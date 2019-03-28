From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: general protection fault in __bfs (2)
Date: Thu, 28 Mar 2019 17:47:40 +0100
Message-ID: <CACRpkdZ0H-zmaeM02=OhFCwW914_qYoxNMJReERFcZPtgz3FwA@mail.gmail.com>
References: <00000000000086d87305801011c4@google.com> <0000000000001d3a060583d187dd@google.com>
 <CAHp75VcBAxcB8G1Dr2-nPF6N9W27O=BY4buORs_nqTM=md1=oQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75VcBAxcB8G1Dr2-nPF6N9W27O=BY4buORs_nqTM=md1=oQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: syzbot <syzbot+c58fa3b1231d2ea0c4d3@syzkaller.appspotmail.com>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Borislav Petkov <bp@alien8.de>, "David S. Miller" <davem@davemloft.net>, Dou Liyang <douly.fnst@cn.fujitsu.com>, "H. Peter Anvin" <hpa@zytor.com>, jon.maloy@ericsson.com, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, "Brown, Len" <len.brown@intel.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@redhat.com>, netdev <netdev@vger.kernel.org>, puwen@hygon.cn, Mike Rapoport <rppt@linux.vnet.ibm.com>, syzkaller-bugs@googlegroups.com, Thomas Gleixner <tglx@linutronix.de>, tipc-discussion@lists.sourceforge.net, "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x8>
List-Id: linux-gpio@vger.kernel.org

On Mon, Mar 11, 2019 at 2:50 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Mon, Mar 11, 2019 at 3:27 PM syzbot
> <syzbot+c58fa3b1231d2ea0c4d3@syzkaller.appspotmail.com> wrote:
> >
> > syzbot has bisected this bug to:
> >
> > commit 2646b90de5c3492db2ead71337fd4c7d7f549ebe
> > Author: Linus Walleij <linus.walleij@linaro.org>
> > Date:   Fri Oct 26 08:41:22 2018 +0000
> >
> >      gpio: Add global TODO file for GPIO
>
> AI is not ready to conqueror the world!

Haha yeah it feels good that syzbot seems wrong... this time :D

Yours,
Linus Walleij
