; ModuleID = 'probe3.e4360fb5-cgu.0'
source_filename = "probe3.e4360fb5-cgu.0"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; probe3::probe
; Function Attrs: nonlazybind uwtable
define void @_ZN6probe35probe17hff6d07efbeddfe4fE() unnamed_addr #0 {
start:
  %0 = alloca i32, align 4
  store i32 1, ptr %0, align 4
  %1 = load i32, ptr %0, align 4
  br label %bb1

bb1:                                              ; preds = %start
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.cttz.i32(i32, i1 immarg) #1

attributes #0 = { nonlazybind uwtable "probe-stack"="__rust_probestack" "target-cpu"="skylake" "target-features"="-avx512pf,-tsxldtrk,+cx16,+sahf,-tbm,-avx512ifma,-sha,+crc32,-fma4,-vpclmulqdq,+prfchw,-bmi2,-cldemote,+fsgsbase,-avx512bf16,-amx-tile,-uintr,-gfni,+popcnt,-ptwrite,+aes,-avx512bitalg,-movdiri,-widekl,-xsaves,-avx512er,-avxvnni,-avx512fp16,-avx512vnni,-amx-bf16,-avx512vpopcntdq,-pconfig,-clwb,-avx512f,-xsavec,-clzero,-pku,+mmx,-lwp,-rdpid,-xop,+rdseed,-waitpkg,-kl,-movdir64b,-sse4a,-avx512bw,+clflushopt,-xsave,-avx512vbmi2,+64bit,-avx512vl,-serialize,-hreset,+invpcid,-avx512cd,-avx,-vaes,-amx-int8,+cx8,-fma,-rtm,-bmi,-enqcmd,+rdrnd,-mwaitx,+sse4.1,+sse4.2,-avx2,+fxsr,-wbnoinvd,+sse,+lzcnt,+pclmul,-rdpru,-f16c,+ssse3,+sgx,-prefetchwt1,+cmov,-avx512vbmi,-shstk,+movbe,-avx512vp2intersect,-xsaveopt,-avx512dq,+sse2,-adx,+sse3" }
attributes #1 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}

!0 = !{i32 7, !"PIC Level", i32 2}
!1 = !{i32 2, !"RtLibUseGOT", i32 1}
