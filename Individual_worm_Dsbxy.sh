##run choreography to extract ID (D), speed(s), bias(b), morphwidth(M), midline(m) and area (e) on all files in a directory
##Usage: Individual_worm_Dsbxy.sh <path to choreography>
for zipfolder in *; do java -Xmx8g -jar $1 --shadowless -p 0.27 -M 2 -t 20 -S -N all -o Dsbxy --plugin Reoutline::despike --plugin Respine $zipfolder; done

##merge all files into one file containing all data
##find . -name '*.dat' -print0 | xargs -0 -I file cat file > merged.file
grep -r '[0-9]' $(find . -name '*.dat') > merged.file

##above doesn't work for large filesets... give the following error: -bash: /usr/bin/grep: Argument list too long 
##if you have a large fileset, replace line 6 with the loop below:
##for filename in $(find . -name '*.dat'); do grep -r '[0-9]' $filename >> merged.file; done