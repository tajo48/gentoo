# Arch linux install script usage
## Inside live arch iso run this command:
```sh
curl https://raw.githubusercontent.com/tajo48/ARCH/master/install.sh | sh
```
## Pendrive mobile install
Allows to keep important work mobile with pernament live boot setup
1. Inside arch or arch virtualbox run this command:
```sh
install-arch
```
2. Then select drive of your choice 
3. Choose beetween HARD and soft format (HARD takes longer but is needed if your drive dont support trim)
4. HARD format with large formats take so much time that I made option to automaticly poweroff computer when installation is done so select witch one you prefer

## Github setup
1. First run this command in your terminal
```sh 
install-github
```
2. Then go to this [link](https://github.com/settings/ssh/new "link") and copy output of your command
(If you closed terminal don't worry just run it ```get-github```)

### Now you can run:
- ```gita``` **COMMIT ALL AND PUSH TO MASTER ASAP** (Bad practice yet good for quick deployment)
- ```install-unreal``` Four step unreal engine install script (You need to connect your Epic Games Store account to github)

## Youtube to opus grabber
1. Install yt-dlp by running this command in your terminal
```sh
install-yt
````
2.Open youtube music in browser and navigate to playlist that you want to grab (Yes it works with "Your Likes/Auto playlist")
3. Load all items by scrolling to the bottom of the playlist
4. Run this command in terminal
```sh
youtube
```
5.Copy js output to console in youtube music tab and press enter
6.Save output by right clicking "copy object" and pasting it to empty file with .txt exstention
7.Run this command (dont worry about repetitions in your music folder script will ignore those)
```sh
youtube <your_file>.txt
```

