From: Yves Lefloch <YvesMarie_Lefloch@sigmadesigns.com>
Subject: Re: Right amount of info in the DT
Date: Tue, 9 May 2017 12:49:26 +0200
Message-ID: <0409ece2-dce3-d77f-f8e5-50fe96aaea1a@sigmadesigns.com>
References: <29e00f75-9f30-8a6f-c2da-43a59cc1f134@sigmadesigns.com>
 <CACRpkdZ_QmZ=Sjub8DPfHkCkU5m=PYxfWgVPzBCFbYvj-BH4HQ@mail.gmail.com>
 <815d2f8e-2e85-31d7-4f69-b89b7be79d9e@sigmadesigns.com>
 <CACRpkdY2Q1tcX40C8JLfa110pyMhzpxmJj41RqTt+MOwcoFxyw@mail.gmail.com>
 <d8d9f35c-a901-dc77-646e-ea09836ee9cf@sigmadesigns.com>
 <CACRpkdaZWh24SSCSeaM3NeLkiLSkyTYzDVkQmzj33=6m4qMraw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from us-smtp-delivery-212.mimecast.com ([216.205.24.212]:33338 "EHLO
        us-smtp-delivery-212.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751554AbdEIK4G (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 9 May 2017 06:56:06 -0400
In-Reply-To: <CACRpkdaZWh24SSCSeaM3NeLkiLSkyTYzDVkQmzj33=6m4qMraw@mail.gmail.com>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Mason <slash.tmp@free.fr>, Thibaud Cornic <thibaud_cornic@sigmadesigns.com>



On 05/07/2017 12:26 PM, Linus Walleij wrote:
> Does all of these really have gpio controller functionality?
> You do not have to compulsively add that. Just make it
> a pin controller.

Most of them have pin controller functionalities, because the pins
can be muxed between GPIO and another function. Only the first group
is GPIO only (dedicated pins). But apart from the choosing of the
current function, the other properties (direction, value) are handled
the same way.
Regarding that, I was wondering what's the recommended approach to
mutualize code:
1. Having a driver under drivers/gpio and another on drivers/pinctrl
   which depends on the first one.
2. Having both drivers in the same file under drivers/pinctrl.
3. Having only one pinctrl driver.
For now I've taken approach 3, but isn't it strange to have pins
dedicated to GPIO like this first group I mentioned controlled
for a pinctrl driver?
What is your opinion on this?

> But I was not meaning you should collect them all under a
> "pins" node like this, but inside each peripheral.

OK, I will do that. Although not all alternate functions currently
have a driver, nor a node in the device tree. I guess the best way
to handle that is to declare the pins as GPIO only and not to worry
about the alternate function; which brings me back to the question
above. Do they need a separate GPIO driver?

