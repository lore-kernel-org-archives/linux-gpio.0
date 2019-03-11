From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: general protection fault in __bfs (2)
Date: Mon, 11 Mar 2019 15:49:52 +0200
Message-ID: <CAHp75VcBAxcB8G1Dr2-nPF6N9W27O=BY4buORs_nqTM=md1=oQ@mail.gmail.com>
References: <00000000000086d87305801011c4@google.com> <0000000000001d3a060583d187dd@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <0000000000001d3a060583d187dd@google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: syzbot <syzbot+c58fa3b1231d2ea0c4d3@syzkaller.appspotmail.com>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>, Borislav Petkov <bp@alien8.de>, "David S. Miller" <davem@davemloft.net>, Dou Liyang <douly.fnst@cn.fujitsu.com>, "H. Peter Anvin" <hpa@zytor.com>, jon.maloy@ericsson.com, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, "Brown, Len" <len.brown@intel.com>, Linus Walleij <linus.walleij@linaro.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@redhat.com>, netdev <netdev@vger.kernel.org>, puwen@hygon.cn, Mike Rapoport <rppt@linux.vnet.ibm.com>, syzkaller-bugs@googlegroups.com, Thomas Gleixner <tglx@linutronix.de>, tipc-discussion@lists.sourceforge.net, "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, Mar 11, 2019 at 3:27 PM syzbot
<syzbot+c58fa3b1231d2ea0c4d3@syzkaller.appspotmail.com> wrote:
>
> syzbot has bisected this bug to:
>
> commit 2646b90de5c3492db2ead71337fd4c7d7f549ebe
> Author: Linus Walleij <linus.walleij@linaro.org>
> Date:   Fri Oct 26 08:41:22 2018 +0000
>
>      gpio: Add global TODO file for GPIO
>

AI is not ready to conqueror the world!

> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=12589f8d200000
> start commit:   2646b90d gpio: Add global TODO file for GPIO
> git tree:       upstream
> final crash:    https://syzkaller.appspot.com/x/report.txt?x=11589f8d200000
> console output: https://syzkaller.appspot.com/x/log.txt?x=16589f8d200000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=8f00801d7b7c4fe6
> dashboard link: https://syzkaller.appspot.com/bug?extid=c58fa3b1231d2ea0c4d3
> userspace arch: amd64
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=15bab650c00000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=17a331df400000
>
> Reported-by: syzbot+c58fa3b1231d2ea0c4d3@syzkaller.appspotmail.com
> Fixes: 2646b90d ("gpio: Add global TODO file for GPIO")



-- 
With Best Regards,
Andy Shevchenko
