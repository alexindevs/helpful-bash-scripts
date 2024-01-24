git status -s | while read -r status file; do
    if [ "$status" == "M" ] || [ "$status" == "A" ]; then
        git add "$file"
        git commit -m "Update $file"
    fi
done
