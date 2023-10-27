; ModuleID = 'test.ll'
source_filename = "test.cpp"
target datalayout = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128"
target triple = "aarch64-unknown-linux-gnu"

@.str = private unnamed_addr constant [6 x i8] c"Hum?\0A\00", align 1
@.str.1 = private unnamed_addr constant [26 x i8] c"Looks like a zero to me!\0A\00", align 1
@.str.2 = private unnamed_addr constant [31 x i8] c"A non-zero value? How quaint!\0A\00", align 1
@__area_ptr = external global i8*
@__prev_loc = external thread_local global i32

; Function Attrs: noinline norecurse optnone
define dso_local i32 @main(i32 %0, i8** %1) #0 {
  call void @setup_shared_memory()
  %3 = load i32, i32* @__prev_loc, align 4, !nosanitize !2
  %4 = load i8*, i8** @__area_ptr, align 8, !nosanitize !2
  %5 = xor i32 %3, 17767
  %6 = getelementptr i8, i8* %4, i32 %5
  %7 = load i8, i8* %6, align 1, !nosanitize !2
  %8 = add i8 %7, 1
  store i8 %8, i8* %6, align 1, !nosanitize !2
  store i32 8883, i32* @__prev_loc, align 4, !nosanitize !2
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i8**, align 8
  %12 = alloca [8 x i8], align 1
  store i32 0, i32* %9, align 4
  store i32 %0, i32* %10, align 4
  store i8** %1, i8*** %11, align 8
  %13 = getelementptr inbounds [8 x i8], [8 x i8]* %12, i64 0, i64 0
  %14 = call i64 @read(i32 0, i8* %13, i64 8)
  %15 = icmp slt i64 %14, 1
  br i1 %15, label %16, label %24

16:                                               ; preds = %2
  %17 = load i32, i32* @__prev_loc, align 4, !nosanitize !2
  %18 = load i8*, i8** @__area_ptr, align 8, !nosanitize !2
  %19 = xor i32 %17, 9158
  %20 = getelementptr i8, i8* %18, i32 %19
  %21 = load i8, i8* %20, align 1, !nosanitize !2
  %22 = add i8 %21, 1
  store i8 %22, i8* %20, align 1, !nosanitize !2
  store i32 4579, i32* @__prev_loc, align 4, !nosanitize !2
  %23 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i64 0, i64 0))
  call void @exit(i32 1) #3
  unreachable

24:                                               ; preds = %2
  %25 = load i32, i32* @__prev_loc, align 4, !nosanitize !2
  %26 = load i8*, i8** @__area_ptr, align 8, !nosanitize !2
  %27 = xor i32 %25, 39017
  %28 = getelementptr i8, i8* %26, i32 %27
  %29 = load i8, i8* %28, align 1, !nosanitize !2
  %30 = add i8 %29, 1
  store i8 %30, i8* %28, align 1, !nosanitize !2
  store i32 19508, i32* @__prev_loc, align 4, !nosanitize !2
  %31 = getelementptr inbounds [8 x i8], [8 x i8]* %12, i64 0, i64 0
  %32 = load i8, i8* %31, align 1
  %33 = zext i8 %32 to i32
  %34 = icmp eq i32 %33, 48
  br i1 %34, label %35, label %43

35:                                               ; preds = %24
  %36 = load i32, i32* @__prev_loc, align 4, !nosanitize !2
  %37 = load i8*, i8** @__area_ptr, align 8, !nosanitize !2
  %38 = xor i32 %36, 18547
  %39 = getelementptr i8, i8* %37, i32 %38
  %40 = load i8, i8* %39, align 1, !nosanitize !2
  %41 = add i8 %40, 1
  store i8 %41, i8* %39, align 1, !nosanitize !2
  store i32 9273, i32* @__prev_loc, align 4, !nosanitize !2
  %42 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.1, i64 0, i64 0))
  br label %51

43:                                               ; preds = %24
  %44 = load i32, i32* @__prev_loc, align 4, !nosanitize !2
  %45 = load i8*, i8** @__area_ptr, align 8, !nosanitize !2
  %46 = xor i32 %44, 56401
  %47 = getelementptr i8, i8* %45, i32 %46
  %48 = load i8, i8* %47, align 1, !nosanitize !2
  %49 = add i8 %48, 1
  store i8 %49, i8* %47, align 1, !nosanitize !2
  store i32 28200, i32* @__prev_loc, align 4, !nosanitize !2
  %50 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.2, i64 0, i64 0))
  br label %51

51:                                               ; preds = %43, %35
  %52 = load i32, i32* @__prev_loc, align 4, !nosanitize !2
  %53 = load i8*, i8** @__area_ptr, align 8, !nosanitize !2
  %54 = xor i32 %52, 23807
  %55 = getelementptr i8, i8* %53, i32 %54
  %56 = load i8, i8* %55, align 1, !nosanitize !2
  %57 = add i8 %56, 1
  store i8 %57, i8* %55, align 1, !nosanitize !2
  store i32 11903, i32* @__prev_loc, align 4, !nosanitize !2
  call void @exit(i32 0) #3
  unreachable
}

declare dso_local i64 @read(i32, i8*, i64) #1

declare dso_local i32 @printf(i8*, ...) #1

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #2

declare void @setup_shared_memory()

attributes #0 = { noinline norecurse optnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="non-leaf" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+neon" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="non-leaf" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+neon" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="non-leaf" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+neon" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"Debian clang version 11.1.0-6+b2"}
!2 = !{}
