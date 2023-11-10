# Tamalero

## Access BU computer and test stands

Once I have provided a `.pub` key I can access with:

```
ssh celia@strange.bu.edu
```

KCU board IP:

  - `192.168.0.10`: upper shelf
  - `192.168.0.11`: lower one that has the module with the LGAD hooked up
  - `192.168.0.12`: used for CI

Every time that something is pushed there is a pipeline that runs over all stands:
https://gitlab.cern.ch/cms-etl-electronics/module_test_sw/-/pipelines/6347108



## Install Tamalero

Install from repository

```ruby
git clone https://gitlab.cern.ch/cms-etl-electronics/module_test_sw.git
cd module_test_sw/
pip install --editable .
```

To fix some requirements:

```ruby
pip3 install hist==2.6.3
```

You may also need to create the `results/` dir before running tests as it is not created by default.

## Run tests

Before running anything always run: `source setup.sh`

To run a threshold scan for a single pixel (row 15, col 0) use:
 
```ruby
ipython3 -i test_ETROC.py -- --test_chip --hard_reset --module 1 --kcu 192.168.0.10 --configuration modulev0 --scan internal --row 15 --col 0
```

The output should be an S-curve like this:
![alt text](https://github.com/CeliaFernandez/HowTo/tree/main/HEP/MTD/ETL/Tamalero/pngs/scan_internal_row_15_col_0_20231016_172239.png)


To run a threshold scan for the entire chip:

```ruby
ipython3 -i test_ETROC.py -- --test_chip --hard_reset --module 1 --kcu 192.168.0.10 --configuration modulev0 --scan full
```

To run basic charge injection tests:

```ruby
ipython3 -i test_ETROC.py -- --test_chip --hard_reset --module 1 --kcu 192.168.0.10 --configuration modulev0 --qinj
```

## Commands

Test tamalero command:

```
ipython3 -i test_tamalero.py -- --kcu 192.168.0.11 --verbose --adcs --configuration modulev0b
```

We should add `--power_up` if we did power cycle.

If `TAMALERO` appears in green indicates that the [...] is turned on. The first time that `test_tamalero.py` is run after `--power_up`it should appear in red color.


## Some definitions

### L1A

L1A is Level 1 Acceptance. Given a satisfactory event reconstruction from the other subsystems in CMS, a L1A will be issued to the ETL/ETROC, which will tell it to pull data from some predetermined location in the buffer. The buffer can have header words(beginning of pull), data words, or trailer words (end of pull or no data). The data words contain individual hit information, with associated pixel, toa, tot, etc.

When looking for data, we will use the KCU to pulse L1As. This is useful when correctly timed with charge injection, so that we get out only/all of the data associated with the charge injection it is paired with

## Noise scans (from Joshua)

Noise scans are *produced in absence of signal*.
The two S-curves in the pixels are both produced with just noise.

- The blue curve (internal) is from the threshold calibration in the ETROC.
The accumulation register just accumulates samples and counts if the sample is higher than the discriminator. As such, you get an S-shape curve as the threshold rises above the noise. An accumulation of 1 is the same as being fully saturated.

- The red curve (external) is done by trying to fing hits. When the accumulation drops, you have reached the point where the discriminator is set on par with the peaks of the  fluctuations in the noise. Consequnetially, you will have rising edges and therefore hits. The red curve just sends a ton of L1As in a similar sampling method, but looking for hits. As you move the threshold through the range of the noise, you get some gaussian-like peak of the number of hits measured. 

Both the red curve and blue curve then should die out as you exit the noise range, and, ideally, the best place to put the threshold is some distance beyond these curves bottoming out.
When we add Qinj, we broaden the red curve.







