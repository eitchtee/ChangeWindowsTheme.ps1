# ChangeWindowsTheme.ps1

Small script for changing between user-created themes on Windows 10.

## Example usage
powershell "Change_Windows_Theme.ps1" -theme ThemeName

> Change `ThemeName` to the name of the theme file without the `.theme` extension as it can be found in `%localappdata%\Microsoft\Windows\Themes\`

## Resources
[How to create a theme on Windows 10](https://www.groovypost.com/howto/create-custom-theme-on-windows-10/)

## Use case
Currently I have two themes on my main computer: One for my day-to-day use and one themed around the company I work for with custom colors and wallpapers. Thus when I need to present my screen on a meeting for example I can switch between these two themes with a single click, making for a more professional presentation.
