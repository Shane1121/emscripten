; ModuleID = 'tests/hello_world.bc'
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

@.str = private unnamed_addr constant [15 x i8] c"hello, world!\0A\00", align 1 ; [#uses=1 type=[15 x i8]*]

@othername = internal alias void (), void ()* @doit
@othername2 = internal alias void (), void ()* @othername

define internal void @doit() unnamed_addr nounwind align 2 {
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str, i32 0, i32 0)) ; [#uses=0 type=i32]
  ret void
}

define i32 @main() {
entry:
  tail call void () @othername2() nounwind
  ret i32 1
}

declare i32 @printf(i8*, ...)

