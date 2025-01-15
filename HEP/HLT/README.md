# HLT

# re-HLT a sample

General instructions to re-HLT a sample can be found [here](https://twiki.cern.ch/twiki/bin/view/CMSPublic/SWGuideGlobalHLT#CMSSW_14_1_X).

## Monte Carlo
For MC, we can only re-HLT GEN-SIM-RAW samples as the information available in further formats is not enough to emulate the L1. Main command that can be used for that is:

```
hltGetConfiguration /users/fernance/2025Scouting/ppMenuPrep/DoubleMuVtx/HLT2/V6 --globaltag auto:phase1_2024_realistic --input /store/user/fernance/GENHLT_Scouting/HTo2ZdTo2mu2x_MZd-6_ctau-10mm-pythia8/private-RunIII2024Summer24-HLTnoPU/241020_202318/0000/EXO-digi-hlt_1.root --max-events 100 --mc --unprescale --output none --eras Run3_2024 --l1-emulator uGT --l1 L1Menu_Collisions2024_v1_3_0_xml --paths ScoutingPFOutput,DST_PFScouting_*,Dataset_ScoutingPFRun3 > hlt.py
#
echo 'process.hltOutputScoutingPF.outputCommands.extend(["keep *_genParticles_*_*"])' >> hlt.py
echo 'process.options.wantSummary = False' >> hlt.py
```

# confDB

Tutorial available [here](https://indico.cern.ch/event/1344500/contributions/5683506/attachments/2793166/4931226/mm_HLT_Tutorial_2024_confDBGUIdev.pdf)

## From LXPLUS

From lxplus we can just compile the github gui version:
```
git clone git@github.com:cms-sw/hlt-confdb.git
cd hlt-confdb
ant clean && ./start #its best to do a full clean each time when starting the gui
```

## Locally from the MAC

Download TigerVNC from [here](https://sourceforge.net/projects/tigervnc/). Also the GitLab repo with the images for podman [here](https://gitlab.cern.ch/cms-tsg/storm/confdb-container).

Use podman to start a container
```
podman machine init
podman machine start
podman info
```

Init:
```
podman build . -t confdbvnc -f Dockerfile.vnc
podman run -it -e USERNAME=fernance --rm  --name confdbcont --net=host confdbvnc 
```
And then use TigerVNC to connect to ```localhost:5901```


To stop it:
```
podman stop confdbcont
```

Note: ```--rm``` will remove the container when finished. If not put, to list it:
```
podman ps -q
```
To stop it:
```
podman stop
```


And then use TigerVNC to connect to ```localhost:5901```
