; ModuleID = 'test-files/example2.c'
source_filename = "test-files/example2.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque

@.str = private unnamed_addr constant [36 x i8] c"Command-line argument received: %s\0A\00", align 1
@.str.1 = private unnamed_addr constant [36 x i8] c"No command-line argument provided.\0A\00", align 1
@.str.2 = private unnamed_addr constant [9 x i8] c"TEST_ENV\00", align 1
@.str.3 = private unnamed_addr constant [35 x i8] c"Environment variable TEST_ENV: %s\0A\00", align 1
@.str.4 = private unnamed_addr constant [40 x i8] c"Environment variable TEST_ENV not set.\0A\00", align 1
@.str.5 = private unnamed_addr constant [9 x i8] c"file.txt\00", align 1
@.str.6 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.7 = private unnamed_addr constant [19 x i8] c"Error opening file\00", align 1
@.str.8 = private unnamed_addr constant [16 x i8] c"File contents:\0A\00", align 1
@.str.9 = private unnamed_addr constant [22 x i8] c"Enter an integer id: \00", align 1
@.str.10 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.11 = private unnamed_addr constant [17 x i8] c"You entered: %d\0A\00", align 1
@.str.12 = private unnamed_addr constant [11 x i8] c"output.txt\00", align 1
@.str.13 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@.str.14 = private unnamed_addr constant [17 x i8] c"Writing to file\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 noundef %0, i8** noundef %1) #0 !dbg !12 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i8**, align 8
  %6 = alloca i8*, align 8
  %7 = alloca %struct._IO_FILE*, align 8
  %8 = alloca i8, align 1
  %9 = alloca i32, align 4
  %10 = alloca %struct._IO_FILE*, align 8
  store i32 0, i32* %3, align 4
  store i32 %0, i32* %4, align 4
  call void @llvm.dbg.declare(metadata i32* %4, metadata !20, metadata !DIExpression()), !dbg !21
  store i8** %1, i8*** %5, align 8
  call void @llvm.dbg.declare(metadata i8*** %5, metadata !22, metadata !DIExpression()), !dbg !23
  %11 = load i32, i32* %4, align 4, !dbg !24
  %12 = icmp sgt i32 %11, 1, !dbg !26
  br i1 %12, label %13, label %18, !dbg !27

13:                                               ; preds = %2
  %14 = load i8**, i8*** %5, align 8, !dbg !28
  %15 = getelementptr inbounds i8*, i8** %14, i64 1, !dbg !28
  %16 = load i8*, i8** %15, align 8, !dbg !28
  %17 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str, i64 0, i64 0), i8* noundef %16), !dbg !30
  br label %20, !dbg !31

18:                                               ; preds = %2
  %19 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.1, i64 0, i64 0)), !dbg !32
  br label %20

20:                                               ; preds = %18, %13
  call void @llvm.dbg.declare(metadata i8** %6, metadata !34, metadata !DIExpression()), !dbg !35
  %21 = call i8* @getenv(i8* noundef getelementptr inbounds ([9 x i8], [9 x i8]* @.str.2, i64 0, i64 0)) #4, !dbg !36
  store i8* %21, i8** %6, align 8, !dbg !35
  %22 = load i8*, i8** %6, align 8, !dbg !37
  %23 = icmp ne i8* %22, null, !dbg !37
  br i1 %23, label %24, label %27, !dbg !39

24:                                               ; preds = %20
  %25 = load i8*, i8** %6, align 8, !dbg !40
  %26 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([35 x i8], [35 x i8]* @.str.3, i64 0, i64 0), i8* noundef %25), !dbg !42
  br label %29, !dbg !43

27:                                               ; preds = %20
  %28 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([40 x i8], [40 x i8]* @.str.4, i64 0, i64 0)), !dbg !44
  br label %29

29:                                               ; preds = %27, %24
  call void @llvm.dbg.declare(metadata %struct._IO_FILE** %7, metadata !46, metadata !DIExpression()), !dbg !106
  %30 = call noalias %struct._IO_FILE* @fopen(i8* noundef getelementptr inbounds ([9 x i8], [9 x i8]* @.str.5, i64 0, i64 0), i8* noundef getelementptr inbounds ([2 x i8], [2 x i8]* @.str.6, i64 0, i64 0)), !dbg !107
  store %struct._IO_FILE* %30, %struct._IO_FILE** %7, align 8, !dbg !106
  %31 = load %struct._IO_FILE*, %struct._IO_FILE** %7, align 8, !dbg !108
  %32 = icmp eq %struct._IO_FILE* %31, null, !dbg !110
  br i1 %32, label %33, label %34, !dbg !111

33:                                               ; preds = %29
  call void @perror(i8* noundef getelementptr inbounds ([19 x i8], [19 x i8]* @.str.7, i64 0, i64 0)), !dbg !112
  store i32 1, i32* %3, align 4, !dbg !114
  br label %62, !dbg !114

34:                                               ; preds = %29
  call void @llvm.dbg.declare(metadata i8* %8, metadata !115, metadata !DIExpression()), !dbg !116
  %35 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.8, i64 0, i64 0)), !dbg !117
  br label %36, !dbg !118

36:                                               ; preds = %42, %34
  %37 = load %struct._IO_FILE*, %struct._IO_FILE** %7, align 8, !dbg !119
  %38 = call i32 @getc(%struct._IO_FILE* noundef %37), !dbg !120
  %39 = trunc i32 %38 to i8, !dbg !120
  store i8 %39, i8* %8, align 1, !dbg !121
  %40 = sext i8 %39 to i32, !dbg !122
  %41 = icmp ne i32 %40, -1, !dbg !123
  br i1 %41, label %42, label %46, !dbg !118

42:                                               ; preds = %36
  %43 = load i8, i8* %8, align 1, !dbg !124
  %44 = sext i8 %43 to i32, !dbg !124
  %45 = call i32 @putchar(i32 noundef %44), !dbg !126
  br label %36, !dbg !118, !llvm.loop !127

46:                                               ; preds = %36
  %47 = load %struct._IO_FILE*, %struct._IO_FILE** %7, align 8, !dbg !130
  %48 = call i32 @fclose(%struct._IO_FILE* noundef %47), !dbg !131
  call void @llvm.dbg.declare(metadata i32* %9, metadata !132, metadata !DIExpression()), !dbg !133
  %49 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([22 x i8], [22 x i8]* @.str.9, i64 0, i64 0)), !dbg !134
  %50 = call i32 (i8*, ...) @__isoc99_scanf(i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str.10, i64 0, i64 0), i32* noundef %9), !dbg !135
  %51 = load i32, i32* %9, align 4, !dbg !136
  %52 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.11, i64 0, i64 0), i32 noundef %51), !dbg !137
  call void @llvm.dbg.declare(metadata %struct._IO_FILE** %10, metadata !138, metadata !DIExpression()), !dbg !139
  %53 = call noalias %struct._IO_FILE* @fopen(i8* noundef getelementptr inbounds ([11 x i8], [11 x i8]* @.str.12, i64 0, i64 0), i8* noundef getelementptr inbounds ([2 x i8], [2 x i8]* @.str.13, i64 0, i64 0)), !dbg !140
  store %struct._IO_FILE* %53, %struct._IO_FILE** %10, align 8, !dbg !139
  %54 = load %struct._IO_FILE*, %struct._IO_FILE** %10, align 8, !dbg !141
  %55 = icmp ne %struct._IO_FILE* %54, null, !dbg !141
  br i1 %55, label %56, label %61, !dbg !143

56:                                               ; preds = %46
  %57 = load %struct._IO_FILE*, %struct._IO_FILE** %10, align 8, !dbg !144
  %58 = call i64 @fwrite(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.14, i64 0, i64 0), i64 noundef 1, i64 noundef 16, %struct._IO_FILE* noundef %57), !dbg !146
  %59 = load %struct._IO_FILE*, %struct._IO_FILE** %10, align 8, !dbg !147
  %60 = call i32 @fclose(%struct._IO_FILE* noundef %59), !dbg !148
  br label %61, !dbg !149

61:                                               ; preds = %56, %46
  store i32 0, i32* %3, align 4, !dbg !150
  br label %62, !dbg !150

62:                                               ; preds = %61, %33
  %63 = load i32, i32* %3, align 4, !dbg !151
  ret i32 %63, !dbg !151
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @printf(i8* noundef, ...) #2

; Function Attrs: nounwind
declare i8* @getenv(i8* noundef) #3

declare noalias %struct._IO_FILE* @fopen(i8* noundef, i8* noundef) #2

declare void @perror(i8* noundef) #2

declare i32 @getc(%struct._IO_FILE* noundef) #2

declare i32 @putchar(i32 noundef) #2

declare i32 @fclose(%struct._IO_FILE* noundef) #2

declare i32 @__isoc99_scanf(i8* noundef, ...) #2

declare i64 @fwrite(i8* noundef, i64 noundef, i64 noundef, %struct._IO_FILE* noundef) #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!4, !5, !6, !7, !8, !9, !10}
!llvm.ident = !{!11}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Ubuntu clang version 14.0.0-1ubuntu1.1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "test-files/example2.c", directory: "/home/mhpatel4/repos/llvm-project", checksumkind: CSK_MD5, checksum: "5f17983376d0e85922675e3ce22b12f0")
!2 = !{!3}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!4 = !{i32 7, !"Dwarf Version", i32 5}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"PIE Level", i32 2}
!9 = !{i32 7, !"uwtable", i32 1}
!10 = !{i32 7, !"frame-pointer", i32 2}
!11 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
!12 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 4, type: !13, scopeLine: 4, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !19)
!13 = !DISubroutineType(types: !14)
!14 = !{!15, !15, !16}
!15 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!19 = !{}
!20 = !DILocalVariable(name: "argc", arg: 1, scope: !12, file: !1, line: 4, type: !15)
!21 = !DILocation(line: 4, column: 14, scope: !12)
!22 = !DILocalVariable(name: "argv", arg: 2, scope: !12, file: !1, line: 4, type: !16)
!23 = !DILocation(line: 4, column: 26, scope: !12)
!24 = !DILocation(line: 6, column: 9, scope: !25)
!25 = distinct !DILexicalBlock(scope: !12, file: !1, line: 6, column: 9)
!26 = !DILocation(line: 6, column: 14, scope: !25)
!27 = !DILocation(line: 6, column: 9, scope: !12)
!28 = !DILocation(line: 7, column: 56, scope: !29)
!29 = distinct !DILexicalBlock(scope: !25, file: !1, line: 6, column: 19)
!30 = !DILocation(line: 7, column: 9, scope: !29)
!31 = !DILocation(line: 8, column: 5, scope: !29)
!32 = !DILocation(line: 9, column: 9, scope: !33)
!33 = distinct !DILexicalBlock(scope: !25, file: !1, line: 8, column: 12)
!34 = !DILocalVariable(name: "env_var", scope: !12, file: !1, line: 13, type: !17)
!35 = !DILocation(line: 13, column: 11, scope: !12)
!36 = !DILocation(line: 13, column: 21, scope: !12)
!37 = !DILocation(line: 14, column: 9, scope: !38)
!38 = distinct !DILexicalBlock(scope: !12, file: !1, line: 14, column: 9)
!39 = !DILocation(line: 14, column: 9, scope: !12)
!40 = !DILocation(line: 15, column: 55, scope: !41)
!41 = distinct !DILexicalBlock(scope: !38, file: !1, line: 14, column: 18)
!42 = !DILocation(line: 15, column: 9, scope: !41)
!43 = !DILocation(line: 16, column: 5, scope: !41)
!44 = !DILocation(line: 17, column: 9, scope: !45)
!45 = distinct !DILexicalBlock(scope: !38, file: !1, line: 16, column: 12)
!46 = !DILocalVariable(name: "fp", scope: !12, file: !1, line: 21, type: !47)
!47 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !48, size: 64)
!48 = !DIDerivedType(tag: DW_TAG_typedef, name: "FILE", file: !49, line: 7, baseType: !50)
!49 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/FILE.h", directory: "", checksumkind: CSK_MD5, checksum: "571f9fb6223c42439075fdde11a0de5d")
!50 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_FILE", file: !51, line: 49, size: 1728, elements: !52)
!51 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/struct_FILE.h", directory: "", checksumkind: CSK_MD5, checksum: "1bad07471b7974df4ecc1d1c2ca207e6")
!52 = !{!53, !54, !55, !56, !57, !58, !59, !60, !61, !62, !63, !64, !65, !68, !70, !71, !72, !76, !78, !80, !84, !87, !89, !92, !95, !96, !97, !101, !102}
!53 = !DIDerivedType(tag: DW_TAG_member, name: "_flags", scope: !50, file: !51, line: 51, baseType: !15, size: 32)
!54 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_ptr", scope: !50, file: !51, line: 54, baseType: !17, size: 64, offset: 64)
!55 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_end", scope: !50, file: !51, line: 55, baseType: !17, size: 64, offset: 128)
!56 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_base", scope: !50, file: !51, line: 56, baseType: !17, size: 64, offset: 192)
!57 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_base", scope: !50, file: !51, line: 57, baseType: !17, size: 64, offset: 256)
!58 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_ptr", scope: !50, file: !51, line: 58, baseType: !17, size: 64, offset: 320)
!59 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_end", scope: !50, file: !51, line: 59, baseType: !17, size: 64, offset: 384)
!60 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_buf_base", scope: !50, file: !51, line: 60, baseType: !17, size: 64, offset: 448)
!61 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_buf_end", scope: !50, file: !51, line: 61, baseType: !17, size: 64, offset: 512)
!62 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_save_base", scope: !50, file: !51, line: 64, baseType: !17, size: 64, offset: 576)
!63 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_backup_base", scope: !50, file: !51, line: 65, baseType: !17, size: 64, offset: 640)
!64 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_save_end", scope: !50, file: !51, line: 66, baseType: !17, size: 64, offset: 704)
!65 = !DIDerivedType(tag: DW_TAG_member, name: "_markers", scope: !50, file: !51, line: 68, baseType: !66, size: 64, offset: 768)
!66 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !67, size: 64)
!67 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_marker", file: !51, line: 36, flags: DIFlagFwdDecl)
!68 = !DIDerivedType(tag: DW_TAG_member, name: "_chain", scope: !50, file: !51, line: 70, baseType: !69, size: 64, offset: 832)
!69 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !50, size: 64)
!70 = !DIDerivedType(tag: DW_TAG_member, name: "_fileno", scope: !50, file: !51, line: 72, baseType: !15, size: 32, offset: 896)
!71 = !DIDerivedType(tag: DW_TAG_member, name: "_flags2", scope: !50, file: !51, line: 73, baseType: !15, size: 32, offset: 928)
!72 = !DIDerivedType(tag: DW_TAG_member, name: "_old_offset", scope: !50, file: !51, line: 74, baseType: !73, size: 64, offset: 960)
!73 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off_t", file: !74, line: 152, baseType: !75)
!74 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "", checksumkind: CSK_MD5, checksum: "d108b5f93a74c50510d7d9bc0ab36df9")
!75 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!76 = !DIDerivedType(tag: DW_TAG_member, name: "_cur_column", scope: !50, file: !51, line: 77, baseType: !77, size: 16, offset: 1024)
!77 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!78 = !DIDerivedType(tag: DW_TAG_member, name: "_vtable_offset", scope: !50, file: !51, line: 78, baseType: !79, size: 8, offset: 1040)
!79 = !DIBasicType(name: "signed char", size: 8, encoding: DW_ATE_signed_char)
!80 = !DIDerivedType(tag: DW_TAG_member, name: "_shortbuf", scope: !50, file: !51, line: 79, baseType: !81, size: 8, offset: 1048)
!81 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 8, elements: !82)
!82 = !{!83}
!83 = !DISubrange(count: 1)
!84 = !DIDerivedType(tag: DW_TAG_member, name: "_lock", scope: !50, file: !51, line: 81, baseType: !85, size: 64, offset: 1088)
!85 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !86, size: 64)
!86 = !DIDerivedType(tag: DW_TAG_typedef, name: "_IO_lock_t", file: !51, line: 43, baseType: null)
!87 = !DIDerivedType(tag: DW_TAG_member, name: "_offset", scope: !50, file: !51, line: 89, baseType: !88, size: 64, offset: 1152)
!88 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off64_t", file: !74, line: 153, baseType: !75)
!89 = !DIDerivedType(tag: DW_TAG_member, name: "_codecvt", scope: !50, file: !51, line: 91, baseType: !90, size: 64, offset: 1216)
!90 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !91, size: 64)
!91 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_codecvt", file: !51, line: 37, flags: DIFlagFwdDecl)
!92 = !DIDerivedType(tag: DW_TAG_member, name: "_wide_data", scope: !50, file: !51, line: 92, baseType: !93, size: 64, offset: 1280)
!93 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !94, size: 64)
!94 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_wide_data", file: !51, line: 38, flags: DIFlagFwdDecl)
!95 = !DIDerivedType(tag: DW_TAG_member, name: "_freeres_list", scope: !50, file: !51, line: 93, baseType: !69, size: 64, offset: 1344)
!96 = !DIDerivedType(tag: DW_TAG_member, name: "_freeres_buf", scope: !50, file: !51, line: 94, baseType: !3, size: 64, offset: 1408)
!97 = !DIDerivedType(tag: DW_TAG_member, name: "__pad5", scope: !50, file: !51, line: 95, baseType: !98, size: 64, offset: 1472)
!98 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !99, line: 46, baseType: !100)
!99 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!100 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!101 = !DIDerivedType(tag: DW_TAG_member, name: "_mode", scope: !50, file: !51, line: 96, baseType: !15, size: 32, offset: 1536)
!102 = !DIDerivedType(tag: DW_TAG_member, name: "_unused2", scope: !50, file: !51, line: 98, baseType: !103, size: 160, offset: 1568)
!103 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 160, elements: !104)
!104 = !{!105}
!105 = !DISubrange(count: 20)
!106 = !DILocation(line: 21, column: 11, scope: !12)
!107 = !DILocation(line: 21, column: 16, scope: !12)
!108 = !DILocation(line: 22, column: 9, scope: !109)
!109 = distinct !DILexicalBlock(scope: !12, file: !1, line: 22, column: 9)
!110 = !DILocation(line: 22, column: 12, scope: !109)
!111 = !DILocation(line: 22, column: 9, scope: !12)
!112 = !DILocation(line: 23, column: 9, scope: !113)
!113 = distinct !DILexicalBlock(scope: !109, file: !1, line: 22, column: 21)
!114 = !DILocation(line: 24, column: 9, scope: !113)
!115 = !DILocalVariable(name: "c", scope: !12, file: !1, line: 27, type: !18)
!116 = !DILocation(line: 27, column: 10, scope: !12)
!117 = !DILocation(line: 28, column: 5, scope: !12)
!118 = !DILocation(line: 29, column: 5, scope: !12)
!119 = !DILocation(line: 29, column: 22, scope: !12)
!120 = !DILocation(line: 29, column: 17, scope: !12)
!121 = !DILocation(line: 29, column: 15, scope: !12)
!122 = !DILocation(line: 29, column: 12, scope: !12)
!123 = !DILocation(line: 29, column: 27, scope: !12)
!124 = !DILocation(line: 30, column: 17, scope: !125)
!125 = distinct !DILexicalBlock(scope: !12, file: !1, line: 29, column: 35)
!126 = !DILocation(line: 30, column: 9, scope: !125)
!127 = distinct !{!127, !118, !128, !129}
!128 = !DILocation(line: 31, column: 5, scope: !12)
!129 = !{!"llvm.loop.mustprogress"}
!130 = !DILocation(line: 32, column: 12, scope: !12)
!131 = !DILocation(line: 32, column: 5, scope: !12)
!132 = !DILocalVariable(name: "id", scope: !12, file: !1, line: 35, type: !15)
!133 = !DILocation(line: 35, column: 9, scope: !12)
!134 = !DILocation(line: 36, column: 5, scope: !12)
!135 = !DILocation(line: 37, column: 5, scope: !12)
!136 = !DILocation(line: 38, column: 33, scope: !12)
!137 = !DILocation(line: 38, column: 5, scope: !12)
!138 = !DILocalVariable(name: "write_fp", scope: !12, file: !1, line: 41, type: !47)
!139 = !DILocation(line: 41, column: 11, scope: !12)
!140 = !DILocation(line: 41, column: 22, scope: !12)
!141 = !DILocation(line: 42, column: 9, scope: !142)
!142 = distinct !DILexicalBlock(scope: !12, file: !1, line: 42, column: 9)
!143 = !DILocation(line: 42, column: 9, scope: !12)
!144 = !DILocation(line: 43, column: 44, scope: !145)
!145 = distinct !DILexicalBlock(scope: !142, file: !1, line: 42, column: 19)
!146 = !DILocation(line: 43, column: 9, scope: !145)
!147 = !DILocation(line: 44, column: 16, scope: !145)
!148 = !DILocation(line: 44, column: 9, scope: !145)
!149 = !DILocation(line: 45, column: 5, scope: !145)
!150 = !DILocation(line: 47, column: 5, scope: !12)
!151 = !DILocation(line: 48, column: 1, scope: !12)
