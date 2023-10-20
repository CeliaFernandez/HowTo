# Development

## Test with runTheMatrix.py

Note: Used 11650.0 as reference for examples.

Show a workflow **only**:
```
runTheMatrix.py -n -e -l 11650.0
```
that can be run by omitting `-n`:
```
runTheMatrix.py -e -l 11650.0
```

To check which workflows are available for a given pattern e.g. `trackingOnly`:

```
runTheMatrix.py -n [-w upgrade] | fgrep trackingOnly
```

Documented workflows:
* 11650.0: `ZMM_14TeV_TuneCP5_2021_GenSim+Digi_2021+RecoNanoFakeHLT_2021+HARVESTNanoFakeHLT_2021+ALCA_2021`

## Work on top of remote CMSSW

### Use of cherry-pick

Use cherry-pick to implement selected commits on top of your local CMSSW area, then check with `git log`:
```
git remote add [name] [repository]
git fetch [name]
git cherry-pick [commit]
git log
```
