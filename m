From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: driver for Xtensa GPIO32
Date: Wed, 11 Dec 2013 13:32:47 +0100
Message-ID: <CACRpkdZV-G8GSE7R+2cfriA0JxAhQz0nzsWOqMP9MEnzkrBVBg@mail.gmail.com>
References: <9b46369ab60c23a6bd9f1930c4ff6c2fec57e798.1386057874.git.baruch@tkos.co.il>
	<CACRpkdb7nLg6op+_oi=PB2FnVcErQGDhHk82PHk7Os9rG1XVKg@mail.gmail.com>
	<20131205054327.GH32492@tarshish>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f181.google.com ([209.85.214.181]:37438 "EHLO
	mail-ob0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751319Ab3LKMcr (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Dec 2013 07:32:47 -0500
Received: by mail-ob0-f181.google.com with SMTP id uy5so6866358obc.40
        for <linux-gpio@vger.kernel.org>; Wed, 11 Dec 2013 04:32:47 -0800 (PST)
In-Reply-To: <20131205054327.GH32492@tarshish>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Baruch Siach <baruch@tkos.co.il>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, linux-xtensa@linux-xtensa.org

On Thu, Dec 5, 2013 at 6:43 AM, Baruch Siach <baruch@tkos.co.il> wrote:
> [Me]

>> If there is also going to be 16 or 64 bit versions of this thing
>> you better call the Kconfig symbol GPIO_XTENSA32 or
>> something.
>
> Not likely. This is a standard optional extension to the xtensa core
> architecture that is referred to in the documentation as GPIO32. This
> extension adds a few instructions to read into and write out from the core
> 32bit general purpose registers. I believe that future 16 or 64 bit versions
> are very unlikely.
>
> Anyway, given that xtensa is the name of the architecture, naming the driver
> gpio-xtensa32 would just confuse users.

OK.

> We need to preserve the irq flags. Let me know if the following is OK:
>
> static inline unsigned long enable_cp(void)
> {
>         unsigned long flags, cpenable;
>
>         local_irq_save(flags);
>         RSR_CPENABLE(cpenable);
>         WSR_CPENABLE(cpenable | XCHAL_CP_PORT_MASK);
>
>         return flags;
> }
>
> static inline void disable_cp(unsigned long flags)
> {
>         WSR_CPENABLE(cpenable);
>         local_irq_restore(flags);
> }

Looks OK.

>> > +static void xtensa_impwire_set_value(struct gpio_chip *gc, unsigned offset,
>> > +                                   int value)
>> > +{
>> > +}
>>
>> This is a rather nasty implementation for something that will always
>> fail. What about putting an dev_err(gc->dev, "..."); in that set_value?
>
> This is an input only device, so this callback should never run. Ideally it
> would be nice to just have it NULL, but the core gpiolib doesn't support that.
> Are you sure bloating the kernel with an error message that never displays is
> worth it?

Yes I am sure. If you think a few lines of error message is too much,
you can add a BUG(); here instead.

>> Why not device_initcall()? (i.e. same as module_init())
>> Do you need it very early?
>
> The main use case for this driver is for intra-core signaling, so it might be
> needed quite early I guess. I don't need any specific need for it to be
> available early at the moment, so I can change it device_initcall() if you
> prefer that.

Please do that for now, thanks. We shouldn't stick strange stuff
in because "may need later", as this can lead to weird stuff that people
don't dare to change. (Cargo-cult phenomenon.)

Yours,
Linus Walleij
