cd "/Users/stephen/notes"
timestamp=$(date "+%Y-%m-%d %H:%M:%S")
echo $timestamp

git add .
git commit -m "$timestamp"
git push origin master
