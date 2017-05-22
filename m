From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: Right amount of info in the DT
Date: Mon, 22 May 2017 17:12:24 +0200
Message-ID: <CACRpkdZg--owpSdpyGUzHKNDS+Wk9juvobGiCNt4vsMEytNPaQ@mail.gmail.com>
References: <29e00f75-9f30-8a6f-c2da-43a59cc1f134@sigmadesigns.com>
 <CACRpkdZ_QmZ=Sjub8DPfHkCkU5m=PYxfWgVPzBCFbYvj-BH4HQ@mail.gmail.com>
 <815d2f8e-2e85-31d7-4f69-b89b7be79d9e@sigmadesigns.com> <CACRpkdY2Q1tcX40C8JLfa110pyMhzpxmJj41RqTt+MOwcoFxyw@mail.gmail.com>
 <d8d9f35c-a901-dc77-646e-ea09836ee9cf@sigmadesigns.com> <CACRpkdaZWh24SSCSeaM3NeLkiLSkyTYzDVkQmzj33=6m4qMraw@mail.gmail.com>
 <0409ece2-dce3-d77f-f8e5-50fe96aaea1a@sigmadesigns.com> <CACRpkdbB9kUaRbm-=1c_kzZ9p2ghh==HNb-8vkGkF3Zrx0rr_Q@mail.gmail.com>
 <42ae4b79-9917-3f9d-8962-d09fbe8c9b1c@sigmadesigns.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f51.google.com ([209.85.214.51]:34241 "EHLO
        mail-it0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934458AbdEVPM0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 May 2017 11:12:26 -0400
Received: by mail-it0-f51.google.com with SMTP id a10so4236044itg.1
        for <linux-gpio@vger.kernel.org>; Mon, 22 May 2017 08:12:25 -0700 (PDT)
In-Reply-To: <42ae4b79-9917-3f9d-8962-d09fbe8c9b1c@sigmadesigns.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Yves Lefloch <YvesMarie_Lefloch@sigmadesigns.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Mason <slash.tmp@free.fr>, Thibaud Cornic <thibaud_cornic@sigmadesigns.com>

On Fri, May 12, 2017 at 5:31 PM, Yves Lefloch
<YvesMarie_Lefloch@sigmadesigns.com> wrote:
> On 05/11/2017 05:22 PM, Linus Walleij wrote:

>> Implement everything you have a data sheet for even if you
>> do not use it right now. It is good to have.
>
> Do you mean that I should submit a driver for every single device
> before I can declare its pins in the DT? That will surely take
> quite a long time, and I'm required to get GPIO functionality before
> that.

I mean that when you write a GPIO driver, i.e. ONE driver for
ONE GPIO controlling hardware, you should implement all the
functionality for THAT GPIO block.

> Furthermore, even if I had a driver for a device whose pins can also
> be GPIOs, say smartcard. If the driver is built as a module, and has
> not been yet loaded in, then, since you want the pinctrl node has a
> child node, no gpiochip struct could have been registered, and the pins
> can't be used as GPIOs.
> Does this mean that to use the smartcard's pin as GPIOs, the smartcard
> driver must absolutely be loaded, even though smartcards are never used?

I do not understand this remark.

If the GPIOs are provided by the smartcard IP block inside your
chip, yes then it makes sense to spawn the GPIO driver as part
of the smartcard driver.

Usually the GPIO hardware is a separate IP block from any others
(such as smartcard) so this situation seldom occurs.

Is you system such that there is an IO range for something like
a smart card, and then that IO range also contains registers for
reusing some or all pins as GPIO?

Then yes, we usually write a driver for this whole IP block and let
it expose a gpiochip as part of its main function.

Yours,
Linus Walleij
