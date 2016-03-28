git remote add SwiftyJSON https://github.com/SwiftyJSON/SwiftyJSON.git
git fetch SwiftyJSON
git read-tree --prefix SwiftyJSON -u SwiftyJSON/master
git commit -m "add SwiftyJSON subtree"

