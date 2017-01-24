From: "Gerd v. Egidy" <lists@egidy.de>
Subject: Re: controlling pinctrl GPIOs from userspace on x86
Date: Wed, 25 Jan 2017 00:25:20 +0100
Message-ID: <4151584.CJCGa0bWPQ@rdx.n.i2n>
References: <9201895.LkQO1ovFfJ@rdx.n.i2n> <CACRpkdaNBiyEqRYgoD-k+TEC90_fq-LAnfH3uJ6Ar8OqjWooZg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from rp02.intra2net.com ([62.75.181.28]:37228 "EHLO
        rp02.intra2net.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750902AbdAXXbJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 24 Jan 2017 18:31:09 -0500
In-Reply-To: <CACRpkdaNBiyEqRYgoD-k+TEC90_fq-LAnfH3uJ6Ar8OqjWooZg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Hi Linus,

thank you for answering after such a long time.

> - What kernel version are you running?

I tried it with a 4.8.12 which was reasonably current when I tried it in 
december.

> - Have you tried compiling tools/gpio/* and running "lsgpio"?

nope.

> That said, GPIO can use pin control as a back-end and pin control
> drivers are often "dual devices" registering both pin control and GPIO.

The pinctrl-sunrisepoint driver does not seem to be such a dual device.

What other ways instead of a dual device driver are there to expose pin 
control pins through the GPIO subsystem?

Is there some kind of translation driver which takes a pinctrl pin with some 
extra information (like push-pull vs. open drain etc.) and creates a user 
accessible entry in the gpio subsystem from it?

If not, wouldn't it make sense to have such a thing?

> Nope. debugfs is for debugging, development, not for proper use.
> We always thought the name "debugfs" would strike a chord :D
> 
> Use the GPIO character device as exemplified with tools/gpio/*

But that just works with stuff exposed by the gpio subsystem, not pure pinctrl, 
correct?

> > So I enabled CONFIG_PINCONF, but after
> > loading the pinctrl-sunrisepoint module I could not see anything relating
> > to this show up in /sys/kernel/debug.
> 
> That is probably because you need to:
> 
> - Enable CONFIG_DEBUGFS
> - mount debugfs on /sys/kernel/debug

those were enabled & mounted. The rest of debugfs was available.

I dug a bit deeper in the source and to me it seemed like the pinctrl-
sunrisepoint module expects that there is a matching device entry in the ACPI 
table presented by the BIOS. I added a printk to spt_pinctrl_probe() and it 
was never called.

I have no control over the BIOS and the ACPI tables it presents. I know I 
could completely replace them, but this is a bit more involved.

According to the datasheet of the sunrisepoint chipset, you can't access the 
gpio resources of the chipset directly, but have to do that through the P2SB 
sideband interface. Other affected drivers, e.g. i2c-i801.c have code to handle 
that. I do not see anything like that in the pinctrl-sunrisepoint driver. I 
don't know how this is supposed to work. I guess that you need some help from 
the BIOS to make it work.

Mika, could you explain how this was designed to be used?

Kind regards,

Gerd

