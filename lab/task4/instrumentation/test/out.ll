; ModuleID = 'test.ll'
source_filename = "test.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [6 x i8] c"Hum?\0A\00", align 1
@.str.1 = private unnamed_addr constant [26 x i8] c"Looks like a zero to me!\0A\00", align 1
@.str.2 = private unnamed_addr constant [31 x i8] c"A non-zero value? How quaint!\0A\00", align 1
@__area_ptr = external global i8*
@__prev_loc = external thread_local global i32

; Function Attrs: mustprogress noinline norecurse optnone uwtable
define dso_local noundef i32 @main(i32 noundef %0, i8** noundef %1) #0 {
  call void @setup_shared_memory()
  %afl_prev_loc = load i32, i32* @__prev_loc, align 4, !nosanitize !6
  %afl_map_ptr = load i8*, i8** @__area_ptr, align 8, !nosanitize !6
  %3 = xor i32 %afl_prev_loc, 17767
  %4 = getelementptr i8, i8* %afl_map_ptr, i32 %3
  %map_ptr_idx = load i8, i8* %4, align 1, !nosanitize !6
  %5 = add i8 %map_ptr_idx, 1
  store i8 %5, i8* %4, align 1, !nosanitize !6
  store i32 8883, i32* @__prev_loc, align 4, !nosanitize !6
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i8**, align 8
  %9 = alloca [8 x i8], align 1
  store i32 0, i32* %6, align 4
  store i32 %0, i32* %7, align 4
  store i8** %1, i8*** %8, align 8
  %10 = getelementptr inbounds [8 x i8], [8 x i8]* %9, i64 0, i64 0
  %11 = call i64 @read(i32 noundef 0, i8* noundef %10, i64 noundef 8)
  %12 = icmp slt i64 %11, 1
  br i1 %12, label %13, label %18

13:                                               ; preds = %2
  %afl_prev_loc1 = load i32, i32* @__prev_loc, align 4, !nosanitize !6
  %afl_map_ptr2 = load i8*, i8** @__area_ptr, align 8, !nosanitize !6
  %14 = xor i32 %afl_prev_loc1, 9158
  %15 = getelementptr i8, i8* %afl_map_ptr2, i32 %14
  %map_ptr_idx3 = load i8, i8* %15, align 1, !nosanitize !6
  %16 = add i8 %map_ptr_idx3, 1
  store i8 %16, i8* %15, align 1, !nosanitize !6
  store i32 4579, i32* @__prev_loc, align 4, !nosanitize !6
  %17 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i64 0, i64 0))
  call void @exit(i32 noundef 1) #3
  unreachable

18:                                               ; preds = %2
  %afl_prev_loc4 = load i32, i32* @__prev_loc, align 4, !nosanitize !6
  %afl_map_ptr5 = load i8*, i8** @__area_ptr, align 8, !nosanitize !6
  %19 = xor i32 %afl_prev_loc4, 39017
  %20 = getelementptr i8, i8* %afl_map_ptr5, i32 %19
  %map_ptr_idx6 = load i8, i8* %20, align 1, !nosanitize !6
  %21 = add i8 %map_ptr_idx6, 1
  store i8 %21, i8* %20, align 1, !nosanitize !6
  store i32 19508, i32* @__prev_loc, align 4, !nosanitize !6
  %22 = getelementptr inbounds [8 x i8], [8 x i8]* %9, i64 0, i64 0
  %23 = load i8, i8* %22, align 1
  %24 = sext i8 %23 to i32
  %25 = icmp eq i32 %24, 48
  br i1 %25, label %26, label %31

26:                                               ; preds = %18
  %afl_prev_loc7 = load i32, i32* @__prev_loc, align 4, !nosanitize !6
  %afl_map_ptr8 = load i8*, i8** @__area_ptr, align 8, !nosanitize !6
  %27 = xor i32 %afl_prev_loc7, 18547
  %28 = getelementptr i8, i8* %afl_map_ptr8, i32 %27
  %map_ptr_idx9 = load i8, i8* %28, align 1, !nosanitize !6
  %29 = add i8 %map_ptr_idx9, 1
  store i8 %29, i8* %28, align 1, !nosanitize !6
  store i32 9273, i32* @__prev_loc, align 4, !nosanitize !6
  %30 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([26 x i8], [26 x i8]* @.str.1, i64 0, i64 0))
  br label %36

31:                                               ; preds = %18
  %afl_prev_loc10 = load i32, i32* @__prev_loc, align 4, !nosanitize !6
  %afl_map_ptr11 = load i8*, i8** @__area_ptr, align 8, !nosanitize !6
  %32 = xor i32 %afl_prev_loc10, 56401
  %33 = getelementptr i8, i8* %afl_map_ptr11, i32 %32
  %map_ptr_idx12 = load i8, i8* %33, align 1, !nosanitize !6
  %34 = add i8 %map_ptr_idx12, 1
  store i8 %34, i8* %33, align 1, !nosanitize !6
  store i32 28200, i32* @__prev_loc, align 4, !nosanitize !6
  %35 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([31 x i8], [31 x i8]* @.str.2, i64 0, i64 0))
  br label %36

36:                                               ; preds = %31, %26
  %afl_prev_loc13 = load i32, i32* @__prev_loc, align 4, !nosanitize !6
  %afl_map_ptr14 = load i8*, i8** @__area_ptr, align 8, !nosanitize !6
  %37 = xor i32 %afl_prev_loc13, 23807
  %38 = getelementptr i8, i8* %afl_map_ptr14, i32 %37
  %map_ptr_idx15 = load i8, i8* %38, align 1, !nosanitize !6
  %39 = add i8 %map_ptr_idx15, 1
  store i8 %39, i8* %38, align 1, !nosanitize !6
  store i32 11903, i32* @__prev_loc, align 4, !nosanitize !6
  call void @exit(i32 noundef 0) #3
  unreachable
}

declare i64 @read(i32 noundef, i8* noundef, i64 noundef) #1

declare i32 @printf(i8* noundef, ...) #1

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #2

declare void @setup_shared_memory()

attributes #0 = { mustprogress noinline norecurse optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 1}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"Debian clang version 14.0.6"}
!6 = !{}
