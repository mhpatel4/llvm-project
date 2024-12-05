; ModuleID = 'test-files/example4.c'
source_filename = "test-files/example4.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque

@.str = private unnamed_addr constant [67 x i8] c"Enter option (1: processData, 2: compareInts, 3: fileOperations): \00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.2 = private unnamed_addr constant [9 x i8] c"test.txt\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.4 = private unnamed_addr constant [25 x i8] c"Failed to open test file\00", align 1
@.str.5 = private unnamed_addr constant [29 x i8] c"Enter number of iterations: \00", align 1
@.str.6 = private unnamed_addr constant [32 x i8] c"Enter two integers to compare: \00", align 1
@.str.7 = private unnamed_addr constant [6 x i8] c"%d %d\00", align 1
@.str.8 = private unnamed_addr constant [60 x i8] c"Enter comparator type (A for ascending, D for descending): \00", align 1
@.str.9 = private unnamed_addr constant [4 x i8] c" %c\00", align 1
@.str.10 = private unnamed_addr constant [23 x i8] c"Comparison result: %d\0A\00", align 1
@.str.11 = private unnamed_addr constant [26 x i8] c"Invalid comparator type.\0A\00", align 1
@.str.12 = private unnamed_addr constant [17 x i8] c"Invalid option.\0A\00", align 1
@.str.13 = private unnamed_addr constant [24 x i8] c"Processing %d items...\0A\00", align 1
@.str.14 = private unnamed_addr constant [20 x i8] c"Processing item %d\0A\00", align 1
@.str.15 = private unnamed_addr constant [20 x i8] c"Failed to open file\00", align 1
@.str.16 = private unnamed_addr constant [18 x i8] c"File content:\0A%s\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !14 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca [100 x i8], align 16
  %7 = alloca i8, align 1
  %8 = alloca %struct._IO_FILE*, align 8
  %9 = alloca i32 (i32, i32)*, align 8
  %10 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  call void @llvm.dbg.declare(metadata i32* %2, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i32* %3, metadata !21, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata i32* %4, metadata !23, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata i32* %5, metadata !25, metadata !DIExpression()), !dbg !26
  call void @llvm.dbg.declare(metadata [100 x i8]* %6, metadata !27, metadata !DIExpression()), !dbg !31
  call void @llvm.dbg.declare(metadata i8* %7, metadata !32, metadata !DIExpression()), !dbg !33
  call void @llvm.dbg.declare(metadata %struct._IO_FILE** %8, metadata !34, metadata !DIExpression()), !dbg !94
  %11 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([67 x i8], [67 x i8]* @.str, i64 0, i64 0)), !dbg !95
  %12 = call i32 (i8*, ...) @__isoc99_scanf(i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i64 0, i64 0), i32* noundef %2), !dbg !96
  %13 = call noalias %struct._IO_FILE* @fopen(i8* noundef getelementptr inbounds ([9 x i8], [9 x i8]* @.str.2, i64 0, i64 0), i8* noundef getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)), !dbg !97
  store %struct._IO_FILE* %13, %struct._IO_FILE** %8, align 8, !dbg !98
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** %8, align 8, !dbg !99
  %15 = icmp eq %struct._IO_FILE* %14, null, !dbg !101
  br i1 %15, label %16, label %17, !dbg !102

16:                                               ; preds = %0
  call void @perror(i8* noundef getelementptr inbounds ([25 x i8], [25 x i8]* @.str.4, i64 0, i64 0)), !dbg !103
  store i32 1, i32* %1, align 4, !dbg !105
  br label %57, !dbg !105

17:                                               ; preds = %0
  %18 = load i32, i32* %2, align 4, !dbg !106
  %19 = icmp eq i32 %18, 1, !dbg !108
  br i1 %19, label %20, label %24, !dbg !109

20:                                               ; preds = %17
  %21 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([29 x i8], [29 x i8]* @.str.5, i64 0, i64 0)), !dbg !110
  %22 = call i32 (i8*, ...) @__isoc99_scanf(i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i64 0, i64 0), i32* noundef %3), !dbg !112
  %23 = load i32, i32* %3, align 4, !dbg !113
  call void @processData(i32 noundef %23), !dbg !114
  br label %54, !dbg !115

24:                                               ; preds = %17
  %25 = load i32, i32* %2, align 4, !dbg !116
  %26 = icmp eq i32 %25, 2, !dbg !118
  br i1 %26, label %27, label %46, !dbg !119

27:                                               ; preds = %24
  %28 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str.6, i64 0, i64 0)), !dbg !120
  %29 = call i32 (i8*, ...) @__isoc99_scanf(i8* noundef getelementptr inbounds ([6 x i8], [6 x i8]* @.str.7, i64 0, i64 0), i32* noundef %4, i32* noundef %5), !dbg !122
  %30 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([60 x i8], [60 x i8]* @.str.8, i64 0, i64 0)), !dbg !123
  %31 = call i32 (i8*, ...) @__isoc99_scanf(i8* noundef getelementptr inbounds ([4 x i8], [4 x i8]* @.str.9, i64 0, i64 0), i8* noundef %7), !dbg !124
  call void @llvm.dbg.declare(metadata i32 (i32, i32)** %9, metadata !125, metadata !DIExpression()), !dbg !129
  %32 = load i8, i8* %7, align 1, !dbg !130
  %33 = call i32 (i32, i32)* @getComparator(i8 noundef signext %32), !dbg !131
  store i32 (i32, i32)* %33, i32 (i32, i32)** %9, align 8, !dbg !129
  %34 = load i32 (i32, i32)*, i32 (i32, i32)** %9, align 8, !dbg !132
  %35 = icmp ne i32 (i32, i32)* %34, null, !dbg !134
  br i1 %35, label %36, label %43, !dbg !135

36:                                               ; preds = %27
  call void @llvm.dbg.declare(metadata i32* %10, metadata !136, metadata !DIExpression()), !dbg !138
  %37 = load i32 (i32, i32)*, i32 (i32, i32)** %9, align 8, !dbg !139
  %38 = load i32, i32* %4, align 4, !dbg !140
  %39 = load i32, i32* %5, align 4, !dbg !141
  %40 = call i32 %37(i32 noundef %38, i32 noundef %39), !dbg !139
  store i32 %40, i32* %10, align 4, !dbg !138
  %41 = load i32, i32* %10, align 4, !dbg !142
  %42 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([23 x i8], [23 x i8]* @.str.10, i64 0, i64 0), i32 noundef %41), !dbg !143
  br label %45, !dbg !144

43:                                               ; preds = %27
  %44 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([26 x i8], [26 x i8]* @.str.11, i64 0, i64 0)), !dbg !145
  br label %45

45:                                               ; preds = %43, %36
  br label %53, !dbg !147

46:                                               ; preds = %24
  %47 = load i32, i32* %2, align 4, !dbg !148
  %48 = icmp eq i32 %47, 3, !dbg !150
  br i1 %48, label %49, label %50, !dbg !151

49:                                               ; preds = %46
  call void @fileOperations(i8* noundef getelementptr inbounds ([9 x i8], [9 x i8]* @.str.2, i64 0, i64 0)), !dbg !152
  br label %52, !dbg !154

50:                                               ; preds = %46
  %51 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.12, i64 0, i64 0)), !dbg !155
  br label %52

52:                                               ; preds = %50, %49
  br label %53

53:                                               ; preds = %52, %45
  br label %54

54:                                               ; preds = %53, %20
  %55 = load %struct._IO_FILE*, %struct._IO_FILE** %8, align 8, !dbg !157
  %56 = call i32 @fclose(%struct._IO_FILE* noundef %55), !dbg !158
  store i32 0, i32* %1, align 4, !dbg !159
  br label %57, !dbg !159

57:                                               ; preds = %54, %16
  %58 = load i32, i32* %1, align 4, !dbg !160
  ret i32 %58, !dbg !160
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @printf(i8* noundef, ...) #2

declare i32 @__isoc99_scanf(i8* noundef, ...) #2

declare noalias %struct._IO_FILE* @fopen(i8* noundef, i8* noundef) #2

declare void @perror(i8* noundef) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @processData(i32 noundef %0) #0 !dbg !161 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, i32* %2, align 4
  call void @llvm.dbg.declare(metadata i32* %2, metadata !164, metadata !DIExpression()), !dbg !165
  %4 = load i32, i32* %2, align 4, !dbg !166
  %5 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([24 x i8], [24 x i8]* @.str.13, i64 0, i64 0), i32 noundef %4), !dbg !167
  call void @llvm.dbg.declare(metadata i32* %3, metadata !168, metadata !DIExpression()), !dbg !170
  store i32 0, i32* %3, align 4, !dbg !170
  br label %6, !dbg !171

6:                                                ; preds = %14, %1
  %7 = load i32, i32* %3, align 4, !dbg !172
  %8 = load i32, i32* %2, align 4, !dbg !174
  %9 = icmp slt i32 %7, %8, !dbg !175
  br i1 %9, label %10, label %17, !dbg !176

10:                                               ; preds = %6
  %11 = load i32, i32* %3, align 4, !dbg !177
  %12 = add nsw i32 %11, 1, !dbg !179
  %13 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([20 x i8], [20 x i8]* @.str.14, i64 0, i64 0), i32 noundef %12), !dbg !180
  br label %14, !dbg !181

14:                                               ; preds = %10
  %15 = load i32, i32* %3, align 4, !dbg !182
  %16 = add nsw i32 %15, 1, !dbg !182
  store i32 %16, i32* %3, align 4, !dbg !182
  br label %6, !dbg !183, !llvm.loop !184

17:                                               ; preds = %6
  ret void, !dbg !187
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 (i32, i32)* @getComparator(i8 noundef signext %0) #0 !dbg !188 {
  %2 = alloca i32 (i32, i32)*, align 8
  %3 = alloca i8, align 1
  store i8 %0, i8* %3, align 1
  call void @llvm.dbg.declare(metadata i8* %3, metadata !191, metadata !DIExpression()), !dbg !192
  %4 = load i8, i8* %3, align 1, !dbg !193
  %5 = sext i8 %4 to i32, !dbg !193
  %6 = icmp eq i32 %5, 65, !dbg !195
  br i1 %6, label %7, label %8, !dbg !196

7:                                                ; preds = %1
  store i32 (i32, i32)* @compareInts, i32 (i32, i32)** %2, align 8, !dbg !197
  br label %14, !dbg !197

8:                                                ; preds = %1
  %9 = load i8, i8* %3, align 1, !dbg !199
  %10 = sext i8 %9 to i32, !dbg !199
  %11 = icmp eq i32 %10, 68, !dbg !201
  br i1 %11, label %12, label %13, !dbg !202

12:                                               ; preds = %8
  store i32 (i32, i32)* @descendingCompare, i32 (i32, i32)** %2, align 8, !dbg !203
  br label %14, !dbg !203

13:                                               ; preds = %8
  store i32 (i32, i32)* null, i32 (i32, i32)** %2, align 8, !dbg !205
  br label %14, !dbg !205

14:                                               ; preds = %13, %12, %7
  %15 = load i32 (i32, i32)*, i32 (i32, i32)** %2, align 8, !dbg !207
  ret i32 (i32, i32)* %15, !dbg !207
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @fileOperations(i8* noundef %0) #0 !dbg !208 {
  %2 = alloca i8*, align 8
  %3 = alloca %struct._IO_FILE*, align 8
  %4 = alloca i64, align 8
  %5 = alloca i8*, align 8
  store i8* %0, i8** %2, align 8
  call void @llvm.dbg.declare(metadata i8** %2, metadata !213, metadata !DIExpression()), !dbg !214
  call void @llvm.dbg.declare(metadata %struct._IO_FILE** %3, metadata !215, metadata !DIExpression()), !dbg !216
  %6 = load i8*, i8** %2, align 8, !dbg !217
  %7 = call noalias %struct._IO_FILE* @fopen(i8* noundef %6, i8* noundef getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)), !dbg !218
  store %struct._IO_FILE* %7, %struct._IO_FILE** %3, align 8, !dbg !216
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8, !dbg !219
  %9 = icmp eq %struct._IO_FILE* %8, null, !dbg !221
  br i1 %9, label %10, label %11, !dbg !222

10:                                               ; preds = %1
  call void @perror(i8* noundef getelementptr inbounds ([20 x i8], [20 x i8]* @.str.15, i64 0, i64 0)), !dbg !223
  br label %32, !dbg !225

11:                                               ; preds = %1
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8, !dbg !226
  %13 = call i32 @fseek(%struct._IO_FILE* noundef %12, i64 noundef 0, i32 noundef 2), !dbg !227
  call void @llvm.dbg.declare(metadata i64* %4, metadata !228, metadata !DIExpression()), !dbg !229
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8, !dbg !230
  %15 = call i64 @ftell(%struct._IO_FILE* noundef %14), !dbg !231
  store i64 %15, i64* %4, align 8, !dbg !229
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8, !dbg !232
  call void @rewind(%struct._IO_FILE* noundef %16), !dbg !233
  call void @llvm.dbg.declare(metadata i8** %5, metadata !234, metadata !DIExpression()), !dbg !235
  %17 = load i64, i64* %4, align 8, !dbg !236
  %18 = add nsw i64 %17, 1, !dbg !237
  %19 = call noalias i8* @malloc(i64 noundef %18) #4, !dbg !238
  store i8* %19, i8** %5, align 8, !dbg !235
  %20 = load i8*, i8** %5, align 8, !dbg !239
  %21 = load i64, i64* %4, align 8, !dbg !240
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8, !dbg !241
  %23 = call i64 @fread(i8* noundef %20, i64 noundef 1, i64 noundef %21, %struct._IO_FILE* noundef %22), !dbg !242
  %24 = load i8*, i8** %5, align 8, !dbg !243
  %25 = load i64, i64* %4, align 8, !dbg !244
  %26 = getelementptr inbounds i8, i8* %24, i64 %25, !dbg !243
  store i8 0, i8* %26, align 1, !dbg !245
  %27 = load i8*, i8** %5, align 8, !dbg !246
  %28 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str.16, i64 0, i64 0), i8* noundef %27), !dbg !247
  %29 = load i8*, i8** %5, align 8, !dbg !248
  call void @free(i8* noundef %29) #4, !dbg !249
  %30 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8, !dbg !250
  %31 = call i32 @fclose(%struct._IO_FILE* noundef %30), !dbg !251
  br label %32, !dbg !252

32:                                               ; preds = %11, %10
  ret void, !dbg !252
}

declare i32 @fclose(%struct._IO_FILE* noundef) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @compareInts(i32 noundef %0, i32 noundef %1) #0 !dbg !253 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  call void @llvm.dbg.declare(metadata i32* %3, metadata !254, metadata !DIExpression()), !dbg !255
  store i32 %1, i32* %4, align 4
  call void @llvm.dbg.declare(metadata i32* %4, metadata !256, metadata !DIExpression()), !dbg !257
  %5 = load i32, i32* %3, align 4, !dbg !258
  %6 = load i32, i32* %4, align 4, !dbg !259
  %7 = sub nsw i32 %5, %6, !dbg !260
  ret i32 %7, !dbg !261
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @descendingCompare(i32 noundef %0, i32 noundef %1) #0 !dbg !262 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  call void @llvm.dbg.declare(metadata i32* %3, metadata !263, metadata !DIExpression()), !dbg !264
  store i32 %1, i32* %4, align 4
  call void @llvm.dbg.declare(metadata i32* %4, metadata !265, metadata !DIExpression()), !dbg !266
  %5 = load i32, i32* %4, align 4, !dbg !267
  %6 = load i32, i32* %3, align 4, !dbg !268
  %7 = sub nsw i32 %5, %6, !dbg !269
  ret i32 %7, !dbg !270
}

declare i32 @fseek(%struct._IO_FILE* noundef, i64 noundef, i32 noundef) #2

declare i64 @ftell(%struct._IO_FILE* noundef) #2

declare void @rewind(%struct._IO_FILE* noundef) #2

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #3

declare i64 @fread(i8* noundef, i64 noundef, i64 noundef, %struct._IO_FILE* noundef) #2

; Function Attrs: nounwind
declare void @free(i8* noundef) #3

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!6, !7, !8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Ubuntu clang version 14.0.0-1ubuntu1.1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "test-files/example4.c", directory: "/home/mhpatel4/repos/llvm-project", checksumkind: CSK_MD5, checksum: "18a8837568accab264b51b8bd1ea2582")
!2 = !{!3, !4}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!6 = !{i32 7, !"Dwarf Version", i32 5}
!7 = !{i32 2, !"Debug Info Version", i32 3}
!8 = !{i32 1, !"wchar_size", i32 4}
!9 = !{i32 7, !"PIC Level", i32 2}
!10 = !{i32 7, !"PIE Level", i32 2}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
!14 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 11, type: !15, scopeLine: 11, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!15 = !DISubroutineType(types: !16)
!16 = !{!17}
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !{}
!19 = !DILocalVariable(name: "option", scope: !14, file: !1, line: 12, type: !17)
!20 = !DILocation(line: 12, column: 9, scope: !14)
!21 = !DILocalVariable(name: "num", scope: !14, file: !1, line: 12, type: !17)
!22 = !DILocation(line: 12, column: 17, scope: !14)
!23 = !DILocalVariable(name: "a", scope: !14, file: !1, line: 12, type: !17)
!24 = !DILocation(line: 12, column: 22, scope: !14)
!25 = !DILocalVariable(name: "b", scope: !14, file: !1, line: 12, type: !17)
!26 = !DILocation(line: 12, column: 25, scope: !14)
!27 = !DILocalVariable(name: "buffer", scope: !14, file: !1, line: 13, type: !28)
!28 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !29)
!29 = !{!30}
!30 = !DISubrange(count: 100)
!31 = !DILocation(line: 13, column: 10, scope: !14)
!32 = !DILocalVariable(name: "type", scope: !14, file: !1, line: 13, type: !5)
!33 = !DILocation(line: 13, column: 23, scope: !14)
!34 = !DILocalVariable(name: "fp", scope: !14, file: !1, line: 14, type: !35)
!35 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !36, size: 64)
!36 = !DIDerivedType(tag: DW_TAG_typedef, name: "FILE", file: !37, line: 7, baseType: !38)
!37 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/FILE.h", directory: "", checksumkind: CSK_MD5, checksum: "571f9fb6223c42439075fdde11a0de5d")
!38 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_FILE", file: !39, line: 49, size: 1728, elements: !40)
!39 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/struct_FILE.h", directory: "", checksumkind: CSK_MD5, checksum: "1bad07471b7974df4ecc1d1c2ca207e6")
!40 = !{!41, !42, !43, !44, !45, !46, !47, !48, !49, !50, !51, !52, !53, !56, !58, !59, !60, !64, !66, !68, !72, !75, !77, !80, !83, !84, !85, !89, !90}
!41 = !DIDerivedType(tag: DW_TAG_member, name: "_flags", scope: !38, file: !39, line: 51, baseType: !17, size: 32)
!42 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_ptr", scope: !38, file: !39, line: 54, baseType: !4, size: 64, offset: 64)
!43 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_end", scope: !38, file: !39, line: 55, baseType: !4, size: 64, offset: 128)
!44 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_base", scope: !38, file: !39, line: 56, baseType: !4, size: 64, offset: 192)
!45 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_base", scope: !38, file: !39, line: 57, baseType: !4, size: 64, offset: 256)
!46 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_ptr", scope: !38, file: !39, line: 58, baseType: !4, size: 64, offset: 320)
!47 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_end", scope: !38, file: !39, line: 59, baseType: !4, size: 64, offset: 384)
!48 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_buf_base", scope: !38, file: !39, line: 60, baseType: !4, size: 64, offset: 448)
!49 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_buf_end", scope: !38, file: !39, line: 61, baseType: !4, size: 64, offset: 512)
!50 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_save_base", scope: !38, file: !39, line: 64, baseType: !4, size: 64, offset: 576)
!51 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_backup_base", scope: !38, file: !39, line: 65, baseType: !4, size: 64, offset: 640)
!52 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_save_end", scope: !38, file: !39, line: 66, baseType: !4, size: 64, offset: 704)
!53 = !DIDerivedType(tag: DW_TAG_member, name: "_markers", scope: !38, file: !39, line: 68, baseType: !54, size: 64, offset: 768)
!54 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !55, size: 64)
!55 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_marker", file: !39, line: 36, flags: DIFlagFwdDecl)
!56 = !DIDerivedType(tag: DW_TAG_member, name: "_chain", scope: !38, file: !39, line: 70, baseType: !57, size: 64, offset: 832)
!57 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !38, size: 64)
!58 = !DIDerivedType(tag: DW_TAG_member, name: "_fileno", scope: !38, file: !39, line: 72, baseType: !17, size: 32, offset: 896)
!59 = !DIDerivedType(tag: DW_TAG_member, name: "_flags2", scope: !38, file: !39, line: 73, baseType: !17, size: 32, offset: 928)
!60 = !DIDerivedType(tag: DW_TAG_member, name: "_old_offset", scope: !38, file: !39, line: 74, baseType: !61, size: 64, offset: 960)
!61 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off_t", file: !62, line: 152, baseType: !63)
!62 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "", checksumkind: CSK_MD5, checksum: "d108b5f93a74c50510d7d9bc0ab36df9")
!63 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!64 = !DIDerivedType(tag: DW_TAG_member, name: "_cur_column", scope: !38, file: !39, line: 77, baseType: !65, size: 16, offset: 1024)
!65 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!66 = !DIDerivedType(tag: DW_TAG_member, name: "_vtable_offset", scope: !38, file: !39, line: 78, baseType: !67, size: 8, offset: 1040)
!67 = !DIBasicType(name: "signed char", size: 8, encoding: DW_ATE_signed_char)
!68 = !DIDerivedType(tag: DW_TAG_member, name: "_shortbuf", scope: !38, file: !39, line: 79, baseType: !69, size: 8, offset: 1048)
!69 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 8, elements: !70)
!70 = !{!71}
!71 = !DISubrange(count: 1)
!72 = !DIDerivedType(tag: DW_TAG_member, name: "_lock", scope: !38, file: !39, line: 81, baseType: !73, size: 64, offset: 1088)
!73 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !74, size: 64)
!74 = !DIDerivedType(tag: DW_TAG_typedef, name: "_IO_lock_t", file: !39, line: 43, baseType: null)
!75 = !DIDerivedType(tag: DW_TAG_member, name: "_offset", scope: !38, file: !39, line: 89, baseType: !76, size: 64, offset: 1152)
!76 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off64_t", file: !62, line: 153, baseType: !63)
!77 = !DIDerivedType(tag: DW_TAG_member, name: "_codecvt", scope: !38, file: !39, line: 91, baseType: !78, size: 64, offset: 1216)
!78 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !79, size: 64)
!79 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_codecvt", file: !39, line: 37, flags: DIFlagFwdDecl)
!80 = !DIDerivedType(tag: DW_TAG_member, name: "_wide_data", scope: !38, file: !39, line: 92, baseType: !81, size: 64, offset: 1280)
!81 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !82, size: 64)
!82 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_wide_data", file: !39, line: 38, flags: DIFlagFwdDecl)
!83 = !DIDerivedType(tag: DW_TAG_member, name: "_freeres_list", scope: !38, file: !39, line: 93, baseType: !57, size: 64, offset: 1344)
!84 = !DIDerivedType(tag: DW_TAG_member, name: "_freeres_buf", scope: !38, file: !39, line: 94, baseType: !3, size: 64, offset: 1408)
!85 = !DIDerivedType(tag: DW_TAG_member, name: "__pad5", scope: !38, file: !39, line: 95, baseType: !86, size: 64, offset: 1472)
!86 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !87, line: 46, baseType: !88)
!87 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!88 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!89 = !DIDerivedType(tag: DW_TAG_member, name: "_mode", scope: !38, file: !39, line: 96, baseType: !17, size: 32, offset: 1536)
!90 = !DIDerivedType(tag: DW_TAG_member, name: "_unused2", scope: !38, file: !39, line: 98, baseType: !91, size: 160, offset: 1568)
!91 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 160, elements: !92)
!92 = !{!93}
!93 = !DISubrange(count: 20)
!94 = !DILocation(line: 14, column: 11, scope: !14)
!95 = !DILocation(line: 17, column: 5, scope: !14)
!96 = !DILocation(line: 18, column: 5, scope: !14)
!97 = !DILocation(line: 21, column: 10, scope: !14)
!98 = !DILocation(line: 21, column: 8, scope: !14)
!99 = !DILocation(line: 22, column: 9, scope: !100)
!100 = distinct !DILexicalBlock(scope: !14, file: !1, line: 22, column: 9)
!101 = !DILocation(line: 22, column: 12, scope: !100)
!102 = !DILocation(line: 22, column: 9, scope: !14)
!103 = !DILocation(line: 23, column: 9, scope: !104)
!104 = distinct !DILexicalBlock(scope: !100, file: !1, line: 22, column: 21)
!105 = !DILocation(line: 24, column: 9, scope: !104)
!106 = !DILocation(line: 28, column: 9, scope: !107)
!107 = distinct !DILexicalBlock(scope: !14, file: !1, line: 28, column: 9)
!108 = !DILocation(line: 28, column: 16, scope: !107)
!109 = !DILocation(line: 28, column: 9, scope: !14)
!110 = !DILocation(line: 29, column: 9, scope: !111)
!111 = distinct !DILexicalBlock(scope: !107, file: !1, line: 28, column: 22)
!112 = !DILocation(line: 30, column: 9, scope: !111)
!113 = !DILocation(line: 31, column: 21, scope: !111)
!114 = !DILocation(line: 31, column: 9, scope: !111)
!115 = !DILocation(line: 32, column: 5, scope: !111)
!116 = !DILocation(line: 32, column: 16, scope: !117)
!117 = distinct !DILexicalBlock(scope: !107, file: !1, line: 32, column: 16)
!118 = !DILocation(line: 32, column: 23, scope: !117)
!119 = !DILocation(line: 32, column: 16, scope: !107)
!120 = !DILocation(line: 33, column: 9, scope: !121)
!121 = distinct !DILexicalBlock(scope: !117, file: !1, line: 32, column: 29)
!122 = !DILocation(line: 34, column: 9, scope: !121)
!123 = !DILocation(line: 36, column: 9, scope: !121)
!124 = !DILocation(line: 37, column: 9, scope: !121)
!125 = !DILocalVariable(name: "cmp", scope: !121, file: !1, line: 39, type: !126)
!126 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !127, size: 64)
!127 = !DISubroutineType(types: !128)
!128 = !{!17, !17, !17}
!129 = !DILocation(line: 39, column: 15, scope: !121)
!130 = !DILocation(line: 39, column: 46, scope: !121)
!131 = !DILocation(line: 39, column: 32, scope: !121)
!132 = !DILocation(line: 40, column: 13, scope: !133)
!133 = distinct !DILexicalBlock(scope: !121, file: !1, line: 40, column: 13)
!134 = !DILocation(line: 40, column: 17, scope: !133)
!135 = !DILocation(line: 40, column: 13, scope: !121)
!136 = !DILocalVariable(name: "result", scope: !137, file: !1, line: 41, type: !17)
!137 = distinct !DILexicalBlock(scope: !133, file: !1, line: 40, column: 26)
!138 = !DILocation(line: 41, column: 17, scope: !137)
!139 = !DILocation(line: 41, column: 26, scope: !137)
!140 = !DILocation(line: 41, column: 30, scope: !137)
!141 = !DILocation(line: 41, column: 33, scope: !137)
!142 = !DILocation(line: 42, column: 47, scope: !137)
!143 = !DILocation(line: 42, column: 13, scope: !137)
!144 = !DILocation(line: 43, column: 9, scope: !137)
!145 = !DILocation(line: 44, column: 13, scope: !146)
!146 = distinct !DILexicalBlock(scope: !133, file: !1, line: 43, column: 16)
!147 = !DILocation(line: 46, column: 5, scope: !121)
!148 = !DILocation(line: 46, column: 16, scope: !149)
!149 = distinct !DILexicalBlock(scope: !117, file: !1, line: 46, column: 16)
!150 = !DILocation(line: 46, column: 23, scope: !149)
!151 = !DILocation(line: 46, column: 16, scope: !117)
!152 = !DILocation(line: 47, column: 9, scope: !153)
!153 = distinct !DILexicalBlock(scope: !149, file: !1, line: 46, column: 29)
!154 = !DILocation(line: 48, column: 5, scope: !153)
!155 = !DILocation(line: 49, column: 9, scope: !156)
!156 = distinct !DILexicalBlock(scope: !149, file: !1, line: 48, column: 12)
!157 = !DILocation(line: 52, column: 12, scope: !14)
!158 = !DILocation(line: 52, column: 5, scope: !14)
!159 = !DILocation(line: 53, column: 5, scope: !14)
!160 = !DILocation(line: 54, column: 1, scope: !14)
!161 = distinct !DISubprogram(name: "processData", scope: !1, file: !1, line: 56, type: !162, scopeLine: 56, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!162 = !DISubroutineType(types: !163)
!163 = !{null, !17}
!164 = !DILocalVariable(name: "count", arg: 1, scope: !161, file: !1, line: 56, type: !17)
!165 = !DILocation(line: 56, column: 22, scope: !161)
!166 = !DILocation(line: 57, column: 40, scope: !161)
!167 = !DILocation(line: 57, column: 5, scope: !161)
!168 = !DILocalVariable(name: "i", scope: !169, file: !1, line: 58, type: !17)
!169 = distinct !DILexicalBlock(scope: !161, file: !1, line: 58, column: 5)
!170 = !DILocation(line: 58, column: 14, scope: !169)
!171 = !DILocation(line: 58, column: 10, scope: !169)
!172 = !DILocation(line: 58, column: 21, scope: !173)
!173 = distinct !DILexicalBlock(scope: !169, file: !1, line: 58, column: 5)
!174 = !DILocation(line: 58, column: 25, scope: !173)
!175 = !DILocation(line: 58, column: 23, scope: !173)
!176 = !DILocation(line: 58, column: 5, scope: !169)
!177 = !DILocation(line: 59, column: 40, scope: !178)
!178 = distinct !DILexicalBlock(scope: !173, file: !1, line: 58, column: 37)
!179 = !DILocation(line: 59, column: 42, scope: !178)
!180 = !DILocation(line: 59, column: 9, scope: !178)
!181 = !DILocation(line: 60, column: 5, scope: !178)
!182 = !DILocation(line: 58, column: 33, scope: !173)
!183 = !DILocation(line: 58, column: 5, scope: !173)
!184 = distinct !{!184, !176, !185, !186}
!185 = !DILocation(line: 60, column: 5, scope: !169)
!186 = !{!"llvm.loop.mustprogress"}
!187 = !DILocation(line: 61, column: 1, scope: !161)
!188 = distinct !DISubprogram(name: "getComparator", scope: !1, file: !1, line: 71, type: !189, scopeLine: 71, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!189 = !DISubroutineType(types: !190)
!190 = !{!126, !5}
!191 = !DILocalVariable(name: "type", arg: 1, scope: !188, file: !1, line: 71, type: !5)
!192 = !DILocation(line: 71, column: 26, scope: !188)
!193 = !DILocation(line: 72, column: 9, scope: !194)
!194 = distinct !DILexicalBlock(scope: !188, file: !1, line: 72, column: 9)
!195 = !DILocation(line: 72, column: 14, scope: !194)
!196 = !DILocation(line: 72, column: 9, scope: !188)
!197 = !DILocation(line: 73, column: 9, scope: !198)
!198 = distinct !DILexicalBlock(scope: !194, file: !1, line: 72, column: 22)
!199 = !DILocation(line: 74, column: 16, scope: !200)
!200 = distinct !DILexicalBlock(scope: !194, file: !1, line: 74, column: 16)
!201 = !DILocation(line: 74, column: 21, scope: !200)
!202 = !DILocation(line: 74, column: 16, scope: !194)
!203 = !DILocation(line: 75, column: 9, scope: !204)
!204 = distinct !DILexicalBlock(scope: !200, file: !1, line: 74, column: 29)
!205 = !DILocation(line: 77, column: 9, scope: !206)
!206 = distinct !DILexicalBlock(scope: !200, file: !1, line: 76, column: 12)
!207 = !DILocation(line: 79, column: 1, scope: !188)
!208 = distinct !DISubprogram(name: "fileOperations", scope: !1, file: !1, line: 81, type: !209, scopeLine: 81, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!209 = !DISubroutineType(types: !210)
!210 = !{null, !211}
!211 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !212, size: 64)
!212 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !5)
!213 = !DILocalVariable(name: "filename", arg: 1, scope: !208, file: !1, line: 81, type: !211)
!214 = !DILocation(line: 81, column: 33, scope: !208)
!215 = !DILocalVariable(name: "fp", scope: !208, file: !1, line: 82, type: !35)
!216 = !DILocation(line: 82, column: 11, scope: !208)
!217 = !DILocation(line: 82, column: 22, scope: !208)
!218 = !DILocation(line: 82, column: 16, scope: !208)
!219 = !DILocation(line: 83, column: 9, scope: !220)
!220 = distinct !DILexicalBlock(scope: !208, file: !1, line: 83, column: 9)
!221 = !DILocation(line: 83, column: 12, scope: !220)
!222 = !DILocation(line: 83, column: 9, scope: !208)
!223 = !DILocation(line: 84, column: 9, scope: !224)
!224 = distinct !DILexicalBlock(scope: !220, file: !1, line: 83, column: 21)
!225 = !DILocation(line: 85, column: 9, scope: !224)
!226 = !DILocation(line: 88, column: 11, scope: !208)
!227 = !DILocation(line: 88, column: 5, scope: !208)
!228 = !DILocalVariable(name: "size", scope: !208, file: !1, line: 89, type: !63)
!229 = !DILocation(line: 89, column: 10, scope: !208)
!230 = !DILocation(line: 89, column: 23, scope: !208)
!231 = !DILocation(line: 89, column: 17, scope: !208)
!232 = !DILocation(line: 90, column: 12, scope: !208)
!233 = !DILocation(line: 90, column: 5, scope: !208)
!234 = !DILocalVariable(name: "content", scope: !208, file: !1, line: 92, type: !4)
!235 = !DILocation(line: 92, column: 11, scope: !208)
!236 = !DILocation(line: 92, column: 36, scope: !208)
!237 = !DILocation(line: 92, column: 41, scope: !208)
!238 = !DILocation(line: 92, column: 29, scope: !208)
!239 = !DILocation(line: 93, column: 11, scope: !208)
!240 = !DILocation(line: 93, column: 23, scope: !208)
!241 = !DILocation(line: 93, column: 29, scope: !208)
!242 = !DILocation(line: 93, column: 5, scope: !208)
!243 = !DILocation(line: 94, column: 5, scope: !208)
!244 = !DILocation(line: 94, column: 13, scope: !208)
!245 = !DILocation(line: 94, column: 19, scope: !208)
!246 = !DILocation(line: 96, column: 35, scope: !208)
!247 = !DILocation(line: 96, column: 5, scope: !208)
!248 = !DILocation(line: 97, column: 10, scope: !208)
!249 = !DILocation(line: 97, column: 5, scope: !208)
!250 = !DILocation(line: 98, column: 12, scope: !208)
!251 = !DILocation(line: 98, column: 5, scope: !208)
!252 = !DILocation(line: 99, column: 1, scope: !208)
!253 = distinct !DISubprogram(name: "compareInts", scope: !1, file: !1, line: 63, type: !127, scopeLine: 63, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!254 = !DILocalVariable(name: "a", arg: 1, scope: !253, file: !1, line: 63, type: !17)
!255 = !DILocation(line: 63, column: 21, scope: !253)
!256 = !DILocalVariable(name: "b", arg: 2, scope: !253, file: !1, line: 63, type: !17)
!257 = !DILocation(line: 63, column: 28, scope: !253)
!258 = !DILocation(line: 64, column: 12, scope: !253)
!259 = !DILocation(line: 64, column: 16, scope: !253)
!260 = !DILocation(line: 64, column: 14, scope: !253)
!261 = !DILocation(line: 64, column: 5, scope: !253)
!262 = distinct !DISubprogram(name: "descendingCompare", scope: !1, file: !1, line: 67, type: !127, scopeLine: 67, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!263 = !DILocalVariable(name: "a", arg: 1, scope: !262, file: !1, line: 67, type: !17)
!264 = !DILocation(line: 67, column: 27, scope: !262)
!265 = !DILocalVariable(name: "b", arg: 2, scope: !262, file: !1, line: 67, type: !17)
!266 = !DILocation(line: 67, column: 34, scope: !262)
!267 = !DILocation(line: 68, column: 12, scope: !262)
!268 = !DILocation(line: 68, column: 16, scope: !262)
!269 = !DILocation(line: 68, column: 14, scope: !262)
!270 = !DILocation(line: 68, column: 5, scope: !262)
