# Enumerate Those Windows Defenses

Goal try to write PowerShell like a sysadmin checking up manually on a system to learn PowerShell vibe - get the script on the machine a run:

```bash
nc -lvnp 80 > info.txt.b64
cat info.txt.b64 | grep -v 'POST\|User-Agent\|Content-Type\|Host\|Content-Length\|Expect\|Connection' > info.txt.b64.cyberchef

# Cyberchef recipe
`#recipe=From_Base64('A-Za-z0-9-_',false,false)Remove_null_bytes()`
```
