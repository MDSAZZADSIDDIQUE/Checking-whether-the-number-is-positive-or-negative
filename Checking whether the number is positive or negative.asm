.model small
.stack 100h
.data
msg db "Enter a number: ", '$'
positive db "Positive", '$'
negative db "Negative", '$'
zero db "Zero", "$"
number db ?
.code
main proc
    mov ax, @data
    mov ds, ax
    
    mov ah, 9
    lea dx, msg
    int 21h
    
    mov ah, 1
    int 21h
    mov bl, al
    
        mov ah, 2
    mov dl, 10
    int 21h
    mov dl, 13
    int 21h
    
    mov cl, 30h
    
    cmp bl, cl
    jg print2
    jl print3
    jmp print
    
    
    print:
    mov ah, 9
    lea dx, zero
    int 21h
    jmp exit
           
    print2:
    mov ah, 9
    lea dx, positive
    int 21h

    jmp exit
    
    print3:
    mov ah, 9
    lea dx, negative
    int 21h

    jmp exit
    
    exit:
    mov ah, 4ch
    int 21h
    main endp
end main
    