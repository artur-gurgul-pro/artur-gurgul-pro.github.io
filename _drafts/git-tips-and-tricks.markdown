---
layout: post
title:  "Git - tricks and tips"
date:   2016-10-19 12:09:07 +0200
categories: git
---

# 
* rebase and magange branches
* Git interactive rebase

### squash the lastests commints

{% highlight bash %}
git rebase -i HEAD~3
{% endhighlight %}


{% highlight bash %}
pick f392171 Added new feature X
pick ba9dd9a Added new elements to page design
pick df71a27 Updated CSS for new elements
{% endhighlight %}

replace to this

{% highlight plaintext %}
pick f392171 Added new feature X
squash ba9dd9a Added new elements to page design
squash df71a27 Updated CSS for new elements
{% endhighlight %}

{% highlight swift %}
git rebase --continue
{% endhighlight %}


{% highlight bash %}
# Reset the current branch to the commit just before the last 12:
git reset --hard HEAD~12

# HEAD@{1} is where the branch was just before the previous command.
# This command sets the state of the index to be as it would just
# after a merge from that commit:
git merge --squash HEAD@{1}

# Commit those squashed changes.  The commit message will be helpfully
# prepopulated with the commit messages of all the squashed commits:
git commit
{% endhighlight %}





Checkout the golden repo
{% highlight bash %}
git checkout golden_repo_name
{% endhighlight %}

Create a new branch from it(golden repo) as follows
{% highlight bash %}
git checkout -b dev-branch
{% endhighlight %}

Squash merge with your local branch that you have already
{% highlight bash %}
git merge --squash feature-branch
{% endhighlight %}

Commit your changes (this will be the only commit that goes in dev-branch)
{% highlight bash %}
git commit -m "My feature complete"
{% endhighlight %}

Push the branch to your local repository
{% highlight bash %}
git push origin dev-branch
{% endhighlight %}


* [Git imarative rebase](https://www.atlassian.com/git/tutorials/rewriting-history/git-rebase)


git checkout filename

When file name is the same as branch name
git checkout -- filename

remove all modifications you have done on working copy
git reset --hard


