## Add the Android Studio menu entry

```
mkdir ~/.local/share/applications/ -p
nano ~/.local/share/applications/AndroidStudio.desktop
```

```
[Desktop Entry]
Version=1.0
Type=Application
Name=Android Studio
Exec=/opt/tom/android-studio/bin/studio.sh
Icon=/opt/tom/android-studio/bin/studio.png
Categories=Development
```