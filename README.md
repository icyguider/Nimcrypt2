# Nimcrypt2
Nimcrypt2 is yet another PE packer/loader designed to bypass AV/EDR. It is an improvement on my original [Nimcrypt](https://github.com/icyguider/nimcrypt) project, with the main improvements being the use of direct syscalls and the ability to load regular PE files as well as raw shellcode.

Before going any further, I must acknowledge those who did the VAST majority of work and research that this project depends on. Firstly, I must thank [@byt3bl33d3r](https://twitter.com/byt3bl33d3r) for his [Offensive Nim repo](https://github.com/byt3bl33d3r/OffensiveNim), and [@ShitSecure](https://twitter.com/ShitSecure) for all of the code snippets he's publicly released. That is what the original version of this tool was created from, and the current version is no different. Particularly, the new PE loading functionality used in this tool is just an implementation of ShitSecure's recently released [Nim-RunPE](https://github.com/S3cur3Th1sSh1t/Nim-RunPE) code. I highly encourage sponsoring him for access to his own [Nim PE Packer](https://twitter.com/ShitSecure/status/1482428360500383755), which is no doubt a much better and more featureful version of this.

Additionally, I would like to thank [@ajpc500](https://twitter.com/ajpc500) for his [NimlineWhispers2](https://github.com/ajpc500/NimlineWhispers2) project that this tool uses for direct syscalls. I cannot stress enough how this project is simply an amalgamation of the public work of those previously mentioned, so all credit must go to them.

```
                      ___                                           
                   .-'   `'.                                        
                  /         \                                       
                  |         ;                                       
                  |         |           ___.--,                     
         _.._     |0) ~ (0) |    _.---'`__.-( (_.                   
  __.--'`_.. '.__.\    '--. \_.-' ,.--'`     `""`                   
 ( ,.--'`   ',__ /./;   ;, '.__.'`    __                            
 _`) )  .---.__.' / |   |\   \__..--""  ""'--.,_                    
`---' .'.''-._.-'`_./  /\ '.  \ _.-~~~````~~~-._`-.__.'             
      | |  .' _.-' |  |  \  \  '.               `~---`              
       \ \/ .'     \  \   '. '-._)                                  
        \/ /        \  \    `=.__`~-.   Nimcrypt v2               
   jgs  / /\         `) )    / / `"".`\                             
  , _.-'.'\ \        / /    ( (     / /  3-in-1 C#, PE, & Raw Shellcode Loader
   `--~`   ) )    .-'.'      '.'.  | (                              
          (/`    ( (`          ) )  '-;                             
           `      '-;         (-'                                   

Nimcrypt v 2.0

Usage:
  nimcrypt -f file_to_load -t csharp/raw/pe [-o <output>] [-p <process>] [-n] [-u] [-s] [-v]
  nimcrypt (-h | --help)

Options:
  -h --help     Show this screen.
  --version     Show version.
  -f --file filename     File to load
  -t --type filetype     Type of file (csharp, raw, or pe)
  -p --process process   Name of process for shellcode injection
  -o --output filename   Filename for compiled exe
  -u --unhook            Unhook ntdll.dll
  -v --verbose           Enable verbose messages during execution
  -n --no-randomization  Disable syscall name randomization
  -s --no-sandbox        Disable sandbox checks
```
#### Features:
* NtQueueApcThread Shellcode Execution w/ PPID Spoofing & 3rd Party DLL Blocking
* Syscall Name Randomization
* Ability to load .NET and Regular PE Files
* AES Encryption with Dynamic Key Generation
* Sandbox Evasion

#### Tested and Confirmed Working on:
* Windows 11 (10.0.22000)
* Windows 10 21H2 (10.0.19044)
* Windows 10 21H1 (10.0.19043)
* Windows 10 20H2 (10.0.19042)
* Windows 10 19H2 (10.0.18363)
* Windows Server 2019 (10.0.17763)

#### Installation/Dependencies:
Nimcrypt2 is designed to be used on Linux systems with Nim installed. Before installing Nim, you must ensure that you have the following packages installed via your package manager:
```
sudo apt install gcc mingw-w64 xz-utils git
```
To install Nim, I prefer to use [choosenim](https://github.com/dom96/choosenim) as follows:
```
curl https://nim-lang.org/choosenim/init.sh -sSf | sh
echo "export PATH=$HOME/.nimble/bin:$PATH" >> ~/.bashrc
export PATH=$HOME/.nimble/bin:$PATH
```

Nimcrypt2 also depends on a few packages that can be installed via Nimble. This can be done like so:
```
nimble install winim nimcrypto docopt ptr_math
```

With all the dependencies now installed, Nimcrypt2 can be compiled like so:
```
nim c -d=release --cc:gcc --embedsrc=on --hints=on --app=console --cpu=amd64 --out=nimcrypt nimcrypt.nim
```

#### Known Bugs:
* As [described](https://github.com/S3cur3Th1sSh1t/Nim-RunPE/blob/a117ecec635824703047c1d850607bdf2cfa628b/README.md?plain=1#L13) by ShitSecure, if the release version of mimikatz is loaded via the PE loader, it will not accept commands for some unknown reason. Using a version of mimikatz that was compiled from source fixes this issue.

#### Greetz & Credit:
* [@byt3bl33d3r](https://twitter.com/byt3bl33d3r) for their Offensive Nim project: https://github.com/byt3bl33d3r/OffensiveNim
* [@ShitSecure](https://twitter.com/ShitSecure) for their Nim-RunPE project: https://github.com/S3cur3Th1sSh1t/Nim-RunPE
* [@ajpc500](https://twitter.com/ajpc500) for their NimlineWhispers2 project: https://github.com/ajpc500/NimlineWhispers2
* [@Snovvcrash](https://twitter.com/snovvcrash) for their NimHollow project: https://github.com/snovvcrash/NimHollow
