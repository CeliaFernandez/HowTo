# Bash routines

## File information and similar

Get the name of one file from abs path:

```ruby
basename path/to/file
```
would return `file`.

## Routined for strings

Given a string in a variable `string` with a prefix `prefix` and a suffix `suffix`. Both prefix and suffix can be removed from that by doing:

```ruby
string="test-module.py"
prefix="test-"
suffix=".py"

# Remove prefix:
foo=${string#"$prefix"}
# Output would be: module.py

# Remove suffix:
foo=${string%"$suffix"}
# Output would be: test-module
```
