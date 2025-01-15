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

### Using conda

We do an environmnet ```environment.yml``` with this:

```
name: EF_java
channels:
  - conda-forge
  - defaults
dependencies:
  - bzip2=1.0.8=h620ffc9_4
  - ca-certificates=2023.12.12=hca03da5_0
  - expat=2.5.0=h313beb8_0
  - libcxx=16.0.6=h4653b0c_0
  - libffi=3.4.4=hca03da5_0
  - libzlib=1.2.13=h53f4e23_5
  - ncurses=6.4=h313beb8_0
  - openjdk=21.0.2=hbeb2e11_0
  - openssl=3.2.1=h0d3ecfb_0
  - pip=23.3.1=py312hca03da5_0
  - python=3.12.1=h99e199e_0
  - readline=8.2=h1a28f6b_0
  - setuptools=68.2.2=py312hca03da5_0
  - sqlite=3.41.2=h80987f9_0
  - tk=8.6.12=hb8d0fd4_0
  - tzdata=2023d=h04d1e81_0
  - wheel=0.41.2=py312hca03da5_0
  - xz=5.4.5=h80987f9_0
  - zlib=1.2.13=h53f4e23_5
prefix: /opt/anaconda3/envs/EF_java
```
(prefix may need to be changed depending on where you have installed anaconda3, miniconda3 or whatever package you use)

Then create the environment:
```
conda env create -f environment.yml
```
and activate the environment:
```
conda activate EF_java
```

We need to tunnel through lxplus, which can be done:
```
ssh -f -N -D 1080 lxplus.cern.ch
```

Then we start the GUI as above, with:
```
ant clean && ./start
```

### Using podman (not working)

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
