From: syzbot <syzbot+c58fa3b1231d2ea0c4d3@syzkaller.appspotmail.com>
Subject: Re: general protection fault in __bfs (2)
Date: Mon, 11 Mar 2019 06:27:01 -0700
Message-ID: <0000000000001d3a060583d187dd@google.com>
References: <00000000000086d87305801011c4@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <00000000000086d87305801011c4@google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: andy.shevchenko@gmail.com, bgolaszewski@baylibre.com, bp@alien8.de, davem@davemloft.net, douly.fnst@cn.fujitsu.com, hpa@zytor.com, jon.maloy@ericsson.com, konrad.wilk@oracle.com, len.brown@intel.com, linus.walleij@linaro.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, mingo@redhat.com, netdev@vger.kernel.org, puwen@hygon.cn, rppt@linux.vnet.ibm.com, syzkaller-bugs@googlegroups.com, tglx@linutronix.de, tipc-discussion@lists.sourceforge.net, x86@kernel.org, ying.xue@windriver.com
List-Id: linux-gpio@vger.kernel.org

syzbot has bisected this bug to:

commit 2646b90de5c3492db2ead71337fd4c7d7f549ebe
Author: Linus Walleij <linus.walleij@linaro.org>
Date:   Fri Oct 26 08:41:22 2018 +0000

     gpio: Add global TODO file for GPIO

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=12589f8d200000
start commit:   2646b90d gpio: Add global TODO file for GPIO
git tree:       upstream
final crash:    https://syzkaller.appspot.com/x/report.txt?x=11589f8d200000
console output: https://syzkaller.appspot.com/x/log.txt?x=16589f8d200000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8f00801d7b7c4fe6
dashboard link: https://syzkaller.appspot.com/bug?extid=c58fa3b1231d2ea0c4d3
userspace arch: amd64
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=15bab650c00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=17a331df400000

Reported-by: syzbot+c58fa3b1231d2ea0c4d3@syzkaller.appspotmail.com
Fixes: 2646b90d ("gpio: Add global TODO file for GPIO")
