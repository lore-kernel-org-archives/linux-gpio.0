From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3] RFC: pinctrl: bcm2835: switch to GPIOLIB_IRQCHIP
Date: Fri, 2 Dec 2016 13:34:28 +0100
Message-ID: <CACRpkdZ4hyba86jNzQeMw+sc4fLhss+EhdQE1kKWW7V0fe7Zzw@mail.gmail.com>
References: <1479145925-3578-1-git-send-email-linus.walleij@linaro.org> <87twapddff.fsf@eliezer.anholt.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qk0-f173.google.com ([209.85.220.173]:33633 "EHLO
        mail-qk0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755258AbcLBMea (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 2 Dec 2016 07:34:30 -0500
Received: by mail-qk0-f173.google.com with SMTP id x190so277060272qkb.0
        for <linux-gpio@vger.kernel.org>; Fri, 02 Dec 2016 04:34:30 -0800 (PST)
In-Reply-To: <87twapddff.fsf@eliezer.anholt.net>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Eric Anholt <eric@anholt.net>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, linux-rpi-kernel <linux-rpi-kernel@lists.infradead.org>, Stefan Wahren <stefan.wahren@i2se.com>

On Wed, Nov 30, 2016 at 1:22 AM, Eric Anholt <eric@anholt.net> wrote:
> Linus Walleij <linus.walleij@linaro.org> writes:
>
>> It should be possible to use the GPIOLIB_IRQCHIP helper
>> library with the BCM2835 driver since it is a pretty straight
>> forward cascaded irqchip.
>>
>> The only difference from other drivers is that the BCM2835
>> has several banks for a single gpiochip, and each bank has
>> a separate IRQ line. Instead of creating one gpiochip per
>> bank, a single gpiochip covers all banks GPIO lines. This
>> makes it necessary to resolve the bank ID in the IRQ
>> handler.
>>
>> The GPIOLIB_IRQCHIP allows several IRQs to be cascaded off
>> the same gpiochip by calling gpiochip_set_chained_irqchip()
>> repeatedly, but we have been a bit short on examples
>> for how this should be handled in practice, so this is intended
>> as an example of how this can be achieved.
>>
>> The old code did not model the chip as a chained interrupt
>> handler, but this patch also rectifies that situation.
>
> I went ahead and put together a little bit of test code for HDMI to
> collect hotplug interrupts.  By registering the GPIO IRQ from the
> driver, I'm seeing my line in /proc/interrupts and its count increments
> when I plug/unplug.  Given that, feel free to apply:
>
> Tested-by: Eric Anholt <eric@anholt.net>
> Acked-by: Eric Anholt <eric@anholt.net>

Thanks Eric, patch applied!

I'm very happy with the state of the driver now, given the
commonality of the hardware I like to have some drivers be
ideally implemented and a pattern for others to follow. The
BCM2835 is pretty much like that now :)

Yours,
Linus Walleij
