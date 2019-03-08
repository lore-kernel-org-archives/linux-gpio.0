From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: mcp23s08: Allocate irq_chip dynamic
Date: Fri, 8 Mar 2019 10:15:50 +0100
Message-ID: <CACRpkdYJHyj+TMOde=veQsj8m+xFf0XGEnT0DS0qgMXCSA5iOA@mail.gmail.com>
References: <20190111162516.28197-1-poeschel@lemonage.de> <CACRpkdZFFu=wgHw0BqXUHiC5euGwWuYbr5bH60zDvFr+q394=w@mail.gmail.com>
 <7ce47f34-ed9f-44ac-b966-68e3bbf3b052@cesnet.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <7ce47f34-ed9f-44ac-b966-68e3bbf3b052@cesnet.cz>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?SmFuIEt1bmRyw6F0?= <jan.kundrat@cesnet.cz>
Cc: Lars Poeschel <poeschel@lemonage.de>, "open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, Heikki Krogerus <heikki.krogerus@linux.intel.com>
List-Id: linux-gpio@vger.kernel.org

On Tue, Mar 5, 2019 at 4:19 PM Jan Kundr=C3=A1t <jan.kundrat@cesnet.cz> wro=
te:

> This commit should probably go to 5.0-stable and 4.20-stable as well

I doubt that this commit is fixing a regression, but who knows...
> If I cherry-pick the following two commits to my 5.0, my board boots once
> again:
>
> 16f4372fd7a5 pinctrl: mcp23s08: use struct_size() in devm_kzalloc()
> 19ab5ca9b77d pinctrl: mcp23s08: Allocate irq_chip dynamic

Hm weird.

> As on "why am I hitting this while nobody else did", my board has a share=
d
> IRQ line which is active during bootup, perhaps that might have something
> to do with this -- I don't know.

Sounds like the code in mcp23s08 .probe() should write to all
registers clearing and disabling interrupts before proceeding to
request interrupts or register the irqchip, else it will fire immediately
and cause oopses.

Yours,
Linus Walleij
