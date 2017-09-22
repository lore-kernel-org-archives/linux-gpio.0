From: Daniel Drake <drake@endlessm.com>
Subject: pinctrl-amd: GPIO interrupts not behaving correctly
Date: Fri, 22 Sep 2017 11:51:44 +0800
Message-ID: <CAD8Lp44PLhFen1dKboBM5bQYDT4heeW-Vv37HvSFO7+ys8gzjw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f180.google.com ([209.85.223.180]:57265 "EHLO
        mail-io0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751795AbdIVDvp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 21 Sep 2017 23:51:45 -0400
Received: by mail-io0-f180.google.com with SMTP id m103so350274iod.13
        for <linux-gpio@vger.kernel.org>; Thu, 21 Sep 2017 20:51:45 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Ken.Xue@amd.com, Shyam-sundar.S-k@amd.com, Nehal-bakulchandra.Shah@amd.com
Cc: Linux Upstreaming Team <linux@endlessm.com>, linux-gpio@vger.kernel.org, Chris Chiu <chiu@endlessm.com>

Hi,

We are working with several AMD-based laptop models which are having
trouble with I2C-HID touchpads (from 2 touchpad vendors). The same
touchpads work fine on non-AMD setups.

These setups use a GPIO as the I2C-HID interrupt source, and in the
problematic cases this GPIO is managed by pinctrl-amd. The laptop I am
looking at today has a AMD E2-9000 RADEON R2 SoC.

Under the I2C-HID spec, the device interrupt is level-triggered. When
the touchpad has data to report, it will bring the GPIO level low
(this is active-low), which should signal the host to read input
report data. The device will hold the GPIO low until there is no more
data that needs to be delivered.

The user-visible problem is that the touchpad appears to stop
responding after a short period of usage. At the i2c-hid driver level,
no more interrupts are arriving. We have checked with a scope that the
interrupt line is being held low at this point, which should mean that
the interrupt handler should be executed again since there is more
data to be read, but that is not happening here.

An easy way to reproduce this issue is to press multiple fingers on
the touchpad, which will result in a large amount of input data to be
queued up on the device side; however the interrupt handler will soon
stop firing so not all the data will be read, and everything stops
there...

We observed that at the point where no more interrupts arrive, no
EOI_MASK write was sent at the point when i2c_irq_hid returned for the
last time (and is never called again). We found a potential solution
to this problem: by adding the IRQCHIP_EOI_THREADED flag, an EOI will
be sent at this point, and we are now unable to get the touchpad to
hang.

But I have some doubts when reviewing this change, and don't really
handle the relationship between amd-pinctrl's irq_enable / irq_disable
/ irq_mask / irq_unmask / irq_eoi functions.

The first thing that I find rather strange is that even with no
modifications, irq_mask is not doing what I think it should. I have
added printks to those functions plus amd_gpio_irq_handler() and
i2c_hid_irq() and this is the result when I use the touchpad:

 amd_gpio_irq_handler status=1f00000000200000
 amd_gpio_irq_mask hwirq=86
 amd_gpio_irq_handler signal EOI
 amd_gpio_irq_handler status=1f00000000200000
 amd_gpio_irq_handler signal EOI
 amd_gpio_irq_handler status=1f00000000200000
 amd_gpio_irq_handler signal EOI
 amd_gpio_irq_handler status=1f00000000200000
 i2c_hid_irq enter
 [...]

The first line is where I touched the touchpad, generating an
interrupt. On the next line, the interrupt is masked, which should now
mean that this GPIO interrupt does not fire any more until it is
unmasked, right?

Then on line 3 we send EOI and on line 4 the interrupt fires again -
even though it is masked. And it fires again and again, firing a total
of 4 times before i2c_hid_irq is called (this is a threaded interrupt
handler, so there is some delay), and it goes on and on like this.

So amd_gpio_irq_mask seems to have no effect. I also tried
amd_gpio_irq_disable at this point and no change; amd_gpio_irq_handler
keeps firing with the same status value.

I tried eliminating the EOI sending in amd_gpio_irq_handler, thinking
that we should maybe only send EOI at the point where i2c_hid_irq has
really finished and is ready to fire again, but this results in
amd_gpio_irq_handler being called repeatedly wth status value
1f00000000000000 and instantaneously resulting in "irq 7 nobody cared"
since that status value does not map to any IRQs to handle.

Are there any specifications available that can help me understand the
usage and behaviour of the registers controlled by pinctrl-amd?

Can anyone explain why irq_mask is apparently not having any effect?
Any ideas towards solutions if the IRQCHIP_EOI_THREADED flag addition
is not correct in itself?

Thanks
Daniel
