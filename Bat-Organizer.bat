@echo off

::Author  Wagner Nunes Ribeiro

::color 0A
cls
echo.
echo 			Bat-Organizer
pause



::lists containing the filetypes
set "imagelist=*.jpg *.png *.gif *.jpeg *.bmp"
set "docslist=*.docx *.doc *.xls *.xlsx *.odf *.rtf"
set "pdfslist=*.pdf"
set "zipslist=*.zip *.rar *.7z *.tar *.ace"
set "binlist=*.exe *.msi"
set "videoslist=*.avi *.rmvb *.wmv *.mp4 *.3gp *.mp4 *.flv *.mkv *.mov *.rm *.mpg *.mpeg"
set "torrentslist=*.torrent"
set "musiclist=*.mp3 *.wav *.aac *.ogg"

::end of lists

call:Organize "Torrents",     "%torrentslist%"
call:Organize "Binaries",     "%binlist%"
call:Organize "Images", 	  "%imagelist%"
call:Organize "Documents",    "%docslist%"
call:Organize "PDFS", 		  "%pdfslist%"
call:Organize "Zips", 		  "%zipslist%"
call:Organize "Videos", 	  "%videoslist%" 


::::::::::::::::::::
::function session::
::::::::::::::::::::

:Organize

IF EXIST %~1 (
echo.
echo ::Moving %~1...
for %%B in (%~2) do (
move "%%B" %~1\ 2>nul
)
)else (
echo.
echo Creating Directory...
mkdir %~1 2>nul
echo.
echo ::Moving %~1...

for %%B in (%~2) do (
move "%%B" %~1\ 2>nul
)
)
:: Removes empty folders
rmdir %~1 >nul

echo.
