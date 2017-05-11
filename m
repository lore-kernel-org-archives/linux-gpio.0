From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: Right amount of info in the DT
Date: Thu, 11 May 2017 17:22:09 +0200
Message-ID: <CACRpkdbB9kUaRbm-=1c_kzZ9p2ghh==HNb-8vkGkF3Zrx0rr_Q@mail.gmail.com>
References: <29e00f75-9f30-8a6f-c2da-43a59cc1f134@sigmadesigns.com>
 <CACRpkdZ_QmZ=Sjub8DPfHkCkU5m=PYxfWgVPzBCFbYvj-BH4HQ@mail.gmail.com>
 <815d2f8e-2e85-31d7-4f69-b89b7be79d9e@sigmadesigns.com> <CACRpkdY2Q1tcX40C8JLfa110pyMhzpxmJj41RqTt+MOwcoFxyw@mail.gmail.com>
 <d8d9f35c-a901-dc77-646e-ea09836ee9cf@sigmadesigns.com> <CACRpkdaZWh24SSCSeaM3NeLkiLSkyTYzDVkQmzj33=6m4qMraw@mail.gmail.com>
 <0409ece2-dce3-d77f-f8e5-50fe96aaea1a@sigmadesigns.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f42.google.com ([209.85.214.42]:36842 "EHLO
        mail-it0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756760AbdEKPWM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 11 May 2017 11:22:12 -0400
Received: by mail-it0-f42.google.com with SMTP id o5so45845564ith.1
        for <linux-gpio@vger.kernel.org>; Thu, 11 May 2017 08:22:12 -0700 (PDT)
In-Reply-To: <0409ece2-dce3-d77f-f8e5-50fe96aaea1a@sigmadesigns.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Yves Lefloch <YvesMarie_Lefloch@sigmadesigns.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Mason <slash.tmp@free.fr>, Thibaud Cornic <thibaud_cornic@sigmadesigns.com>

On Tue, May 9, 2017 at 12:49 PM, Yves Lefloch
<YvesMarie_Lefloch@sigmadesigns.com> wrote:

> I was wondering what's the recommended approach to
> mutualize code:
> 1. Having a driver under drivers/gpio and another on drivers/pinctrl
>    which depends on the first one.
> 2. Having both drivers in the same file under drivers/pinctrl.
> 3. Having only one pinctrl driver.

All approaches exist. I have no strong opinion, but when possible
try to make separation of concerns.

> For now I've taken approach 3, but isn't it strange to have pins
> dedicated to GPIO like this first group I mentioned controlled
> for a pinctrl driver?
> What is your opinion on this?

Just make sure your driver also provides a gpio_chip and
write good looking code.

>> But I was not meaning you should collect them all under a
>> "pins" node like this, but inside each peripheral.
>
> OK, I will do that. Although not all alternate functions currently
> have a driver, nor a node in the device tree. I guess the best way
> to handle that is to declare the pins as GPIO only and not to worry
> about the alternate function; which brings me back to the question
> above. Do they need a separate GPIO driver?

Implement everything you have a data sheet for even if you
do not use it right now. It is good to have.

Have you read the section "GPIO mode pitfalls" in the documentation?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/pinctrl.txt

It is very important that you know for sure whether it is actual
GPIO or just named that way by some hardware engineer.

Yours,
Linus Walleij
