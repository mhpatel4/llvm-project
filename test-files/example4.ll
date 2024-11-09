; ModuleID = 'test-files/example4.c'
source_filename = "test-files/example4.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [34 x i8] c"Result of Addition: %d + %d = %d\0A\00", align 1
@.str.1 = private unnamed_addr constant [37 x i8] c"Result of Subtraction: %d - %d = %d\0A\00", align 1
@.str.2 = private unnamed_addr constant [40 x i8] c"Result of Multiplication: %d * %d = %d\0A\00", align 1
@.str.3 = private unnamed_addr constant [34 x i8] c"Result of Division: %d / %d = %d\0A\00", align 1
@.str.4 = private unnamed_addr constant [26 x i8] c"Error: Division by zero!\0A\00", align 1
@.str.5 = private unnamed_addr constant [23 x i8] c"\0AChoose an operation:\0A\00", align 1
@.str.6 = private unnamed_addr constant [8 x i8] c"1. Add\0A\00", align 1
@.str.7 = private unnamed_addr constant [13 x i8] c"2. Subtract\0A\00", align 1
@.str.8 = private unnamed_addr constant [13 x i8] c"3. Multiply\0A\00", align 1
@.str.9 = private unnamed_addr constant [11 x i8] c"4. Divide\0A\00", align 1
@.str.10 = private unnamed_addr constant [9 x i8] c"5. Exit\0A\00", align 1
@.str.11 = private unnamed_addr constant [21 x i8] c"Enter choice (1-5): \00", align 1
@.str.12 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.13 = private unnamed_addr constant [22 x i8] c"Exiting the program.\0A\00", align 1
@.str.14 = private unnamed_addr constant [20 x i8] c"Enter two numbers: \00", align 1
@.str.15 = private unnamed_addr constant [6 x i8] c"%d %d\00", align 1
@.str.16 = private unnamed_addr constant [38 x i8] c"Invalid choice, please select again.\0A\00", align 1
@.str.17 = private unnamed_addr constant [52 x i8] c"Do you want to perform another calculation? (y/n): \00", align 1
@.str.18 = private unnamed_addr constant [4 x i8] c" %c\00", align 1
@.str.19 = private unnamed_addr constant [43 x i8] c"Thank you for using the program. Goodbye!\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @add(i32 noundef %0, i32 noundef %1) #0 !dbg !10 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  call void @llvm.dbg.declare(metadata i32* %3, metadata !15, metadata !DIExpression()), !dbg !16
  store i32 %1, i32* %4, align 4
  call void @llvm.dbg.declare(metadata i32* %4, metadata !17, metadata !DIExpression()), !dbg !18
  %5 = load i32, i32* %3, align 4, !dbg !19
  %6 = load i32, i32* %4, align 4, !dbg !20
  %7 = load i32, i32* %3, align 4, !dbg !21
  %8 = load i32, i32* %4, align 4, !dbg !22
  %9 = add nsw i32 %7, %8, !dbg !23
  %10 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([34 x i8], [34 x i8]* @.str, i64 0, i64 0), i32 noundef %5, i32 noundef %6, i32 noundef %9), !dbg !24
  ret void, !dbg !25
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @printf(i8* noundef, ...) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @subtract(i32 noundef %0, i32 noundef %1) #0 !dbg !26 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  call void @llvm.dbg.declare(metadata i32* %3, metadata !27, metadata !DIExpression()), !dbg !28
  store i32 %1, i32* %4, align 4
  call void @llvm.dbg.declare(metadata i32* %4, metadata !29, metadata !DIExpression()), !dbg !30
  %5 = load i32, i32* %3, align 4, !dbg !31
  %6 = load i32, i32* %4, align 4, !dbg !32
  %7 = load i32, i32* %3, align 4, !dbg !33
  %8 = load i32, i32* %4, align 4, !dbg !34
  %9 = sub nsw i32 %7, %8, !dbg !35
  %10 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([37 x i8], [37 x i8]* @.str.1, i64 0, i64 0), i32 noundef %5, i32 noundef %6, i32 noundef %9), !dbg !36
  ret void, !dbg !37
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @multiply(i32 noundef %0, i32 noundef %1) #0 !dbg !38 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  call void @llvm.dbg.declare(metadata i32* %3, metadata !39, metadata !DIExpression()), !dbg !40
  store i32 %1, i32* %4, align 4
  call void @llvm.dbg.declare(metadata i32* %4, metadata !41, metadata !DIExpression()), !dbg !42
  %5 = load i32, i32* %3, align 4, !dbg !43
  %6 = load i32, i32* %4, align 4, !dbg !44
  %7 = load i32, i32* %3, align 4, !dbg !45
  %8 = load i32, i32* %4, align 4, !dbg !46
  %9 = mul nsw i32 %7, %8, !dbg !47
  %10 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([40 x i8], [40 x i8]* @.str.2, i64 0, i64 0), i32 noundef %5, i32 noundef %6, i32 noundef %9), !dbg !48
  ret void, !dbg !49
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @divide(i32 noundef %0, i32 noundef %1) #0 !dbg !50 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  call void @llvm.dbg.declare(metadata i32* %3, metadata !51, metadata !DIExpression()), !dbg !52
  store i32 %1, i32* %4, align 4
  call void @llvm.dbg.declare(metadata i32* %4, metadata !53, metadata !DIExpression()), !dbg !54
  %5 = load i32, i32* %4, align 4, !dbg !55
  %6 = icmp ne i32 %5, 0, !dbg !57
  br i1 %6, label %7, label %14, !dbg !58

7:                                                ; preds = %2
  %8 = load i32, i32* %3, align 4, !dbg !59
  %9 = load i32, i32* %4, align 4, !dbg !61
  %10 = load i32, i32* %3, align 4, !dbg !62
  %11 = load i32, i32* %4, align 4, !dbg !63
  %12 = sdiv i32 %10, %11, !dbg !64
  %13 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([34 x i8], [34 x i8]* @.str.3, i64 0, i64 0), i32 noundef %8, i32 noundef %9, i32 noundef %12), !dbg !65
  br label %16, !dbg !66

14:                                               ; preds = %2
  %15 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([26 x i8], [26 x i8]* @.str.4, i64 0, i64 0)), !dbg !67
  br label %16

16:                                               ; preds = %14, %7
  ret void, !dbg !69
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @displayMenu() #0 !dbg !70 {
  %1 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([23 x i8], [23 x i8]* @.str.5, i64 0, i64 0)), !dbg !73
  %2 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([8 x i8], [8 x i8]* @.str.6, i64 0, i64 0)), !dbg !74
  %3 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([13 x i8], [13 x i8]* @.str.7, i64 0, i64 0)), !dbg !75
  %4 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([13 x i8], [13 x i8]* @.str.8, i64 0, i64 0)), !dbg !76
  %5 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([11 x i8], [11 x i8]* @.str.9, i64 0, i64 0)), !dbg !77
  %6 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([9 x i8], [9 x i8]* @.str.10, i64 0, i64 0)), !dbg !78
  ret void, !dbg !79
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !80 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca void (i32, i32)*, align 8
  %6 = alloca i8, align 1
  store i32 0, i32* %1, align 4
  call void @llvm.dbg.declare(metadata i32* %2, metadata !83, metadata !DIExpression()), !dbg !84
  call void @llvm.dbg.declare(metadata i32* %3, metadata !85, metadata !DIExpression()), !dbg !86
  call void @llvm.dbg.declare(metadata i32* %4, metadata !87, metadata !DIExpression()), !dbg !88
  call void @llvm.dbg.declare(metadata void (i32, i32)** %5, metadata !89, metadata !DIExpression()), !dbg !91
  br label %7, !dbg !92

7:                                                ; preds = %0, %22, %39
  call void @displayMenu(), !dbg !93
  %8 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.11, i64 0, i64 0)), !dbg !95
  %9 = call i32 (i8*, ...) @__isoc99_scanf(i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str.12, i64 0, i64 0), i32* noundef %2), !dbg !96
  %10 = load i32, i32* %2, align 4, !dbg !97
  %11 = icmp eq i32 %10, 5, !dbg !99
  br i1 %11, label %12, label %14, !dbg !100

12:                                               ; preds = %7
  %13 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([22 x i8], [22 x i8]* @.str.13, i64 0, i64 0)), !dbg !101
  br label %40, !dbg !103

14:                                               ; preds = %7
  %15 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([20 x i8], [20 x i8]* @.str.14, i64 0, i64 0)), !dbg !104
  %16 = call i32 (i8*, ...) @__isoc99_scanf(i8* noundef getelementptr inbounds ([6 x i8], [6 x i8]* @.str.15, i64 0, i64 0), i32* noundef %3, i32* noundef %4), !dbg !105
  %17 = load i32, i32* %2, align 4, !dbg !106
  switch i32 %17, label %22 [
    i32 1, label %18
    i32 2, label %19
    i32 3, label %20
    i32 4, label %21
  ], !dbg !107

18:                                               ; preds = %14
  store void (i32, i32)* @add, void (i32, i32)** %5, align 8, !dbg !108
  br label %24, !dbg !110

19:                                               ; preds = %14
  store void (i32, i32)* @subtract, void (i32, i32)** %5, align 8, !dbg !111
  br label %24, !dbg !112

20:                                               ; preds = %14
  store void (i32, i32)* @multiply, void (i32, i32)** %5, align 8, !dbg !113
  br label %24, !dbg !114

21:                                               ; preds = %14
  store void (i32, i32)* @divide, void (i32, i32)** %5, align 8, !dbg !115
  br label %24, !dbg !116

22:                                               ; preds = %14
  %23 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([38 x i8], [38 x i8]* @.str.16, i64 0, i64 0)), !dbg !117
  br label %7, !dbg !118, !llvm.loop !119

24:                                               ; preds = %21, %20, %19, %18
  %25 = load void (i32, i32)*, void (i32, i32)** %5, align 8, !dbg !121
  %26 = load i32, i32* %3, align 4, !dbg !122
  %27 = load i32, i32* %4, align 4, !dbg !123
  call void %25(i32 noundef %26, i32 noundef %27), !dbg !121
  call void @llvm.dbg.declare(metadata i8* %6, metadata !124, metadata !DIExpression()), !dbg !126
  %28 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([52 x i8], [52 x i8]* @.str.17, i64 0, i64 0)), !dbg !127
  %29 = call i32 (i8*, ...) @__isoc99_scanf(i8* noundef getelementptr inbounds ([4 x i8], [4 x i8]* @.str.18, i64 0, i64 0), i8* noundef %6), !dbg !128
  %30 = load i8, i8* %6, align 1, !dbg !129
  %31 = sext i8 %30 to i32, !dbg !129
  %32 = icmp eq i32 %31, 110, !dbg !131
  br i1 %32, label %37, label %33, !dbg !132

33:                                               ; preds = %24
  %34 = load i8, i8* %6, align 1, !dbg !133
  %35 = sext i8 %34 to i32, !dbg !133
  %36 = icmp eq i32 %35, 78, !dbg !134
  br i1 %36, label %37, label %39, !dbg !135

37:                                               ; preds = %33, %24
  %38 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([43 x i8], [43 x i8]* @.str.19, i64 0, i64 0)), !dbg !136
  br label %40, !dbg !138

39:                                               ; preds = %33
  br label %7, !dbg !92, !llvm.loop !119

40:                                               ; preds = %37, %12
  ret i32 0, !dbg !139
}

declare i32 @__isoc99_scanf(i8* noundef, ...) #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7, !8}
!llvm.ident = !{!9}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Ubuntu clang version 14.0.0-1ubuntu1.1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "test-files/example4.c", directory: "/home/mhpatel4/repos/llvm-project", checksumkind: CSK_MD5, checksum: "404bb39552891892c5ca4bb20bf353b0")
!2 = !{i32 7, !"Dwarf Version", i32 5}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"PIE Level", i32 2}
!7 = !{i32 7, !"uwtable", i32 1}
!8 = !{i32 7, !"frame-pointer", i32 2}
!9 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
!10 = distinct !DISubprogram(name: "add", scope: !1, file: !1, line: 4, type: !11, scopeLine: 4, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13, !13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !{}
!15 = !DILocalVariable(name: "a", arg: 1, scope: !10, file: !1, line: 4, type: !13)
!16 = !DILocation(line: 4, column: 14, scope: !10)
!17 = !DILocalVariable(name: "b", arg: 2, scope: !10, file: !1, line: 4, type: !13)
!18 = !DILocation(line: 4, column: 21, scope: !10)
!19 = !DILocation(line: 5, column: 50, scope: !10)
!20 = !DILocation(line: 5, column: 53, scope: !10)
!21 = !DILocation(line: 5, column: 56, scope: !10)
!22 = !DILocation(line: 5, column: 60, scope: !10)
!23 = !DILocation(line: 5, column: 58, scope: !10)
!24 = !DILocation(line: 5, column: 5, scope: !10)
!25 = !DILocation(line: 6, column: 1, scope: !10)
!26 = distinct !DISubprogram(name: "subtract", scope: !1, file: !1, line: 8, type: !11, scopeLine: 8, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!27 = !DILocalVariable(name: "a", arg: 1, scope: !26, file: !1, line: 8, type: !13)
!28 = !DILocation(line: 8, column: 19, scope: !26)
!29 = !DILocalVariable(name: "b", arg: 2, scope: !26, file: !1, line: 8, type: !13)
!30 = !DILocation(line: 8, column: 26, scope: !26)
!31 = !DILocation(line: 9, column: 53, scope: !26)
!32 = !DILocation(line: 9, column: 56, scope: !26)
!33 = !DILocation(line: 9, column: 59, scope: !26)
!34 = !DILocation(line: 9, column: 63, scope: !26)
!35 = !DILocation(line: 9, column: 61, scope: !26)
!36 = !DILocation(line: 9, column: 5, scope: !26)
!37 = !DILocation(line: 10, column: 1, scope: !26)
!38 = distinct !DISubprogram(name: "multiply", scope: !1, file: !1, line: 12, type: !11, scopeLine: 12, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!39 = !DILocalVariable(name: "a", arg: 1, scope: !38, file: !1, line: 12, type: !13)
!40 = !DILocation(line: 12, column: 19, scope: !38)
!41 = !DILocalVariable(name: "b", arg: 2, scope: !38, file: !1, line: 12, type: !13)
!42 = !DILocation(line: 12, column: 26, scope: !38)
!43 = !DILocation(line: 13, column: 56, scope: !38)
!44 = !DILocation(line: 13, column: 59, scope: !38)
!45 = !DILocation(line: 13, column: 62, scope: !38)
!46 = !DILocation(line: 13, column: 66, scope: !38)
!47 = !DILocation(line: 13, column: 64, scope: !38)
!48 = !DILocation(line: 13, column: 5, scope: !38)
!49 = !DILocation(line: 14, column: 1, scope: !38)
!50 = distinct !DISubprogram(name: "divide", scope: !1, file: !1, line: 16, type: !11, scopeLine: 16, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!51 = !DILocalVariable(name: "a", arg: 1, scope: !50, file: !1, line: 16, type: !13)
!52 = !DILocation(line: 16, column: 17, scope: !50)
!53 = !DILocalVariable(name: "b", arg: 2, scope: !50, file: !1, line: 16, type: !13)
!54 = !DILocation(line: 16, column: 24, scope: !50)
!55 = !DILocation(line: 17, column: 9, scope: !56)
!56 = distinct !DILexicalBlock(scope: !50, file: !1, line: 17, column: 9)
!57 = !DILocation(line: 17, column: 11, scope: !56)
!58 = !DILocation(line: 17, column: 9, scope: !50)
!59 = !DILocation(line: 18, column: 54, scope: !60)
!60 = distinct !DILexicalBlock(scope: !56, file: !1, line: 17, column: 17)
!61 = !DILocation(line: 18, column: 57, scope: !60)
!62 = !DILocation(line: 18, column: 60, scope: !60)
!63 = !DILocation(line: 18, column: 64, scope: !60)
!64 = !DILocation(line: 18, column: 62, scope: !60)
!65 = !DILocation(line: 18, column: 9, scope: !60)
!66 = !DILocation(line: 19, column: 5, scope: !60)
!67 = !DILocation(line: 20, column: 9, scope: !68)
!68 = distinct !DILexicalBlock(scope: !56, file: !1, line: 19, column: 12)
!69 = !DILocation(line: 22, column: 1, scope: !50)
!70 = distinct !DISubprogram(name: "displayMenu", scope: !1, file: !1, line: 25, type: !71, scopeLine: 25, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!71 = !DISubroutineType(types: !72)
!72 = !{null}
!73 = !DILocation(line: 26, column: 5, scope: !70)
!74 = !DILocation(line: 27, column: 5, scope: !70)
!75 = !DILocation(line: 28, column: 5, scope: !70)
!76 = !DILocation(line: 29, column: 5, scope: !70)
!77 = !DILocation(line: 30, column: 5, scope: !70)
!78 = !DILocation(line: 31, column: 5, scope: !70)
!79 = !DILocation(line: 32, column: 1, scope: !70)
!80 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 35, type: !81, scopeLine: 35, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!81 = !DISubroutineType(types: !82)
!82 = !{!13}
!83 = !DILocalVariable(name: "choice", scope: !80, file: !1, line: 36, type: !13)
!84 = !DILocation(line: 36, column: 9, scope: !80)
!85 = !DILocalVariable(name: "x", scope: !80, file: !1, line: 37, type: !13)
!86 = !DILocation(line: 37, column: 9, scope: !80)
!87 = !DILocalVariable(name: "y", scope: !80, file: !1, line: 37, type: !13)
!88 = !DILocation(line: 37, column: 12, scope: !80)
!89 = !DILocalVariable(name: "operation", scope: !80, file: !1, line: 38, type: !90)
!90 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64)
!91 = !DILocation(line: 38, column: 12, scope: !80)
!92 = !DILocation(line: 40, column: 5, scope: !80)
!93 = !DILocation(line: 41, column: 9, scope: !94)
!94 = distinct !DILexicalBlock(scope: !80, file: !1, line: 40, column: 15)
!95 = !DILocation(line: 42, column: 9, scope: !94)
!96 = !DILocation(line: 43, column: 9, scope: !94)
!97 = !DILocation(line: 45, column: 13, scope: !98)
!98 = distinct !DILexicalBlock(scope: !94, file: !1, line: 45, column: 13)
!99 = !DILocation(line: 45, column: 20, scope: !98)
!100 = !DILocation(line: 45, column: 13, scope: !94)
!101 = !DILocation(line: 46, column: 13, scope: !102)
!102 = distinct !DILexicalBlock(scope: !98, file: !1, line: 45, column: 26)
!103 = !DILocation(line: 47, column: 13, scope: !102)
!104 = !DILocation(line: 51, column: 9, scope: !94)
!105 = !DILocation(line: 52, column: 9, scope: !94)
!106 = !DILocation(line: 55, column: 17, scope: !94)
!107 = !DILocation(line: 55, column: 9, scope: !94)
!108 = !DILocation(line: 57, column: 27, scope: !109)
!109 = distinct !DILexicalBlock(scope: !94, file: !1, line: 55, column: 25)
!110 = !DILocation(line: 58, column: 17, scope: !109)
!111 = !DILocation(line: 60, column: 27, scope: !109)
!112 = !DILocation(line: 61, column: 17, scope: !109)
!113 = !DILocation(line: 63, column: 27, scope: !109)
!114 = !DILocation(line: 64, column: 17, scope: !109)
!115 = !DILocation(line: 66, column: 27, scope: !109)
!116 = !DILocation(line: 67, column: 17, scope: !109)
!117 = !DILocation(line: 69, column: 17, scope: !109)
!118 = !DILocation(line: 70, column: 17, scope: !109)
!119 = distinct !{!119, !92, !120}
!120 = !DILocation(line: 85, column: 5, scope: !80)
!121 = !DILocation(line: 74, column: 9, scope: !94)
!122 = !DILocation(line: 74, column: 19, scope: !94)
!123 = !DILocation(line: 74, column: 22, scope: !94)
!124 = !DILocalVariable(name: "anotherCalculation", scope: !94, file: !1, line: 77, type: !125)
!125 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!126 = !DILocation(line: 77, column: 14, scope: !94)
!127 = !DILocation(line: 78, column: 9, scope: !94)
!128 = !DILocation(line: 79, column: 9, scope: !94)
!129 = !DILocation(line: 81, column: 13, scope: !130)
!130 = distinct !DILexicalBlock(scope: !94, file: !1, line: 81, column: 13)
!131 = !DILocation(line: 81, column: 32, scope: !130)
!132 = !DILocation(line: 81, column: 39, scope: !130)
!133 = !DILocation(line: 81, column: 42, scope: !130)
!134 = !DILocation(line: 81, column: 61, scope: !130)
!135 = !DILocation(line: 81, column: 13, scope: !94)
!136 = !DILocation(line: 82, column: 13, scope: !137)
!137 = distinct !DILexicalBlock(scope: !130, file: !1, line: 81, column: 69)
!138 = !DILocation(line: 83, column: 13, scope: !137)
!139 = !DILocation(line: 87, column: 5, scope: !80)
