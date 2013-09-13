From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/7] misc: ixp4-beeper: use gpiolib strictly
Date: Fri, 13 Sep 2013 10:35:26 +0200
Message-ID: <CACRpkdamJBKPcCCi0U6C7SY8fD9pR9-e+_k9EGHXLyAfcRvcQA@mail.gmail.com>
References: <1378816226-8016-1-git-send-email-linus.walleij@linaro.org>
	<522FCE28.8020909@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f180.google.com ([209.85.214.180]:43446 "EHLO
	mail-ob0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751779Ab3IMIf1 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 13 Sep 2013 04:35:27 -0400
Received: by mail-ob0-f180.google.com with SMTP id wm4so823508obc.39
        for <linux-gpio@vger.kernel.org>; Fri, 13 Sep 2013 01:35:26 -0700 (PDT)
In-Reply-To: <522FCE28.8020909@nvidia.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alex Courbot <acourbot@nvidia.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Imre Kaloz <kaloz@openwrt.org>, Krzysztof Halasa <khc@pm.waw.pl>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>

On Wed, Sep 11, 2013 at 3:58 AM, Alex Courbot <acourbot@nvidia.com> wrote:
> On 09/10/2013 09:30 PM, Linus Walleij wrote:
>>         /* flip the beeper output */
>> -       *IXP4XX_GPIO_GPOUTR ^= (1 << (unsigned int) dev_id);
>> +       gpio_set_value(pin, ~gpio_get_value(pin));
>
>
> Don't you want
>
>         gpio_set_value(pin, !gpio_get_value(pin));
>
> instead? From the deleted line I suppose you guess to invert the GPIO value,
> but using ~ will invert all the bits of the integer returned by
> gpio_get_value(), meaning that if it returns 1 you will end up calling
> gpio_set_value(-2). In practice your gpio is very unlikely to ever be set to
> 0.

You're right, fixed this.

>>         free_irq(IRQ_IXP4XX_TIMER2, (void *)dev->id);
>> +       gpio_free(dev->id);
>
>
> Just wondering, is there a reason for not using the devm_gpio functions
> here?

I didn't want to change the style of the whole driver, but I can make
a separate patch switching the whole driver to use managed
resources at some later point.

Yours,
Linus Walleij
