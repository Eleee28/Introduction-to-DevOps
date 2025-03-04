# Lab 5 - GitHub Actions

The aim of this lab is to set up a continuous integration pipeline using GitHub Actions, which is a CI system built directly into GitHub.

In addition, this lab also documents how to use SSH to authenticate with GitHub, rather than using GitHub tokes. This is much more convenient, but you might find that SSH traffic is blocked on some networks.

[GitHub actions repo](https://github.com/actions)

## Setting up SSH Authentication
So far, we've used GitHub tokens to authenticate our pushes to GitHub. This works, but having to constantly copy and paste the token can be very annoying. GitHub offers a better alternative, which is to use SSH for authentication. We will start by setting this up.

In order to use SSH, you need to generate an SSH keypair. It is important that you generate a secure key here (GitHub will reject insecure settings). One good choice that is widely supported is 4096-bit RSA. Start by generating a keypair on your host machine:
~~~bash
ssh-keygen -t rsa -b 4096 -c "<your email address>"
~~~
Be sure to use the same email address associated with your GitHub account. You will be asked a number of questions when you run the command but you can just keep pressing enter to accept the defaults. Note that one of the options is to set a password, this is a password to encrypt the SSH keys on your computer's hard disk. If you enable this, you will still have to enter a password every time you push, but you can set a password that you can remember rather than having to use the GitHub token. The command should generate a keypair in the `~/.ssh` folder: the private key will be at `~/.ssh/id_rsa` and the public key at `~/.ssh/id_rsa.pub`.

After creating the key, you will have to run a piece of software called an SSH Agent and register the new key with it. The SSH Agent is used by GitHub to carry out the authentication, so you will need to ensure it is running whenever you want to use SSH with GitHub. The command for this is:
~~~bash
eval $(ssh-agent -s)
~~~

Now, run `ssh-add ~/.ssh/id_rsa` to register your private key with the SSH Agent. Assuming this worked, you have everything you need setup on your own machine. The next step is to tell GitHub about your public key. To do this, open GitHub in your browser and open the GitHub settings page (i.e. click the user icon at the top right of the page and click Settings from the menu that appears). Then click SSH and GPG keys from the menu on the left-hand side of the page, and click New SSH key. You will be asked to give the key a name so you can identify it, and you will also see a text box labelled Key. You should copy and paste the entire contents of the `~/.ssh/id_rsa.pub` key here (note: NOT the private key!). Click Add SSH key to complete the process.

To verify it worked, visit one of the repositories you created for one of the labs from a previous week and try to clone it using SSH. From the repo page, click *Code > SSH* and copy the line beginning with git@github.com. Clone the repo using this command: `git clone <copied line goes here>`. You should be able to clone the repo and make pushes to it without being prompted for a password.

## Creating a repo with GitHub Actions enabled
In order to create a repo with a working GitHub Actions setup, you need to start off with a project that has a proper build setup enabled. The easiest thing to do is to write a simple C programme and write a Makefile for it. Make sure that you add the build artefacts to the `.gitignore` file to ensure you don't upload them to the repo.

Commit this code to a git repo, and push it to GitHub. Next, create a GitHub workflow to build the code. This will involve creating a YAML file in `.github/workflows` in your repo. Start off with a workflow with two steps: a first using the `checkout` action to clone the repo, and a second that will invoke the build process. Commit and push the changes. At the top of the GitHub page for your repo, you should see a tab along the top called *Actions*. You can watch the workflow run there. Verify that the workflow you wrote runs correctly. Make and push some changes to your code to ensure that the build process can handle it.

By default, GitHub Actions just deletes the output of the build process. We would like to keep a copy of the build application so we can download and test it. You should add a third step to your workflow YAML file to do this. You can use the `upload-artifact` action for this: see the [documentation](https://github.com/actions/upload-artifact) for usage examples. Again, verify that the build works, and that you can download the file.

## Creating a release
GitHub allows you to create **releases**, where you pick a particular commit of your repo as a stable release that can be used directly by users. Users can download you code as a Zip file or tarball, skipping git altogether. You can also (and should) upload binary builds of the code here.

Releases rely on git **tags** (a tag is a human-readable name given to a particular commit). For example, you might decide that a particular commit is version 1.0 of your software. We might want to give it the tag v1.0 to reflect this. To set the tag, checkout the commit you want to tag, and run the following command:
~~~bash
git tag v1.0
~~~

`git push` doesn't push tags by default. To get GitHub to see your tag, you'll have to run `git push --tags`. A count of tags in the repo is shown next to the branch drop-down at the top left of the GitHub repo page. You can see the tags by either clicking this number or clicking the branch drop-down and switching to the *Tags* branch. Once the tag is visible on GitHub, you can begin creating a release.

You should see a section titled *Releases* on the right-hand side of the page. Click the link there to make your first release. You'll have to start by choosing the tag from a drop-down menu, and giving the release a name (e.g. My Programme v1.0). You can also write a description of the release. For a real software project, you would write information for users outlining new features or bugfixes in this release here.

Finally, you have the option to upload files. You should download the binary file uploaded by the `upload-artifact` action for your release, and upload it here, so users can download the programme pre-built without having to compile by themselves. Finally, click *Publish release*. You should now see the release on the left of the GitHub page for your repo. If you click it, you should see your binary available to download, along with the source in both Zip and tarball formats.