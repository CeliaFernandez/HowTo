# Development

## Work on top of remote CMSSW

### Use of cherry-pick

Use cherry-pick to implement selected commits on top of your local CMSSW area, then check with `git log`:
```
git remote add [name] [repository]
git fetch [name]
git cherry-pick [commit]
git log
```
