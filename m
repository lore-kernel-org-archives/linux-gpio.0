From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 05/33] gpio: add generic single-register fixed-direction
 GPIO driver
Date: Tue, 30 Aug 2016 23:47:09 +0200
Message-ID: <CACRpkdbNn0VXf7bHcfAq2qe2WpiZUxO-HRvikh4nv-svgJf+pg@mail.gmail.com>
References: <20160829102328.GA28796@n2100.armlinux.org.uk> <E1beJjz-0000mA-0o@rmk-PC.armlinux.org.uk>
 <CACRpkdZJy9gZwH9__qXAf6nURN7xV6CbOaGC-JL6X5rDHN55VQ@mail.gmail.com> <20160830214253.GP1041@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f43.google.com ([209.85.218.43]:35632 "EHLO
        mail-oi0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753969AbcH3VrL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 Aug 2016 17:47:11 -0400
Received: by mail-oi0-f43.google.com with SMTP id p186so10357009oia.2
        for <linux-gpio@vger.kernel.org>; Tue, 30 Aug 2016 14:47:10 -0700 (PDT)
In-Reply-To: <20160830214253.GP1041@n2100.armlinux.org.uk>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Russell King - ARM Linux <linux@armlinux.org.uk>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, linux-pcmcia@lists.infradead.org, Alexandre Courbot <gnurou@gmail.com>, Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, Kristoffer Ericson <kristoffer.ericson@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>

On Tue, Aug 30, 2016 at 11:42 PM, Russell King - ARM Linux
<linux@armlinux.org.uk> wrote:
> On Tue, Aug 30, 2016 at 11:25:19PM +0200, Linus Walleij wrote:

>> > +#define to_gpio_reg(x) container_of(x, struct gpio_reg, gc)
>>
>> You don't need that trickery anymore, just:
>>
>> > +static int gpio_reg_get_direction(struct gpio_chip *gc, unsigned offset)
>> > +{
>> > +       struct gpio_reg *r = to_gpio_reg(gc);
>>
>> struct gpio_reg *r = gpiochip_get_data(gc);
>>
>> (applied everywhere)
>
> I prefer my method by a long shot

Sure it's no strong preference. Keep it like this if you like.
I'm very happy with the series either way!

Yours,
Linus Walleij
