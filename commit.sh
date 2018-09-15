# This is a script that I'm going to be using to commit my notes on github
# Of course, the catch is that you need to have github credentails stored in your terminal. 
# If you're REALLY paranoid, I suggest you write a cron task that executes this script every 15 minutes or so.

cd "/Users/stephen/notes"
timestamp=$(date "+%Y-%m-%d %H:%M:%S")
echo $timestamp

git add .
git commit -m "$timestamp"
git push origin master
