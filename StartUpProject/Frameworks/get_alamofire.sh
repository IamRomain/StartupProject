git remote add Alamofire https://github.com/Alamofire/Alamofire.git
git fetch Alamofire
git read-tree --prefix Alamofire -u Alamofire/master
git commit -m "add Alamofire subtree"

