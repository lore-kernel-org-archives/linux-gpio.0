From: =?iso-8859-1?Q?Jan_Kundr=E1t?= <jan.kundrat@cesnet.cz>
Subject: Re: [PATCH] pinctrl: mcp23s08: Allocate =?iso-8859-1?Q?irq=5Fchip_dynamic?=
Date: Fri, 08 Mar 2019 13:30:19 +0100
Message-ID: <a79af7cc-20e7-4a52-b77f-24f40ddca23d@cesnet.cz>
References: <20190111162516.28197-1-poeschel@lemonage.de>
 <CACRpkdZFFu=wgHw0BqXUHiC5euGwWuYbr5bH60zDvFr+q394=w@mail.gmail.com>
 <7ce47f34-ed9f-44ac-b966-68e3bbf3b052@cesnet.cz>
 <CACRpkdYJHyj+TMOde=veQsj8m+xFf0XGEnT0DS0qgMXCSA5iOA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdYJHyj+TMOde=veQsj8m+xFf0XGEnT0DS0qgMXCSA5iOA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Lars Poeschel <poeschel@lemonage.de>, "open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, Heikki Krogerus <heikki.krogerus@linux.intel.com>
List-Id: linux-gpio@vger.kernel.org

On p=C3=A1tek 8. b=C5=99ezna 2019 10:15:50 CET, Linus Walleij wrote:
> On Tue, Mar 5, 2019 at 4:19 PM Jan Kundr=C3=A1t <jan.kundrat@cesnet.cz> wro=
te:
>
>> This commit should probably go to 5.0-stable and 4.20-stable as well
>
> I doubt that this commit is fixing a regression, but who knows...
>> If I cherry-pick the following two commits to my 5.0, my board boots once
>> again:
>>=20
>> 16f4372fd7a5 pinctrl: mcp23s08: use struct_size() in devm_kzalloc()
>> 19ab5ca9b77d pinctrl: mcp23s08: Allocate irq_chip dynamic
>
> Hm weird.

My working theory is that this is because I have two physical chips on the=20=

same SPI CS. If I am correct, it works like this between 4.20 and current=20
gpio-next:

- GPIO expander #1 is initialized, including the irqchip
- GPIO expander #2 is initialized, and the irqchip initialization fails
- an interrupt on a shared IRQ line which is common to GPIO expanders #1=20
and #2 and one other unrelated device starts to be processed
- GPIO expander #1 says "not mine interrupt"
- GPIO expander #2 attempts to dereference a null pointer becase since=20
171948ea33e14, the gpiochip->irq.irq_enable/disable are not initialized

>> As on "why am I hitting this while nobody else did", my board has a shared=

>> IRQ line which is active during bootup, perhaps that might have something
>> to do with this -- I don't know.
>
> Sounds like the code in mcp23s08 .probe() should write to all
> registers clearing and disabling interrupts before proceeding to
> request interrupts or register the irqchip, else it will fire immediately
> and cause oopses.

I do not think that this would help me. My IRQ line is shared with another=20=

chip, so it can be physically asserted even if this particular GPIO=20
expander doesn't generate an interrupt.

I suspect that this configuration (multiple MCP23S17 on one SPI CS, and an=20=

IRQ line shared with something else) is quite rare...

With kind regards,
Jan
