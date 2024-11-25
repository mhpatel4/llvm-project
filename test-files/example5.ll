; ModuleID = 'test-files/example5.c'
source_filename = "test-files/example5.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque

@.str = private unnamed_addr constant [48 x i8] c"Enter option (1: processData, 2: compareInts): \00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.2 = private unnamed_addr constant [10 x i8] c"input.txt\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.4 = private unnamed_addr constant [20 x i8] c"Failed to open file\00", align 1
@.str.5 = private unnamed_addr constant [13 x i8] c"Empty file.\0A\00", align 1
@.str.6 = private unnamed_addr constant [21 x i8] c"First character: %c\0A\00", align 1
@.str.7 = private unnamed_addr constant [30 x i8] c"File content (%ld bytes): %s\0A\00", align 1
@.str.8 = private unnamed_addr constant [29 x i8] c"Enter number of iterations: \00", align 1
@.str.9 = private unnamed_addr constant [14 x i8] c"Iteration %d\0A\00", align 1
@.str.10 = private unnamed_addr constant [32 x i8] c"Enter two integers to compare: \00", align 1
@.str.11 = private unnamed_addr constant [6 x i8] c"%d %d\00", align 1
@.str.12 = private unnamed_addr constant [23 x i8] c"Comparison result: %d\0A\00", align 1
@.str.13 = private unnamed_addr constant [23 x i8] c"Comparator not found.\0A\00", align 1
@.str.14 = private unnamed_addr constant [17 x i8] c"Invalid option.\0A\00", align 1
@.str.15 = private unnamed_addr constant [24 x i8] c"Processing %d items...\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !14 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca [100 x i8], align 16
  %4 = alloca %struct._IO_FILE*, align 8
  %5 = alloca i8, align 1
  %6 = alloca i64, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i64, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32 (i32, i32)*, align 8
  %14 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  call void @llvm.dbg.declare(metadata i32* %2, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata [100 x i8]* %3, metadata !21, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata %struct._IO_FILE** %4, metadata !26, metadata !DIExpression()), !dbg !86
  %15 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([48 x i8], [48 x i8]* @.str, i64 0, i64 0)), !dbg !87
  %16 = call i32 (i8*, ...) @__isoc99_scanf(i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i64 0, i64 0), i32* noundef %2), !dbg !88
  %17 = call noalias %struct._IO_FILE* @fopen(i8* noundef getelementptr inbounds ([10 x i8], [10 x i8]* @.str.2, i64 0, i64 0), i8* noundef getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)), !dbg !89
  store %struct._IO_FILE* %17, %struct._IO_FILE** %4, align 8, !dbg !90
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8, !dbg !91
  %19 = icmp eq %struct._IO_FILE* %18, null, !dbg !93
  br i1 %19, label %20, label %21, !dbg !94

20:                                               ; preds = %0
  call void @perror(i8* noundef getelementptr inbounds ([20 x i8], [20 x i8]* @.str.4, i64 0, i64 0)), !dbg !95
  store i32 1, i32* %1, align 4, !dbg !97
  br label %102, !dbg !97

21:                                               ; preds = %0
  call void @llvm.dbg.declare(metadata i8* %5, metadata !98, metadata !DIExpression()), !dbg !99
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8, !dbg !100
  %23 = call i32 @getc(%struct._IO_FILE* noundef %22), !dbg !101
  %24 = trunc i32 %23 to i8, !dbg !101
  store i8 %24, i8* %5, align 1, !dbg !99
  %25 = load i8, i8* %5, align 1, !dbg !102
  %26 = sext i8 %25 to i32, !dbg !102
  %27 = icmp eq i32 %26, -1, !dbg !104
  br i1 %27, label %28, label %30, !dbg !105

28:                                               ; preds = %21
  %29 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([13 x i8], [13 x i8]* @.str.5, i64 0, i64 0)), !dbg !106
  br label %34, !dbg !108

30:                                               ; preds = %21
  %31 = load i8, i8* %5, align 1, !dbg !109
  %32 = sext i8 %31 to i32, !dbg !109
  %33 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.6, i64 0, i64 0), i32 noundef %32), !dbg !111
  br label %34

34:                                               ; preds = %30, %28
  %35 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8, !dbg !112
  %36 = call i32 @fseek(%struct._IO_FILE* noundef %35, i64 noundef 0, i32 noundef 2), !dbg !113
  call void @llvm.dbg.declare(metadata i64* %6, metadata !114, metadata !DIExpression()), !dbg !115
  %37 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8, !dbg !116
  %38 = call i64 @ftell(%struct._IO_FILE* noundef %37), !dbg !117
  store i64 %38, i64* %6, align 8, !dbg !115
  %39 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8, !dbg !118
  %40 = call i32 @fseek(%struct._IO_FILE* noundef %39, i64 noundef 0, i32 noundef 0), !dbg !119
  %41 = load i64, i64* %6, align 8, !dbg !120
  %42 = icmp sgt i64 %41, 0, !dbg !122
  br i1 %42, label %43, label %58, !dbg !123

43:                                               ; preds = %34
  call void @llvm.dbg.declare(metadata i8** %7, metadata !124, metadata !DIExpression()), !dbg !126
  %44 = load i64, i64* %6, align 8, !dbg !127
  %45 = add nsw i64 %44, 1, !dbg !128
  %46 = call noalias i8* @malloc(i64 noundef %45) #4, !dbg !129
  store i8* %46, i8** %7, align 8, !dbg !126
  call void @llvm.dbg.declare(metadata i64* %8, metadata !130, metadata !DIExpression()), !dbg !131
  %47 = load i8*, i8** %7, align 8, !dbg !132
  %48 = load i64, i64* %6, align 8, !dbg !133
  %49 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8, !dbg !134
  %50 = call i64 @fread(i8* noundef %47, i64 noundef 1, i64 noundef %48, %struct._IO_FILE* noundef %49), !dbg !135
  store i64 %50, i64* %8, align 8, !dbg !131
  %51 = load i8*, i8** %7, align 8, !dbg !136
  %52 = load i64, i64* %8, align 8, !dbg !137
  %53 = getelementptr inbounds i8, i8* %51, i64 %52, !dbg !136
  store i8 0, i8* %53, align 1, !dbg !138
  %54 = load i64, i64* %6, align 8, !dbg !139
  %55 = load i8*, i8** %7, align 8, !dbg !140
  %56 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([30 x i8], [30 x i8]* @.str.7, i64 0, i64 0), i64 noundef %54, i8* noundef %55), !dbg !141
  %57 = load i8*, i8** %7, align 8, !dbg !142
  call void @free(i8* noundef %57) #4, !dbg !143
  br label %58, !dbg !144

58:                                               ; preds = %43, %34
  %59 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([29 x i8], [29 x i8]* @.str.8, i64 0, i64 0)), !dbg !145
  call void @llvm.dbg.declare(metadata i32* %9, metadata !146, metadata !DIExpression()), !dbg !147
  %60 = call i32 (i8*, ...) @__isoc99_scanf(i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i64 0, i64 0), i32* noundef %9), !dbg !148
  call void @llvm.dbg.declare(metadata i32* %10, metadata !149, metadata !DIExpression()), !dbg !151
  store i32 0, i32* %10, align 4, !dbg !151
  br label %61, !dbg !152

61:                                               ; preds = %69, %58
  %62 = load i32, i32* %10, align 4, !dbg !153
  %63 = load i32, i32* %9, align 4, !dbg !155
  %64 = icmp slt i32 %62, %63, !dbg !156
  br i1 %64, label %65, label %72, !dbg !157

65:                                               ; preds = %61
  %66 = load i32, i32* %10, align 4, !dbg !158
  %67 = add nsw i32 %66, 1, !dbg !160
  %68 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([14 x i8], [14 x i8]* @.str.9, i64 0, i64 0), i32 noundef %67), !dbg !161
  br label %69, !dbg !162

69:                                               ; preds = %65
  %70 = load i32, i32* %10, align 4, !dbg !163
  %71 = add nsw i32 %70, 1, !dbg !163
  store i32 %71, i32* %10, align 4, !dbg !163
  br label %61, !dbg !164, !llvm.loop !165

72:                                               ; preds = %61
  %73 = load i32, i32* %2, align 4, !dbg !168
  %74 = icmp eq i32 %73, 1, !dbg !170
  br i1 %74, label %75, label %77, !dbg !171

75:                                               ; preds = %72
  %76 = load i32, i32* %9, align 4, !dbg !172
  call void @processData(i32 noundef %76), !dbg !174
  br label %99, !dbg !175

77:                                               ; preds = %72
  %78 = load i32, i32* %2, align 4, !dbg !176
  %79 = icmp eq i32 %78, 2, !dbg !178
  br i1 %79, label %80, label %96, !dbg !179

80:                                               ; preds = %77
  call void @llvm.dbg.declare(metadata i32* %11, metadata !180, metadata !DIExpression()), !dbg !182
  call void @llvm.dbg.declare(metadata i32* %12, metadata !183, metadata !DIExpression()), !dbg !184
  %81 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str.10, i64 0, i64 0)), !dbg !185
  %82 = call i32 (i8*, ...) @__isoc99_scanf(i8* noundef getelementptr inbounds ([6 x i8], [6 x i8]* @.str.11, i64 0, i64 0), i32* noundef %11, i32* noundef %12), !dbg !186
  call void @llvm.dbg.declare(metadata i32 (i32, i32)** %13, metadata !187, metadata !DIExpression()), !dbg !191
  %83 = call i32 (i32, i32)* @getComparator(i8 noundef signext 65), !dbg !192
  store i32 (i32, i32)* %83, i32 (i32, i32)** %13, align 8, !dbg !191
  %84 = load i32 (i32, i32)*, i32 (i32, i32)** %13, align 8, !dbg !193
  %85 = icmp ne i32 (i32, i32)* %84, null, !dbg !195
  br i1 %85, label %86, label %93, !dbg !196

86:                                               ; preds = %80
  call void @llvm.dbg.declare(metadata i32* %14, metadata !197, metadata !DIExpression()), !dbg !199
  %87 = load i32 (i32, i32)*, i32 (i32, i32)** %13, align 8, !dbg !200
  %88 = load i32, i32* %11, align 4, !dbg !201
  %89 = load i32, i32* %12, align 4, !dbg !202
  %90 = call i32 %87(i32 noundef %88, i32 noundef %89), !dbg !200
  store i32 %90, i32* %14, align 4, !dbg !199
  %91 = load i32, i32* %14, align 4, !dbg !203
  %92 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([23 x i8], [23 x i8]* @.str.12, i64 0, i64 0), i32 noundef %91), !dbg !204
  br label %95, !dbg !205

93:                                               ; preds = %80
  %94 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([23 x i8], [23 x i8]* @.str.13, i64 0, i64 0)), !dbg !206
  br label %95

95:                                               ; preds = %93, %86
  br label %98, !dbg !208

96:                                               ; preds = %77
  %97 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.14, i64 0, i64 0)), !dbg !209
  br label %98

98:                                               ; preds = %96, %95
  br label %99

99:                                               ; preds = %98, %75
  %100 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8, !dbg !211
  %101 = call i32 @fclose(%struct._IO_FILE* noundef %100), !dbg !212
  store i32 0, i32* %1, align 4, !dbg !213
  br label %102, !dbg !213

102:                                              ; preds = %99, %20
  %103 = load i32, i32* %1, align 4, !dbg !214
  ret i32 %103, !dbg !214
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @printf(i8* noundef, ...) #2

declare i32 @__isoc99_scanf(i8* noundef, ...) #2

declare noalias %struct._IO_FILE* @fopen(i8* noundef, i8* noundef) #2

declare void @perror(i8* noundef) #2

declare i32 @getc(%struct._IO_FILE* noundef) #2

declare i32 @fseek(%struct._IO_FILE* noundef, i64 noundef, i32 noundef) #2

declare i64 @ftell(%struct._IO_FILE* noundef) #2

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #3

declare i64 @fread(i8* noundef, i64 noundef, i64 noundef, %struct._IO_FILE* noundef) #2

; Function Attrs: nounwind
declare void @free(i8* noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @processData(i32 noundef %0) #0 !dbg !215 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, i32* %2, align 4
  call void @llvm.dbg.declare(metadata i32* %2, metadata !218, metadata !DIExpression()), !dbg !219
  %4 = load i32, i32* %2, align 4, !dbg !220
  %5 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([24 x i8], [24 x i8]* @.str.15, i64 0, i64 0), i32 noundef %4), !dbg !221
  call void @llvm.dbg.declare(metadata i32* %3, metadata !222, metadata !DIExpression()), !dbg !224
  store i32 0, i32* %3, align 4, !dbg !224
  br label %6, !dbg !225

6:                                                ; preds = %11, %1
  %7 = load i32, i32* %3, align 4, !dbg !226
  %8 = load i32, i32* %2, align 4, !dbg !228
  %9 = icmp slt i32 %7, %8, !dbg !229
  br i1 %9, label %10, label %14, !dbg !230

10:                                               ; preds = %6
  br label %11, !dbg !231

11:                                               ; preds = %10
  %12 = load i32, i32* %3, align 4, !dbg !233
  %13 = add nsw i32 %12, 1, !dbg !233
  store i32 %13, i32* %3, align 4, !dbg !233
  br label %6, !dbg !234, !llvm.loop !235

14:                                               ; preds = %6
  ret void, !dbg !237
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 (i32, i32)* @getComparator(i8 noundef signext %0) #0 !dbg !238 {
  %2 = alloca i32 (i32, i32)*, align 8
  %3 = alloca i8, align 1
  store i8 %0, i8* %3, align 1
  call void @llvm.dbg.declare(metadata i8* %3, metadata !241, metadata !DIExpression()), !dbg !242
  %4 = load i8, i8* %3, align 1, !dbg !243
  %5 = sext i8 %4 to i32, !dbg !243
  %6 = icmp eq i32 %5, 65, !dbg !245
  br i1 %6, label %7, label %8, !dbg !246

7:                                                ; preds = %1
  store i32 (i32, i32)* @compareInts, i32 (i32, i32)** %2, align 8, !dbg !247
  br label %9, !dbg !247

8:                                                ; preds = %1
  store i32 (i32, i32)* null, i32 (i32, i32)** %2, align 8, !dbg !249
  br label %9, !dbg !249

9:                                                ; preds = %8, %7
  %10 = load i32 (i32, i32)*, i32 (i32, i32)** %2, align 8, !dbg !251
  ret i32 (i32, i32)* %10, !dbg !251
}

declare i32 @fclose(%struct._IO_FILE* noundef) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @compareInts(i32 noundef %0, i32 noundef %1) #0 !dbg !252 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  call void @llvm.dbg.declare(metadata i32* %3, metadata !253, metadata !DIExpression()), !dbg !254
  store i32 %1, i32* %4, align 4
  call void @llvm.dbg.declare(metadata i32* %4, metadata !255, metadata !DIExpression()), !dbg !256
  %5 = load i32, i32* %3, align 4, !dbg !257
  %6 = load i32, i32* %4, align 4, !dbg !258
  %7 = sub nsw i32 %5, %6, !dbg !259
  ret i32 %7, !dbg !260
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!6, !7, !8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Ubuntu clang version 14.0.0-1ubuntu1.1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "test-files/example5.c", directory: "/home/mhpatel4/repos/llvm-project", checksumkind: CSK_MD5, checksum: "cb23f555d150671b3aad089b01f99e6d")
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
!14 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 10, type: !15, scopeLine: 10, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!15 = !DISubroutineType(types: !16)
!16 = !{!17}
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !{}
!19 = !DILocalVariable(name: "option", scope: !14, file: !1, line: 11, type: !17)
!20 = !DILocation(line: 11, column: 9, scope: !14)
!21 = !DILocalVariable(name: "buffer", scope: !14, file: !1, line: 12, type: !22)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !23)
!23 = !{!24}
!24 = !DISubrange(count: 100)
!25 = !DILocation(line: 12, column: 10, scope: !14)
!26 = !DILocalVariable(name: "fp", scope: !14, file: !1, line: 13, type: !27)
!27 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !28, size: 64)
!28 = !DIDerivedType(tag: DW_TAG_typedef, name: "FILE", file: !29, line: 7, baseType: !30)
!29 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/FILE.h", directory: "", checksumkind: CSK_MD5, checksum: "571f9fb6223c42439075fdde11a0de5d")
!30 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_FILE", file: !31, line: 49, size: 1728, elements: !32)
!31 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/struct_FILE.h", directory: "", checksumkind: CSK_MD5, checksum: "1bad07471b7974df4ecc1d1c2ca207e6")
!32 = !{!33, !34, !35, !36, !37, !38, !39, !40, !41, !42, !43, !44, !45, !48, !50, !51, !52, !56, !58, !60, !64, !67, !69, !72, !75, !76, !77, !81, !82}
!33 = !DIDerivedType(tag: DW_TAG_member, name: "_flags", scope: !30, file: !31, line: 51, baseType: !17, size: 32)
!34 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_ptr", scope: !30, file: !31, line: 54, baseType: !4, size: 64, offset: 64)
!35 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_end", scope: !30, file: !31, line: 55, baseType: !4, size: 64, offset: 128)
!36 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_base", scope: !30, file: !31, line: 56, baseType: !4, size: 64, offset: 192)
!37 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_base", scope: !30, file: !31, line: 57, baseType: !4, size: 64, offset: 256)
!38 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_ptr", scope: !30, file: !31, line: 58, baseType: !4, size: 64, offset: 320)
!39 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_end", scope: !30, file: !31, line: 59, baseType: !4, size: 64, offset: 384)
!40 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_buf_base", scope: !30, file: !31, line: 60, baseType: !4, size: 64, offset: 448)
!41 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_buf_end", scope: !30, file: !31, line: 61, baseType: !4, size: 64, offset: 512)
!42 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_save_base", scope: !30, file: !31, line: 64, baseType: !4, size: 64, offset: 576)
!43 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_backup_base", scope: !30, file: !31, line: 65, baseType: !4, size: 64, offset: 640)
!44 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_save_end", scope: !30, file: !31, line: 66, baseType: !4, size: 64, offset: 704)
!45 = !DIDerivedType(tag: DW_TAG_member, name: "_markers", scope: !30, file: !31, line: 68, baseType: !46, size: 64, offset: 768)
!46 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !47, size: 64)
!47 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_marker", file: !31, line: 36, flags: DIFlagFwdDecl)
!48 = !DIDerivedType(tag: DW_TAG_member, name: "_chain", scope: !30, file: !31, line: 70, baseType: !49, size: 64, offset: 832)
!49 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !30, size: 64)
!50 = !DIDerivedType(tag: DW_TAG_member, name: "_fileno", scope: !30, file: !31, line: 72, baseType: !17, size: 32, offset: 896)
!51 = !DIDerivedType(tag: DW_TAG_member, name: "_flags2", scope: !30, file: !31, line: 73, baseType: !17, size: 32, offset: 928)
!52 = !DIDerivedType(tag: DW_TAG_member, name: "_old_offset", scope: !30, file: !31, line: 74, baseType: !53, size: 64, offset: 960)
!53 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off_t", file: !54, line: 152, baseType: !55)
!54 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "", checksumkind: CSK_MD5, checksum: "d108b5f93a74c50510d7d9bc0ab36df9")
!55 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!56 = !DIDerivedType(tag: DW_TAG_member, name: "_cur_column", scope: !30, file: !31, line: 77, baseType: !57, size: 16, offset: 1024)
!57 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!58 = !DIDerivedType(tag: DW_TAG_member, name: "_vtable_offset", scope: !30, file: !31, line: 78, baseType: !59, size: 8, offset: 1040)
!59 = !DIBasicType(name: "signed char", size: 8, encoding: DW_ATE_signed_char)
!60 = !DIDerivedType(tag: DW_TAG_member, name: "_shortbuf", scope: !30, file: !31, line: 79, baseType: !61, size: 8, offset: 1048)
!61 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 8, elements: !62)
!62 = !{!63}
!63 = !DISubrange(count: 1)
!64 = !DIDerivedType(tag: DW_TAG_member, name: "_lock", scope: !30, file: !31, line: 81, baseType: !65, size: 64, offset: 1088)
!65 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !66, size: 64)
!66 = !DIDerivedType(tag: DW_TAG_typedef, name: "_IO_lock_t", file: !31, line: 43, baseType: null)
!67 = !DIDerivedType(tag: DW_TAG_member, name: "_offset", scope: !30, file: !31, line: 89, baseType: !68, size: 64, offset: 1152)
!68 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off64_t", file: !54, line: 153, baseType: !55)
!69 = !DIDerivedType(tag: DW_TAG_member, name: "_codecvt", scope: !30, file: !31, line: 91, baseType: !70, size: 64, offset: 1216)
!70 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !71, size: 64)
!71 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_codecvt", file: !31, line: 37, flags: DIFlagFwdDecl)
!72 = !DIDerivedType(tag: DW_TAG_member, name: "_wide_data", scope: !30, file: !31, line: 92, baseType: !73, size: 64, offset: 1280)
!73 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !74, size: 64)
!74 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_wide_data", file: !31, line: 38, flags: DIFlagFwdDecl)
!75 = !DIDerivedType(tag: DW_TAG_member, name: "_freeres_list", scope: !30, file: !31, line: 93, baseType: !49, size: 64, offset: 1344)
!76 = !DIDerivedType(tag: DW_TAG_member, name: "_freeres_buf", scope: !30, file: !31, line: 94, baseType: !3, size: 64, offset: 1408)
!77 = !DIDerivedType(tag: DW_TAG_member, name: "__pad5", scope: !30, file: !31, line: 95, baseType: !78, size: 64, offset: 1472)
!78 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !79, line: 46, baseType: !80)
!79 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!80 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!81 = !DIDerivedType(tag: DW_TAG_member, name: "_mode", scope: !30, file: !31, line: 96, baseType: !17, size: 32, offset: 1536)
!82 = !DIDerivedType(tag: DW_TAG_member, name: "_unused2", scope: !30, file: !31, line: 98, baseType: !83, size: 160, offset: 1568)
!83 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 160, elements: !84)
!84 = !{!85}
!85 = !DISubrange(count: 20)
!86 = !DILocation(line: 13, column: 11, scope: !14)
!87 = !DILocation(line: 16, column: 5, scope: !14)
!88 = !DILocation(line: 17, column: 5, scope: !14)
!89 = !DILocation(line: 20, column: 10, scope: !14)
!90 = !DILocation(line: 20, column: 8, scope: !14)
!91 = !DILocation(line: 21, column: 9, scope: !92)
!92 = distinct !DILexicalBlock(scope: !14, file: !1, line: 21, column: 9)
!93 = !DILocation(line: 21, column: 12, scope: !92)
!94 = !DILocation(line: 21, column: 9, scope: !14)
!95 = !DILocation(line: 22, column: 9, scope: !96)
!96 = distinct !DILexicalBlock(scope: !92, file: !1, line: 21, column: 21)
!97 = !DILocation(line: 23, column: 9, scope: !96)
!98 = !DILocalVariable(name: "ch", scope: !14, file: !1, line: 27, type: !5)
!99 = !DILocation(line: 27, column: 10, scope: !14)
!100 = !DILocation(line: 27, column: 20, scope: !14)
!101 = !DILocation(line: 27, column: 15, scope: !14)
!102 = !DILocation(line: 28, column: 9, scope: !103)
!103 = distinct !DILexicalBlock(scope: !14, file: !1, line: 28, column: 9)
!104 = !DILocation(line: 28, column: 12, scope: !103)
!105 = !DILocation(line: 28, column: 9, scope: !14)
!106 = !DILocation(line: 29, column: 9, scope: !107)
!107 = distinct !DILexicalBlock(scope: !103, file: !1, line: 28, column: 20)
!108 = !DILocation(line: 30, column: 5, scope: !107)
!109 = !DILocation(line: 31, column: 41, scope: !110)
!110 = distinct !DILexicalBlock(scope: !103, file: !1, line: 30, column: 12)
!111 = !DILocation(line: 31, column: 9, scope: !110)
!112 = !DILocation(line: 35, column: 11, scope: !14)
!113 = !DILocation(line: 35, column: 5, scope: !14)
!114 = !DILocalVariable(name: "fileSize", scope: !14, file: !1, line: 36, type: !55)
!115 = !DILocation(line: 36, column: 10, scope: !14)
!116 = !DILocation(line: 36, column: 27, scope: !14)
!117 = !DILocation(line: 36, column: 21, scope: !14)
!118 = !DILocation(line: 37, column: 11, scope: !14)
!119 = !DILocation(line: 37, column: 5, scope: !14)
!120 = !DILocation(line: 40, column: 9, scope: !121)
!121 = distinct !DILexicalBlock(scope: !14, file: !1, line: 40, column: 9)
!122 = !DILocation(line: 40, column: 18, scope: !121)
!123 = !DILocation(line: 40, column: 9, scope: !14)
!124 = !DILocalVariable(name: "fileContent", scope: !125, file: !1, line: 41, type: !4)
!125 = distinct !DILexicalBlock(scope: !121, file: !1, line: 40, column: 23)
!126 = !DILocation(line: 41, column: 15, scope: !125)
!127 = !DILocation(line: 41, column: 43, scope: !125)
!128 = !DILocation(line: 41, column: 52, scope: !125)
!129 = !DILocation(line: 41, column: 36, scope: !125)
!130 = !DILocalVariable(name: "bytesRead", scope: !125, file: !1, line: 42, type: !78)
!131 = !DILocation(line: 42, column: 16, scope: !125)
!132 = !DILocation(line: 42, column: 34, scope: !125)
!133 = !DILocation(line: 42, column: 61, scope: !125)
!134 = !DILocation(line: 42, column: 71, scope: !125)
!135 = !DILocation(line: 42, column: 28, scope: !125)
!136 = !DILocation(line: 43, column: 9, scope: !125)
!137 = !DILocation(line: 43, column: 21, scope: !125)
!138 = !DILocation(line: 43, column: 32, scope: !125)
!139 = !DILocation(line: 44, column: 50, scope: !125)
!140 = !DILocation(line: 44, column: 60, scope: !125)
!141 = !DILocation(line: 44, column: 9, scope: !125)
!142 = !DILocation(line: 45, column: 14, scope: !125)
!143 = !DILocation(line: 45, column: 9, scope: !125)
!144 = !DILocation(line: 46, column: 5, scope: !125)
!145 = !DILocation(line: 49, column: 5, scope: !14)
!146 = !DILocalVariable(name: "n", scope: !14, file: !1, line: 50, type: !17)
!147 = !DILocation(line: 50, column: 9, scope: !14)
!148 = !DILocation(line: 51, column: 5, scope: !14)
!149 = !DILocalVariable(name: "i", scope: !150, file: !1, line: 54, type: !17)
!150 = distinct !DILexicalBlock(scope: !14, file: !1, line: 54, column: 5)
!151 = !DILocation(line: 54, column: 14, scope: !150)
!152 = !DILocation(line: 54, column: 10, scope: !150)
!153 = !DILocation(line: 54, column: 21, scope: !154)
!154 = distinct !DILexicalBlock(scope: !150, file: !1, line: 54, column: 5)
!155 = !DILocation(line: 54, column: 25, scope: !154)
!156 = !DILocation(line: 54, column: 23, scope: !154)
!157 = !DILocation(line: 54, column: 5, scope: !150)
!158 = !DILocation(line: 55, column: 34, scope: !159)
!159 = distinct !DILexicalBlock(scope: !154, file: !1, line: 54, column: 33)
!160 = !DILocation(line: 55, column: 36, scope: !159)
!161 = !DILocation(line: 55, column: 9, scope: !159)
!162 = !DILocation(line: 56, column: 5, scope: !159)
!163 = !DILocation(line: 54, column: 29, scope: !154)
!164 = !DILocation(line: 54, column: 5, scope: !154)
!165 = distinct !{!165, !157, !166, !167}
!166 = !DILocation(line: 56, column: 5, scope: !150)
!167 = !{!"llvm.loop.mustprogress"}
!168 = !DILocation(line: 59, column: 9, scope: !169)
!169 = distinct !DILexicalBlock(scope: !14, file: !1, line: 59, column: 9)
!170 = !DILocation(line: 59, column: 16, scope: !169)
!171 = !DILocation(line: 59, column: 9, scope: !14)
!172 = !DILocation(line: 60, column: 21, scope: !173)
!173 = distinct !DILexicalBlock(scope: !169, file: !1, line: 59, column: 22)
!174 = !DILocation(line: 60, column: 9, scope: !173)
!175 = !DILocation(line: 61, column: 5, scope: !173)
!176 = !DILocation(line: 61, column: 16, scope: !177)
!177 = distinct !DILexicalBlock(scope: !169, file: !1, line: 61, column: 16)
!178 = !DILocation(line: 61, column: 23, scope: !177)
!179 = !DILocation(line: 61, column: 16, scope: !169)
!180 = !DILocalVariable(name: "a", scope: !181, file: !1, line: 62, type: !17)
!181 = distinct !DILexicalBlock(scope: !177, file: !1, line: 61, column: 29)
!182 = !DILocation(line: 62, column: 13, scope: !181)
!183 = !DILocalVariable(name: "b", scope: !181, file: !1, line: 62, type: !17)
!184 = !DILocation(line: 62, column: 16, scope: !181)
!185 = !DILocation(line: 64, column: 9, scope: !181)
!186 = !DILocation(line: 65, column: 9, scope: !181)
!187 = !DILocalVariable(name: "cmp", scope: !181, file: !1, line: 67, type: !188)
!188 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !189, size: 64)
!189 = !DISubroutineType(types: !190)
!190 = !{!17, !17, !17}
!191 = !DILocation(line: 67, column: 15, scope: !181)
!192 = !DILocation(line: 67, column: 32, scope: !181)
!193 = !DILocation(line: 68, column: 13, scope: !194)
!194 = distinct !DILexicalBlock(scope: !181, file: !1, line: 68, column: 13)
!195 = !DILocation(line: 68, column: 17, scope: !194)
!196 = !DILocation(line: 68, column: 13, scope: !181)
!197 = !DILocalVariable(name: "result", scope: !198, file: !1, line: 69, type: !17)
!198 = distinct !DILexicalBlock(scope: !194, file: !1, line: 68, column: 26)
!199 = !DILocation(line: 69, column: 17, scope: !198)
!200 = !DILocation(line: 69, column: 26, scope: !198)
!201 = !DILocation(line: 69, column: 30, scope: !198)
!202 = !DILocation(line: 69, column: 33, scope: !198)
!203 = !DILocation(line: 70, column: 47, scope: !198)
!204 = !DILocation(line: 70, column: 13, scope: !198)
!205 = !DILocation(line: 71, column: 9, scope: !198)
!206 = !DILocation(line: 72, column: 13, scope: !207)
!207 = distinct !DILexicalBlock(scope: !194, file: !1, line: 71, column: 16)
!208 = !DILocation(line: 74, column: 5, scope: !181)
!209 = !DILocation(line: 75, column: 9, scope: !210)
!210 = distinct !DILexicalBlock(scope: !177, file: !1, line: 74, column: 12)
!211 = !DILocation(line: 79, column: 12, scope: !14)
!212 = !DILocation(line: 79, column: 5, scope: !14)
!213 = !DILocation(line: 80, column: 5, scope: !14)
!214 = !DILocation(line: 81, column: 1, scope: !14)
!215 = distinct !DISubprogram(name: "processData", scope: !1, file: !1, line: 83, type: !216, scopeLine: 83, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!216 = !DISubroutineType(types: !217)
!217 = !{null, !17}
!218 = !DILocalVariable(name: "count", arg: 1, scope: !215, file: !1, line: 83, type: !17)
!219 = !DILocation(line: 83, column: 22, scope: !215)
!220 = !DILocation(line: 84, column: 40, scope: !215)
!221 = !DILocation(line: 84, column: 5, scope: !215)
!222 = !DILocalVariable(name: "i", scope: !223, file: !1, line: 86, type: !17)
!223 = distinct !DILexicalBlock(scope: !215, file: !1, line: 86, column: 5)
!224 = !DILocation(line: 86, column: 14, scope: !223)
!225 = !DILocation(line: 86, column: 10, scope: !223)
!226 = !DILocation(line: 86, column: 21, scope: !227)
!227 = distinct !DILexicalBlock(scope: !223, file: !1, line: 86, column: 5)
!228 = !DILocation(line: 86, column: 25, scope: !227)
!229 = !DILocation(line: 86, column: 23, scope: !227)
!230 = !DILocation(line: 86, column: 5, scope: !223)
!231 = !DILocation(line: 88, column: 5, scope: !232)
!232 = distinct !DILexicalBlock(scope: !227, file: !1, line: 86, column: 37)
!233 = !DILocation(line: 86, column: 33, scope: !227)
!234 = !DILocation(line: 86, column: 5, scope: !227)
!235 = distinct !{!235, !230, !236, !167}
!236 = !DILocation(line: 88, column: 5, scope: !223)
!237 = !DILocation(line: 89, column: 1, scope: !215)
!238 = distinct !DISubprogram(name: "getComparator", scope: !1, file: !1, line: 95, type: !239, scopeLine: 95, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!239 = !DISubroutineType(types: !240)
!240 = !{!188, !5}
!241 = !DILocalVariable(name: "type", arg: 1, scope: !238, file: !1, line: 95, type: !5)
!242 = !DILocation(line: 95, column: 26, scope: !238)
!243 = !DILocation(line: 96, column: 9, scope: !244)
!244 = distinct !DILexicalBlock(scope: !238, file: !1, line: 96, column: 9)
!245 = !DILocation(line: 96, column: 14, scope: !244)
!246 = !DILocation(line: 96, column: 9, scope: !238)
!247 = !DILocation(line: 97, column: 9, scope: !248)
!248 = distinct !DILexicalBlock(scope: !244, file: !1, line: 96, column: 22)
!249 = !DILocation(line: 99, column: 9, scope: !250)
!250 = distinct !DILexicalBlock(scope: !244, file: !1, line: 98, column: 12)
!251 = !DILocation(line: 101, column: 1, scope: !238)
!252 = distinct !DISubprogram(name: "compareInts", scope: !1, file: !1, line: 91, type: !189, scopeLine: 91, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!253 = !DILocalVariable(name: "a", arg: 1, scope: !252, file: !1, line: 91, type: !17)
!254 = !DILocation(line: 91, column: 21, scope: !252)
!255 = !DILocalVariable(name: "b", arg: 2, scope: !252, file: !1, line: 91, type: !17)
!256 = !DILocation(line: 91, column: 28, scope: !252)
!257 = !DILocation(line: 92, column: 12, scope: !252)
!258 = !DILocation(line: 92, column: 16, scope: !252)
!259 = !DILocation(line: 92, column: 14, scope: !252)
!260 = !DILocation(line: 92, column: 5, scope: !252)
