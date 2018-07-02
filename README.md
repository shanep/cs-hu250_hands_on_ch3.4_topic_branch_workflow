# Ch3.4
# Exercise: Sample Workflow using Topic Branches

## Step 1
Familiarize yourself with the repository by checking the repository history, file structure, file contents, etc.

This exercise will reproduce the "Topic Branches" workflow from [Chapter 3.4 Git Branching - Branching Workflows](https://git-scm.com/book/en/v2/Git-Branching-Branching-Workflows).

## Step 2
Read and understand the contents of the `./chaos_monkey1.sh` script which will create the same repository structure as illustrated in `Figure 28. Multiple topic branches` from [Chapter 3.4 Git Branching - Branching Workflows](https://git-scm.com/book/en/v2/Git-Branching-Branching-Workflows).

If you are previewing this markdown file (e.g., using [Visual Studio Code](https://code.visualstudio.com) or other similar tools) you will see `Figure 28` reproduced below:

![Figure 28. Multiple topic branches](https://git-scm.com/book/en/v2/images/topic-branches-1.png)

Figure 28. Multiple topic branches (repository structure that will be created after running the `./chaos_monkey1.sh` script)

## Step 3
Run the `./chaos_monkey1.sh` script to create the repository structure illustrated in `Figure 28` from `Step 2`.

NOTE: Future merge operations (described in the next steps) will not encounter any merge conflicts because each branch modified a different file.

## Step 4
Run the following two commands to view the branch and commit history of the repository:
```bash
$ git log --oneline --decorate --graph --all
$ git log --oneline --decorate --graph --all --author-date-order
```

Compare the output with `Figure 28` (see `Step 2`).

## Step 5
Checkout each branch and examine the content of each `index_<branch_name>.html` file to understand what changes have been made in the different branches.

For the `dumbidea` branch, you should examine the contents of the following files:
* `index_dumbidea.html`
* `index_master.html`

For the `master` branch, you should examine the contents of the following file:
* `index_master.html`

For the `iss91` branch, you should examine the contents of the following files:
* `index_iss91.html`
* `index_master.html`

For the `iss91v2` branch, you should examine the contents of the following files:
* `index_iss91.html`
* `index_iss91v2.html`
* `index_master.html`

Notice that the contents of each `index_<branch_name>.html` file corresponds to its lineage in the repository as shown in `Step 4`.

## Step 6
Merge the `dumbidea` branch into `master` (which will result in a "fast-forward" merge) using:
```bash
$ git checkout master
$ git merge dumbidea
```

Examine the branch and commit history of the repository (see `Step 4`).

Also, notice that now the `master` branch incorporated the `index_dumbidea.html` file and contains:
* `index_dumbidea.html`
* `index_master.html`

## Step 7
Merge the `iss91v2` branch into `master` (which will result in a "recursive" merge that will generate a new commit, since both branches made changes in parallel) using:
```bash
$ git checkout master
$ git merge iss91v2 -m "C14-Merge branch 'iss91v2' into 'master'"
```

Examine the branch and commit history of the repository (see `Step 4`). Notice the newly created commit `C14...` and the fact that `iss91` (containing `C5` and `C6`) is not merged into any other branch.

In addition, examine the content of the following files which are now in the `master` branch:
* `index_dumbidea.html`
* `index_iss91.html`
* `index_iss91v2.html`
* `index_master.html`

You should observe that there is no trace of commits `C5` or `C6` in any of these `index_<branch_name>.html` files.

## Step 8
Count the number of all commits that are currently in the repository.

## Step 9
Read and understand the contents of the `./chaos_monkey2.sh` script.

## Step 10
Run the `./chaos_monkey2.sh` script to create the repository structure illustrated in `Figure 29. History after merging dumbidea and iss91v2` from [Chapter 3.4 Git Branching - Branching Workflows](https://git-scm.com/book/en/v2/Git-Branching-Branching-Workflows).

![Figure 29. History after merging dumbidea and iss91v2 and discarding iss91](https://git-scm.com/book/en/v2/images/topic-branches-2.png)

Figure 29. History after merging dumbidea and iss91v2 and discarding iss91 (repository structure after running the `./chaos_monkey2.sh` script).

## Step 11
View the branch and commit history of the repository (see `Step 4`).

Count the number of all commits that are currently in the repository.
