# powershell-tree

a simple cross-platform-powershell edition of the famous windows/unix/gnu [tree tool](https://en.wikipedia.org/wiki/Tree_(command))

# Usage

```
./tree.ps1 'C:\Program Files\dotnet\'
```

output:

```
./dotnet
+-- host
|   `-- fxr
|       +-- 3.1.0
|       |   `-- hostfxr.dll (585.4 kB)
|       +-- 3.1.31
|       |   `-- hostfxr.dll (586.4 kB)
|       +-- 6.0.0-rc.1.21451.13
|       |   `-- hostfxr.dll (365.1 kB)
|       +-- 6.0.11
|       |   `-- hostfxr.dll (366.1 kB)
|       `-- 7.0.0
|           `-- hostfxr.dll (374.7 kB)
+-- library-packs
|   +-- Microsoft.AspNetCore.Components.WebView.Maui.7.0.49.nupkg (341.6 kB)
|   +-- Microsoft.Maui.Graphics.7.0.49.nupkg (1.2 MB)
|   `-- Microsoft.Maui.Graphics.Win2D.WinUI.Desktop.7.0.49.nupkg (97.7 kB)
+-- metadata
|   `-- workloads
|       +-- 6.0.100
|       |   `-- installertype
|       |       `-- msi (0.0 B)
|       +-- 6.0.300
|       |   `-- installertype
|       |       `-- msi (0.0 B)
|       `-- 7.0.100
|           `-- installertype
|               `-- msi (0.0 B)
+-- packs
|   +-- Microsoft.Android.Ref.33
|   |   `-- 33.0.4
|   |       +-- data
|   |       |   `-- FrameworkList.xml (733.0 B)
|   |       +-- ref
|   |       |   `-- net7.0
|   |       |       +-- Java.Interop.dll (107.4 kB)
|   |       |       +-- Java.Interop.xml (17.3 kB)
|   |       |       +-- mono.android.dex (347.9 kB)
|   |       |       +-- Mono.Android.dll (14.8 MB)
...
```
