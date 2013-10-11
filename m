From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] RFC: gpio: add API to be strict about GPIO IRQ usage
Date: Fri, 11 Oct 2013 10:39:39 +0200
Message-ID: <CACRpkdZh_2v=_cudk2Kdq64DRtH1VPTECW0s15iaZAw4+ZW2Dg@mail.gmail.com>
References: <1380022390-21262-1-git-send-email-linus.walleij@linaro.org>
	<5241D12E.4050405@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ie0-f172.google.com ([209.85.223.172]:63636 "EHLO
	mail-ie0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753771Ab3JKIjj (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Oct 2013 04:39:39 -0400
Received: by mail-ie0-f172.google.com with SMTP id x13so7842558ief.3
        for <linux-gpio@vger.kernel.org>; Fri, 11 Oct 2013 01:39:39 -0700 (PDT)
In-Reply-To: <5241D12E.4050405@wwwdotorg.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Enric Balletbo i Serra <eballetbo@gmail.com>, Grant Likely <grant.likely@linaro.org>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>, Santosh Shilimkar <santosh.shilimkar@ti.com>

On Tue, Sep 24, 2013 at 7:51 PM, Stephen Warren <swarren@wwwdotorg.org> wrote:
> On 09/24/2013 05:33 AM, Linus Walleij wrote:

>> @@ -466,6 +478,13 @@ static int gpio_setup_irq(struct gpio_desc *desc, struct device *dev,
>>       if (ret < 0)
>>               goto free_id;
>>
>> +     ret = gpiod_lock_as_irq(desc);
>> +     if (ret < 0) {
>> +             gpiod_warn(desc,
>> +                        "failed to flag the GPIO for IRQ\n");
>> +             goto free_id;
>> +     }
>
> I believe gpio_setup_irq() can be called with flags==0 (disable IRQ
> usage) or flags!=0 (set up IRQ usage). As such, I believe that block of
> code needs to check flags, and either call gpiod_lock_as_irq() or
> gpio_unlock_as_irq() as appropriate.

Yep fixed this. Actually hardening the sysfs interface was just an
unexpected side effect of this, rather nice.

>> diff --git a/drivers/pinctrl/pinctrl-nomadik.c b/drivers/pinctrl/pinctrl-nomadik.c
>> @@ -795,6 +795,14 @@ static int nmk_gpio_to_irq(struct gpio_chip *chip, unsigned offset)
>>  {
>>       struct nmk_gpio_chip *nmk_chip =
>>               container_of(chip, struct nmk_gpio_chip, chip);
>> +     int ret;
>> +
>> +     ret = gpio_lock_as_irq(chip, offset);
>
> I don't think that gpio_to_irq() is the correct place to call the new
> function, for two reasons:
>
> 1)
>
> Not all paths that use interrupts call gpio_to_irq(). It's perfectly
> valid for a driver to receive an IRQ number, request it, and be done.
> The is commmon when a driver only cares about IRQ functionality and not
> GPIO functionality, and hence did not receive a GPIO and convert it to
> the IRQ.
>
> To solve this, I think irq_chip drivers should call the new gpiolib
> functions when the IRQ is actually requested or set up.
>
> Related, where does gpio_unlock_as_irq() get called in the Nomadik
> driver? It should happen when free_irq() is called.

Yeah if we formalize the criterion that interrupts out of any GPIO
chips should be possible to request without first getting it from the
<linux/gpio.h> interface, then this holds.

However that is not the whole story, is it? We have a gazillion
drivers calling irq_create_mapping() in this function, so I would
say that things are already a mess here.

One alternative is to do what gpio-tegra.c does and call
irq_create_mapping() on every GPIO line that can do IRQ in
probe(). However that is a bit sloppy is it not? Or is this what
we always want drivers to do? This has the side effect of showing
all these IRQs in /proc/interrupts but maybe that is not such
a big deal?

> 2)
>
> (Nit):
>
> The fact that gpio_to_irq() was called doesn't actually guarantee that
> the IRQ will be requested. Admittedly it's silly to call gpio_to_irq()
> if you're not going to request the IRQ, adn this can be considered a
> bug, but it can be done. This might happen (at least temporarily) due to
> deferred probe.

Yeah well you're right it's just supposed to be a translation function.

Part of me want to add an optional irqdomain to struct gpio_chip
and have gpio_to_irq() just call irq_find_mapping() by default
unless the driver specifies its own translation callback, because
I think this is what (modern) drivers should generally do.

What do you think about this refactoring idea?

Yours,
Linus Walleij
