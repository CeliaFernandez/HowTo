# Crab3

## Extract luminosity of processed dataset

Get the report that will return the processed lumisections:
```
crab report crab_work
```

Then setup brilcalc and use it to compute the luminosity:
```
source /cvmfs/cms-bril.cern.ch/cms-lumi-pog/brilws-docker/brilws-env
brilcalc lumi --normtag /cvmfs/cms-bril.cern.ch/cms-lumi-pog/Normtags/normtag_BRIL.json -u /fb -i crab_work/results/processedLumis.json
```
