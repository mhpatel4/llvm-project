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
@.str.4 = private unnamed_addr constant [26 x i8] c"Failed to open input file\00", align 1
@.str.5 = private unnamed_addr constant [11 x i8] c"output.txt\00", align 1
@.str.6 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@.str.7 = private unnamed_addr constant [27 x i8] c"Failed to open output file\00", align 1
@.str.8 = private unnamed_addr constant [13 x i8] c"Empty file.\0A\00", align 1
@.str.9 = private unnamed_addr constant [21 x i8] c"First character: %c\0A\00", align 1
@.str.10 = private unnamed_addr constant [30 x i8] c"File content (%ld bytes): %s\0A\00", align 1
@.str.11 = private unnamed_addr constant [29 x i8] c"Enter number of iterations: \00", align 1
@.str.12 = private unnamed_addr constant [14 x i8] c"Iteration %d\0A\00", align 1
@.str.13 = private unnamed_addr constant [32 x i8] c"Enter two integers to compare: \00", align 1
@.str.14 = private unnamed_addr constant [6 x i8] c"%d %d\00", align 1
@.str.15 = private unnamed_addr constant [23 x i8] c"Comparison result: %d\0A\00", align 1
@.str.16 = private unnamed_addr constant [23 x i8] c"Comparator not found.\0A\00", align 1
@.str.17 = private unnamed_addr constant [17 x i8] c"Invalid option.\0A\00", align 1
@.str.18 = private unnamed_addr constant [24 x i8] c"Processing %d items...\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !14 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca [100 x i8], align 16
  %4 = alloca %struct._IO_FILE*, align 8
  %5 = alloca %struct._IO_FILE*, align 8
  %6 = alloca i8, align 1
  %7 = alloca i64, align 8
  %8 = alloca i8*, align 8
  %9 = alloca i64, align 8
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32 (i32, i32)*, align 8
  %15 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  call void @llvm.dbg.declare(metadata i32* %2, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata [100 x i8]* %3, metadata !21, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata %struct._IO_FILE** %4, metadata !26, metadata !DIExpression()), !dbg !86
  call void @llvm.dbg.declare(metadata %struct._IO_FILE** %5, metadata !87, metadata !DIExpression()), !dbg !88
  %16 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([48 x i8], [48 x i8]* @.str, i64 0, i64 0)), !dbg !89
  %17 = call i32 (i8*, ...) @__isoc99_scanf(i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i64 0, i64 0), i32* noundef %2), !dbg !90
  %18 = call noalias %struct._IO_FILE* @fopen(i8* noundef getelementptr inbounds ([10 x i8], [10 x i8]* @.str.2, i64 0, i64 0), i8* noundef getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)), !dbg !91
  store %struct._IO_FILE* %18, %struct._IO_FILE** %4, align 8, !dbg !92
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8, !dbg !93
  %20 = icmp eq %struct._IO_FILE* %19, null, !dbg !95
  br i1 %20, label %21, label %22, !dbg !96

21:                                               ; preds = %0
  call void @perror(i8* noundef getelementptr inbounds ([26 x i8], [26 x i8]* @.str.4, i64 0, i64 0)), !dbg !97
  store i32 1, i32* %1, align 4, !dbg !99
  br label %121, !dbg !99

22:                                               ; preds = %0
  %23 = call noalias %struct._IO_FILE* @fopen(i8* noundef getelementptr inbounds ([11 x i8], [11 x i8]* @.str.5, i64 0, i64 0), i8* noundef getelementptr inbounds ([2 x i8], [2 x i8]* @.str.6, i64 0, i64 0)), !dbg !100
  store %struct._IO_FILE* %23, %struct._IO_FILE** %5, align 8, !dbg !101
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8, !dbg !102
  %25 = icmp eq %struct._IO_FILE* %24, null, !dbg !104
  br i1 %25, label %26, label %29, !dbg !105

26:                                               ; preds = %22
  call void @perror(i8* noundef getelementptr inbounds ([27 x i8], [27 x i8]* @.str.7, i64 0, i64 0)), !dbg !106
  %27 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8, !dbg !108
  %28 = call i32 @fclose(%struct._IO_FILE* noundef %27), !dbg !109
  store i32 1, i32* %1, align 4, !dbg !110
  br label %121, !dbg !110

29:                                               ; preds = %22
  call void @llvm.dbg.declare(metadata i8* %6, metadata !111, metadata !DIExpression()), !dbg !112
  %30 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8, !dbg !113
  %31 = call i32 @getc(%struct._IO_FILE* noundef %30), !dbg !114
  %32 = trunc i32 %31 to i8, !dbg !114
  store i8 %32, i8* %6, align 1, !dbg !112
  %33 = load i8, i8* %6, align 1, !dbg !115
  %34 = sext i8 %33 to i32, !dbg !115
  %35 = icmp eq i32 %34, -1, !dbg !117
  br i1 %35, label %36, label %39, !dbg !118

36:                                               ; preds = %29
  %37 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8, !dbg !119
  %38 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* noundef %37, i8* noundef getelementptr inbounds ([13 x i8], [13 x i8]* @.str.8, i64 0, i64 0)), !dbg !121
  br label %44, !dbg !122

39:                                               ; preds = %29
  %40 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8, !dbg !123
  %41 = load i8, i8* %6, align 1, !dbg !125
  %42 = sext i8 %41 to i32, !dbg !125
  %43 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* noundef %40, i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.9, i64 0, i64 0), i32 noundef %42), !dbg !126
  br label %44

44:                                               ; preds = %39, %36
  %45 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8, !dbg !127
  %46 = call i32 @fseek(%struct._IO_FILE* noundef %45, i64 noundef 0, i32 noundef 2), !dbg !128
  call void @llvm.dbg.declare(metadata i64* %7, metadata !129, metadata !DIExpression()), !dbg !130
  %47 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8, !dbg !131
  %48 = call i64 @ftell(%struct._IO_FILE* noundef %47), !dbg !132
  store i64 %48, i64* %7, align 8, !dbg !130
  %49 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8, !dbg !133
  %50 = call i32 @fseek(%struct._IO_FILE* noundef %49, i64 noundef 0, i32 noundef 0), !dbg !134
  %51 = load i64, i64* %7, align 8, !dbg !135
  %52 = icmp sgt i64 %51, 0, !dbg !137
  br i1 %52, label %53, label %75, !dbg !138

53:                                               ; preds = %44
  call void @llvm.dbg.declare(metadata i8** %8, metadata !139, metadata !DIExpression()), !dbg !141
  %54 = load i64, i64* %7, align 8, !dbg !142
  %55 = add nsw i64 %54, 1, !dbg !143
  %56 = call noalias i8* @malloc(i64 noundef %55) #4, !dbg !144
  store i8* %56, i8** %8, align 8, !dbg !141
  call void @llvm.dbg.declare(metadata i64* %9, metadata !145, metadata !DIExpression()), !dbg !146
  %57 = load i8*, i8** %8, align 8, !dbg !147
  %58 = load i64, i64* %7, align 8, !dbg !148
  %59 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8, !dbg !149
  %60 = call i64 @fread(i8* noundef %57, i64 noundef 1, i64 noundef %58, %struct._IO_FILE* noundef %59), !dbg !150
  store i64 %60, i64* %9, align 8, !dbg !146
  %61 = load i8*, i8** %8, align 8, !dbg !151
  %62 = load i64, i64* %9, align 8, !dbg !152
  %63 = getelementptr inbounds i8, i8* %61, i64 %62, !dbg !151
  store i8 0, i8* %63, align 1, !dbg !153
  %64 = load i64, i64* %7, align 8, !dbg !154
  %65 = load i8*, i8** %8, align 8, !dbg !155
  %66 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([30 x i8], [30 x i8]* @.str.10, i64 0, i64 0), i64 noundef %64, i8* noundef %65), !dbg !156
  %67 = bitcast i64* %7 to i8*, !dbg !157
  %68 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8, !dbg !158
  %69 = call i64 @fwrite(i8* noundef %67, i64 noundef 8, i64 noundef 1, %struct._IO_FILE* noundef %68), !dbg !159
  %70 = load i8*, i8** %8, align 8, !dbg !160
  %71 = load i64, i64* %9, align 8, !dbg !161
  %72 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8, !dbg !162
  %73 = call i64 @fwrite(i8* noundef %70, i64 noundef 1, i64 noundef %71, %struct._IO_FILE* noundef %72), !dbg !163
  %74 = load i8*, i8** %8, align 8, !dbg !164
  call void @free(i8* noundef %74) #4, !dbg !165
  br label %75, !dbg !166

75:                                               ; preds = %53, %44
  %76 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([29 x i8], [29 x i8]* @.str.11, i64 0, i64 0)), !dbg !167
  call void @llvm.dbg.declare(metadata i32* %10, metadata !168, metadata !DIExpression()), !dbg !169
  %77 = call i32 (i8*, ...) @__isoc99_scanf(i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i64 0, i64 0), i32* noundef %10), !dbg !170
  call void @llvm.dbg.declare(metadata i32* %11, metadata !171, metadata !DIExpression()), !dbg !173
  store i32 0, i32* %11, align 4, !dbg !173
  br label %78, !dbg !174

78:                                               ; preds = %86, %75
  %79 = load i32, i32* %11, align 4, !dbg !175
  %80 = load i32, i32* %10, align 4, !dbg !177
  %81 = icmp slt i32 %79, %80, !dbg !178
  br i1 %81, label %82, label %89, !dbg !179

82:                                               ; preds = %78
  %83 = load i32, i32* %11, align 4, !dbg !180
  %84 = add nsw i32 %83, 1, !dbg !182
  %85 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([14 x i8], [14 x i8]* @.str.12, i64 0, i64 0), i32 noundef %84), !dbg !183
  br label %86, !dbg !184

86:                                               ; preds = %82
  %87 = load i32, i32* %11, align 4, !dbg !185
  %88 = add nsw i32 %87, 1, !dbg !185
  store i32 %88, i32* %11, align 4, !dbg !185
  br label %78, !dbg !186, !llvm.loop !187

89:                                               ; preds = %78
  %90 = load i32, i32* %2, align 4, !dbg !190
  %91 = icmp eq i32 %90, 1, !dbg !192
  br i1 %91, label %92, label %94, !dbg !193

92:                                               ; preds = %89
  %93 = load i32, i32* %10, align 4, !dbg !194
  call void @processData(i32 noundef %93), !dbg !196
  br label %116, !dbg !197

94:                                               ; preds = %89
  %95 = load i32, i32* %2, align 4, !dbg !198
  %96 = icmp eq i32 %95, 2, !dbg !200
  br i1 %96, label %97, label %113, !dbg !201

97:                                               ; preds = %94
  call void @llvm.dbg.declare(metadata i32* %12, metadata !202, metadata !DIExpression()), !dbg !204
  call void @llvm.dbg.declare(metadata i32* %13, metadata !205, metadata !DIExpression()), !dbg !206
  %98 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str.13, i64 0, i64 0)), !dbg !207
  %99 = call i32 (i8*, ...) @__isoc99_scanf(i8* noundef getelementptr inbounds ([6 x i8], [6 x i8]* @.str.14, i64 0, i64 0), i32* noundef %12, i32* noundef %13), !dbg !208
  call void @llvm.dbg.declare(metadata i32 (i32, i32)** %14, metadata !209, metadata !DIExpression()), !dbg !213
  %100 = call i32 (i32, i32)* @getComparator(i8 noundef signext 65), !dbg !214
  store i32 (i32, i32)* %100, i32 (i32, i32)** %14, align 8, !dbg !213
  %101 = load i32 (i32, i32)*, i32 (i32, i32)** %14, align 8, !dbg !215
  %102 = icmp ne i32 (i32, i32)* %101, null, !dbg !217
  br i1 %102, label %103, label %110, !dbg !218

103:                                              ; preds = %97
  call void @llvm.dbg.declare(metadata i32* %15, metadata !219, metadata !DIExpression()), !dbg !221
  %104 = load i32 (i32, i32)*, i32 (i32, i32)** %14, align 8, !dbg !222
  %105 = load i32, i32* %12, align 4, !dbg !223
  %106 = load i32, i32* %13, align 4, !dbg !224
  %107 = call i32 %104(i32 noundef %105, i32 noundef %106), !dbg !222
  store i32 %107, i32* %15, align 4, !dbg !221
  %108 = load i32, i32* %15, align 4, !dbg !225
  %109 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([23 x i8], [23 x i8]* @.str.15, i64 0, i64 0), i32 noundef %108), !dbg !226
  br label %112, !dbg !227

110:                                              ; preds = %97
  %111 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([23 x i8], [23 x i8]* @.str.16, i64 0, i64 0)), !dbg !228
  br label %112

112:                                              ; preds = %110, %103
  br label %115, !dbg !230

113:                                              ; preds = %94
  %114 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.17, i64 0, i64 0)), !dbg !231
  br label %115

115:                                              ; preds = %113, %112
  br label %116

116:                                              ; preds = %115, %92
  %117 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8, !dbg !233
  %118 = call i32 @fclose(%struct._IO_FILE* noundef %117), !dbg !234
  %119 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8, !dbg !235
  %120 = call i32 @fclose(%struct._IO_FILE* noundef %119), !dbg !236
  store i32 0, i32* %1, align 4, !dbg !237
  br label %121, !dbg !237

121:                                              ; preds = %116, %26, %21
  %122 = load i32, i32* %1, align 4, !dbg !238
  ret i32 %122, !dbg !238
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @printf(i8* noundef, ...) #2

declare i32 @__isoc99_scanf(i8* noundef, ...) #2

declare noalias %struct._IO_FILE* @fopen(i8* noundef, i8* noundef) #2

declare void @perror(i8* noundef) #2

declare i32 @fclose(%struct._IO_FILE* noundef) #2

declare i32 @getc(%struct._IO_FILE* noundef) #2

declare i32 @fprintf(%struct._IO_FILE* noundef, i8* noundef, ...) #2

declare i32 @fseek(%struct._IO_FILE* noundef, i64 noundef, i32 noundef) #2

declare i64 @ftell(%struct._IO_FILE* noundef) #2

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #3

declare i64 @fread(i8* noundef, i64 noundef, i64 noundef, %struct._IO_FILE* noundef) #2

declare i64 @fwrite(i8* noundef, i64 noundef, i64 noundef, %struct._IO_FILE* noundef) #2

; Function Attrs: nounwind
declare void @free(i8* noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @processData(i32 noundef %0) #0 !dbg !239 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, i32* %2, align 4
  call void @llvm.dbg.declare(metadata i32* %2, metadata !242, metadata !DIExpression()), !dbg !243
  %4 = load i32, i32* %2, align 4, !dbg !244
  %5 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([24 x i8], [24 x i8]* @.str.18, i64 0, i64 0), i32 noundef %4), !dbg !245
  call void @llvm.dbg.declare(metadata i32* %3, metadata !246, metadata !DIExpression()), !dbg !248
  store i32 0, i32* %3, align 4, !dbg !248
  br label %6, !dbg !249

6:                                                ; preds = %11, %1
  %7 = load i32, i32* %3, align 4, !dbg !250
  %8 = load i32, i32* %2, align 4, !dbg !252
  %9 = icmp slt i32 %7, %8, !dbg !253
  br i1 %9, label %10, label %14, !dbg !254

10:                                               ; preds = %6
  br label %11, !dbg !255

11:                                               ; preds = %10
  %12 = load i32, i32* %3, align 4, !dbg !257
  %13 = add nsw i32 %12, 1, !dbg !257
  store i32 %13, i32* %3, align 4, !dbg !257
  br label %6, !dbg !258, !llvm.loop !259

14:                                               ; preds = %6
  ret void, !dbg !261
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 (i32, i32)* @getComparator(i8 noundef signext %0) #0 !dbg !262 {
  %2 = alloca i32 (i32, i32)*, align 8
  %3 = alloca i8, align 1
  store i8 %0, i8* %3, align 1
  call void @llvm.dbg.declare(metadata i8* %3, metadata !265, metadata !DIExpression()), !dbg !266
  %4 = load i8, i8* %3, align 1, !dbg !267
  %5 = sext i8 %4 to i32, !dbg !267
  %6 = icmp eq i32 %5, 65, !dbg !269
  br i1 %6, label %7, label %8, !dbg !270

7:                                                ; preds = %1
  store i32 (i32, i32)* @compareInts, i32 (i32, i32)** %2, align 8, !dbg !271
  br label %9, !dbg !271

8:                                                ; preds = %1
  store i32 (i32, i32)* null, i32 (i32, i32)** %2, align 8, !dbg !273
  br label %9, !dbg !273

9:                                                ; preds = %8, %7
  %10 = load i32 (i32, i32)*, i32 (i32, i32)** %2, align 8, !dbg !275
  ret i32 (i32, i32)* %10, !dbg !275
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @compareInts(i32 noundef %0, i32 noundef %1) #0 !dbg !276 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  call void @llvm.dbg.declare(metadata i32* %3, metadata !277, metadata !DIExpression()), !dbg !278
  store i32 %1, i32* %4, align 4
  call void @llvm.dbg.declare(metadata i32* %4, metadata !279, metadata !DIExpression()), !dbg !280
  %5 = load i32, i32* %3, align 4, !dbg !281
  %6 = load i32, i32* %4, align 4, !dbg !282
  %7 = sub nsw i32 %5, %6, !dbg !283
  ret i32 %7, !dbg !284
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
!1 = !DIFile(filename: "test-files/example5.c", directory: "/home/mhpatel4/repos/llvm-project", checksumkind: CSK_MD5, checksum: "858a477577d362ab1d3595c073c16b46")
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
!87 = !DILocalVariable(name: "outputFile", scope: !14, file: !1, line: 13, type: !27)
!88 = !DILocation(line: 13, column: 16, scope: !14)
!89 = !DILocation(line: 16, column: 5, scope: !14)
!90 = !DILocation(line: 17, column: 5, scope: !14)
!91 = !DILocation(line: 20, column: 10, scope: !14)
!92 = !DILocation(line: 20, column: 8, scope: !14)
!93 = !DILocation(line: 21, column: 9, scope: !94)
!94 = distinct !DILexicalBlock(scope: !14, file: !1, line: 21, column: 9)
!95 = !DILocation(line: 21, column: 12, scope: !94)
!96 = !DILocation(line: 21, column: 9, scope: !14)
!97 = !DILocation(line: 22, column: 9, scope: !98)
!98 = distinct !DILexicalBlock(scope: !94, file: !1, line: 21, column: 21)
!99 = !DILocation(line: 23, column: 9, scope: !98)
!100 = !DILocation(line: 27, column: 18, scope: !14)
!101 = !DILocation(line: 27, column: 16, scope: !14)
!102 = !DILocation(line: 28, column: 9, scope: !103)
!103 = distinct !DILexicalBlock(scope: !14, file: !1, line: 28, column: 9)
!104 = !DILocation(line: 28, column: 20, scope: !103)
!105 = !DILocation(line: 28, column: 9, scope: !14)
!106 = !DILocation(line: 29, column: 9, scope: !107)
!107 = distinct !DILexicalBlock(scope: !103, file: !1, line: 28, column: 29)
!108 = !DILocation(line: 30, column: 16, scope: !107)
!109 = !DILocation(line: 30, column: 9, scope: !107)
!110 = !DILocation(line: 31, column: 9, scope: !107)
!111 = !DILocalVariable(name: "ch", scope: !14, file: !1, line: 35, type: !5)
!112 = !DILocation(line: 35, column: 10, scope: !14)
!113 = !DILocation(line: 35, column: 20, scope: !14)
!114 = !DILocation(line: 35, column: 15, scope: !14)
!115 = !DILocation(line: 36, column: 9, scope: !116)
!116 = distinct !DILexicalBlock(scope: !14, file: !1, line: 36, column: 9)
!117 = !DILocation(line: 36, column: 12, scope: !116)
!118 = !DILocation(line: 36, column: 9, scope: !14)
!119 = !DILocation(line: 37, column: 17, scope: !120)
!120 = distinct !DILexicalBlock(scope: !116, file: !1, line: 36, column: 20)
!121 = !DILocation(line: 37, column: 9, scope: !120)
!122 = !DILocation(line: 38, column: 5, scope: !120)
!123 = !DILocation(line: 39, column: 17, scope: !124)
!124 = distinct !DILexicalBlock(scope: !116, file: !1, line: 38, column: 12)
!125 = !DILocation(line: 39, column: 54, scope: !124)
!126 = !DILocation(line: 39, column: 9, scope: !124)
!127 = !DILocation(line: 43, column: 11, scope: !14)
!128 = !DILocation(line: 43, column: 5, scope: !14)
!129 = !DILocalVariable(name: "fileSize", scope: !14, file: !1, line: 44, type: !55)
!130 = !DILocation(line: 44, column: 10, scope: !14)
!131 = !DILocation(line: 44, column: 27, scope: !14)
!132 = !DILocation(line: 44, column: 21, scope: !14)
!133 = !DILocation(line: 45, column: 11, scope: !14)
!134 = !DILocation(line: 45, column: 5, scope: !14)
!135 = !DILocation(line: 48, column: 9, scope: !136)
!136 = distinct !DILexicalBlock(scope: !14, file: !1, line: 48, column: 9)
!137 = !DILocation(line: 48, column: 18, scope: !136)
!138 = !DILocation(line: 48, column: 9, scope: !14)
!139 = !DILocalVariable(name: "fileContent", scope: !140, file: !1, line: 49, type: !4)
!140 = distinct !DILexicalBlock(scope: !136, file: !1, line: 48, column: 23)
!141 = !DILocation(line: 49, column: 15, scope: !140)
!142 = !DILocation(line: 49, column: 43, scope: !140)
!143 = !DILocation(line: 49, column: 52, scope: !140)
!144 = !DILocation(line: 49, column: 36, scope: !140)
!145 = !DILocalVariable(name: "bytesRead", scope: !140, file: !1, line: 50, type: !78)
!146 = !DILocation(line: 50, column: 16, scope: !140)
!147 = !DILocation(line: 50, column: 34, scope: !140)
!148 = !DILocation(line: 50, column: 61, scope: !140)
!149 = !DILocation(line: 50, column: 71, scope: !140)
!150 = !DILocation(line: 50, column: 28, scope: !140)
!151 = !DILocation(line: 51, column: 9, scope: !140)
!152 = !DILocation(line: 51, column: 21, scope: !140)
!153 = !DILocation(line: 51, column: 32, scope: !140)
!154 = !DILocation(line: 53, column: 50, scope: !140)
!155 = !DILocation(line: 53, column: 60, scope: !140)
!156 = !DILocation(line: 53, column: 9, scope: !140)
!157 = !DILocation(line: 56, column: 16, scope: !140)
!158 = !DILocation(line: 56, column: 44, scope: !140)
!159 = !DILocation(line: 56, column: 9, scope: !140)
!160 = !DILocation(line: 57, column: 16, scope: !140)
!161 = !DILocation(line: 57, column: 43, scope: !140)
!162 = !DILocation(line: 57, column: 54, scope: !140)
!163 = !DILocation(line: 57, column: 9, scope: !140)
!164 = !DILocation(line: 59, column: 14, scope: !140)
!165 = !DILocation(line: 59, column: 9, scope: !140)
!166 = !DILocation(line: 60, column: 5, scope: !140)
!167 = !DILocation(line: 63, column: 5, scope: !14)
!168 = !DILocalVariable(name: "n", scope: !14, file: !1, line: 64, type: !17)
!169 = !DILocation(line: 64, column: 9, scope: !14)
!170 = !DILocation(line: 65, column: 5, scope: !14)
!171 = !DILocalVariable(name: "i", scope: !172, file: !1, line: 68, type: !17)
!172 = distinct !DILexicalBlock(scope: !14, file: !1, line: 68, column: 5)
!173 = !DILocation(line: 68, column: 14, scope: !172)
!174 = !DILocation(line: 68, column: 10, scope: !172)
!175 = !DILocation(line: 68, column: 21, scope: !176)
!176 = distinct !DILexicalBlock(scope: !172, file: !1, line: 68, column: 5)
!177 = !DILocation(line: 68, column: 25, scope: !176)
!178 = !DILocation(line: 68, column: 23, scope: !176)
!179 = !DILocation(line: 68, column: 5, scope: !172)
!180 = !DILocation(line: 69, column: 34, scope: !181)
!181 = distinct !DILexicalBlock(scope: !176, file: !1, line: 68, column: 33)
!182 = !DILocation(line: 69, column: 36, scope: !181)
!183 = !DILocation(line: 69, column: 9, scope: !181)
!184 = !DILocation(line: 70, column: 5, scope: !181)
!185 = !DILocation(line: 68, column: 29, scope: !176)
!186 = !DILocation(line: 68, column: 5, scope: !176)
!187 = distinct !{!187, !179, !188, !189}
!188 = !DILocation(line: 70, column: 5, scope: !172)
!189 = !{!"llvm.loop.mustprogress"}
!190 = !DILocation(line: 73, column: 9, scope: !191)
!191 = distinct !DILexicalBlock(scope: !14, file: !1, line: 73, column: 9)
!192 = !DILocation(line: 73, column: 16, scope: !191)
!193 = !DILocation(line: 73, column: 9, scope: !14)
!194 = !DILocation(line: 74, column: 21, scope: !195)
!195 = distinct !DILexicalBlock(scope: !191, file: !1, line: 73, column: 22)
!196 = !DILocation(line: 74, column: 9, scope: !195)
!197 = !DILocation(line: 75, column: 5, scope: !195)
!198 = !DILocation(line: 75, column: 16, scope: !199)
!199 = distinct !DILexicalBlock(scope: !191, file: !1, line: 75, column: 16)
!200 = !DILocation(line: 75, column: 23, scope: !199)
!201 = !DILocation(line: 75, column: 16, scope: !191)
!202 = !DILocalVariable(name: "a", scope: !203, file: !1, line: 76, type: !17)
!203 = distinct !DILexicalBlock(scope: !199, file: !1, line: 75, column: 29)
!204 = !DILocation(line: 76, column: 13, scope: !203)
!205 = !DILocalVariable(name: "b", scope: !203, file: !1, line: 76, type: !17)
!206 = !DILocation(line: 76, column: 16, scope: !203)
!207 = !DILocation(line: 78, column: 9, scope: !203)
!208 = !DILocation(line: 79, column: 9, scope: !203)
!209 = !DILocalVariable(name: "cmp", scope: !203, file: !1, line: 81, type: !210)
!210 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !211, size: 64)
!211 = !DISubroutineType(types: !212)
!212 = !{!17, !17, !17}
!213 = !DILocation(line: 81, column: 15, scope: !203)
!214 = !DILocation(line: 81, column: 32, scope: !203)
!215 = !DILocation(line: 82, column: 13, scope: !216)
!216 = distinct !DILexicalBlock(scope: !203, file: !1, line: 82, column: 13)
!217 = !DILocation(line: 82, column: 17, scope: !216)
!218 = !DILocation(line: 82, column: 13, scope: !203)
!219 = !DILocalVariable(name: "result", scope: !220, file: !1, line: 83, type: !17)
!220 = distinct !DILexicalBlock(scope: !216, file: !1, line: 82, column: 26)
!221 = !DILocation(line: 83, column: 17, scope: !220)
!222 = !DILocation(line: 83, column: 26, scope: !220)
!223 = !DILocation(line: 83, column: 30, scope: !220)
!224 = !DILocation(line: 83, column: 33, scope: !220)
!225 = !DILocation(line: 84, column: 47, scope: !220)
!226 = !DILocation(line: 84, column: 13, scope: !220)
!227 = !DILocation(line: 85, column: 9, scope: !220)
!228 = !DILocation(line: 86, column: 13, scope: !229)
!229 = distinct !DILexicalBlock(scope: !216, file: !1, line: 85, column: 16)
!230 = !DILocation(line: 88, column: 5, scope: !203)
!231 = !DILocation(line: 89, column: 9, scope: !232)
!232 = distinct !DILexicalBlock(scope: !199, file: !1, line: 88, column: 12)
!233 = !DILocation(line: 93, column: 12, scope: !14)
!234 = !DILocation(line: 93, column: 5, scope: !14)
!235 = !DILocation(line: 94, column: 12, scope: !14)
!236 = !DILocation(line: 94, column: 5, scope: !14)
!237 = !DILocation(line: 95, column: 5, scope: !14)
!238 = !DILocation(line: 96, column: 1, scope: !14)
!239 = distinct !DISubprogram(name: "processData", scope: !1, file: !1, line: 98, type: !240, scopeLine: 98, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!240 = !DISubroutineType(types: !241)
!241 = !{null, !17}
!242 = !DILocalVariable(name: "count", arg: 1, scope: !239, file: !1, line: 98, type: !17)
!243 = !DILocation(line: 98, column: 22, scope: !239)
!244 = !DILocation(line: 99, column: 40, scope: !239)
!245 = !DILocation(line: 99, column: 5, scope: !239)
!246 = !DILocalVariable(name: "i", scope: !247, file: !1, line: 101, type: !17)
!247 = distinct !DILexicalBlock(scope: !239, file: !1, line: 101, column: 5)
!248 = !DILocation(line: 101, column: 14, scope: !247)
!249 = !DILocation(line: 101, column: 10, scope: !247)
!250 = !DILocation(line: 101, column: 21, scope: !251)
!251 = distinct !DILexicalBlock(scope: !247, file: !1, line: 101, column: 5)
!252 = !DILocation(line: 101, column: 25, scope: !251)
!253 = !DILocation(line: 101, column: 23, scope: !251)
!254 = !DILocation(line: 101, column: 5, scope: !247)
!255 = !DILocation(line: 103, column: 5, scope: !256)
!256 = distinct !DILexicalBlock(scope: !251, file: !1, line: 101, column: 37)
!257 = !DILocation(line: 101, column: 33, scope: !251)
!258 = !DILocation(line: 101, column: 5, scope: !251)
!259 = distinct !{!259, !254, !260, !189}
!260 = !DILocation(line: 103, column: 5, scope: !247)
!261 = !DILocation(line: 104, column: 1, scope: !239)
!262 = distinct !DISubprogram(name: "getComparator", scope: !1, file: !1, line: 110, type: !263, scopeLine: 110, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!263 = !DISubroutineType(types: !264)
!264 = !{!210, !5}
!265 = !DILocalVariable(name: "type", arg: 1, scope: !262, file: !1, line: 110, type: !5)
!266 = !DILocation(line: 110, column: 26, scope: !262)
!267 = !DILocation(line: 111, column: 9, scope: !268)
!268 = distinct !DILexicalBlock(scope: !262, file: !1, line: 111, column: 9)
!269 = !DILocation(line: 111, column: 14, scope: !268)
!270 = !DILocation(line: 111, column: 9, scope: !262)
!271 = !DILocation(line: 112, column: 9, scope: !272)
!272 = distinct !DILexicalBlock(scope: !268, file: !1, line: 111, column: 22)
!273 = !DILocation(line: 114, column: 9, scope: !274)
!274 = distinct !DILexicalBlock(scope: !268, file: !1, line: 113, column: 12)
!275 = !DILocation(line: 116, column: 1, scope: !262)
!276 = distinct !DISubprogram(name: "compareInts", scope: !1, file: !1, line: 106, type: !211, scopeLine: 106, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!277 = !DILocalVariable(name: "a", arg: 1, scope: !276, file: !1, line: 106, type: !17)
!278 = !DILocation(line: 106, column: 21, scope: !276)
!279 = !DILocalVariable(name: "b", arg: 2, scope: !276, file: !1, line: 106, type: !17)
!280 = !DILocation(line: 106, column: 28, scope: !276)
!281 = !DILocation(line: 107, column: 12, scope: !276)
!282 = !DILocation(line: 107, column: 16, scope: !276)
!283 = !DILocation(line: 107, column: 14, scope: !276)
!284 = !DILocation(line: 107, column: 5, scope: !276)
