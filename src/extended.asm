; File for assembly instructions extended beyond boot sector

times 2048-($-$$) db 0 ;Fill four sectors with bytes