From: Daniel Drake <drake@endlessm.com>
Subject: intel-gpio interrupts stop firing with Focaltech I2C-HID touchpad
Date: Thu, 16 Nov 2017 11:38:33 +0000
Message-ID: <CAD8Lp47LZs6qbd00CDeX4s-eQkqf1dGO9VaFXuCaReQ2yE73Og@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ot0-f181.google.com ([74.125.82.181]:44967 "EHLO
        mail-ot0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934387AbdKPLie (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Nov 2017 06:38:34 -0500
Received: by mail-ot0-f181.google.com with SMTP id o23so11406618otd.1
        for <linux-gpio@vger.kernel.org>; Thu, 16 Nov 2017 03:38:34 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: mika.westerberg@linux.intel.com, heikki.krogerus@linux.intel.com
Cc: Chris Chiu <chiu@endlessm.com>, linux-gpio@vger.kernel.org, Linux Kernel <linux-kernel@vger.kernel.org>, Endless Linux Upstreaming Team <linux@endlessm.com>

Hi,

We have 2 new laptop samples which use ACPI GpioInt for the I2C-HID
touchpad interrupt (via intel-gpio) and both models face different
issues related to this interrupt, which is level-triggered active low
(as defined by i2c-hid spec), and ultimately handled by a threaded
interrupt handler in the i2c-hid driver.

The first model that we are looking at is Asus X540NA SKU3 using a
Focaltech touchpad, Intel Apollo Lake using pinctrl-broxton. The
touchpad stops responding after a short period of usage. An easy
reproducer is to touch with 2 fingers. At this point, no more
intel-gpio interrupts appear and the touchpad can no longer be used.

Is there any documentation available for the registers that intel-gpio
works with? We have tried several experiments but have been unable to
really understand the behaviour of the hardware here.

We are using this base patch for debugging:
https://gist.github.com/dsd/1f10c6c818569ceec11f910ad8a07228
It logs the register values before and after each operation, and also
has a timer showing the same reg values every 1 second.

With this patch applied, here are the boot logs showing initial
(succesful) probing of the touchpad:
https://gist.github.com/dsd/2d7cd918e13b7cbabccd53a4e0c28c88

And here is a later log snippet showing the touchpad being used,
before interrupts stop arriving @ 130.883810 on line 3341
https://gist.github.com/dsd/dc6cbdb4690285977004cf076c7a8f55
On line 3342 onwards, the debug timer is logging the state of the
hardware, showing that the GPIO is low (PADCFG0=40900100), the
interrupt is enabled (IE=40000), the interrupt is pending (IS=40000)
but yet no interrupt arrives.

When interrupts do work, the basic sequence of events is:
 - intel-gpio hardware interrupt fires
 - call generic_handle_irq()
 - mask (unset bit in IE register)
 - ack (unset bit in IS register)
 - Enter i2c_hid threaded IRQ handler some time later
 - i2c_hid threaded IRQ handler returns
 - unmask (set bit in IE register)

I experimented with this sequence of events, and I found that if I
don't mask/unmask, but instead move the ack until several seconds
later, then no more interrupts will arrive til the ack.
So if is it the ack that seems to make the hardware start re-sampling
the GPIO level in order to generate more interupts, should that be
done only after the IRQ handler has finished?

3 experiments with that idea, each link both with the incremental
patch and the resultant logs:

1. Move the ack to happen right after unmask in the above sequence
https://gist.github.com/dsd/7d1de6ce43602fd4181c456c528fad7e

2. Move the ack to happen right before unmask
https://gist.github.com/dsd/eefffcb1d55078e7d7a6525115400412

3. Ack at that same point in the sequence but don't mask/unmask at all
https://gist.github.com/dsd/3372599ea5f925a1e9bbf76c5c3d7a96

Unfortunately in 3 all cases the problem is the same, the interrupts
soon stop firing even though IE/IS/PADCFG0 all suggest that another
interrupt is pending.

Maybe it is not the ack behaviour that is wrong here. Ultimately we
found a nasty workaround where we detect the above conditions and then
mask and unmask the interrupt and that is enough to kick things off
again.
https://github.com/endlessm/linux/commit/34d7fb46383f9f91d5d2514e155fba913fa02440

Any ideas? We would like to find a correct and upstreamable solution.

I'll also start another thread for the other product (with i2c-hid
ELAN touchpad) which is also having trouble with intel-gpio, although
that one is getting too many interrupts rather than too few. We are
still studying it.

Daniel
