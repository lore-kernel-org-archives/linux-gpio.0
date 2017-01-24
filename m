From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: controlling pinctrl GPIOs from userspace on x86
Date: Tue, 24 Jan 2017 14:08:15 +0100
Message-ID: <CACRpkdaNBiyEqRYgoD-k+TEC90_fq-LAnfH3uJ6Ar8OqjWooZg@mail.gmail.com>
References: <9201895.LkQO1ovFfJ@rdx.n.i2n>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f177.google.com ([209.85.223.177]:35465 "EHLO
        mail-io0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750710AbdAXNIR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 24 Jan 2017 08:08:17 -0500
Received: by mail-io0-f177.google.com with SMTP id j18so134433212ioe.2
        for <linux-gpio@vger.kernel.org>; Tue, 24 Jan 2017 05:08:17 -0800 (PST)
In-Reply-To: <9201895.LkQO1ovFfJ@rdx.n.i2n>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "Gerd v. Egidy" <lists@egidy.de>, Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Tue, Dec 6, 2016 at 11:34 PM, Gerd v. Egidy <lists@egidy.de> wrote:

> I have a x86 mainboard with a Intel Sunrise Point chipset.

I think you should address Mika Westerberg, he know all stuff Intel GPIO.

> One function I want
> to control is tied to a specific GPIO on the chipset (GPP_E1 / SATAXPCIE_1).
> There seems to be a driver for this in the kernel:
> pinctrl/intel/pinctrl-sunrisepoint.c
>
> The easiest solution for me would be if I could control this GPIO from
> userspace.

- What kernel version are you running?

- Have you tried compiling tools/gpio/* and running "lsgpio"?
  https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/tools/gpio

> I have seen examples where a pin from pinctrl is made available to the "gpio"
> driver with a devicetree setting on arm devices. But I have a x86 system with
> a classic BIOS, so no devicetree here to help me.

Pin control per se is not available from userspace, only GPIO.
We only expose GPIO lines to userspace from the GPIO
subsystem.

That said, GPIO can use pin control as a back-end and pin control
drivers are often "dual devices" registering both pin control and GPIO.

> I have seen that there is pinconf which should give some info and control over
> pinctrl through debugfs, correct?.

Nope. debugfs is for debugging, development, not for proper use.
We always thought the name "debugfs" would strike a chord :D

Use the GPIO character device as exemplified with tools/gpio/*

> So I enabled CONFIG_PINCONF, but after
> loading the pinctrl-sunrisepoint module I could not see anything relating to
> this show up in /sys/kernel/debug.

That is probably because you need to:

- Enable CONFIG_DEBUGFS
- mount debugfs on /sys/kernel/debug

Yours,
Linus Walleij
