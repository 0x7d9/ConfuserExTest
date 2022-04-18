MSBuild ClassLibrary1.csproj -restore -t:rebuild

move /y bin\debug\net40\ClassLibrary1.dll ClassLibrary1.dll

:: merge
ILMerge /ndebug /targetplatform:v4 /out:ClassLibrary1C.dll ClassLibrary1.dll Microsoft.Office.Interop.Excel.dll Microsoft.Vbe.Interop.dll office.dll

:: It's ok in ConfuserEx1.5, but error in ConfuserEx1.6

:: <protection id="rename">
:: <argument name="mode" value="sequential" />
:: <argument name="renPublic" value="true" />

Confuser.CLI -out Confused .\ClassLibrary1C.dll CEX.crproj

pause
