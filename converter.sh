mkdir -p converted && \
for f in *.MOV; do
    ffmpeg -i "$f" -vf scale=1920:1080 -c:v libx264 -c:a aac "${f%.MOV}.mp4" && \
    echo "file converted: $f"
done && \
mv *.mp4 converted/ && \
echo "Files converted and moved to the directory."