class Xctool < Formula
  desc "Drop-in replacement for xcodebuild with a few extra features"
  homepage 'https://github.com/facebook/xctool'
  # url 'https://github.com/facebook/xctool/archive/v0.2.4.tar.gz'
  # sha256 '0eb7a0ed45feb413ee12fd10f2425975124c1ee3c5dd55e35fa1ff271cea841a'
  head 'https://github.com/facebook/xctool.git'

  patch :p1, :DATA
  
  # bottle do
  #   cellar :any
  #   sha256 "4ec86b7dcd1cfe3b60064d037f58fe79a31e1747b277f04c1c8dc7880e573597" => :yosemite
  #   sha256 "6d59a5ba2bac54067349a387ed427407e08896f2d74e05666c1342db3a27264c" => :mavericks
  # end

  depends_on :xcode => "6.0"

  def install
    system "./scripts/build.sh", "XT_INSTALL_ROOT=#{libexec}"
    bin.install_symlink "#{libexec}/bin/xctool"
  end

  test do
    system "(#{bin}/xctool -help; true)"
  end
end


__END__
diff --git a/xctool/xctool.xcodeproj/xcshareddata/xcschemes/xctool.xcscheme b/xctool/xctool.xcodeproj/xcshareddata/xcschemes/xctool.xcscheme
index 0ea0637..4e2234e 100644
--- a/xctool/xctool.xcodeproj/xcshareddata/xcschemes/xctool.xcscheme
+++ b/xctool/xctool.xcodeproj/xcshareddata/xcschemes/xctool.xcscheme
@@ -1,7 +1,7 @@
 <?xml version="1.0" encoding="UTF-8"?>
 <Scheme
    LastUpgradeVersion = "0700"
-   version = "1.8">
+   version = "1.3">
    <BuildAction
       parallelizeBuildables = "NO"
       buildImplicitDependencies = "NO">
@@ -14,90 +14,6 @@
             buildForAnalyzing = "YES">
             <BuildableReference
                BuildableIdentifier = "primary"
-               BlueprintIdentifier = "CD9048FD1756C5B1006CF16D"
-               BuildableName = "otest-query-ios"
-               BlueprintName = "otest-query-ios"
-               ReferencedContainer = "container:../otest-query/otest-query.xcodeproj">
-            </BuildableReference>
-         </BuildActionEntry>
-         <BuildActionEntry
-            buildForTesting = "YES"
-            buildForRunning = "YES"
-            buildForProfiling = "YES"
-            buildForArchiving = "YES"
-            buildForAnalyzing = "YES">
-            <BuildableReference
-               BuildableIdentifier = "primary"
-               BlueprintIdentifier = "CD66612B175D1A890057DF4D"
-               BuildableName = "otest-query-osx"
-               BlueprintName = "otest-query-osx"
-               ReferencedContainer = "container:../otest-query/otest-query.xcodeproj">
-            </BuildableReference>
-         </BuildActionEntry>
-         <BuildActionEntry
-            buildForTesting = "YES"
-            buildForRunning = "YES"
-            buildForProfiling = "YES"
-            buildForArchiving = "YES"
-            buildForAnalyzing = "YES">
-            <BuildableReference
-               BuildableIdentifier = "primary"
-               BlueprintIdentifier = "283758D817CED68F006E1544"
-               BuildableName = "otest-query-lib-ios.dylib"
-               BlueprintName = "otest-query-lib-ios"
-               ReferencedContainer = "container:../otest-query/otest-query.xcodeproj">
-            </BuildableReference>
-         </BuildActionEntry>
-         <BuildActionEntry
-            buildForTesting = "YES"
-            buildForRunning = "YES"
-            buildForProfiling = "YES"
-            buildForArchiving = "YES"
-            buildForAnalyzing = "YES">
-            <BuildableReference
-               BuildableIdentifier = "primary"
-               BlueprintIdentifier = "28660746183474A7000ACB87"
-               BuildableName = "otest-query-lib-osx.dylib"
-               BlueprintName = "otest-query-lib-osx"
-               ReferencedContainer = "container:../otest-query/otest-query.xcodeproj">
-            </BuildableReference>
-         </BuildActionEntry>
-         <BuildActionEntry
-            buildForTesting = "YES"
-            buildForRunning = "YES"
-            buildForProfiling = "YES"
-            buildForArchiving = "YES"
-            buildForAnalyzing = "YES">
-            <BuildableReference
-               BuildableIdentifier = "primary"
-               BlueprintIdentifier = "283CCA8B16C2EE4C00F2E343"
-               BuildableName = "otest-shim-ios.dylib"
-               BlueprintName = "otest-shim-ios"
-               ReferencedContainer = "container:../otest-shim/otest-shim.xcodeproj">
-            </BuildableReference>
-         </BuildActionEntry>
-         <BuildActionEntry
-            buildForTesting = "YES"
-            buildForRunning = "YES"
-            buildForProfiling = "YES"
-            buildForArchiving = "YES"
-            buildForAnalyzing = "YES">
-            <BuildableReference
-               BuildableIdentifier = "primary"
-               BlueprintIdentifier = "282BFE18171602C60022F9FF"
-               BuildableName = "otest-shim-osx.dylib"
-               BlueprintName = "otest-shim-osx"
-               ReferencedContainer = "container:../otest-shim/otest-shim.xcodeproj">
-            </BuildableReference>
-         </BuildActionEntry>
-         <BuildActionEntry
-            buildForTesting = "YES"
-            buildForRunning = "YES"
-            buildForProfiling = "YES"
-            buildForArchiving = "YES"
-            buildForAnalyzing = "YES">
-            <BuildableReference
-               BuildableIdentifier = "primary"
                BlueprintIdentifier = "283CCAA816C2EE7200F2E343"
                BuildableName = "xcodebuild-shim.dylib"
                BlueprintName = "xcodebuild-shim"
@@ -272,27 +188,13 @@
                ReferencedContainer = "container:xctool.xcodeproj">
             </BuildableReference>
          </BuildActionEntry>
-         <BuildActionEntry
-            buildForTesting = "YES"
-            buildForRunning = "NO"
-            buildForProfiling = "YES"
-            buildForArchiving = "YES"
-            buildForAnalyzing = "YES">
-            <BuildableReference
-               BuildableIdentifier = "primary"
-               BlueprintIdentifier = "CCFC5E1F1B433C1B00C03A8A"
-               BuildableName = "otest-shim-tests.xctest"
-               BlueprintName = "otest-shim-tests"
-               ReferencedContainer = "container:../otest-shim/otest-shim.xcodeproj">
-            </BuildableReference>
-         </BuildActionEntry>
       </BuildActionEntries>
    </BuildAction>
    <TestAction
+      buildConfiguration = "Debug"
       selectedDebuggerIdentifier = "Xcode.DebuggerFoundation.Debugger.LLDB"
       selectedLauncherIdentifier = "Xcode.DebuggerFoundation.Launcher.LLDB"
-      shouldUseLaunchSchemeArgsEnv = "NO"
-      buildConfiguration = "Debug">
+      shouldUseLaunchSchemeArgsEnv = "NO">
       <Testables>
          <TestableReference
             skipped = "NO">
@@ -314,16 +216,6 @@
                ReferencedContainer = "container:../reporters/reporters.xcodeproj">
             </BuildableReference>
          </TestableReference>
-         <TestableReference
-            skipped = "NO">
-            <BuildableReference
-               BuildableIdentifier = "primary"
-               BlueprintIdentifier = "CCFC5E1F1B433C1B00C03A8A"
-               BuildableName = "otest-shim-tests.xctest"
-               BlueprintName = "otest-shim-tests"
-               ReferencedContainer = "container:../otest-shim/otest-shim.xcodeproj">
-            </BuildableReference>
-         </TestableReference>
       </Testables>
       <MacroExpansion>
          <BuildableReference
@@ -350,11 +242,11 @@
       </AdditionalOptions>
    </TestAction>
    <LaunchAction
+      buildConfiguration = "Debug"
       selectedDebuggerIdentifier = "Xcode.DebuggerFoundation.Debugger.LLDB"
       selectedLauncherIdentifier = "Xcode.DebuggerFoundation.Launcher.LLDB"
       launchStyle = "0"
       useCustomWorkingDirectory = "NO"
-      buildConfiguration = "Debug"
       ignoresPersistentStateOnLaunch = "NO"
       debugDocumentVersioning = "YES"
       debugServiceExtension = "internal"
@@ -373,18 +265,18 @@
       </AdditionalOptions>
    </LaunchAction>
    <ProfileAction
+      buildConfiguration = "Release"
       shouldUseLaunchSchemeArgsEnv = "YES"
       savedToolIdentifier = ""
       useCustomWorkingDirectory = "NO"
-      buildConfiguration = "Release"
       debugDocumentVersioning = "YES">
       <MacroExpansion>
          <BuildableReference
             BuildableIdentifier = "primary"
-            BlueprintIdentifier = "CD9048FD1756C5B1006CF16D"
-            BuildableName = "otest-query-ios"
-            BlueprintName = "otest-query-ios"
-            ReferencedContainer = "container:../otest-query/otest-query.xcodeproj">
+            BlueprintIdentifier = "283CCAA816C2EE7200F2E343"
+            BuildableName = "xcodebuild-shim.dylib"
+            BlueprintName = "xcodebuild-shim"
+            ReferencedContainer = "container:../xcodebuild-shim/xcodebuild-shim.xcodeproj">
          </BuildableReference>
       </MacroExpansion>
    </ProfileAction>
