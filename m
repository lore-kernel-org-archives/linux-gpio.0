From: Axel Lin <axel.lin@ingics.com>
Subject: Re: [PATCH RFT] gpio: zevio: Get correct gpio output value
Date: Tue, 8 Apr 2014 07:57:45 +0800
Message-ID: <CAFRkauAq=6va_iH9OnUL8nq0Mf+0+HcDVk0gDurMAEx7BFx=pA@mail.gmail.com>
References: <1396852492.26619.1.camel@phoenix>
	<1456321.rfNnq0vY8Z@fabians-laptop.fritz.box>
	<20140407191035.GH11339@book.gsilab.sittig.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qa0-f46.google.com ([209.85.216.46]:34097 "EHLO
	mail-qa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754309AbaDGX5q (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Apr 2014 19:57:46 -0400
Received: by mail-qa0-f46.google.com with SMTP id i13so163611qae.33
        for <linux-gpio@vger.kernel.org>; Mon, 07 Apr 2014 16:57:45 -0700 (PDT)
In-Reply-To: <20140407191035.GH11339@book.gsilab.sittig.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Gerhard Sittig <gsi@denx.de>
Cc: Fabian Vogt <fabian@ritter-vogt.de>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org

>> > @@ -81,9 +81,15 @@ static inline void zevio_gpio_port_set(struct zevio_gpio *c, unsigned pin,
>> >  static int zevio_gpio_get(struct gpio_chip *chip, unsigned pin)
>> >  {
>> >     struct zevio_gpio *controller = to_zevio_gpio(chip);
>> > +   u32 val, dir;
>> >
>> > -   /* Only reading allowed, so no spinlock needed */
>> > -   u32 val = zevio_gpio_port_get(controller, pin, ZEVIO_GPIO_INPUT);
>> > +   spin_lock(&controller->lock);
>> > +   dir = zevio_gpio_port_get(controller, pin, ZEVIO_GPIO_DIRECTION);
>> > +   if (dir | BIT(ZEVIO_GPIO_BIT(pin)))
>> > +           val = zevio_gpio_port_get(controller, pin, ZEVIO_GPIO_INPUT);
>> > +   else
>> > +           val = zevio_gpio_port_get(controller, pin, ZEVIO_GPIO_OUTPUT);
>> > +   spin_unlock(&controller->lock);
>
> As a side effect of your making me look at the code:
>
> Is the if() not an "always true" condition?  Should this be
> s/|/\&/ instead?
You are right, I'm sending a v2 now.

Thanks for the review,
Axel
