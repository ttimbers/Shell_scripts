##change current directory to folder containing .zip folders you want to analyze via 
## cd <folder path>
##note, you can get folder path by dragging the folder into the shell/terminal
##run choreography to extract ID (D), speed(s), bias(b), morphwidth(M), midline(m) and area (e) on all files in a directory
for zipfolder in *; do java -Xmx8g -jar /Users/michelleroux/Documents/Tiffany/MWT_analysis/Chore.jar --shadowless -p 0.27 -M 2 -t 20 -S -o DsbMme --plugin Reoutline::despike --plugin Respine $zipfolder; done

##after you have run the above command for all strain/group folders you want to organize, move up a directory
cd ..
##merge all files into one file containing all data
##find . -name '*.dat' -print0 | xargs -0 -I file cat file > merged.file
grep '[0-9]' $(find . -name '*.dat') > merged.file