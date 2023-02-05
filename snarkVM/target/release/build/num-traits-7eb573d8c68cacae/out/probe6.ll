; ModuleID = 'probe6.67ab3e1a-cgu.0'
source_filename = "probe6.67ab3e1a-cgu.0"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; std::f64::<impl f64>::copysign
; Function Attrs: inlinehint nonlazybind uwtable
define internal double @"_ZN3std3f6421_$LT$impl$u20$f64$GT$8copysign17h998d9c2932f02594E"(double %self, double %sign) unnamed_addr #0 {
start:
  %0 = alloca double, align 8
  %1 = call double @llvm.copysign.f64(double %self, double %sign)
  store double %1, ptr %0, align 8
  %2 = load double, ptr %0, align 8
  br label %bb1

bb1:                                              ; preds = %start
  ret double %2
}

; probe6::probe
; Function Attrs: nonlazybind uwtable
define void @_ZN6probe65probe17h2a0c909ff383c8e0E() unnamed_addr #1 {
start:
; call std::f64::<impl f64>::copysign
  %_1 = call double @"_ZN3std3f6421_$LT$impl$u20$f64$GT$8copysign17h998d9c2932f02594E"(double 1.000000e+00, double -1.000000e+00)
  br label %bb1

bb1:                                              ; preds = %start
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.copysign.f64(double, double) #2

attributes #0 = { inlinehint nonlazybind uwtable "probe-stack"="__rust_probestack" "target-cpu"="skylake" "target-features"="-avx512pf,-tsxldtrk,+cx16,+sahf,-tbm,-avx512ifma,-sha,+crc32,-fma4,-vpclmulqdq,+prfchw,-bmi2,-cldemote,+fsgsbase,-avx512bf16,-amx-tile,-uintr,-gfni,+popcnt,-ptwrite,+aes,-avx512bitalg,-movdiri,-widekl,-xsaves,-avx512er,-avxvnni,-avx512fp16,-avx512vnni,-amx-bf16,-avx512vpopcntdq,-pconfig,-clwb,-avx512f,-xsavec,-clzero,-pku,+mmx,-lwp,-rdpid,-xop,+rdseed,-waitpkg,-kl,-movdir64b,-sse4a,-avx512bw,+clflushopt,-xsave,-avx512vbmi2,+64bit,-avx512vl,-serialize,-hreset,+invpcid,-avx512cd,-avx,-vaes,-amx-int8,+cx8,-fma,-rtm,-bmi,-enqcmd,+rdrnd,-mwaitx,+sse4.1,+sse4.2,-avx2,+fxsr,-wbnoinvd,+sse,+lzcnt,+pclmul,-rdpru,-f16c,+ssse3,+sgx,-prefetchwt1,+cmov,-avx512vbmi,-shstk,+movbe,-avx512vp2intersect,-xsaveopt,-avx512dq,+sse2,-adx,+sse3" }
attributes #1 = { nonlazybind uwtable "probe-stack"="__rust_probestack" "target-cpu"="skylake" "target-features"="-avx512pf,-tsxldtrk,+cx16,+sahf,-tbm,-avx512ifma,-sha,+crc32,-fma4,-vpclmulqdq,+prfchw,-bmi2,-cldemote,+fsgsbase,-avx512bf16,-amx-tile,-uintr,-gfni,+popcnt,-ptwrite,+aes,-avx512bitalg,-movdiri,-widekl,-xsaves,-avx512er,-avxvnni,-avx512fp16,-avx512vnni,-amx-bf16,-avx512vpopcntdq,-pconfig,-clwb,-avx512f,-xsavec,-clzero,-pku,+mmx,-lwp,-rdpid,-xop,+rdseed,-waitpkg,-kl,-movdir64b,-sse4a,-avx512bw,+clflushopt,-xsave,-avx512vbmi2,+64bit,-avx512vl,-serialize,-hreset,+invpcid,-avx512cd,-avx,-vaes,-amx-int8,+cx8,-fma,-rtm,-bmi,-enqcmd,+rdrnd,-mwaitx,+sse4.1,+sse4.2,-avx2,+fxsr,-wbnoinvd,+sse,+lzcnt,+pclmul,-rdpru,-f16c,+ssse3,+sgx,-prefetchwt1,+cmov,-avx512vbmi,-shstk,+movbe,-avx512vp2intersect,-xsaveopt,-avx512dq,+sse2,-adx,+sse3" }
attributes #2 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}

!0 = !{i32 7, !"PIC Level", i32 2}
!1 = !{i32 2, !"RtLibUseGOT", i32 1}
