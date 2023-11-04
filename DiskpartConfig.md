# Diskpart Configuration

Currently supports MBR and UEFI (gpt) format

These are initial scripts, they can be totally free of imterpretation.

## MBR

Sources: https://gist.github.com/Alee14/e8ce6306a038902df6e7a6d667544ac9#mbr

Here's the complete MBR configuration with the most interesting options : 

```
list disk
select disk (number for main disk)
clean 
convert mbr

(Creating recovery is optional)
create part primary size 500
format quick label Recovery
assign letter R
set id 27

create part primary
format quick label Windows (or label of your choice)
assign letter C (or E)
active
```

MBR configuration sufficient :

```
list disk
select disk 0
clean
convert mbr
create part primary
format quick label Windows
assign letter C
active
```

**<!>  Keep in mind the letter you use for the main drive.**


## Gpt/UEFI

Sources: https://gist.github.com/Alee14/e8ce6306a038902df6e7a6d667544ac9#uefi

Here's the complete GPT configuration with the most interesting options : 

```
list disk
select disk (number for main disk)
clean # Clearing the partitions
convert gpt
create part efi size 512
format fs fat32 quick
assign letter w
create part msr size 16

(Creating recovery is optional)
create part primary size 500
format quick label Recovery
assign letter R
set id de94bba4-06d1-4d40-a16a-bfd50179d6ac
gpt attributes 0x8000000000000001

create part primary 
format quick label Windows (or label of your choice)
assign letter C (or E)
```

GPT configuration sufficient :

```
list disk
select disk 0
clean 
convert gpt
create part efi size 512
format fs fat32 quick
assign letter w
create part msr size 16
create part primary 
format quick label Windows
assign letter C 
```
**<!>  Keep in mind the letter you use for the main drive.**

## Credit

I didn't invent anything.

Thanks to him.

https://gist.github.com/Alee14/e8ce6306a038902df6e7a6d667544ac9
