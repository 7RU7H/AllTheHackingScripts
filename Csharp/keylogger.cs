//From https://tryhackme.com/room/windowsapi
// p/invoke definitions for future reference
//[DllImport("user32.dll", CharSet = CharSet.Auto, SetLastError = true)]
//private static extern IntPtr SetWindowsHookEx(int idHook, LowLevelKeyboardProc lpfn, IntPtr hMod, uint dwThreadId);
//[DllImport("user32.dll", CharSet = CharSet.Auto, SetLastError = true)]
//[return: MarshalAs(UnmanagedType.Bool)]
//private static extern bool UnhookWindowsHookEx(IntPtr hhk);
//[DllImport("kernel32.dll", CharSet = CharSet.Auto, SetLastError = true)]
//private static extern IntPtr GetModuleHandle(string lpModuleName);
//private static int WHKEYBOARDLL = 13;
//[DllImport("kernel32.dll", CharSet = CharSet.Auto, SetLastError = true)]
//private static extern IntPtr GetCurrentProcess();


public static void Main() {
	_hookID = SetHook(_proc);
	Application.Run();
	UnhookWindowsHookEx(_hookID);
	Application.Exit();
}
private static IntPtr SetHook(LowLevelKeyboardProc proc) {
	using (Process curProcess = Process.GetCurrentProcess()) {
		return SetWindowsHookEx(WHKEYBOARDLL, proc, GetModuleHandle(curProcess.ProcessName), 0);
	}
}
