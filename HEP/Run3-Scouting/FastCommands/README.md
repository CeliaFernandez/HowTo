# Fast commands

**Last updated:** 17 Oct 2023

## Skimmer

To test the skimmer:

```
# Launch on selected file:
cmsRun Scouting/NtupleMaker/test/producer_Run3.py inputs=/ceph/cms/store/user/mmasciov/nfs-7/ScoutingPFRun3_Run2022D_forTest.root era=2022D data=True nevents=1000 output=output_data.root
# Accessing data through xrootd AAA:
cmsRun Scouting/NtupleMaker/test/producer_Run3.py inputs=root://cmsxrootd.fnal.gov///store/data/Run2022G/ScoutingPFRun3/RAW/v1/000/362/362/00000/2d16d7af-edc1-424b-93b1-533668ceb27f.root
```

## Looper

Run locally template command:

```
./main.exe outdir year sample startfile nfiles iscondor
```

Examples:

```
./main.exe privateHZdZd 2022 HTo2ZdTo2mu2x_MZd-0p36_ctau-10 0 500
```

**Condor:**

2022:

```
sh condor/runScoutingLooper_onCondor.sh looperOutput_2022_Dec-04-2023
```

2023:

```
sh condor/runScoutingLooper_onCondor.sh 2023 looperOutput_2023_Dec-04-2023
```

## Filler

Run locally the filler:

```
python3 fillHistosScouting.py --inDir /store/user/fernance/Run3ScoutingOutput/looperOutput_Dec-04-2023 --inSample Signal_HTo2ZdTo2mu2x_MZd-2p0_ctau-100mm
```


Launch 2022 and 2023 together to the same directory:

```
sh condor/runScoutingHistos_onCondor.sh /ceph/cms/store/user/fernance/Run3ScoutingOutput/looperOutput_Dec-04-2023/ outputHistograms_Dec-05-2023_allCuts
sh condor/runScoutingHistos_onCondor.sh 2023 /ceph/cms/store/user/fernance/Run3ScoutingOutput/looperOutput_Dec-04-2023/ outputHistograms_Dec-05-2023_allCuts
```

## Plots

Mass in different categories:
```
python3 plotHistosScouting.py --inSamples Data Signal_HTo2ZdTo2mu2x_MZd-2p0_ctau-10mm Signal_HTo2ZdTo2mu2x_MZd-7p0_ctau-10mm Signal_ScenB1_30_9p9_4p8_ctau_10mm --inDir /ceph/cms/store/user/fernance/Run3ScoutingOutput/outputHistograms_Dec-22-2023_allCuts_RooOnly_newCategorization/ --logY --logX --weightSignal --outSuffix 2022_catOnly --rebinWindow 10 --dimuonMassSel 0.2 50.0 --plotOSV
```




