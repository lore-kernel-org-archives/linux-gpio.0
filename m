From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] ARM/serial: at91: switch atmel serial to use gpiolib
Date: Wed, 6 Nov 2013 10:16:45 +0100
Message-ID: <CACRpkdY3uK56K2YPB2AjOQzjJxUmkpX0AR0kOpfPyckwv2nztQ@mail.gmail.com>
References: <1383654959-18112-1-git-send-email-linus.walleij@linaro.org>
	<20131105162828.GC28304@ns203013.ovh.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f170.google.com ([209.85.214.170]:46711 "EHLO
	mail-ob0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753567Ab3KFJQp (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 6 Nov 2013 04:16:45 -0500
Received: by mail-ob0-f170.google.com with SMTP id wp18so9860650obc.15
        for <linux-gpio@vger.kernel.org>; Wed, 06 Nov 2013 01:16:45 -0800 (PST)
In-Reply-To: <20131105162828.GC28304@ns203013.ovh.net>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Andrew Victor <linux@maxim.org.za>, Nicolas Ferre <nicolas.ferre@atmel.com>, linus-serial <linus-serial@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alexandre Courbot <acourbot@nvidia.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On Tue, Nov 5, 2013 at 5:28 PM, Jean-Christophe PLAGNIOL-VILLARD
<plagnioj@jcrosoft.com> wrote:
> On 13:35 Tue 05 Nov     , Linus Walleij wrote:

>> +     /*
>> +      * AT91RM9200 Errata #39: RTS0 is not internally connected
>> +      * to PA21. We need to drive the pin as a GPIO.
>> +      */
>> +     if (gpio_is_valid(atmel_port->rts_gpio) &&
>> +         port->mapbase == AT91RM9200_BASE_US0) {

> not really a fon of this hack
>
> if we use a uart for rs485 we need to use a gpio for rts too

Hm it was completely unnecessary anyway, as I now specify
the RTS pin per UART instance, it will only be valid for
those setting it right.

>> +     /*
>> +      * In theory the GPIO pin controlling RTS could be zero and
>> +      * this would be an improper check, but we know that the only
>> +      * existing case is != 0 and it's nice to use the zero-initialized
>> +      * structs to indicate "no RTS GPIO" instead of open-coding some
>> +      * invalid value everywhere.
>> +      */
>> +     if (pdata->rts_gpio > 0) {

>         this can not work 0 is a valid gpio if you do this you need to update
>         ALL the bard filee too to set it as -EINVAL;

Isn't it the other way around? I did this exactly to avoid updating
all the boardfiles, as the rts_gpio == 0 for all those not
defining it. This is why I test for > 0.

Yours,
Linus Walleij
