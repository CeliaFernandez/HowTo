# Bash routines

## Fast in-line commands

Execute a command in every directory, e.g. ```crab resubmit```:
```
for dir in $(ls -d crab_*/); do crab resubmit "$dir"; done
```

### Name substitution
Substitute a given pattern in files in bash file:
```
#!/bin/bash
directory="."

for file in "$directory"/output_Signal_HTo2ZdTo2mu2x_MZd-*_ctau-*mm_2022postEE_2022_0To99.root; do
    # Verificar si el archivo existe
    if [[ -e "$file" ]]; then
        # Sustituir 2022 por 2023 en el nombre del archivo
        new_file="${file//2022_0To99.root/2023_0To99.root}"
        mv "$file" "$new_file"
        echo "Renombrado: $file -> $new_file"
    fi
done
```
and terminal command:
```
for file in output_Signal_HTo2ZdTo2mu2x_MZd-*_ctau-*mm_2022postEE_2022_0To99.root; do mv "$file" "${file//2022_0To99.root/2023_0To99.root}"; done
```


## File information and similar

Get the name of one file from abs path:

```ruby
filepath="path/to/file"
# To define a variable:
filename="$(basename $filepath)"
```

in this case `filename` would be `"file"`.

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
