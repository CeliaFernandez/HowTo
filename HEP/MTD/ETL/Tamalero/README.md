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



