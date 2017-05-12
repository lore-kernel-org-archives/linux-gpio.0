From: Yves Lefloch <YvesMarie_Lefloch@sigmadesigns.com>
Subject: Re: Right amount of info in the DT
Date: Fri, 12 May 2017 17:31:20 +0200
Message-ID: <42ae4b79-9917-3f9d-8962-d09fbe8c9b1c@sigmadesigns.com>
References: <29e00f75-9f30-8a6f-c2da-43a59cc1f134@sigmadesigns.com>
 <CACRpkdZ_QmZ=Sjub8DPfHkCkU5m=PYxfWgVPzBCFbYvj-BH4HQ@mail.gmail.com>
 <815d2f8e-2e85-31d7-4f69-b89b7be79d9e@sigmadesigns.com>
 <CACRpkdY2Q1tcX40C8JLfa110pyMhzpxmJj41RqTt+MOwcoFxyw@mail.gmail.com>
 <d8d9f35c-a901-dc77-646e-ea09836ee9cf@sigmadesigns.com>
 <CACRpkdaZWh24SSCSeaM3NeLkiLSkyTYzDVkQmzj33=6m4qMraw@mail.gmail.com>
 <0409ece2-dce3-d77f-f8e5-50fe96aaea1a@sigmadesigns.com>
 <CACRpkdbB9kUaRbm-=1c_kzZ9p2ghh==HNb-8vkGkF3Zrx0rr_Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from us-smtp-delivery-212.mimecast.com ([216.205.24.212]:38152 "EHLO
        us-smtp-delivery-212.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1757306AbdELPiG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 12 May 2017 11:38:06 -0400
In-Reply-To: <CACRpkdbB9kUaRbm-=1c_kzZ9p2ghh==HNb-8vkGkF3Zrx0rr_Q@mail.gmail.com>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Mason <slash.tmp@free.fr>, Thibaud Cornic <thibaud_cornic@sigmadesigns.com>

On 05/11/2017 05:22 PM, Linus Walleij wrote:
> Just make sure your driver also provides a gpio_chip and
> write good looking code.

OK, IMHO the code I attached earlier would do that.

> Implement everything you have a data sheet for even if you
> do not use it right now. It is good to have.

Do you mean that I should submit a driver for every single device
before I can declare its pins in the DT? That will surely take
quite a long time, and I'm required to get GPIO functionality before
that.

Furthermore, even if I had a driver for a device whose pins can also
be GPIOs, say smartcard. If the driver is built as a module, and has
not been yet loaded in, then, since you want the pinctrl node has a
child node, no gpiochip struct could have been registered, and the pins
can't be used as GPIOs.
Does this mean that to use the smartcard's pin as GPIOs, the smartcard
driver must absolutely be loaded, even though smartcards are never used?

> Have you read the section "GPIO mode pitfalls" in the documentation?
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/pinctrl.txt
> 
> It is very important that you know for sure whether it is actual
> GPIO or just named that way by some hardware engineer.

I did read the documentation, and I'm pretty sure those pins are all
actual GPIOs: once a pin's mode flag has been cleared, it can be
arbitrarily set high or low, or listened to by kernel code.

Regards,
Yves.

