# Screen

To run something on the backup:

```ruby
AKLOG=/usr/bin/aklog krenew -b -t -- screen -D -m
screen -r
```

then run the desired command. To get out just press **ctrl+A+D**.


The process can be accessed after that with
```ruby
screen -r
```

Note: If running on remote with multiple machine e.g. `lxplus`, the machine should be specified
