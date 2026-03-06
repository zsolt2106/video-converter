read -p "Enter the target folder path: " target_folder

if [ ! -d "$target_folder" ]; then
    echo "Directory does not exist. Please check the path and try again."
    exit 1
fi

cd "$target_folder"  && \
mkdir -p converted && \
for f in *.MOV *.mov; do
    [ -f "$f" ] || continue
    outname="${f%.MOV}"
    outname="${outname%.mov}"
    ffmpeg -i "$f" -vf scale=1920:1080 -c:v libx264 -c:a aac "${outname}.mp4" && \
    echo "file converted: $f"
done && \
mv *.mp4 converted/ && \
echo "Files have been converted ! Output files can be found in $target_folder/converted"