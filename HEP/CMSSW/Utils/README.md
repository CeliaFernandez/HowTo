# Utils

## Bypass CMSSW version
By default, CMSSW doesn't let you **use an older CMSSW version of the one that was used to produce the input file**. This could be done by **bypassing the version check** that is done when reading the input file by adding this line:

```
# Input source
process.source = cms.Source("PoolSource",
    fileNames = cms.untracked.vstring('file:output_hlt.root'),
    secondaryFileNames = cms.untracked.vstring(),
    bypassVersionCheck = cms.untracked.bool(True), ## This is the line you have to add
    inputCommands = cms.untracked.vstring(
        'keep *', 
    )
)
```


## Check data taking setting
**Conditions for the data taking** can be check the ```ProdOfflineConfiguration.py```  file, where this conditions are set. For example:

The **global tag**:
https://github.com/dmwm/T0/blob/01b7a07ad8f82321b0f8de088abe80211565167d/etc/ProdOfflineConfiguration.py#L156

The **production CMSSW release**:
https://github.com/dmwm/T0/blob/01b7a07ad8f82321b0f8de088abe80211565167d/etc/ProdOfflineConfiguration.py#L104
