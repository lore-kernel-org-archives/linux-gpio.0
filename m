From: Anatol Pomozov <anatol.pomozov@gmail.com>
Subject: NULL crash in lp_gpio_irq_handler
Date: Sat, 16 Apr 2016 21:37:31 -0700
Message-ID: <CAOMFOmXUc_dkv5WHh+qQ=AAs03Pg+Uz+_1rbj0TH_7coODAjeA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f172.google.com ([209.85.213.172]:38131 "EHLO
	mail-ig0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751106AbcDQEhc (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 17 Apr 2016 00:37:32 -0400
Received: by mail-ig0-f172.google.com with SMTP id y9so972738igg.1
        for <linux-gpio@vger.kernel.org>; Sat, 16 Apr 2016 21:37:31 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, ldewangan@nvidia.com, Linus Walleij <linus.walleij@linaro.org>

I have several chromeboxes where I use ezScript firmware [1] compiled
from upstream coreboot source. The boxes have Arch Linux installed.

Since kernel 4.2 (or 4.3 or don't remember exactly) I started getting
boot time crash that comes from gpio_lynxpoint module, function
lp_gpio_irq_handler(). The crash happens at ~20% of all boot.

Here is the full crash log [2]. It says crash happens in
lp_gpio_irq_handler+0x2b that points to the given assembler code:

00000000000003a0 <lp_gpio_irq_handler>:
 3a0:   e8 00 00 00 00          callq  3a5 <lp_gpio_irq_handler+0x5>
 3a5:   55                      push   %rbp
 3a6:   48 8d 47 28             lea    0x28(%rdi),%rax
 3aa:   48 89 e5                mov    %rsp,%rbp
 3ad:   41 57                   push   %r15
 3af:   41 56                   push   %r14
 3b1:   41 55                   push   %r13
 3b3:   41 54                   push   %r12
 3b5:   45 31 e4                xor    %r12d,%r12d
 3b8:   53                      push   %rbx
 3b9:   41 be 01 00 00 00       mov    $0x1,%r14d
 3bf:   48 83 ec 10             sub    $0x10,%rsp
 3c3:   48 89 45 d0             mov    %rax,-0x30(%rbp)
 3c7:   48 8b 47 08             mov    0x8(%rdi),%rax
 3cb:   4c 8b 78 20             mov    0x20(%rax),%r15
^^^^^^^^^^ THE CRASH HAPPENS HERE, rax is 0 ^^^^^^^^^^^^
 3cf:   48 8b 47 40             mov    0x40(%rdi),%rax
 3d3:   66 41 83 bf 94 00 00    cmpw   $0x0,0x94(%r15)
 3da:   00 00
 3dc:   48 89 45 c8             mov    %rax,-0x38(%rbp)
 3e0:   74 7c                   je     45e <lp_gpio_irq_handler+0xbe>
 3e2:   49 8b 47 20             mov    0x20(%r15),%rax
 3e6:   44 89 e1                mov    %r12d,%ecx
 3e9:   c1 e9 05                shr    $0x5,%ecx
 3ec:   c1 e1 02                shl    $0x2,%ecx
 3ef:   48 8b b8 00 01 00 00    mov    0x100(%rax),%rdi
 3f6:   48 8d 94 0f 80 00 00    lea    0x80(%rdi,%rcx,1),%rdx

Any ideas what is the problem with the driver and why it is random?
How to debug the problem?


[1] http://forum.kodi.tv/showthread.php?tid=194362
[2] https://goo.gl/FyFZg9
