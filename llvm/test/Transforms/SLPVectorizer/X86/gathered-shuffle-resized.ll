; NOTE: Assertions have been autogenerated by utils/update_test_checks.py UTC_ARGS: --version 5
; RUN: opt -S --passes=slp-vectorizer -mtriple=x86_64-grtev4-linux-gnu < %s | FileCheck %s

define ptr @test(ptr %0, ptr %args_gep) {
; CHECK-LABEL: define ptr @test(
; CHECK-SAME: ptr [[TMP0:%.*]], ptr [[ARGS_GEP:%.*]]) {
; CHECK-NEXT:  [[BB:.*:]]
; CHECK-NEXT:    [[ARG1:%.*]] = load ptr, ptr [[ARGS_GEP]], align 8
; CHECK-NEXT:    [[ARG26:%.*]] = load ptr, ptr [[TMP0]], align 8
; CHECK-NEXT:    [[TMP1:%.*]] = load <2 x i32>, ptr [[ARG1]], align 32
; CHECK-NEXT:    [[TMP2:%.*]] = shufflevector <2 x i32> [[TMP1]], <2 x i32> poison, <16 x i32> <i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 0, i32 0, i32 0, i32 0>
; CHECK-NEXT:    [[TMP3:%.*]] = icmp eq <16 x i32> [[TMP2]], zeroinitializer
; CHECK-NEXT:    [[TMP4:%.*]] = zext <16 x i1> [[TMP3]] to <16 x i8>
; CHECK-NEXT:    store <16 x i8> [[TMP4]], ptr [[ARG26]], align 32
; CHECK-NEXT:    [[TMP5:%.*]] = getelementptr i8, ptr [[ARG26]], i64 17
; CHECK-NEXT:    [[TMP6:%.*]] = getelementptr i8, ptr [[ARG1]], i64 8
; CHECK-NEXT:    [[TMP7:%.*]] = getelementptr i8, ptr [[ARG1]], i64 12
; CHECK-NEXT:    [[TMP9:%.*]] = load <2 x i32>, ptr [[TMP6]], align 8, !noalias [[META0:![0-9]+]]
; CHECK-NEXT:    [[TMP8:%.*]] = load i32, ptr [[TMP7]], align 4, !noalias [[META0]]
; CHECK-NEXT:    [[TMP10:%.*]] = shufflevector <2 x i32> [[TMP1]], <2 x i32> poison, <4 x i32> <i32 0, i32 1, i32 poison, i32 poison>
; CHECK-NEXT:    [[TMP11:%.*]] = shufflevector <2 x i32> [[TMP9]], <2 x i32> poison, <16 x i32> <i32 poison, i32 poison, i32 0, i32 1, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison>
; CHECK-NEXT:    [[TMP12:%.*]] = shufflevector <4 x i32> [[TMP10]], <4 x i32> poison, <16 x i32> <i32 0, i32 1, i32 2, i32 3, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison>
; CHECK-NEXT:    [[TMP13:%.*]] = shufflevector <2 x i32> [[TMP1]], <2 x i32> [[TMP9]], <16 x i32> <i32 0, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 3, i32 3, i32 3>
; CHECK-NEXT:    [[TMP14:%.*]] = icmp eq <16 x i32> [[TMP13]], zeroinitializer
; CHECK-NEXT:    [[TMP15:%.*]] = zext <16 x i1> [[TMP14]] to <16 x i8>
; CHECK-NEXT:    store <16 x i8> [[TMP15]], ptr [[TMP5]], align 1
; CHECK-NEXT:    [[TMP16:%.*]] = icmp eq i32 [[TMP8]], 0
; CHECK-NEXT:    [[TMP17:%.*]] = zext i1 [[TMP16]] to i8
; CHECK-NEXT:    store i8 [[TMP17]], ptr [[TMP0]], align 1
; CHECK-NEXT:    ret ptr null
;
bb:
  %arg1 = load ptr, ptr %args_gep, align 8
  %arg26 = load ptr, ptr %0, align 8
  %1 = load i32, ptr %arg1, align 32
  %2 = icmp eq i32 %1, 0
  %3 = zext i1 %2 to i8
  store i8 %3, ptr %arg26, align 32, !alias.scope !0
  %4 = icmp eq i32 %1, 0
  %5 = zext i1 %4 to i8
  %6 = getelementptr i8, ptr %arg26, i64 1
  store i8 %5, ptr %6, align 1, !alias.scope !0
  %7 = icmp eq i32 %1, 0
  %8 = zext i1 %7 to i8
  %9 = getelementptr i8, ptr %arg26, i64 2
  store i8 %8, ptr %9, align 2, !alias.scope !0
  %10 = icmp eq i32 %1, 0
  %11 = zext i1 %10 to i8
  %12 = getelementptr i8, ptr %arg26, i64 3
  store i8 %11, ptr %12, align 1, !alias.scope !0
  %13 = icmp eq i32 %1, 0
  %14 = zext i1 %13 to i8
  %15 = getelementptr i8, ptr %arg26, i64 4
  store i8 %14, ptr %15, align 4, !alias.scope !0
  %16 = icmp eq i32 %1, 0
  %17 = zext i1 %16 to i8
  %18 = getelementptr i8, ptr %arg26, i64 5
  store i8 %17, ptr %18, align 1, !alias.scope !0
  %19 = getelementptr i8, ptr %arg1, i64 4
  %20 = load i32, ptr %19, align 4, !noalias !0
  %21 = icmp eq i32 %20, 0
  %22 = zext i1 %21 to i8
  %23 = getelementptr i8, ptr %arg26, i64 6
  store i8 %22, ptr %23, align 2
  %24 = icmp eq i32 %20, 0
  %25 = zext i1 %24 to i8
  %26 = getelementptr i8, ptr %arg26, i64 7
  store i8 %25, ptr %26, align 1
  %27 = icmp eq i32 %20, 0
  %28 = zext i1 %27 to i8
  %29 = getelementptr i8, ptr %arg26, i64 8
  store i8 %28, ptr %29, align 8
  %30 = icmp eq i32 %20, 0
  %31 = zext i1 %30 to i8
  %32 = getelementptr i8, ptr %arg26, i64 9
  store i8 %31, ptr %32, align 1
  %33 = icmp eq i32 %20, 0
  %34 = zext i1 %33 to i8
  %35 = getelementptr i8, ptr %arg26, i64 10
  store i8 %34, ptr %35, align 2
  %36 = icmp eq i32 %20, 0
  %37 = zext i1 %36 to i8
  %38 = getelementptr i8, ptr %arg26, i64 11
  store i8 %37, ptr %38, align 1
  %39 = icmp eq i32 %1, 0
  %40 = zext i1 %39 to i8
  %41 = getelementptr i8, ptr %arg26, i64 12
  store i8 %40, ptr %41, align 4
  %42 = icmp eq i32 %1, 0
  %43 = zext i1 %42 to i8
  %44 = getelementptr i8, ptr %arg26, i64 13
  store i8 %43, ptr %44, align 1
  %45 = icmp eq i32 %1, 0
  %46 = zext i1 %45 to i8
  %47 = getelementptr i8, ptr %arg26, i64 14
  store i8 %46, ptr %47, align 2
  %48 = icmp eq i32 %1, 0
  %49 = zext i1 %48 to i8
  %50 = getelementptr i8, ptr %arg26, i64 15
  store i8 %49, ptr %50, align 1
  %51 = icmp eq i32 %1, 0
  %52 = zext i1 %51 to i8
  %53 = getelementptr i8, ptr %arg26, i64 17
  store i8 %52, ptr %53, align 1, !alias.scope !0
  %54 = icmp eq i32 %20, 0
  %55 = zext i1 %54 to i8
  %56 = getelementptr i8, ptr %arg26, i64 18
  store i8 %55, ptr %56, align 2, !alias.scope !0
  %57 = icmp eq i32 %20, 0
  %58 = zext i1 %57 to i8
  %59 = getelementptr i8, ptr %arg26, i64 19
  store i8 %58, ptr %59, align 1, !alias.scope !0
  %60 = icmp eq i32 %20, 0
  %61 = zext i1 %60 to i8
  %62 = getelementptr i8, ptr %arg26, i64 20
  store i8 %61, ptr %62, align 4, !alias.scope !0
  %63 = icmp eq i32 %20, 0
  %64 = zext i1 %63 to i8
  %65 = getelementptr i8, ptr %arg26, i64 21
  store i8 %64, ptr %65, align 1, !alias.scope !0
  %66 = icmp eq i32 %20, 0
  %67 = zext i1 %66 to i8
  %68 = getelementptr i8, ptr %arg26, i64 22
  store i8 %67, ptr %68, align 2, !alias.scope !0
  %69 = icmp eq i32 %20, 0
  %70 = zext i1 %69 to i8
  %71 = getelementptr i8, ptr %arg26, i64 23
  store i8 %70, ptr %71, align 1, !alias.scope !0
  %72 = getelementptr i8, ptr %arg1, i64 8
  %73 = load i32, ptr %72, align 8, !noalias !0
  %74 = icmp eq i32 %73, 0
  %75 = zext i1 %74 to i8
  %76 = getelementptr i8, ptr %arg26, i64 24
  store i8 %75, ptr %76, align 8, !alias.scope !0
  %77 = icmp eq i32 %73, 0
  %78 = zext i1 %77 to i8
  %79 = getelementptr i8, ptr %arg26, i64 25
  store i8 %78, ptr %79, align 1, !alias.scope !0
  %80 = icmp eq i32 %73, 0
  %81 = zext i1 %80 to i8
  %82 = getelementptr i8, ptr %arg26, i64 26
  store i8 %81, ptr %82, align 2, !alias.scope !0
  %83 = icmp eq i32 %73, 0
  %84 = zext i1 %83 to i8
  %85 = getelementptr i8, ptr %arg26, i64 27
  store i8 %84, ptr %85, align 1, !alias.scope !0
  %86 = icmp eq i32 %73, 0
  %87 = zext i1 %86 to i8
  %88 = getelementptr i8, ptr %arg26, i64 28
  store i8 %87, ptr %88, align 4, !alias.scope !0
  %89 = icmp eq i32 %73, 0
  %90 = zext i1 %89 to i8
  %91 = getelementptr i8, ptr %arg26, i64 29
  store i8 %90, ptr %91, align 1, !alias.scope !0
  %92 = getelementptr i8, ptr %arg1, i64 12
  %93 = load i32, ptr %92, align 4, !noalias !0
  %94 = icmp eq i32 %93, 0
  %95 = zext i1 %94 to i8
  %96 = getelementptr i8, ptr %arg26, i64 30
  store i8 %95, ptr %96, align 2
  %97 = icmp eq i32 %93, 0
  %98 = zext i1 %97 to i8
  %99 = getelementptr i8, ptr %arg26, i64 31
  store i8 %98, ptr %99, align 1
  %100 = icmp eq i32 %93, 0
  %101 = zext i1 %100 to i8
  %102 = getelementptr i8, ptr %arg26, i64 32
  store i8 %101, ptr %102, align 32
  %103 = icmp eq i32 %93, 0
  %104 = zext i1 %103 to i8
  store i8 %104, ptr %0, align 1
  ret ptr null
}

!0 = !{!1}
!1 = !{!"result slice: {}", !2}
!2 = !{!"fn AA domain"}
;.
; CHECK: [[META0]] = !{[[META1:![0-9]+]]}
; CHECK: [[META1]] = !{!"result slice: {}", [[META2:![0-9]+]]}
; CHECK: [[META2]] = !{!"fn AA domain"}
;.
