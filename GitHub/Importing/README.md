# Branch and PR change and movement

## How to work on a remote branch

Fetch the remote repo:
```git fetch```
Then, show all the branches, ```remotes/*```branches are the ones available in each remote:
```
git branch -a -v
```
Then you can create a new local branch out of it by doing:
```
git swicth [branch name]
```
where the remote is guessed by Github.


## How to clone the code from a given PR which wasn't merged yet

```
git fetch origin pull/[N]/head
git checkout -b [branch_name] FETCH_HEAD
```

where:

- `N`: Is the PR number in the given repository
- `branch_name`: Is the branch that will contain that change
