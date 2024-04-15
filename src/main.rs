use dialoguer::Confirm;
use regex::Regex;
use std::{
    env,
    io,
    fs,
    io::{prelude::*, BufReader},
    net::{TcpListener, TcpStream},
    path::Path,
};


fn main() {
    let mut ip = String::new();
    let confirmation :bool = if !env::args().any(|arg| arg == "--no-confirm") {
        Confirm::new()
        .with_prompt("Do you want to use the default ip?")
        .interact()
        .unwrap()
    } else {
        true
    };

    if confirmation {
        println!("Using default ip");
        ip = "127.0.0.1".to_string();
        ip = format!("{}:7878", ip);
    } else {
        println!("What's the ip?");
        io::stdin()
            .read_line(&mut ip)
            .expect("Failed to read line");
        ip = ip.trim().to_string();
        ip = format!("{}:7878", ip);
    }
    
    let listener = TcpListener::bind(ip).unwrap();
    
    for stream in listener.incoming() {
        let stream = stream.unwrap();

        handle_connection(stream);
    }
}
fn handle_connection(mut stream: TcpStream) {
    // --snip--
    let buf_reader = BufReader::new(&mut stream);
    let request_line = buf_reader.lines().next().unwrap().unwrap();
    //println!("{}", request_line.as_str());

    let re_get = Regex::new(r"(?m)^GET .* HTTP\/1.1").unwrap();
    let regex_one = Regex::new(r"(?m)^GET ").unwrap();
    let regex_two = Regex::new(r"(?m) HTTP\/1.1$").unwrap();
    let sub: &str = "";
    let result_one: &str = &regex_one.replace_all(request_line.as_str(), sub);
    let result_two = regex_two.replace_all(result_one, sub);
    let path: &str = &format!("./host{}", result_two);
    println!("{}", re_get.is_match(request_line.as_str()));
    println!("regex result = '{}'", result_two);
    println!("path ={}", path);

    //dont let /../ to be used to access files outside of the host folder
    // issue found by xar55
    if path.contains("/../") {
        println!("path contains /../");
        stream.write_all("HTTP/1.1 404 NOT FOUND\r\n\r\n".as_bytes()).unwrap();
        return;
    }

    let (status_line, filename) =
        if re_get.is_match(request_line.as_str()) && Path::new(path).is_file() {
            ("HTTP/1.1 200 OK", path)
        } else {
            if path == "./host/" {
                ("HTTP/1.1 200 OK", "./host/linux-install.sh")
            } else {
                ("HTTP/1.1 404 NOT FOUND", "./host/404")
            }
        };

    let contents = fs::read_to_string(filename).unwrap();
    let length = contents.len();

    let response = format!("{status_line}\r\nContent-Length: {length}\r\n\r\n{contents}");

    stream.write_all(response.as_bytes()).unwrap();
}
