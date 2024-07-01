
zmienne
GPTAPIKEY="appkey"
GITHOMEREPO="/home/artur/projs/home"


`aa`
	`aa add ./file-name.config` => dodaje plik do chata gpt, tworzy twardy link w repo i dodaje plik do make
	`aa rm ./file-name.config` => usuwa
	`aa commit` => zatwierdza zmiany w repozytorium i aktualizuje chat gpt
	`aa reset` => resetuje zmiany i aktualizuje chat gpt
	`aa update` => wysyła aktualną wersję plików do chata gpt

`a` 
	`a this is what i want to ask gpt about`
	`a --file ./file-name.config --ask "i want to add possibility to restart service on receive hook"` => Otwiera vima z sugestią zmian  
		`af ./file-name.config i want to add possibility to restart service on receive hook` 



apt install -y apparmor-utils


Running kernel seems to be up-to-date.

The processor microcode seems to be up-to-date.

No services need to be restarted.

No containers need to be restarted.

No user sessions are running outdated binaries.

No VM guests are running outdated hypervisor (qemu) binaries on this host.
root@gurgul:~# aa-complain /usr/lib/ipsec/charon
Setting /usr/lib/ipsec/charon to complain mode.
root@gurgul:~# aa-complain /usr/lib/ipsec/stroke
Setting /usr/lib/ipsec/stroke to complain mode.



# Gitlab setup



git clone https://gitlab.com/gitlab-org/gitlab-foss.git
cd gitlab-foss
bundle config set --local path "$HOME/.gem"
bundle install -j$(nproc)




```

Last login: Mon Jul  1 14:27:58 on ttys001
➜  ~ xxd /Users/artur/Documents/Secrets/professional.xckey
00000000: bc6d a422 0696 c59e 9c97 ad8e 3ec6 8f01  .m."........>...
00000010: 896c 3020 b2d5 ddba bc87 9742 56b4 ab69  .l0 .......BV..i
00000020: ef73 ee57 b5e4 589f a23e 655d 47ca 9611  .s.W..X..>e]G...
00000030: f79c 8fb9 33ff c6a2 7b66 8c09 be2f 51c9  ....3...{f.../Q.
00000040: 55ba 5dfb ca9d c0a5 fe80 bd52 3cb5 fd28  U.]........R<..(
00000050: 020e 52df 20f5 0537 1922 2ac0 1dfe 6cdc  ..R. ..7."*...l.
00000060: ba3f bcd2 3fc3 b59b cb11 2dde 454d 4f27  .?..?.....-.EMO'
00000070: e733 5b04 21ac a14f b04e efae da9a 96b1  .3[.!..O.N......
➜  ~
```


```➜  ~ xxd -p /Users/artur/Documents/Secrets/professional.xckey | tr -d '\n'
bc6da4220696c59e9c97ad8e3ec68f01896c3020b2d5ddbabc87974256b4ab69ef73ee57b5e4589fa23e655d47ca9611f79c8fb933ffc6a27b668c09be2f51c955ba5dfbca9dc0a5fe80bd523cb5fd28020e52df20f5053719222ac01dfe6cdcba3fbcd23fc3b59bcb112dde454d4f27e7335b0421aca14fb04eefaeda9a96b1
```


https://wiki.gentoo.org/wiki/KeePassXC/cli

https://keepassxc.org/docs/KeePassXC_UserGuide



https://github.com/keepassxreboot/keepassxc/blob/develop/docs/man/keepassxc-cli.1.adoc