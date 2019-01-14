# CompilerCrasherAutoclosureSubscript

Swift version: 5.0-DEVELOPMENT-SNAPSHOT-2019-01-13-a

```
$ swift build
$ swift test --enable-code-coverage
```

This crashes the compiler

```
Assertion failed: (Loc.isValid()), function getLineAndColumn, file /Users/buildnode/jenkins/workspace/oss-swift-5.0-package-osx/swift/include/swift/Basic/SourceManager.h, line 195.
Stack dump:
0.	Program arguments: /Library/Developer/Toolchains/swift-5.0-DEVELOPMENT-SNAPSHOT-2019-01-13-a.xctoolchain/usr/bin/swift -frontend -c -primary-file /Users/sergej/Developer/swift-compiler-bug/Sources/S/S.swift -emit-module-path /Users/sergej/Developer/swift-compiler-bug/.build/x86_64-apple-macosx/debug/S.build/S~partial.swiftmodule -emit-module-doc-path /Users/sergej/Developer/swift-compiler-bug/.build/x86_64-apple-macosx/debug/S.build/S~partial.swiftdoc -emit-dependencies-path /Users/sergej/Developer/swift-compiler-bug/.build/x86_64-apple-macosx/debug/S.build/S.d -emit-reference-dependencies-path /Users/sergej/Developer/swift-compiler-bug/.build/x86_64-apple-macosx/debug/S.build/S.swiftdeps -target x86_64-apple-macosx10.10 -enable-objc-interop -sdk /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.14.sdk -I /Users/sergej/Developer/swift-compiler-bug/.build/x86_64-apple-macosx/debug -F /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/Library/Frameworks -enable-testing -g -module-cache-path /Users/sergej/Developer/swift-compiler-bug/.build/x86_64-apple-macosx/debug/ModuleCache -profile-generate -profile-coverage-mapping -swift-version 4.2 -Onone -D SWIFT_PACKAGE -D DEBUG -color-diagnostics -parse-as-library -module-name S -o /Users/sergej/Developer/swift-compiler-bug/.build/x86_64-apple-macosx/debug/S.build/S.swift.o -index-store-path /Users/sergej/Developer/swift-compiler-bug/.build/x86_64-apple-macosx/debug/index/store -index-system-modules 
1.	While emitting SIL for modify for subscript(_:_:) (at /Users/sergej/Developer/swift-compiler-bug/Sources/S/S.swift:3:3)
2.	While silgen emitFunction SIL function "@$s1SAAVyS2i_SiyXKtciM".
 for modify for subscript(_:_:) (at /Users/sergej/Developer/swift-compiler-bug/Sources/S/S.swift:3:3)
0  swift                    0x0000000106246858 llvm::sys::PrintStackTrace(llvm::raw_ostream&) + 40
1  swift                    0x0000000106245ad5 llvm::sys::RunSignalHandlers() + 85
2  swift                    0x0000000106246e62 SignalHandler(int) + 258
3  libsystem_platform.dylib 0x00007fff5dbb6b3d _sigtramp + 29
4  swift                    0x000000010755dae5 cmark_strbuf__initbuf + 131400
5  libsystem_c.dylib        0x00007fff5da741c9 abort + 127
6  libsystem_c.dylib        0x00007fff5da3c868 basename_r + 0
7  swift                    0x0000000103492ca6 swift::SILProfiler::assignRegionCounters() + 3926
8  swift                    0x0000000103491c44 swift::SILProfiler::create(swift::SILModule&, swift::ForDefinition_t, swift::ASTNode) + 436
9  swift                    0x000000010341b0c2 swift::SILFunction::createProfiler(swift::ASTNode, swift::ForDefinition_t) + 34
10 swift                    0x0000000102ed46c9 swift::Lowering::SILGenModule::getFunction(swift::SILDeclRef, swift::ForDefinition_t) + 569
11 swift                    0x0000000102ed670d swift::Lowering::SILGenModule::emitClosure(swift::AbstractClosureExpr*) + 77
12 swift                    0x0000000102f5c1e8 (anonymous namespace)::RValueEmitter::visitAbstractClosureExpr(swift::AbstractClosureExpr*, swift::Lowering::SGFContext) + 40
13 swift                    0x0000000102f4f160 swift::ASTVisitor<(anonymous namespace)::RValueEmitter, swift::Lowering::RValue, void, void, void, void, void, swift::Lowering::SGFContext>::visit(swift::Expr*, swift::Lowering::SGFContext) + 112
14 swift                    0x0000000102f43d69 swift::Lowering::SILGenFunction::emitRValueAsSingleValue(swift::Expr*, swift::Lowering::SGFContext) + 57
15 swift                    0x0000000102ef5b74 (anonymous namespace)::ArgEmitter::emit(swift::Lowering::ArgumentSource&&, swift::Lowering::AbstractionPattern) + 2740
16 swift                    0x0000000102ef698d (anonymous namespace)::ArgEmitter::emitExpanded(swift::Lowering::ArgumentSource&&, swift::Lowering::AbstractionPattern) + 685
      0x0000000102ef5136 (anonymous namespace)::ArgEmitter::emit(swift::Lowering::ArgumentSource&&, swift::Lowering::AbstractionPattern) + 118
18 swift                    0x0000000102eee690 (anonymous namespace)::ArgEmitter::emitTopLevel(swift::Lowering::ArgumentSource&&, swift::Lowering::AbstractionPattern) + 2784
19 swift                    0x0000000102eed4be swift::Lowering::SILGenFunction::prepareSubscriptIndices(swift::SubscriptDecl*, swift::SubstitutionMap, swift::AccessStrategy, swift::Expr*) + 830
20 swift                    0x0000000102f7668e SILGenLValue::visitSubscriptExpr(swift::SubscriptExpr*, swift::Lowering::SGFAccessKind, swift::Lowering::LValueOptions) + 686
21 swift                    0x0000000102f71a4b swift::ASTVisitor<SILGenLValue, swift::Lowering::LValue, void, void, void, void, void, swift::Lowering::SGFAccessKind, swift::Lowering::LValueOptions>::visit(swift::Expr*, swift::Lowering::SGFAccessKind, swift::Lowering::LValueOptions) + 283
22 swift                    0x0000000102f7180a swift::Lowering::SILGenFunction::emitLValue(swift::Expr*, swift::Lowering::SGFAccessKind, swift::Lowering::LValueOptions) + 58
23 swift                    0x0000000102ef5434 (anonymous namespace)::ArgEmitter::emit(swift::Lowering::ArgumentSource&&, swift::Lowering::AbstractionPattern) + 884
24 swift                    0x0000000102ee2db8 swift::Lowering::SILGenFunction::emitYield(swift::SILLocation, llvm::MutableArrayRef<swift::Lowering::ArgumentSource>, llvm::ArrayRef<swift::Lowering::AbstractionPattern>, swift::Lowering::JumpDest) + 792
25 swift                    0x0000000102fb25c6 swift::ASTVisitor<(anonymous namespace)::StmtEmitter, void, void, void, void, void, void>::visit(swift::Stmt*) + 4262
26 swift                    0x0000000102fb362b swift::ASTVisitor<(anonymous namespace)::StmtEmitter, void, void, void, void, void, void>::visit(swift::Stmt*) + 8459
27 swift                    0x0000000102fb1515 swift::Lowering::SILGenFunction::emitStmt(swift::Stmt*) + 21
28 swift                    0x0000000102f6722a swift::Lowering::SILGenFunction::emitFunction(swift::FuncDecl*) + 426
29 swift                    0x0000000102edde0d swift::Lowering::SILGenModule::emitFunction(swift::FuncDecl*)::$_1::operator()(swift::SILFunction*) const + 237
30 swift                    0x0000000102ed4df2 swift::Lowering::SILGenModule::emitFunction(swift::FuncDecl*) + 642
31 swift                    0x0000000102fbe5e5 (anonymous namespace)::SILGenType::visitFuncDecl(swift::FuncDecl*) + 21
32 swift                    0x0000000102fbbe6f (anonymous namespace)::SILGenType::emitType() + 239
33 swift                    0x0000000102fbbd79 swift::Lowering::SILGenModule::visitNominalTypeDecl(swift::NominalTypeDecl*) + 25
34 swift                    0x0000000102eda2d6 swift::Lowering::SILGenModule::emitSourceFile(swift::SourceFile*) + 822
35 swift                    0x0000000102edb1e6 swift::SILModule::constructSIL(swift::ModuleDecl*, swift::SILOptions&, swift::FileUnit*) + 294
36 swift                    0x0000000102edb77c swift::performSILGeneration(swift::FileUnit&, swift::SILOptions&) + 44
37 swift                    0x000000010265ff73 performCompile(swift::CompilerInstance&, swift::CompilerInvocation&, llvm::ArrayRef<char const*>, int&, swift::FrontendObserver*, swift::UnifiedStatsReporter*) + 7491
38 swift                    0x000000010265d19d swift::performFrontend(llvm::ArrayRef<char const*>, char const*, void*, swift::FrontendObserver*) + 3021
39 swift                    0x000000010260f0be main + 686
40 libdyld.dylib            0x00007fff5d9cbed9 start + 1
<unknown>:0: error: unable to execute command: Abort trap: 6
<unknown>:0: error: compile command failed due to signal 6 (use -v to see invocation)
```
