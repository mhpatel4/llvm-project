; ModuleID = 'test-files/example3.c'
source_filename = "test-files/example3.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [17 x i8] c"Enter a number: \00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.2 = private unnamed_addr constant [33 x i8] c"Enter a number to add to count: \00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Total count: %d\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !10 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  call void @llvm.dbg.declare(metadata i32* %2, metadata !15, metadata !DIExpression()), !dbg !16
  call void @llvm.dbg.declare(metadata i32* %3, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i32* %4, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i32* %5, metadata !21, metadata !DIExpression()), !dbg !22
  store i32 0, i32* %5, align 4, !dbg !22
  %6 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str, i64 0, i64 0)), !dbg !23
  %7 = call i32 (i8*, ...) @__isoc99_scanf(i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i64 0, i64 0), i32* noundef %2), !dbg !24
  store i32 0, i32* %3, align 4, !dbg !25
  br label %8, !dbg !27

8:                                                ; preds = %18, %0
  %9 = load i32, i32* %3, align 4, !dbg !28
  %10 = load i32, i32* %2, align 4, !dbg !30
  %11 = icmp slt i32 %9, %10, !dbg !31
  br i1 %11, label %12, label %21, !dbg !32

12:                                               ; preds = %8
  %13 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([33 x i8], [33 x i8]* @.str.2, i64 0, i64 0)), !dbg !33
  %14 = call i32 (i8*, ...) @__isoc99_scanf(i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i64 0, i64 0), i32* noundef %4), !dbg !35
  %15 = load i32, i32* %4, align 4, !dbg !36
  %16 = load i32, i32* %5, align 4, !dbg !37
  %17 = add nsw i32 %16, %15, !dbg !37
  store i32 %17, i32* %5, align 4, !dbg !37
  br label %18, !dbg !38

18:                                               ; preds = %12
  %19 = load i32, i32* %3, align 4, !dbg !39
  %20 = add nsw i32 %19, 1, !dbg !39
  store i32 %20, i32* %3, align 4, !dbg !39
  br label %8, !dbg !40, !llvm.loop !41

21:                                               ; preds = %8
  %22 = load i32, i32* %5, align 4, !dbg !44
  %23 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0), i32 noundef %22), !dbg !45
  ret i32 0, !dbg !46
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @printf(i8* noundef, ...) #2

declare i32 @__isoc99_scanf(i8* noundef, ...) #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7, !8}
!llvm.ident = !{!9}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Ubuntu clang version 14.0.0-1ubuntu1.1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "test-files/example3.c", directory: "/home/mhpatel4/repos/llvm-project", checksumkind: CSK_MD5, checksum: "bd66208739d9dbd037ea5fd44340fae1")
!2 = !{i32 7, !"Dwarf Version", i32 5}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"PIE Level", i32 2}
!7 = !{i32 7, !"uwtable", i32 1}
!8 = !{i32 7, !"frame-pointer", i32 2}
!9 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
!10 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 3, type: !11, scopeLine: 3, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !{}
!15 = !DILocalVariable(name: "n", scope: !10, file: !1, line: 4, type: !13)
!16 = !DILocation(line: 4, column: 9, scope: !10)
!17 = !DILocalVariable(name: "i", scope: !10, file: !1, line: 4, type: !13)
!18 = !DILocation(line: 4, column: 12, scope: !10)
!19 = !DILocalVariable(name: "input", scope: !10, file: !1, line: 4, type: !13)
!20 = !DILocation(line: 4, column: 15, scope: !10)
!21 = !DILocalVariable(name: "count", scope: !10, file: !1, line: 4, type: !13)
!22 = !DILocation(line: 4, column: 22, scope: !10)
!23 = !DILocation(line: 6, column: 5, scope: !10)
!24 = !DILocation(line: 7, column: 5, scope: !10)
!25 = !DILocation(line: 9, column: 12, scope: !26)
!26 = distinct !DILexicalBlock(scope: !10, file: !1, line: 9, column: 5)
!27 = !DILocation(line: 9, column: 10, scope: !26)
!28 = !DILocation(line: 9, column: 17, scope: !29)
!29 = distinct !DILexicalBlock(scope: !26, file: !1, line: 9, column: 5)
!30 = !DILocation(line: 9, column: 21, scope: !29)
!31 = !DILocation(line: 9, column: 19, scope: !29)
!32 = !DILocation(line: 9, column: 5, scope: !26)
!33 = !DILocation(line: 10, column: 9, scope: !34)
!34 = distinct !DILexicalBlock(scope: !29, file: !1, line: 9, column: 29)
!35 = !DILocation(line: 11, column: 9, scope: !34)
!36 = !DILocation(line: 12, column: 18, scope: !34)
!37 = !DILocation(line: 12, column: 15, scope: !34)
!38 = !DILocation(line: 13, column: 5, scope: !34)
!39 = !DILocation(line: 9, column: 25, scope: !29)
!40 = !DILocation(line: 9, column: 5, scope: !29)
!41 = distinct !{!41, !32, !42, !43}
!42 = !DILocation(line: 13, column: 5, scope: !26)
!43 = !{!"llvm.loop.mustprogress"}
!44 = !DILocation(line: 15, column: 33, scope: !10)
!45 = !DILocation(line: 15, column: 5, scope: !10)
!46 = !DILocation(line: 17, column: 5, scope: !10)
