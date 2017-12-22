From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: pinctrl-amd: What hardware does it apply to?
Date: Fri, 22 Dec 2017 08:48:22 +0100
Message-ID: <CACRpkdaSxJLbk_hN0mgURLk4u4ATbE-HvmX1yM+BWjcrzcKjXA@mail.gmail.com>
References: <6c675643-45ec-c57f-f1b2-afb25f3e947e@opengear.com>
 <2142688.oNeEzK9Weu@debian64> <5e17a846-b2c6-c078-3d90-bbf19aea2a8a@opengear.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f180.google.com ([209.85.223.180]:43092 "EHLO
        mail-io0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751069AbdLVHsY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Dec 2017 02:48:24 -0500
Received: by mail-io0-f180.google.com with SMTP id k202so15437625ioe.10
        for <linux-gpio@vger.kernel.org>; Thu, 21 Dec 2017 23:48:24 -0800 (PST)
In-Reply-To: <5e17a846-b2c6-c078-3d90-bbf19aea2a8a@opengear.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andrew Cooks <andrew.cooks@opengear.com>
Cc: Christian Lamparter <chunkeey@gmail.com>, linux-gpio@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nehal Shah <Nehal-bakulchandra.Shah@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, Ken Xue <Ken.Xue@amd.com>, Tobias Diedrich <ranma+kernel@tdiedrich.de>, Sudheesh Mavila <sudheesh.mavila@amd.com>, platypus-sw <platypus-sw@opengear.com>, alan@mizrahi.com.ve

On Fri, Dec 22, 2017 at 2:17 AM, Andrew Cooks <andrew.cooks@opengear.com> wrote:
> On 21/12/17 23:02, Christian Lamparter wrote:

>> Just a FYI: due to these difficulties with getting a gpio driver
>> upstream, Alan Mizrahi upstreamed an in-kernel led-apu.c driver [0]
>> that sort of bypasses the whole pinctrl vs gpio issue.
>
> Thanks, I saw that and was somewhat surprised to see it accepted.

I looked at the driver and it seems actually good and doing the
right thing. If I understand it right:

- It does a bunch of magic dmi_match() on DMI_BOARD_NAME
  to figure out what board this is.

- It then proceeds to register LEDs using some bits in the MMIO
  area that are used for LEDs.

So these bits/lines are actually not GPIO, since GPIO means
"general purpose input/output" - they are specific purpose and the
specific purpose can be detected.

So I don't have any objections from an architectural point of view.

Some may expose the register as GPIO and add LEDs on top but
it (using drivers/leds/leds-gpio.c) but that may be pointless extra
abstraction.

It has a deeper problem though. It is writing these GPIO registers
without any thought of someone else possibly accessing them and
without any shared locks.

This problem is usually solved by either using GPIO inbetween if
the GPIO driver takes care of protecting the register, or using
regmap, preferably with drivers/mfd/syscon.c, so that regmap will
protect the MMIO register.

So there may be technical reasons to use GPIO or syscon abstractions
that are not architectural reasons if you see what I mean.

If only these few GPIO lines are actually used and only used for
these LEDs, (the rest of the bits in the register unused) then this
driver is as good as any.

Yours,
Linus Walleij
