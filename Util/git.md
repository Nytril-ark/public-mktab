
---

To update local repository with changes from the remote, 
but ensure that your local modifications (even if they conflict with remote changes) take precedence:

`git pull -X ours`

or, on the opposite side:

`git pull -X theirs`

---

to revert most recent commit (by adding a commit that undoes the recent one)
```
git revert HEAD
git push
```
