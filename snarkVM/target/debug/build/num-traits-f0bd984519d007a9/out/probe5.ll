; ModuleID = 'probe5.f2dbdd71-cgu.0'
source_filename = "probe5.f2dbdd71-cgu.0"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@alloc3 = private unnamed_addr constant <{ [75 x i8] }> <{ [75 x i8] c"/rustc/897e37553bba8b42751c67658967889d11ecd120/library/core/src/num/mod.rs" }>, align 1
@alloc4 = private unnamed_addr constant <{ ptr, [16 x i8] }> <{ ptr @alloc3, [16 x i8] c"K\00\00\00\00\00\00\00Z\03\00\00\05\00\00\00" }>, align 8
@str.0 = internal constant [25 x i8] c"attempt to divide by zero"

; probe5::probe
; Function Attrs: nonlazybind uwtable
define void @_ZN6probe55probe17h1fc3bc572dc2ac25E() unnamed_addr #0 {
start:
  %0 = call i1 @llvm.expect.i1(i1 false, i1 false)
  br i1 %0, label %panic.i, label %"_ZN4core3num21_$LT$impl$u20$u32$GT$10div_euclid17hee731f0ad19d6b4eE.exit"

panic.i:                                          ; preds = %start
; call core::panicking::panic
  call void @_ZN4core9panicking5panic17hf0565452d0d0936cE(ptr align 1 @str.0, i64 25, ptr align 8 @alloc4) #3
  unreachable

"_ZN4core3num21_$LT$impl$u20$u32$GT$10div_euclid17hee731f0ad19d6b4eE.exit": ; preds = %start
  br label %bb1

bb1:                                              ; preds = %"_ZN4core3num21_$LT$impl$u20$u32$GT$10div_euclid17hee731f0ad19d6b4eE.exit"
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind readnone willreturn
declare i1 @llvm.expect.i1(i1, i1) #1

; core::panicking::panic
; Function Attrs: cold noinline noreturn nonlazybind uwtable
declare void @_ZN4core9panicking5panic17hf0565452d0d0936cE(ptr align 1, i64, ptr align 8) unnamed_addr #2

attributes #0 = { nonlazybind uwtable "probe-stack"="__rust_probestack" "target-cpu"="skylake" "target-features"="-avx512pf,-tsxldtrk,+cx16,+sahf,-tbm,-avx512ifma,-sha,+crc32,-fma4,-vpclmulqdq,+prfchw,-bmi2,-cldemote,+fsgsbase,-avx512bf16,-amx-tile,-uintr,-gfni,+popcnt,-ptwrite,+aes,-avx512bitalg,-movdiri,-widekl,-xsaves,-avx512er,-avxvnni,-avx512fp16,-avx512vnni,-amx-bf16,-avx512vpopcntdq,-pconfig,-clwb,-avx512f,-xsavec,-clzero,-pku,+mmx,-lwp,-rdpid,-xop,+rdseed,-waitpkg,-kl,-movdir64b,-sse4a,-avx512bw,+clflushopt,-xsave,-avx512vbmi2,+64bit,-avx512vl,-serialize,-hreset,+invpcid,-avx512cd,-avx,-vaes,-amx-int8,+cx8,-fma,-rtm,-bmi,-enqcmd,+rdrnd,-mwaitx,+sse4.1,+sse4.2,-avx2,+fxsr,-wbnoinvd,+sse,+lzcnt,+pclmul,-rdpru,-f16c,+ssse3,+sgx,-prefetchwt1,+cmov,-avx512vbmi,-shstk,+movbe,-avx512vp2intersect,-xsaveopt,-avx512dq,+sse2,-adx,+sse3" }
attributes #1 = { nocallback nofree nosync nounwind readnone willreturn }
attributes #2 = { cold noinline noreturn nonlazybind uwtable "probe-stack"="__rust_probestack" "target-cpu"="skylake" "target-features"="-avx512pf,-tsxldtrk,+cx16,+sahf,-tbm,-avx512ifma,-sha,+crc32,-fma4,-vpclmulqdq,+prfchw,-bmi2,-cldemote,+fsgsbase,-avx512bf16,-amx-tile,-uintr,-gfni,+popcnt,-ptwrite,+aes,-avx512bitalg,-movdiri,-widekl,-xsaves,-avx512er,-avxvnni,-avx512fp16,-avx512vnni,-amx-bf16,-avx512vpopcntdq,-pconfig,-clwb,-avx512f,-xsavec,-clzero,-pku,+mmx,-lwp,-rdpid,-xop,+rdseed,-waitpkg,-kl,-movdir64b,-sse4a,-avx512bw,+clflushopt,-xsave,-avx512vbmi2,+64bit,-avx512vl,-serialize,-hreset,+invpcid,-avx512cd,-avx,-vaes,-amx-int8,+cx8,-fma,-rtm,-bmi,-enqcmd,+rdrnd,-mwaitx,+sse4.1,+sse4.2,-avx2,+fxsr,-wbnoinvd,+sse,+lzcnt,+pclmul,-rdpru,-f16c,+ssse3,+sgx,-prefetchwt1,+cmov,-avx512vbmi,-shstk,+movbe,-avx512vp2intersect,-xsaveopt,-avx512dq,+sse2,-adx,+sse3" }
attributes #3 = { noreturn }

!llvm.module.flags = !{!0, !1}

!0 = !{i32 7, !"PIC Level", i32 2}
!1 = !{i32 2, !"RtLibUseGOT", i32 1}
