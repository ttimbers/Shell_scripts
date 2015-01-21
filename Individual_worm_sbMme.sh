##run choreography to extract ID (D), speed(s), bias(b), morphwidth(M), midline(m) and area (e) on all files in a directory
for zipfolder in *; do java -Xmx8g -jar /Users/michelleroux/Documents/Tiffany/MWT_analysis/Chore.jar --shadowless -p 0.27 -M 2 -t 20 -S -N all -o DsbMme --plugin Reoutline::despike --plugin Respine $zipfolder; done

##merge all files into one file containing all data
##find . -name '*.dat' -print0 | xargs -0 -I file cat file > merged.file
grep -r '[0-9]' $(find . -name '*.dat') > merged.file

##above doesn't work for large filesets... give the following error: -bash: /usr/bin/grep: Argument list too long 