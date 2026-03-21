DISCLAIMER

This contains alot of refactored or improved scripts, anything that is not mine is referenced
Any refactored stuff or the idea to add to should have a a reference. If not please message me so I can attribute.

# TODO 
Find or make percentage script to show how much this is NOT my work!
correctFileEnc.sh Not working! -> change to find fileencoding aswell

Inspired by PayloadAllTheThings, a place for all those cool scripts I have found or made that have come in use.
An archive to store everything and pay tribute to those that have helped me in solving problems, taught me to code and hack.

Every piece of code that was not written by me, - still figuring out github - the person or group gets a followed and starred.


There are one(-ish\*)-liners and concept files per language.
I trying to refactor for each language as and when I need to, therefore if am not using it I am not refactoring to it or writing from scratch or finding scripts.
I separated one-liner out from my own cheatsheets for the purpose of archiving and more importantly finding, remembering and using them more

📂 Directory: python3/ (The Heavy Hitters)

    EnumElf.py: Your lately updated script with an angr script generator. Very clever for static analysis.

    pypy_pwn.py: A template for exploit POCs and binary exploitation.

    shell_gen.py: For when you need a quick way to craft payloads without the manual labor.

    xor_encoder.py / b64_custom.py: Custom encoding functions for obfuscation.

    dir_brute.py: A threaded directory brute-forcer (your own little "Meseeks" for finding hidden paths).

    listener.py: A stable reverse shell handler.

📂 Directory: powershell/ (Windows Persistence)

    AMS_Bypass.ps1: A classic script to blind AMSI so your toys can play in peace.

    Invoke-Persistence.ps1: Sets up startup folder or registry-based persistence.

    PrivEsc_Check.ps1: A collection of one-liners for finding misconfigured services/unquoted paths.

    LogCleaner.ps1: "I was never here"—for clearing Event Viewer logs.

📂 Directory: cpp_c/ (System Level)

    useradd.c: Compiles down to a tiny binary that adds a local admin user (the "Measure twice, cut once" special).

    buffer_overflow_template.cpp: A boilerplate for calculating offsets and overwriting EIP.

    process_hollower.cpp: Advanced stealth technique—replacing a legitimate process with your own code.

📂 Directory: go/ (The Modern Edge)

    portscanner.go: High-concurrency port scanning. Much faster than the Python version for big networks.

    webhook_exfil.go: A neat little tool to exfiltrate data via Discord/Slack webhooks.

📂 Directory: shell_bash/ (The CTF Toolkit)

    find_setuid.sh: Scans the filesystem for binaries with the SUID bit set.

    reverse_shell_one_liners.txt: Your personal cheat sheet for Bash, Perl, Ruby, and PHP shells.

    grep_secrets.sh: Recursively greps through /var/www or config files for passwords/API keys.

📂 Directory: javascript/

    encoding_funcs.js: Refactored functions for handling browser-side data manipulation.

    xss_payloads.js: A collection of "Don't click that link" scripts for testing web vulnerabilities.


# References:
# Anyone on here is followed and starred

https://gist.github.com/mzfr 

https://tryhackme.com/room/pythonforcybersecurity

bash/sshspy.sh:# From: https://www.infosecmatter.com/ssh-sniffing-ssh-spying-methods-and-defense/
bash/manageKRB5Conf.sh:function removeFromKRB5Conf ()
bash/manageKRB5Conf.sh:        remove) removeFromKRB5Conf $2 $3 $4 $5 ;;
python3/8L4ckH47-Python-Book/screenshotter.py:    img_dc = win32ui.CreateDCFromHandle(desktop_dc)
python3/8L4ckH47-Python-Book/email_exfil.py:    message = f'Subject: {subject}\nFrom {smtp_acct}\n'
Cplusplus/hollowing-injector.cpp:// From https://tryhackme.com/room/abusingwindowsinternals
Cplusplus/DLL-Injection/dll-injector.c:// From https://tryhackme.com/room/abusingwindowsinternals
Cplusplus/DLL-Injection/dllmain.cpp:// From https://tryhackme.com/room/abusingwindowsinternals
Cplusplus/thread-injector.cpp:// From https://tryhackme.com/room/abusingwindowsinternals
PowerShell/Enum-Win-Defenses/README.md:`#recipe=From_Base64('A-Za-z0-9-_',false,false)Remove_null_bytes()`
PowerShell/AD-DCOM-HTA.ps1:     $com = [activator]::CreateInstance([type]::GetTypeFromProgId("$applicationName.Application", "$IP"))
PowerShell/AD-DCOM-HTA.ps1:$com = [activator]::CreateInstance([type]::GetTypeFromProgId($Application, $IP))
PowerShell/Spray-Passwords.ps1:                            $then = [DateTime]::FromFileTime($badpwdtime)
PowerShell/StartupPersistenceScript.ps1:# From https://tryhackme.com/r/room/windowsuseraccountforensics
Csharp/Encryptor.cs:// From https://tryhackme.com/room/avevasionshellcode
Csharp/keylogger.cs://From https://tryhackme.com/room/windowsapi
Csharp/shellcode-launcher.cs:// From https://tryhackme.com/room/windowsapi

bash/vpn-down.sh:# Author: BHIS - Michael Allen
bash/Curlculator.sh:# Author 7ru7h
bash/manageKRB5Conf.sh:# Author: 7ru7h
python3/angr-binaryAnalysis.py:# Author XCT from https://www.youtube.com/watch?v=UnZj5zzcBG4
PowerShell/Spray-Passwords.ps1:    Authored by    : Jakob H. Heidelberg / @JakobHeidelberg / www.improsec.com
Csharp/Stager.cs:// Original Author: @mvelazc0
