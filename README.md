# Automatic Install Windows 10

Install Windows 10 automatically. 

Scripts that can be compiled into an iso, to be launched on the Windows installation screen

### Quick explanation: 


These are scripts in `.bat` format
You'll be able to install Windows with virtually complete automation.

A considerable time-saver for all VM players and test administrators.

We'll add a Windows 10 image to the machine, then add our image to access the script at the same time as the Windows 10 image.

You'll need to compile them into an `.iso` and either mount it or burn it (a simple copy on a usb can also work for other uses).

Don't worry, there'll be a tutorial on how to compile them in `.iso`.

We'll clean and convert the disk to mbr or gpt, then install the windows image which is in a second `.iso` mounted on the machine to be installed, and finally we'll be able to pass on a large part of the user and hardware configuration.


## Get Started

**For a quick configuration without custom disk formats or partitions, please ignore the commands between (optionnal)(/optionnal)**

(optionnal)
### Configure Diskpart



(/optionnal)



### Credits:
The repo that inspired all this, many thanks.

https://gist.github.com/Alee14/e8ce6306a038902df6e7a6d667544ac9
