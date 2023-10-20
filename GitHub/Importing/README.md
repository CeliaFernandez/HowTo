# Importing others work in your repo

## How to clone the code from a given PR which wasn't merged yet

```
git fetch origin pull/[N]/head
git checkout -b [branch_name] FETCH_HEAD
```

where:

- `N`: Is the PR number in the given repository
- `branch_name`: Is the branch that will contain that change
