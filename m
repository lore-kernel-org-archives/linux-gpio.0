From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: pca953x: Fix warning when HW interrupts are
 rescheduled by the softirq tasklet
Date: Thu, 25 Sep 2014 10:07:40 +0200
Message-ID: <CACRpkdYtjQC_hCiqSB7fidct6CjJ5kMbj0PegW3MEuouBajv+g@mail.gmail.com>
References: <1410251533-4990-1-git-send-email-LW@KARO-electronics.de>
	<CACRpkdbTXtx+EU4Dw1fxeThRUG4s5XvcJnAJ9PJd8i4KKGC65A@mail.gmail.com>
	<5421670D.10200@ti.com>
	<CACRpkdYCsdMcJY7Y0gK4_zPxiWRFKkzi2TaZUi1Vn7Kp0Cbgzg@mail.gmail.com>
	<5422B8F0.9060803@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ie0-f180.google.com ([209.85.223.180]:41847 "EHLO
	mail-ie0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751160AbaIYIHl (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 25 Sep 2014 04:07:41 -0400
Received: by mail-ie0-f180.google.com with SMTP id ar1so9947893iec.25
        for <linux-gpio@vger.kernel.org>; Thu, 25 Sep 2014 01:07:40 -0700 (PDT)
In-Reply-To: <5422B8F0.9060803@ti.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Grygorii Strashko <grygorii.strashko@ti.com>
Cc: =?UTF-8?Q?Lothar_Wa=C3=9Fmann?= <LW@karo-electronics.de>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>

On Wed, Sep 24, 2014 at 2:28 PM, Grygorii Strashko
<grygorii.strashko@ti.com> wrote:
> On 09/24/2014 02:17 PM, Linus Walleij wrote:

>> So PCA cannot use gpiochip_set_chained_irqchip()?
>
> Yes. It can't - pca is i2c device.

? I don't get this statement.

Why does the fact that it is an I2C device matter?
We have several devices that are in fact on top of
I2C (albeit as MFD cells) like gpio-tc3589x.c.

>> Anyway I feel I should fix this as per above for all
>> chips using that function, right?
>
> Pls note, the gpiochip_irqchip_add() is called before
> gpiochip_set_chained_irqchip() in all places now.

Yes, but the .map function isn't called until a client
wants to use an IRQ. And that won't happen until after
we exit the whole .probe() function.

> Also seems, we should assume that
> gpiochip_set_chained_irqchip() can be called
> few times and it could be unsafe to use it for storing parent_irq.

Well it happens in one single driver, and was done by me.
Maybe I should either disallow that, as that means we're adding
multiple parents (which is what you want, right?) or actually
implement it in a way so that multiple parents can be handled
by the helpers, by adding the parents to a list or something.

> So maybe it would be enough to just adding field for parent_irq
> in struct gpio_chip + fix for gpiochip_irq_map() to re-use it
> (to fix simple cases :).

Yes for the simple case. But maybe it's better to patch
gpiochip_set_chained_irqchip() to handle also the complex
case per above?

Yours,
Linus Walleij
