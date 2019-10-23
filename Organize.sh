#!/bin/bash

#lists containing the filetypes
imagelist=("*.jpg" "*.png" "*.gif" "*.jpeg" "*.bmp ")
docslist=("*.docx" "*.doc" "*.xls" "*.xlsx" "*.odf" "*.rtf" "*.ppt" "*.pptx" "*.odt")
pdfslist=("*.pdf" "*.mobi" "*.epub")
zipslist=("*.zip" "*.rar" "*.7z" "*.tar" "*.ace" "*.tar" "*.tar.gz" "*.bz2" "*.gz" "*.gzip")
binlist=("*.exe" "*.msi" "*.bin" "*.jar")
videoslist=("*.avi" "*.rmvb" "*.wmv" "*.mp4" "*.3gp" "*.mp4" "*.flv" "*.mkv" "*.mov" "*.rm" "*.mpg" "*.mpeg" "*.ogg")
torrentslist=("*.torrent")
songlist=("*.mp3" "*.wav" "*.aac" "*.ogg")
isolist=("*.iso" "*.ISO")
#end of lists

function Organize(){
listaext="$@"
	if [ ! -d "$1" ]; then
	echo "Creating directory $1 ..."
	mkdir "$1"
	fi
		for i in "${listaext[@]}"
		do
			echo "Moving $1..."
			mv $i "$1" 2>/dev/null
		done
		#cleaning empty directories
		rmdir "$1" 2>/dev/null

}

Organize Images "${imagelist[@]}";
Organize Docs "${docslist[@]}"
Organize Binaries "${binlist[@]}";
Organize Documents "${docslist[@]}";
Organize Songs "${songlist[@]}";
Organize Videos "${videoslist[@]}";
Organize PDFS "${pdfslist[@]}";
Organize Torrents "${torrentslist[@]}";
Organize Zips "${zipslist[@]}";
Organize ISOs "${isolist[@]}";