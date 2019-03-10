
NAME    memsrch

data    SEGMENT RW      PUBLIC
data    ENDS

code32  SEGMENT ER      PUBLIC
ASSUME  DS:data
PUBLIC  mem_srch_key
PUBLIC  mem_srch_notkey

mem_srch_key  PROC    NEAR
              push edi
              mov eax, ss:[esp+16]
              mov edi, ss:[esp+12]
              mov ecx, ss:[esp+8]
              cld
              repnz scasd
              jz  srched
              mov eax, 0ffffffffh
              jmp outsrch
    srched:   mov eax, ss:[esp+8]
              sub eax, ecx
              dec eax
   outsrch:   pop edi
              ret 12
mem_srch_key  ENDP

mem_srch_notkey  PROC    NEAR
                 push edi
                 mov eax, ss:[esp+16]
                 mov edi, ss:[esp+12]
                 mov ecx, ss:[esp+8]
                 cld
                 repz scasd
                 jnz  nsrched
                 mov eax, 0ffffffffh
                 jmp noutsrch
      nsrched:   mov eax, ss:[esp+8]
                 sub eax, ecx
                 dec eax
     noutsrch:   pop edi
                 ret 12
mem_srch_notkey  ENDP

code32  ENDS
END
