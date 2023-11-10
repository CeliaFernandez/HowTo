# Log

```
ipython3 -i test_tamalero.py -- --kcu 192.168.0.11 --verbose --adcs --configuration modulev0b
```

```
rb_0.get_link_status(0, False)
rb_0.get_link_status(0, True)
```

```
fifo.reset()
```
```
fifo.send_l1a(4)
```
```
fifo.get_ocupancy()
```


Reset:
```
rb_0.disable_etroc_readout(all=True)
rb_0.reset_data_error_count()
rb_0.enable_etroc_readout(link, slave=slave)
rb_0.rerun_bitslip()
```

When the fifo restarts you can also use:
```
etroc.reset_modules()
```
