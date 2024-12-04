; ModuleID = 'test-files/example6.c'
source_filename = "test-files/example6.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [23 x i8] c"Enter a choice (1-3): \00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.2 = private unnamed_addr constant [21 x i8] c"You chose option 1.\0A\00", align 1
@.str.3 = private unnamed_addr constant [21 x i8] c"You chose option 2.\0A\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"You chose option 3.\0A\00", align 1
@.str.5 = private unnamed_addr constant [17 x i8] c"Invalid choice.\0A\00", align 1
@.str.6 = private unnamed_addr constant [36 x i8] c"Enter a number for the loop count: \00", align 1
@.str.7 = private unnamed_addr constant [41 x i8] c"Starting a for loop with %d iterations:\0A\00", align 1
@.str.8 = private unnamed_addr constant [14 x i8] c"Iteration %d\0A\00", align 1
@.str.9 = private unnamed_addr constant [48 x i8] c"Loop count must be positive. No loop executed.\0A\00", align 1
@.str.10 = private unnamed_addr constant [46 x i8] c"Executing a while loop to countdown from %d:\0A\00", align 1
@.str.11 = private unnamed_addr constant [15 x i8] c"Countdown: %d\0A\00", align 1
@.str.12 = private unnamed_addr constant [29 x i8] c"Program execution finished.\0A\00", align 1

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
  %6 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([23 x i8], [23 x i8]* @.str, i64 0, i64 0)), !dbg !21
  %7 = call i32 (i8*, ...) @__isoc99_scanf(i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i64 0, i64 0), i32* noundef %2), !dbg !22
  %8 = load i32, i32* %2, align 4, !dbg !23
  switch i32 %8, label %15 [
    i32 1, label %9
    i32 2, label %11
    i32 3, label %13
  ], !dbg !24

9:                                                ; preds = %0
  %10 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.2, i64 0, i64 0)), !dbg !25
  br label %17, !dbg !27

11:                                               ; preds = %0
  %12 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.3, i64 0, i64 0)), !dbg !28
  br label %17, !dbg !29

13:                                               ; preds = %0
  %14 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !30
  br label %17, !dbg !31

15:                                               ; preds = %0
  %16 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.5, i64 0, i64 0)), !dbg !32
  br label %17, !dbg !33

17:                                               ; preds = %15, %13, %11, %9
  %18 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !34
  %19 = call i32 (i8*, ...) @__isoc99_scanf(i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i64 0, i64 0), i32* noundef %3), !dbg !35
  %20 = load i32, i32* %3, align 4, !dbg !36
  %21 = icmp sgt i32 %20, 0, !dbg !38
  br i1 %21, label %22, label %37, !dbg !39

22:                                               ; preds = %17
  %23 = load i32, i32* %3, align 4, !dbg !40
  %24 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([41 x i8], [41 x i8]* @.str.7, i64 0, i64 0), i32 noundef %23), !dbg !42
  store i32 0, i32* %4, align 4, !dbg !43
  br label %25, !dbg !45

25:                                               ; preds = %33, %22
  %26 = load i32, i32* %4, align 4, !dbg !46
  %27 = load i32, i32* %3, align 4, !dbg !48
  %28 = icmp slt i32 %26, %27, !dbg !49
  br i1 %28, label %29, label %36, !dbg !50

29:                                               ; preds = %25
  %30 = load i32, i32* %4, align 4, !dbg !51
  %31 = add nsw i32 %30, 1, !dbg !53
  %32 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([14 x i8], [14 x i8]* @.str.8, i64 0, i64 0), i32 noundef %31), !dbg !54
  br label %33, !dbg !55

33:                                               ; preds = %29
  %34 = load i32, i32* %4, align 4, !dbg !56
  %35 = add nsw i32 %34, 1, !dbg !56
  store i32 %35, i32* %4, align 4, !dbg !56
  br label %25, !dbg !57, !llvm.loop !58

36:                                               ; preds = %25
  br label %39, !dbg !61

37:                                               ; preds = %17
  %38 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([48 x i8], [48 x i8]* @.str.9, i64 0, i64 0)), !dbg !62
  br label %39

39:                                               ; preds = %37, %36
  call void @llvm.dbg.declare(metadata i32* %5, metadata !64, metadata !DIExpression()), !dbg !65
  store i32 5, i32* %5, align 4, !dbg !65
  %40 = load i32, i32* %5, align 4, !dbg !66
  %41 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([46 x i8], [46 x i8]* @.str.10, i64 0, i64 0), i32 noundef %40), !dbg !67
  br label %42, !dbg !68

42:                                               ; preds = %45, %39
  %43 = load i32, i32* %5, align 4, !dbg !69
  %44 = icmp sgt i32 %43, 0, !dbg !70
  br i1 %44, label %45, label %50, !dbg !68

45:                                               ; preds = %42
  %46 = load i32, i32* %5, align 4, !dbg !71
  %47 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.11, i64 0, i64 0), i32 noundef %46), !dbg !73
  %48 = load i32, i32* %5, align 4, !dbg !74
  %49 = add nsw i32 %48, -1, !dbg !74
  store i32 %49, i32* %5, align 4, !dbg !74
  br label %42, !dbg !68, !llvm.loop !75

50:                                               ; preds = %42
  %51 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([29 x i8], [29 x i8]* @.str.12, i64 0, i64 0)), !dbg !77
  ret i32 0, !dbg !78
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
!1 = !DIFile(filename: "test-files/example6.c", directory: "/home/mhpatel4/repos/llvm-project", checksumkind: CSK_MD5, checksum: "79e9b96a9f50cc8fb62f913a895e621b")
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
!15 = !DILocalVariable(name: "choice", scope: !10, file: !1, line: 4, type: !13)
!16 = !DILocation(line: 4, column: 9, scope: !10)
!17 = !DILocalVariable(name: "loopCount", scope: !10, file: !1, line: 4, type: !13)
!18 = !DILocation(line: 4, column: 17, scope: !10)
!19 = !DILocalVariable(name: "i", scope: !10, file: !1, line: 4, type: !13)
!20 = !DILocation(line: 4, column: 28, scope: !10)
!21 = !DILocation(line: 6, column: 5, scope: !10)
!22 = !DILocation(line: 7, column: 5, scope: !10)
!23 = !DILocation(line: 10, column: 13, scope: !10)
!24 = !DILocation(line: 10, column: 5, scope: !10)
!25 = !DILocation(line: 12, column: 13, scope: !26)
!26 = distinct !DILexicalBlock(scope: !10, file: !1, line: 10, column: 21)
!27 = !DILocation(line: 13, column: 13, scope: !26)
!28 = !DILocation(line: 15, column: 13, scope: !26)
!29 = !DILocation(line: 16, column: 13, scope: !26)
!30 = !DILocation(line: 18, column: 13, scope: !26)
!31 = !DILocation(line: 19, column: 13, scope: !26)
!32 = !DILocation(line: 21, column: 13, scope: !26)
!33 = !DILocation(line: 22, column: 5, scope: !26)
!34 = !DILocation(line: 25, column: 5, scope: !10)
!35 = !DILocation(line: 26, column: 5, scope: !10)
!36 = !DILocation(line: 28, column: 9, scope: !37)
!37 = distinct !DILexicalBlock(scope: !10, file: !1, line: 28, column: 9)
!38 = !DILocation(line: 28, column: 19, scope: !37)
!39 = !DILocation(line: 28, column: 9, scope: !10)
!40 = !DILocation(line: 29, column: 61, scope: !41)
!41 = distinct !DILexicalBlock(scope: !37, file: !1, line: 28, column: 24)
!42 = !DILocation(line: 29, column: 9, scope: !41)
!43 = !DILocation(line: 30, column: 16, scope: !44)
!44 = distinct !DILexicalBlock(scope: !41, file: !1, line: 30, column: 9)
!45 = !DILocation(line: 30, column: 14, scope: !44)
!46 = !DILocation(line: 30, column: 21, scope: !47)
!47 = distinct !DILexicalBlock(scope: !44, file: !1, line: 30, column: 9)
!48 = !DILocation(line: 30, column: 25, scope: !47)
!49 = !DILocation(line: 30, column: 23, scope: !47)
!50 = !DILocation(line: 30, column: 9, scope: !44)
!51 = !DILocation(line: 31, column: 38, scope: !52)
!52 = distinct !DILexicalBlock(scope: !47, file: !1, line: 30, column: 41)
!53 = !DILocation(line: 31, column: 40, scope: !52)
!54 = !DILocation(line: 31, column: 13, scope: !52)
!55 = !DILocation(line: 32, column: 9, scope: !52)
!56 = !DILocation(line: 30, column: 37, scope: !47)
!57 = !DILocation(line: 30, column: 9, scope: !47)
!58 = distinct !{!58, !50, !59, !60}
!59 = !DILocation(line: 32, column: 9, scope: !44)
!60 = !{!"llvm.loop.mustprogress"}
!61 = !DILocation(line: 33, column: 5, scope: !41)
!62 = !DILocation(line: 34, column: 9, scope: !63)
!63 = distinct !DILexicalBlock(scope: !37, file: !1, line: 33, column: 12)
!64 = !DILocalVariable(name: "whileCounter", scope: !10, file: !1, line: 38, type: !13)
!65 = !DILocation(line: 38, column: 9, scope: !10)
!66 = !DILocation(line: 39, column: 62, scope: !10)
!67 = !DILocation(line: 39, column: 5, scope: !10)
!68 = !DILocation(line: 40, column: 5, scope: !10)
!69 = !DILocation(line: 40, column: 12, scope: !10)
!70 = !DILocation(line: 40, column: 25, scope: !10)
!71 = !DILocation(line: 41, column: 35, scope: !72)
!72 = distinct !DILexicalBlock(scope: !10, file: !1, line: 40, column: 30)
!73 = !DILocation(line: 41, column: 9, scope: !72)
!74 = !DILocation(line: 42, column: 21, scope: !72)
!75 = distinct !{!75, !68, !76, !60}
!76 = !DILocation(line: 43, column: 5, scope: !10)
!77 = !DILocation(line: 45, column: 5, scope: !10)
!78 = !DILocation(line: 46, column: 5, scope: !10)
