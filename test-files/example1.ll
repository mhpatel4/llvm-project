; ModuleID = 'test-files/example1.c'
source_filename = "test-files/example1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque

@.str = private unnamed_addr constant [9 x i8] c"file.txt\00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.2 = private unnamed_addr constant [19 x i8] c"Error opening file\00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !12 {
  %1 = alloca i32, align 4
  %2 = alloca [1000 x i8], align 16
  %3 = alloca %struct._IO_FILE*, align 8
  %4 = alloca i8, align 1
  %5 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  call void @llvm.dbg.declare(metadata [1000 x i8]* %2, metadata !17, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata %struct._IO_FILE** %3, metadata !23, metadata !DIExpression()), !dbg !84
  %6 = call noalias %struct._IO_FILE* @fopen(i8* noundef getelementptr inbounds ([9 x i8], [9 x i8]* @.str, i64 0, i64 0), i8* noundef getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i64 0, i64 0)), !dbg !85
  store %struct._IO_FILE* %6, %struct._IO_FILE** %3, align 8, !dbg !84
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8, !dbg !86
  %8 = icmp eq %struct._IO_FILE* %7, null, !dbg !88
  br i1 %8, label %9, label %10, !dbg !89

9:                                                ; preds = %0
  call void @perror(i8* noundef getelementptr inbounds ([19 x i8], [19 x i8]* @.str.2, i64 0, i64 0)), !dbg !90
  store i32 1, i32* %1, align 4, !dbg !92
  br label %37, !dbg !92

10:                                               ; preds = %0
  call void @llvm.dbg.declare(metadata i8* %4, metadata !93, metadata !DIExpression()), !dbg !94
  call void @llvm.dbg.declare(metadata i32* %5, metadata !95, metadata !DIExpression()), !dbg !96
  store i32 0, i32* %5, align 4, !dbg !96
  br label %11, !dbg !97

11:                                               ; preds = %10, %28
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8, !dbg !98
  %13 = call i32 @getc(%struct._IO_FILE* noundef %12), !dbg !100
  %14 = trunc i32 %13 to i8, !dbg !100
  store i8 %14, i8* %4, align 1, !dbg !101
  %15 = load i8, i8* %4, align 1, !dbg !102
  %16 = sext i8 %15 to i32, !dbg !102
  %17 = icmp eq i32 %16, -1, !dbg !104
  br i1 %17, label %18, label %19, !dbg !105

18:                                               ; preds = %11
  br label %29, !dbg !106

19:                                               ; preds = %11
  %20 = load i8, i8* %4, align 1, !dbg !107
  %21 = load i32, i32* %5, align 4, !dbg !108
  %22 = add nsw i32 %21, 1, !dbg !108
  store i32 %22, i32* %5, align 4, !dbg !108
  %23 = sext i32 %21 to i64, !dbg !109
  %24 = getelementptr inbounds [1000 x i8], [1000 x i8]* %2, i64 0, i64 %23, !dbg !109
  store i8 %20, i8* %24, align 1, !dbg !110
  %25 = load i32, i32* %5, align 4, !dbg !111
  %26 = icmp sge i32 %25, 1000, !dbg !113
  br i1 %26, label %27, label %28, !dbg !114

27:                                               ; preds = %19
  br label %29, !dbg !115

28:                                               ; preds = %19
  br label %11, !dbg !97, !llvm.loop !116

29:                                               ; preds = %27, %18
  %30 = load i32, i32* %5, align 4, !dbg !118
  %31 = sext i32 %30 to i64, !dbg !119
  %32 = getelementptr inbounds [1000 x i8], [1000 x i8]* %2, i64 0, i64 %31, !dbg !119
  store i8 0, i8* %32, align 1, !dbg !120
  %33 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8, !dbg !121
  %34 = call i32 @fclose(%struct._IO_FILE* noundef %33), !dbg !122
  %35 = getelementptr inbounds [1000 x i8], [1000 x i8]* %2, i64 0, i64 0, !dbg !123
  %36 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0), i8* noundef %35), !dbg !124
  store i32 0, i32* %1, align 4, !dbg !125
  br label %37, !dbg !125

37:                                               ; preds = %29, %9
  %38 = load i32, i32* %1, align 4, !dbg !126
  ret i32 %38, !dbg !126
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare noalias %struct._IO_FILE* @fopen(i8* noundef, i8* noundef) #2

declare void @perror(i8* noundef) #2

declare i32 @getc(%struct._IO_FILE* noundef) #2

declare i32 @fclose(%struct._IO_FILE* noundef) #2

declare i32 @printf(i8* noundef, ...) #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!4, !5, !6, !7, !8, !9, !10}
!llvm.ident = !{!11}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Ubuntu clang version 14.0.0-1ubuntu1.1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "test-files/example1.c", directory: "/home/mhpatel4/repos/llvm-project", checksumkind: CSK_MD5, checksum: "33a0015fc0f693977553d2f4772a1089")
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
!12 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 3, type: !13, scopeLine: 3, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !16)
!13 = !DISubroutineType(types: !14)
!14 = !{!15}
!15 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!16 = !{}
!17 = !DILocalVariable(name: "str1", scope: !12, file: !1, line: 4, type: !18)
!18 = !DICompositeType(tag: DW_TAG_array_type, baseType: !19, size: 8000, elements: !20)
!19 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!20 = !{!21}
!21 = !DISubrange(count: 1000)
!22 = !DILocation(line: 4, column: 10, scope: !12)
!23 = !DILocalVariable(name: "fp", scope: !12, file: !1, line: 5, type: !24)
!24 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !25, size: 64)
!25 = !DIDerivedType(tag: DW_TAG_typedef, name: "FILE", file: !26, line: 7, baseType: !27)
!26 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/FILE.h", directory: "", checksumkind: CSK_MD5, checksum: "571f9fb6223c42439075fdde11a0de5d")
!27 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_FILE", file: !28, line: 49, size: 1728, elements: !29)
!28 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/struct_FILE.h", directory: "", checksumkind: CSK_MD5, checksum: "1bad07471b7974df4ecc1d1c2ca207e6")
!29 = !{!30, !31, !33, !34, !35, !36, !37, !38, !39, !40, !41, !42, !43, !46, !48, !49, !50, !54, !56, !58, !62, !65, !67, !70, !73, !74, !75, !79, !80}
!30 = !DIDerivedType(tag: DW_TAG_member, name: "_flags", scope: !27, file: !28, line: 51, baseType: !15, size: 32)
!31 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_ptr", scope: !27, file: !28, line: 54, baseType: !32, size: 64, offset: 64)
!32 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !19, size: 64)
!33 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_end", scope: !27, file: !28, line: 55, baseType: !32, size: 64, offset: 128)
!34 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_base", scope: !27, file: !28, line: 56, baseType: !32, size: 64, offset: 192)
!35 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_base", scope: !27, file: !28, line: 57, baseType: !32, size: 64, offset: 256)
!36 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_ptr", scope: !27, file: !28, line: 58, baseType: !32, size: 64, offset: 320)
!37 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_end", scope: !27, file: !28, line: 59, baseType: !32, size: 64, offset: 384)
!38 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_buf_base", scope: !27, file: !28, line: 60, baseType: !32, size: 64, offset: 448)
!39 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_buf_end", scope: !27, file: !28, line: 61, baseType: !32, size: 64, offset: 512)
!40 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_save_base", scope: !27, file: !28, line: 64, baseType: !32, size: 64, offset: 576)
!41 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_backup_base", scope: !27, file: !28, line: 65, baseType: !32, size: 64, offset: 640)
!42 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_save_end", scope: !27, file: !28, line: 66, baseType: !32, size: 64, offset: 704)
!43 = !DIDerivedType(tag: DW_TAG_member, name: "_markers", scope: !27, file: !28, line: 68, baseType: !44, size: 64, offset: 768)
!44 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !45, size: 64)
!45 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_marker", file: !28, line: 36, flags: DIFlagFwdDecl)
!46 = !DIDerivedType(tag: DW_TAG_member, name: "_chain", scope: !27, file: !28, line: 70, baseType: !47, size: 64, offset: 832)
!47 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !27, size: 64)
!48 = !DIDerivedType(tag: DW_TAG_member, name: "_fileno", scope: !27, file: !28, line: 72, baseType: !15, size: 32, offset: 896)
!49 = !DIDerivedType(tag: DW_TAG_member, name: "_flags2", scope: !27, file: !28, line: 73, baseType: !15, size: 32, offset: 928)
!50 = !DIDerivedType(tag: DW_TAG_member, name: "_old_offset", scope: !27, file: !28, line: 74, baseType: !51, size: 64, offset: 960)
!51 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off_t", file: !52, line: 152, baseType: !53)
!52 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "", checksumkind: CSK_MD5, checksum: "d108b5f93a74c50510d7d9bc0ab36df9")
!53 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!54 = !DIDerivedType(tag: DW_TAG_member, name: "_cur_column", scope: !27, file: !28, line: 77, baseType: !55, size: 16, offset: 1024)
!55 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!56 = !DIDerivedType(tag: DW_TAG_member, name: "_vtable_offset", scope: !27, file: !28, line: 78, baseType: !57, size: 8, offset: 1040)
!57 = !DIBasicType(name: "signed char", size: 8, encoding: DW_ATE_signed_char)
!58 = !DIDerivedType(tag: DW_TAG_member, name: "_shortbuf", scope: !27, file: !28, line: 79, baseType: !59, size: 8, offset: 1048)
!59 = !DICompositeType(tag: DW_TAG_array_type, baseType: !19, size: 8, elements: !60)
!60 = !{!61}
!61 = !DISubrange(count: 1)
!62 = !DIDerivedType(tag: DW_TAG_member, name: "_lock", scope: !27, file: !28, line: 81, baseType: !63, size: 64, offset: 1088)
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !64, size: 64)
!64 = !DIDerivedType(tag: DW_TAG_typedef, name: "_IO_lock_t", file: !28, line: 43, baseType: null)
!65 = !DIDerivedType(tag: DW_TAG_member, name: "_offset", scope: !27, file: !28, line: 89, baseType: !66, size: 64, offset: 1152)
!66 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off64_t", file: !52, line: 153, baseType: !53)
!67 = !DIDerivedType(tag: DW_TAG_member, name: "_codecvt", scope: !27, file: !28, line: 91, baseType: !68, size: 64, offset: 1216)
!68 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !69, size: 64)
!69 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_codecvt", file: !28, line: 37, flags: DIFlagFwdDecl)
!70 = !DIDerivedType(tag: DW_TAG_member, name: "_wide_data", scope: !27, file: !28, line: 92, baseType: !71, size: 64, offset: 1280)
!71 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !72, size: 64)
!72 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_wide_data", file: !28, line: 38, flags: DIFlagFwdDecl)
!73 = !DIDerivedType(tag: DW_TAG_member, name: "_freeres_list", scope: !27, file: !28, line: 93, baseType: !47, size: 64, offset: 1344)
!74 = !DIDerivedType(tag: DW_TAG_member, name: "_freeres_buf", scope: !27, file: !28, line: 94, baseType: !3, size: 64, offset: 1408)
!75 = !DIDerivedType(tag: DW_TAG_member, name: "__pad5", scope: !27, file: !28, line: 95, baseType: !76, size: 64, offset: 1472)
!76 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !77, line: 46, baseType: !78)
!77 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!78 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!79 = !DIDerivedType(tag: DW_TAG_member, name: "_mode", scope: !27, file: !28, line: 96, baseType: !15, size: 32, offset: 1536)
!80 = !DIDerivedType(tag: DW_TAG_member, name: "_unused2", scope: !27, file: !28, line: 98, baseType: !81, size: 160, offset: 1568)
!81 = !DICompositeType(tag: DW_TAG_array_type, baseType: !19, size: 160, elements: !82)
!82 = !{!83}
!83 = !DISubrange(count: 20)
!84 = !DILocation(line: 5, column: 11, scope: !12)
!85 = !DILocation(line: 5, column: 16, scope: !12)
!86 = !DILocation(line: 6, column: 9, scope: !87)
!87 = distinct !DILexicalBlock(scope: !12, file: !1, line: 6, column: 9)
!88 = !DILocation(line: 6, column: 12, scope: !87)
!89 = !DILocation(line: 6, column: 9, scope: !12)
!90 = !DILocation(line: 7, column: 9, scope: !91)
!91 = distinct !DILexicalBlock(scope: !87, file: !1, line: 6, column: 21)
!92 = !DILocation(line: 8, column: 9, scope: !91)
!93 = !DILocalVariable(name: "c", scope: !12, file: !1, line: 11, type: !19)
!94 = !DILocation(line: 11, column: 10, scope: !12)
!95 = !DILocalVariable(name: "len", scope: !12, file: !1, line: 12, type: !15)
!96 = !DILocation(line: 12, column: 9, scope: !12)
!97 = !DILocation(line: 13, column: 5, scope: !12)
!98 = !DILocation(line: 14, column: 18, scope: !99)
!99 = distinct !DILexicalBlock(scope: !12, file: !1, line: 13, column: 15)
!100 = !DILocation(line: 14, column: 13, scope: !99)
!101 = !DILocation(line: 14, column: 11, scope: !99)
!102 = !DILocation(line: 15, column: 13, scope: !103)
!103 = distinct !DILexicalBlock(scope: !99, file: !1, line: 15, column: 13)
!104 = !DILocation(line: 15, column: 15, scope: !103)
!105 = !DILocation(line: 15, column: 13, scope: !99)
!106 = !DILocation(line: 15, column: 23, scope: !103)
!107 = !DILocation(line: 16, column: 23, scope: !99)
!108 = !DILocation(line: 16, column: 17, scope: !99)
!109 = !DILocation(line: 16, column: 9, scope: !99)
!110 = !DILocation(line: 16, column: 21, scope: !99)
!111 = !DILocation(line: 17, column: 13, scope: !112)
!112 = distinct !DILexicalBlock(scope: !99, file: !1, line: 17, column: 13)
!113 = !DILocation(line: 17, column: 17, scope: !112)
!114 = !DILocation(line: 17, column: 13, scope: !99)
!115 = !DILocation(line: 17, column: 26, scope: !112)
!116 = distinct !{!116, !97, !117}
!117 = !DILocation(line: 18, column: 5, scope: !12)
!118 = !DILocation(line: 19, column: 10, scope: !12)
!119 = !DILocation(line: 19, column: 5, scope: !12)
!120 = !DILocation(line: 19, column: 15, scope: !12)
!121 = !DILocation(line: 21, column: 12, scope: !12)
!122 = !DILocation(line: 21, column: 5, scope: !12)
!123 = !DILocation(line: 22, column: 20, scope: !12)
!124 = !DILocation(line: 22, column: 5, scope: !12)
!125 = !DILocation(line: 24, column: 5, scope: !12)
!126 = !DILocation(line: 25, column: 1, scope: !12)
