# Basics


## How to merge a branch

We have two branches, A and B and we want to merge the changes made in A into B. For that we should:
```
# [In branch_A]
git add ...
git commit -m "Commit the changes we want to merge"
git checkout branch_B
git merge branch_A
```


## How to undo a pull

Check the various changes and ids:
```
git reflog
```
and then reset by taking the position you want to recover:
```
git reset --hard a0d3fe6
```
