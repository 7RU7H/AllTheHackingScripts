# Note on wordlists


## 32emailsForSpecialChars.txt



## betterRaftandDirb.txt

Create simplely to be slightly better than average.
```bash
cat /usr/share/wordlists/seclists/Discovery/Web-Content/raft-small-words.txt | cat /usr/share/wordlists/seclists/Discovery/Web-Content/directory-list-2.3-medium.txt| cat /usr/share/wordlists/seclists/Discovery/Web-Content/common.txt |  uniq | sort > betterRaftandDirb.txt
```

## rockyou5000.txt

First 5000 words of rockyou

## specialChars.txt

Fuzz special characters - redundant in payloadAllTheThings
