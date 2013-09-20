From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 5/7] staging: media/lirc: switch to use gpiolib
Date: Fri, 20 Sep 2013 21:28:02 +0200
Message-ID: <CACRpkda5x78wMVm=vOB4_Bb8hsa6Sumfv0CANPBtOdHq1LxDYw@mail.gmail.com>
References: <1378816283-8164-1-git-send-email-linus.walleij@linaro.org>
	<m3d2ocvrx7.fsf@intrepid.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f181.google.com ([209.85.214.181]:42301 "EHLO
	mail-ob0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753160Ab3ITT2E (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 20 Sep 2013 15:28:04 -0400
Received: by mail-ob0-f181.google.com with SMTP id gq1so1078919obb.40
        for <linux-gpio@vger.kernel.org>; Fri, 20 Sep 2013 12:28:03 -0700 (PDT)
In-Reply-To: <m3d2ocvrx7.fsf@intrepid.localdomain>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Krzysztof Halasa <khc@pm.waw.pl>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Imre Kaloz <kaloz@openwrt.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alexandre Courbot <acourbot@nvidia.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On Fri, Sep 13, 2013 at 2:15 PM, Krzysztof Halasa <khc@pm.waw.pl> wrote:

> Linus Walleij <linus.walleij@linaro.org> writes:
>
>> +++ b/drivers/staging/media/lirc/lirc_serial.c
>> @@ -839,6 +839,16 @@ static int lirc_serial_probe(struct platform_device *dev)
>>  {
>>       int i, nlow, nhigh, result;
>>
>> +#ifdef CONFIG_LIRC_SERIAL_NSLU2
>> +     /* This GPIO is used for a LED on the NSLU2 */
>> +     result = devm_gpio_request(dev, NSLU2_LED_GRN, "lirc-serial");
>
> Will this succeed with the LED driver already loaded? Should the user
> unload it first?

Hm if this driver should use this as a LED it needs to register
a trigger for that GPIO LED instead. A GPIO can not be used by
two consumers at the same time...

Yours,
Linus Walleij
