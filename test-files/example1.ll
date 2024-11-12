; ModuleID = 'test-files/example1.c'
source_filename = "test-files/example1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque

@.str = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@.str.1 = private unnamed_addr constant [9 x i8] c"file.txt\00", align 1
@.str.2 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.3 = private unnamed_addr constant [19 x i8] c"Error opening file\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @printContent(i8* noundef %0) #0 !dbg !12 {
  %2 = alloca i8*, align 8
  store i8* %0, i8** %2, align 8
  call void @llvm.dbg.declare(metadata i8** %2, metadata !19, metadata !DIExpression()), !dbg !20
  %3 = load i8*, i8** %2, align 8, !dbg !21
  %4 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i8* noundef %3), !dbg !22
  ret void, !dbg !23
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @printf(i8* noundef, ...) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !24 {
  %1 = alloca i32, align 4
  %2 = alloca [1000 x i8], align 16
  %3 = alloca %struct._IO_FILE*, align 8
  %4 = alloca i8, align 1
  %5 = alloca i32, align 4
  %6 = alloca void (i8*)*, align 8
  store i32 0, i32* %1, align 4
  call void @llvm.dbg.declare(metadata [1000 x i8]* %2, metadata !28, metadata !DIExpression()), !dbg !32
  call void @llvm.dbg.declare(metadata %struct._IO_FILE** %3, metadata !33, metadata !DIExpression()), !dbg !94
  %7 = call noalias %struct._IO_FILE* @fopen(i8* noundef getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i64 0, i64 0), i8* noundef getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i64 0, i64 0)), !dbg !95
  store %struct._IO_FILE* %7, %struct._IO_FILE** %3, align 8, !dbg !94
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8, !dbg !96
  %9 = icmp eq %struct._IO_FILE* %8, null, !dbg !98
  br i1 %9, label %10, label %11, !dbg !99

10:                                               ; preds = %0
  call void @perror(i8* noundef getelementptr inbounds ([19 x i8], [19 x i8]* @.str.3, i64 0, i64 0)), !dbg !100
  store i32 1, i32* %1, align 4, !dbg !102
  br label %37, !dbg !102

11:                                               ; preds = %0
  call void @llvm.dbg.declare(metadata i8* %4, metadata !103, metadata !DIExpression()), !dbg !104
  call void @llvm.dbg.declare(metadata i32* %5, metadata !105, metadata !DIExpression()), !dbg !106
  store i32 0, i32* %5, align 4, !dbg !106
  br label %12, !dbg !107

12:                                               ; preds = %23, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8, !dbg !108
  %14 = call i32 @getc(%struct._IO_FILE* noundef %13), !dbg !109
  %15 = trunc i32 %14 to i8, !dbg !109
  store i8 %15, i8* %4, align 1, !dbg !110
  %16 = sext i8 %15 to i32, !dbg !111
  %17 = icmp ne i32 %16, -1, !dbg !112
  br i1 %17, label %18, label %21, !dbg !113

18:                                               ; preds = %12
  %19 = load i32, i32* %5, align 4, !dbg !114
  %20 = icmp slt i32 %19, 1000, !dbg !115
  br label %21

21:                                               ; preds = %18, %12
  %22 = phi i1 [ false, %12 ], [ %20, %18 ], !dbg !116
  br i1 %22, label %23, label %29, !dbg !107

23:                                               ; preds = %21
  %24 = load i8, i8* %4, align 1, !dbg !117
  %25 = load i32, i32* %5, align 4, !dbg !119
  %26 = add nsw i32 %25, 1, !dbg !119
  store i32 %26, i32* %5, align 4, !dbg !119
  %27 = sext i32 %25 to i64, !dbg !120
  %28 = getelementptr inbounds [1000 x i8], [1000 x i8]* %2, i64 0, i64 %27, !dbg !120
  store i8 %24, i8* %28, align 1, !dbg !121
  br label %12, !dbg !107, !llvm.loop !122

29:                                               ; preds = %21
  %30 = load i32, i32* %5, align 4, !dbg !125
  %31 = sext i32 %30 to i64, !dbg !126
  %32 = getelementptr inbounds [1000 x i8], [1000 x i8]* %2, i64 0, i64 %31, !dbg !126
  store i8 0, i8* %32, align 1, !dbg !127
  %33 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8, !dbg !128
  %34 = call i32 @fclose(%struct._IO_FILE* noundef %33), !dbg !129
  call void @llvm.dbg.declare(metadata void (i8*)** %6, metadata !130, metadata !DIExpression()), !dbg !132
  store void (i8*)* @printContent, void (i8*)** %6, align 8, !dbg !132
  %35 = load void (i8*)*, void (i8*)** %6, align 8, !dbg !133
  %36 = getelementptr inbounds [1000 x i8], [1000 x i8]* %2, i64 0, i64 0, !dbg !134
  call void %35(i8* noundef %36), !dbg !133
  store i32 0, i32* %1, align 4, !dbg !135
  br label %37, !dbg !135

37:                                               ; preds = %29, %10
  %38 = load i32, i32* %1, align 4, !dbg !136
  ret i32 %38, !dbg !136
}

declare noalias %struct._IO_FILE* @fopen(i8* noundef, i8* noundef) #2

declare void @perror(i8* noundef) #2

declare i32 @getc(%struct._IO_FILE* noundef) #2

declare i32 @fclose(%struct._IO_FILE* noundef) #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!4, !5, !6, !7, !8, !9, !10}
!llvm.ident = !{!11}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Ubuntu clang version 14.0.0-1ubuntu1.1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "test-files/example1.c", directory: "/home/mhpatel4/repos/llvm-project", checksumkind: CSK_MD5, checksum: "8e99677d8a8cb5ba364151ba267a3099")
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
!12 = distinct !DISubprogram(name: "printContent", scope: !1, file: !1, line: 3, type: !13, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!13 = !DISubroutineType(types: !14)
!14 = !{null, !15}
!15 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!16 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !17)
!17 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!18 = !{}
!19 = !DILocalVariable(name: "content", arg: 1, scope: !12, file: !1, line: 3, type: !15)
!20 = !DILocation(line: 3, column: 31, scope: !12)
!21 = !DILocation(line: 4, column: 20, scope: !12)
!22 = !DILocation(line: 4, column: 5, scope: !12)
!23 = !DILocation(line: 5, column: 1, scope: !12)
!24 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 7, type: !25, scopeLine: 7, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!25 = !DISubroutineType(types: !26)
!26 = !{!27}
!27 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!28 = !DILocalVariable(name: "str1", scope: !24, file: !1, line: 8, type: !29)
!29 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 8000, elements: !30)
!30 = !{!31}
!31 = !DISubrange(count: 1000)
!32 = !DILocation(line: 8, column: 10, scope: !24)
!33 = !DILocalVariable(name: "fp", scope: !24, file: !1, line: 9, type: !34)
!34 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !35, size: 64)
!35 = !DIDerivedType(tag: DW_TAG_typedef, name: "FILE", file: !36, line: 7, baseType: !37)
!36 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/FILE.h", directory: "", checksumkind: CSK_MD5, checksum: "571f9fb6223c42439075fdde11a0de5d")
!37 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_FILE", file: !38, line: 49, size: 1728, elements: !39)
!38 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/struct_FILE.h", directory: "", checksumkind: CSK_MD5, checksum: "1bad07471b7974df4ecc1d1c2ca207e6")
!39 = !{!40, !41, !43, !44, !45, !46, !47, !48, !49, !50, !51, !52, !53, !56, !58, !59, !60, !64, !66, !68, !72, !75, !77, !80, !83, !84, !85, !89, !90}
!40 = !DIDerivedType(tag: DW_TAG_member, name: "_flags", scope: !37, file: !38, line: 51, baseType: !27, size: 32)
!41 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_ptr", scope: !37, file: !38, line: 54, baseType: !42, size: 64, offset: 64)
!42 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!43 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_end", scope: !37, file: !38, line: 55, baseType: !42, size: 64, offset: 128)
!44 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_base", scope: !37, file: !38, line: 56, baseType: !42, size: 64, offset: 192)
!45 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_base", scope: !37, file: !38, line: 57, baseType: !42, size: 64, offset: 256)
!46 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_ptr", scope: !37, file: !38, line: 58, baseType: !42, size: 64, offset: 320)
!47 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_end", scope: !37, file: !38, line: 59, baseType: !42, size: 64, offset: 384)
!48 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_buf_base", scope: !37, file: !38, line: 60, baseType: !42, size: 64, offset: 448)
!49 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_buf_end", scope: !37, file: !38, line: 61, baseType: !42, size: 64, offset: 512)
!50 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_save_base", scope: !37, file: !38, line: 64, baseType: !42, size: 64, offset: 576)
!51 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_backup_base", scope: !37, file: !38, line: 65, baseType: !42, size: 64, offset: 640)
!52 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_save_end", scope: !37, file: !38, line: 66, baseType: !42, size: 64, offset: 704)
!53 = !DIDerivedType(tag: DW_TAG_member, name: "_markers", scope: !37, file: !38, line: 68, baseType: !54, size: 64, offset: 768)
!54 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !55, size: 64)
!55 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_marker", file: !38, line: 36, flags: DIFlagFwdDecl)
!56 = !DIDerivedType(tag: DW_TAG_member, name: "_chain", scope: !37, file: !38, line: 70, baseType: !57, size: 64, offset: 832)
!57 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !37, size: 64)
!58 = !DIDerivedType(tag: DW_TAG_member, name: "_fileno", scope: !37, file: !38, line: 72, baseType: !27, size: 32, offset: 896)
!59 = !DIDerivedType(tag: DW_TAG_member, name: "_flags2", scope: !37, file: !38, line: 73, baseType: !27, size: 32, offset: 928)
!60 = !DIDerivedType(tag: DW_TAG_member, name: "_old_offset", scope: !37, file: !38, line: 74, baseType: !61, size: 64, offset: 960)
!61 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off_t", file: !62, line: 152, baseType: !63)
!62 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "", checksumkind: CSK_MD5, checksum: "d108b5f93a74c50510d7d9bc0ab36df9")
!63 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!64 = !DIDerivedType(tag: DW_TAG_member, name: "_cur_column", scope: !37, file: !38, line: 77, baseType: !65, size: 16, offset: 1024)
!65 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!66 = !DIDerivedType(tag: DW_TAG_member, name: "_vtable_offset", scope: !37, file: !38, line: 78, baseType: !67, size: 8, offset: 1040)
!67 = !DIBasicType(name: "signed char", size: 8, encoding: DW_ATE_signed_char)
!68 = !DIDerivedType(tag: DW_TAG_member, name: "_shortbuf", scope: !37, file: !38, line: 79, baseType: !69, size: 8, offset: 1048)
!69 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 8, elements: !70)
!70 = !{!71}
!71 = !DISubrange(count: 1)
!72 = !DIDerivedType(tag: DW_TAG_member, name: "_lock", scope: !37, file: !38, line: 81, baseType: !73, size: 64, offset: 1088)
!73 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !74, size: 64)
!74 = !DIDerivedType(tag: DW_TAG_typedef, name: "_IO_lock_t", file: !38, line: 43, baseType: null)
!75 = !DIDerivedType(tag: DW_TAG_member, name: "_offset", scope: !37, file: !38, line: 89, baseType: !76, size: 64, offset: 1152)
!76 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off64_t", file: !62, line: 153, baseType: !63)
!77 = !DIDerivedType(tag: DW_TAG_member, name: "_codecvt", scope: !37, file: !38, line: 91, baseType: !78, size: 64, offset: 1216)
!78 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !79, size: 64)
!79 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_codecvt", file: !38, line: 37, flags: DIFlagFwdDecl)
!80 = !DIDerivedType(tag: DW_TAG_member, name: "_wide_data", scope: !37, file: !38, line: 92, baseType: !81, size: 64, offset: 1280)
!81 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !82, size: 64)
!82 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_wide_data", file: !38, line: 38, flags: DIFlagFwdDecl)
!83 = !DIDerivedType(tag: DW_TAG_member, name: "_freeres_list", scope: !37, file: !38, line: 93, baseType: !57, size: 64, offset: 1344)
!84 = !DIDerivedType(tag: DW_TAG_member, name: "_freeres_buf", scope: !37, file: !38, line: 94, baseType: !3, size: 64, offset: 1408)
!85 = !DIDerivedType(tag: DW_TAG_member, name: "__pad5", scope: !37, file: !38, line: 95, baseType: !86, size: 64, offset: 1472)
!86 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !87, line: 46, baseType: !88)
!87 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!88 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!89 = !DIDerivedType(tag: DW_TAG_member, name: "_mode", scope: !37, file: !38, line: 96, baseType: !27, size: 32, offset: 1536)
!90 = !DIDerivedType(tag: DW_TAG_member, name: "_unused2", scope: !37, file: !38, line: 98, baseType: !91, size: 160, offset: 1568)
!91 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 160, elements: !92)
!92 = !{!93}
!93 = !DISubrange(count: 20)
!94 = !DILocation(line: 9, column: 11, scope: !24)
!95 = !DILocation(line: 9, column: 16, scope: !24)
!96 = !DILocation(line: 10, column: 9, scope: !97)
!97 = distinct !DILexicalBlock(scope: !24, file: !1, line: 10, column: 9)
!98 = !DILocation(line: 10, column: 12, scope: !97)
!99 = !DILocation(line: 10, column: 9, scope: !24)
!100 = !DILocation(line: 11, column: 9, scope: !101)
!101 = distinct !DILexicalBlock(scope: !97, file: !1, line: 10, column: 21)
!102 = !DILocation(line: 12, column: 9, scope: !101)
!103 = !DILocalVariable(name: "c", scope: !24, file: !1, line: 15, type: !17)
!104 = !DILocation(line: 15, column: 10, scope: !24)
!105 = !DILocalVariable(name: "len", scope: !24, file: !1, line: 16, type: !27)
!106 = !DILocation(line: 16, column: 9, scope: !24)
!107 = !DILocation(line: 19, column: 5, scope: !24)
!108 = !DILocation(line: 19, column: 22, scope: !24)
!109 = !DILocation(line: 19, column: 17, scope: !24)
!110 = !DILocation(line: 19, column: 15, scope: !24)
!111 = !DILocation(line: 19, column: 12, scope: !24)
!112 = !DILocation(line: 19, column: 27, scope: !24)
!113 = !DILocation(line: 19, column: 34, scope: !24)
!114 = !DILocation(line: 19, column: 37, scope: !24)
!115 = !DILocation(line: 19, column: 41, scope: !24)
!116 = !DILocation(line: 0, scope: !24)
!117 = !DILocation(line: 20, column: 23, scope: !118)
!118 = distinct !DILexicalBlock(scope: !24, file: !1, line: 19, column: 49)
!119 = !DILocation(line: 20, column: 17, scope: !118)
!120 = !DILocation(line: 20, column: 9, scope: !118)
!121 = !DILocation(line: 20, column: 21, scope: !118)
!122 = distinct !{!122, !107, !123, !124}
!123 = !DILocation(line: 21, column: 5, scope: !24)
!124 = !{!"llvm.loop.mustprogress"}
!125 = !DILocation(line: 22, column: 10, scope: !24)
!126 = !DILocation(line: 22, column: 5, scope: !24)
!127 = !DILocation(line: 22, column: 15, scope: !24)
!128 = !DILocation(line: 24, column: 12, scope: !24)
!129 = !DILocation(line: 24, column: 5, scope: !24)
!130 = !DILocalVariable(name: "printPtr", scope: !24, file: !1, line: 27, type: !131)
!131 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!132 = !DILocation(line: 27, column: 12, scope: !24)
!133 = !DILocation(line: 30, column: 5, scope: !24)
!134 = !DILocation(line: 30, column: 14, scope: !24)
!135 = !DILocation(line: 32, column: 5, scope: !24)
!136 = !DILocation(line: 33, column: 1, scope: !24)
