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

### Lxy bins

```
python3 plotHistosScouting.py --inSamples Data --year 2022 --inMultiDir /ceph/cms/store/user/fernance/Run3ScoutingOutput/outputHistograms_Jan-04-2024_allCuts /ceph/cms/store/user/fernance/Run3ScoutingOutput/outputHistograms_Jan-04-2024_0p0to0p5_allCuts /ceph/cms/store/user/fernance/Run3ScoutingOutput/outputHistograms_Jan-04-2024_0p5to2p7_allCuts /ceph/cms/store/user/fernance/Run3ScoutingOutput/outputHistograms_Jan-04-2024_2p7to6p5_allCuts /ceph/cms/store/user/fernance/Run3ScoutingOutput/outputHistograms_Jan-04-2024_6p5to11p0_allCuts /ceph/cms/store/user/fernance/Run3ScoutingOutput/outputHistograms_Jan-04-2024_11p0to16p0_allCuts /ceph/cms/store/user/fernance/Run3ScoutingOutput/outputHistograms_Jan-04-2024_16p0to70p0_noMuonHitSel --inMultiLeg "All vertices" "l_{xy} #in [0.0, 0.5] cm" "l_{xy} #in [0.5, 2.7] cm" "l_{xy} #in [2.7, 6.5] cm" "l_{xy} #in [6.5, 11] cm" "l_{xy} #in [11, 16] cm" "l_{xy} #in [16, 70] cm" --logY --logX --dimuonMassSel 0.4 50.0 --outSuffix 2022Data_lxyBins_logX
```


### L1 seed studies:

For 2022:
```
python3 plotHistosScouting.py --inSamples Data --inYears 2022 2022 2022 2022 2022 2022 2022 --inMultiDir /ceph/cms/store/user/fernance/Run3ScoutingOutput/outputHistograms_Nov/outputHistograms_Nov-14-2023_allSeeds /ceph/cms/store/user/fernance/Run3ScoutingOutput/outputHistograms_Nov/outputHistograms_Nov-14-2023_noL1_DoubleMu_12_5 /ceph/cms/store/user/fernance/Run3ScoutingOutput/outputHistograms_Nov/outputHistograms_Nov-14-2023_noL1_DoubleMu_15_7 /ceph/cms/store/user/fernance/Run3ScoutingOutput/outputHistograms_Nov/outputHistograms_Nov-14-2023_noL1_DoubleMu4p5er2p0_SQ_OS_Mass_7to18 /ceph/cms/store/user/fernance/Run3ScoutingOutput/outputHistograms_Nov/outputHistograms_Nov-14-2023_noL1_DoubleMu4p5er2p0_SQ_OS_Mass_Min7 /ceph/cms/store/user/fernance/Run3ScoutingOutput/outputHistograms_Nov/outputHistograms_Nov-14-2023_noL1_DoubleMu4p5_SQ_OS_dR_Max1p2 /ceph/cms/store/user/fernance/Run3ScoutingOutput/outputHistograms_Nov/outputHistograms_Nov-14-2023_noL1_DoubleMu4_SQ_OS_dR_Max1p2 --inMultiLeg "All seeds" "No L1_DoubleMu_12_5" "No L1_DoubleMu_15_7" "No L1_DoubleMu4p5er2p0_SQ_OS_Mass_7to18" "No L1_DoubleMu4p5er2p0_SQ_OS_Mass_Min7" "No L1_DoubleMu4p5_SQ_OS_dR_Max1p2" "No L1_DoubleMu4_SQ_OS_dR_Max1p2" --logY --doRatio --outSuffix 2022Data_SeedStudy --lxySel 0.0 70.0
```

For 2023 before run 367621:
```
python3 plotHistosScouting.py --inSamples Data --year 2023 --inMultiDir /ceph/cms/store/user/fernance/Run3ScoutingOutput/outputHistograms_Jan-09-2024_2023_before367621_allSeeds /ceph/cms/store/user/fernance/Run3ScoutingOutput/outputHistograms_Jan-09-2024_2023_before367621_noL1_DoubleMu_12_5 /ceph/cms/store/user/fernance/Run3ScoutingOutput/outputHistograms_Jan-09-2024_2023_before367621_noL1_DoubleMu_15_7 /ceph/cms/store/user/fernance/Run3ScoutingOutput/outputHistograms_Jan-09-2024_2023_before367621_noL1_DoubleMu4p5er2p0_SQ_OS_Mass_7to18 /ceph/cms/store/user/fernance/Run3ScoutingOutput/outputHistograms_Jan-09-2024_2023_before367621_noL1_DoubleMu4p5er2p0_SQ_OS_Mass_Min7 /ceph/cms/store/user/fernance/Run3ScoutingOutput/outputHistograms_Jan-09-2024_2023_before367621_noL1_DoubleMu4p5_SQ_OS_dR_Max1p2/ /ceph/cms/store/user/fernance/Run3ScoutingOutput/outputHistograms_Jan-09-2024_2023_before367621_noL1_DoubleMu4_SQ_OS_dR_Max1p2 --inMultiLeg "All seeds" "No L1_DoubleMu_12_5" "No L1_DoubleMu_15_7" "No L1_DoubleMu4p5er2p0_SQ_OS_Mass_7to18" "No L1_DoubleMu4p5er2p0_SQ_OS_Mass_Min7" "No L1_DoubleMu4p5_SQ_OS_dR_Max1p2" "No L1_DoubleMu4_SQ_OS_dR_Max1p2" --logY --doRatio --outSuffix 2023Data_before367621_SeedStudy --lxySel 0.0 70.0 --lumi 12.12
```

For 2023 after run 367621:
```
python3 plotHistosScouting.py --inSamples Data --year 2023 --inMultiDir /ceph/cms/store/user/fernance/Run3ScoutingOutput/outputHistograms_Jan-09-2024_2023_after367621_allSeeds /ceph/cms/store/user/fernance/Run3ScoutingOutput/outputHistograms_Jan-09-2024_2023_after367621_noL1_DoubleMu_12_5 /ceph/cms/store/user/fernance/Run3ScoutingOutput/outputHistograms_Jan-09-2024_2023_after367621_noL1_DoubleMu_15_7 /ceph/cms/store/user/fernance/Run3ScoutingOutput/outputHistograms_Jan-09-2024_2023_after367621_noL1_DoubleMu4p5er2p0_SQ_OS_Mass_7to18 /ceph/cms/store/user/fernance/Run3ScoutingOutput/outputHistograms_Jan-09-2024_2023_after367621_noL1_DoubleMu4p5er2p0_SQ_OS_Mass_Min7 /ceph/cms/store/user/fernance/Run3ScoutingOutput/outputHistograms_Jan-09-2024_2023_after367621_noL1_DoubleMu4p5_SQ_OS_dR_Max1p2/ /ceph/cms/store/user/fernance/Run3ScoutingOutput/outputHistograms_Jan-09-2024_2023_after367621_noL1_DoubleMu4_SQ_OS_dR_Max1p2 /ceph/cms/store/user/fernance/Run3ScoutingOutput/outputHistograms_Jan-09-2024_2023_after367621_noL1_DoubleMu0er1p4_SQ_OS_dR_Max1p4 /ceph/cms/store/user/fernance/Run3ScoutingOutput/outputHistograms_Jan-09-2024_2023_after367621_noL1_DoubleMu0er1p5_SQ_OS_dR_Max1p4 /ceph/cms/store/user/fernance/Run3ScoutingOutput/outputHistograms_Jan-09-2024_2023_after367621_noL1_DoubleMu8_SQ --inMultiLeg "All seeds" "No L1_DoubleMu_12_5" "No L1_DoubleMu_15_7" "No L1_DoubleMu4p5er2p0_SQ_OS_Mass_7to18" "No L1_DoubleMu4p5er2p0_SQ_OS_Mass_Min7" "No L1_DoubleMu4p5_SQ_OS_dR_Max1p2" "No L1_DoubleMu4_SQ_OS_dR_Max1p2" "L1_DoubleMu0er1p4_SQ_OS_dR_Max1p4" "L1_DoubleMu0er1p5_SQ_OS_dR_Max1p4" "L1_DoubleMu8_SQ" --logY --doRatio --outSuffix 2023Data_after367621_SeedStudy --lxySel 0.0 70.0 --lumi 15.07
```


and we can also add ```--logX --dimuonMassSel 0.4 140.0 --rebinWindow 2``` in every case





