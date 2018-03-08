node {
	stage 'Checkout'
		checkout scm

  env.getEnvironment()
//mkdir C:\projects\llvm\build
//cd C:\projects\llvm\build
//cmake -G "Visual Studio 14 2015" C:\projects\llvm

//# subdependencies for my library
//msbuild llvm.sln /m /t:Libraries\LLVMCore
//msbuild llvm.sln /m /t:Libraries\LLVMAsmParser
//msbuild llvm.sln /m /t:Libraries\LLVMBitReader
//msbuild llvm.sln /m /t:Libraries\LLVMProfileData
//msbuild llvm.sln /m /t:Libraries\LLVMMC
//msbuild llvm.sln /m /t:Libraries\LLVMMCParser
//msbuild llvm.sln /m /t:Libraries\LLVMObject
//msbuild llvm.sln /m /t:Libraries\LLVMAnalysis

//# dependencies for my library
//msbuild llvm.sln /m /t:Libraries\LLVMIRReader
//msbuild llvm.sln /m /t:Libraries\LLVMTransformUtils

//# to build my library
//msbuild llvm.sln /m /t:Tools\llvm-config

//# to check strip-debug-info
//msbuild llvm.sln /m /t:Tools\llvm-dis

//msbuild llvm.sln /m /t:llvm-headers

	stage 'Build'
		bat 'nuget restore SolutionName.sln'
		bat "\"${tool 'MSBuild'}\" SolutionName.sln /p:Configuration=Release /p:Platform=\"Any CPU\" /p:ProductVersion=1.0.0.${env.BUILD_NUMBER}"

	stage 'Archive'
		archive 'ProjectName/bin/Release/**'
}
