# Lab 2 - Git

The aim of this lab is to give some hands-on experience working with git, but using a very simple codebase. This means that focus is on git's behaviour instead of the code.

## Setting up git

Install git for your operating system. Once you have installed it, it is useful to tell git what your name and email address are using the commands:

~~bash
git config --global user.email email address
git config --global user.name "your name"
~~

Create a new empty repository (on GitHub) called devops-lab-2. You can make the repo private or public. When creating the repo, make sure you select the option to create a README file in the new repository.

## Cloning your repo

You should be able to clone a local copy of your (currently empty) repo with the following command:
~~bash
git clone repo_url
~~

## Making commits to the repo

Write a simple programme (e.g. a hello world programme) in a language of your choice. Add and commit this to the repo with a suitable commit message. Then, use `git push` to upload these changes to the remote repository. Verify that the code can be seen via the GitHub web interface, and take a screenshot of this, which will be needed later. 

[screenshot GitHub UI](1-1.png)

Modify the simple programme to do something else (e.g. display the numbers 1 to 10 using a loop). Add, commit and push the changes. Use `git log` to see the IDs of your commits, and `git diff` to find the difference between the two commits. Take a screenshot of the output from `git diff`.

[screenshot git diff](2-1.png)

## Branching and merging

Create and switch to a new branch called `new_greeting`. Change the string printed from saying hello world to say "Welcome!". Switch back to the `main` branch, and modify the string again to say "This is another string!". Now, merge the `new_greeting` branch into the main branch:
`git merge new_greeting`

This should cause a merge conflict. Resolve the merge confict, and then commit and push the merged branch to the remote repository.

We will also try doing a fast-forward merge: create a new branch called `fast_forward_test`. Switch to this branch, and write a second program to compute the average of a set of numbers given to the user. Add, commit and push the changes in this branch. Now, use the git merge command to merge `fast_forward_test` into `main`.

## Creating a pull request

The final thing we will look at for this lab is a pull request. A pull request is a proposed change made by somebody else to your code, which is important for open source projects (where the core developers will often want anybody to be able to propose changes to the code). For this part of the lab, you will need to find another student in the class to create a change to the code for you. If you repo is private, you might find you'll need to give them read permission to make this work. This can be done via the GitHub web UI.

First, the other student should create a fork of your repo in their own GitHub account, by clicking Fork at the top right of your repo page on GitHub. Next, they should clone your repo, and modify your averaging code to also calculate and display largest and smallest numbers that the user entered. They should then add, commit and push the changes to their forked repo. When they refresh the GitHub web UI on their browser, they should see a button labelled Compare & pull request at the top. They will have to fill out a form, where they describe the changes to you, and then click Create pull request. You should then see the pull request appear on your GitHub page. You should be able to merge it into your original code by clicking a button.