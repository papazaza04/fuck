fuck(char):
        push    rbp
        mov     rbp, rsp
        mov     eax, edi
        mov     BYTE PTR [rbp-4], al
        cmp     BYTE PTR [rbp-4], 47
        jle     .L2
        cmp     BYTE PTR [rbp-4], 57
        jg      .L2
        movsx   eax, BYTE PTR [rbp-4]
        sub     eax, 48
        jmp     .L3
.L2:
        movsx   eax, BYTE PTR [rbp-4]
        sub     eax, 55
.L3:
        pop     rbp
        ret
.LC0:
        .string "%s %d"
.LC1:
        .string "%d"
main:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 100032
        mov     DWORD PTR [rbp-4], 0
        lea     rdx, [rbp-16]
        lea     rax, [rbp-100016]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC0
        mov     eax, 0
        call    __isoc99_scanf
        lea     rax, [rbp-100016]
        mov     rdi, rax
        call    strlen
        mov     DWORD PTR [rbp-12], eax
        mov     DWORD PTR [rbp-8], 0
        jmp     .L5
.L6:
        mov     eax, DWORD PTR [rbp-8]
        cdqe
        movzx   eax, BYTE PTR [rbp-100016+rax]
        movsx   eax, al
        mov     edi, eax
        call    fuck(char)
        pxor    xmm2, xmm2
        cvtsi2sd        xmm2, eax
        movsd   QWORD PTR [rbp-100024], xmm2
        mov     eax, DWORD PTR [rbp-12]
        sub     eax, 1
        sub     eax, DWORD PTR [rbp-8]
        mov     edx, eax
        mov     eax, DWORD PTR [rbp-16]
        mov     esi, edx
        mov     edi, eax
        call    _ZSt3powIiiEN9__gnu_cxx11__promote_2IDTplcvNS1_IT_XsrSt12__is_integerIS2_E7__valueEE6__typeELi0EcvNS1_IT0_XsrS3_IS7_E7__valueEE6__typeELi0EEXsrS3_ISB_E7__valueEE6__typeES2_S7_
        movsd   xmm1, QWORD PTR [rbp-100024]
        mulsd   xmm1, xmm0
        pxor    xmm0, xmm0
        cvtsi2sd        xmm0, DWORD PTR [rbp-4]
        addsd   xmm0, xmm1
        cvttsd2si       eax, xmm0
        mov     DWORD PTR [rbp-4], eax
        add     DWORD PTR [rbp-8], 1
.L5:
        mov     eax, DWORD PTR [rbp-8]
        cmp     eax, DWORD PTR [rbp-12]
        jl      .L6
        mov     eax, DWORD PTR [rbp-4]
        mov     esi, eax
        mov     edi, OFFSET FLAT:.LC1
        mov     eax, 0
        call    printf
        mov     eax, 0
        leave
        ret