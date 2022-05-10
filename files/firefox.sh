#! /bin/bash

if  [ -d "/home/tajo48/.mozilla/firefox/" ]
then
    for profile in /home/tajo48/.mozilla/firefox/?*.default-release
    do
        echo $profile
        
        if grep 'toolkit.legacyUserProfileCustomizations.stylesheets' $profile/prefs.js
        then
            sed -i -e 's/^user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", \(true\|false\));$/user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);/' $profile/prefs.js
        else
            echo 'user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);' >> $profile/prefs.js
        fi
        
        
        if grep 'ui.systemUsesDarkTheme' $profile/prefs.js
        then
            sed -i -e 's/^user_pref("ui.systemUsesDarkTheme", \(0\|1\));$/user_pref("ui.systemUsesDarkTheme", 1);/' $profile/prefs.js
        else
            echo 'user_pref("ui.systemUsesDarkTheme", 1);' >> $profile/prefs.js
        fi
        
        if grep 'browser.gnome-search-provider.enabled' $profile/prefs.js
        then
            sed -i -e 's/^user_pref("browser.gnome-search-provider.enabled", \(true\|false\));$/user_pref("browser.gnome-search-provider.enabled", true);/' $profile/prefs.js
        else
            echo 'user_pref("browser.gnome-search-provider.enabled", true);' >> $profile/prefs.js
        fi
        
        
        
        if [ -f $profile/chrome ]; then
            echo "File $profile/chrome exists."
        else
            mkdir $profile/chrome
        fi
        rm -rf $profile/chrome/userChrome.css
        cp /home/tajo48/ARCH/files/userChrome.css $profile/chrome/userChrome.css
    done
else
    echo "There is no Firefox folder."
fi




