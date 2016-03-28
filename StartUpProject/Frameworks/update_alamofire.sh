git fetch Alamofire
#git pull -s subtree Alamofire master
git merge -s subtree --squash Alamofire/master
git commit -m "update Alamofire"

