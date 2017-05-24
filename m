From: Thibaud Cornic <thibaud_cornic@sigmadesigns.com>
Subject: Re: Right amount of info in the DT
Date: Wed, 24 May 2017 11:41:28 +0200
Message-ID: <526a19bc-932a-3f84-eaf7-03c0b67bae2f@sigmadesigns.com>
References: <29e00f75-9f30-8a6f-c2da-43a59cc1f134@sigmadesigns.com>
 <CACRpkdZ_QmZ=Sjub8DPfHkCkU5m=PYxfWgVPzBCFbYvj-BH4HQ@mail.gmail.com>
 <815d2f8e-2e85-31d7-4f69-b89b7be79d9e@sigmadesigns.com>
 <CACRpkdY2Q1tcX40C8JLfa110pyMhzpxmJj41RqTt+MOwcoFxyw@mail.gmail.com>
 <d8d9f35c-a901-dc77-646e-ea09836ee9cf@sigmadesigns.com>
 <CACRpkdaZWh24SSCSeaM3NeLkiLSkyTYzDVkQmzj33=6m4qMraw@mail.gmail.com>
 <0409ece2-dce3-d77f-f8e5-50fe96aaea1a@sigmadesigns.com>
 <CACRpkdbB9kUaRbm-=1c_kzZ9p2ghh==HNb-8vkGkF3Zrx0rr_Q@mail.gmail.com>
 <42ae4b79-9917-3f9d-8962-d09fbe8c9b1c@sigmadesigns.com>
 <CACRpkdZg--owpSdpyGUzHKNDS+Wk9juvobGiCNt4vsMEytNPaQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from us-smtp-delivery-212.mimecast.com ([63.128.21.212]:53077 "EHLO
        us-smtp-delivery-212.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751643AbdEXJsG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 24 May 2017 05:48:06 -0400
In-Reply-To: <CACRpkdZg--owpSdpyGUzHKNDS+Wk9juvobGiCNt4vsMEytNPaQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Yves Lefloch <YvesMarie_Lefloch@sigmadesigns.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Mason <slash.tmp@free.fr>

On 22/05/2017 17:12, Linus Walleij wrote:
> On Fri, May 12, 2017 at 5:31 PM, Yves Lefloch <YvesMarie_Lefloch@sigmadesigns.com> wrote:
>> On 05/11/2017 05:22 PM, Linus Walleij wrote: 
>>> Implement everything you have a data sheet for even if you do not use it right now. It is good to have. 
>> Do you mean that I should submit a driver for every single device before I can declare its pins in the DT? That will surely take quite a long time, and I'm required to get GPIO functionality before that. 
> I mean that when you write a GPIO driver, i.e. ONE driver for ONE GPIO controlling hardware, you should implement all the functionality for THAT GPIO block.
Right now, Yves works on the GPIOs, and he'd like to be able to support all the GPIOs of the chip, even those
which are muxed with the UART/smart card/other IPs pins.
For example, we have a UART2 IP, which pins can be used as GPIOs or for the UART functionality.
The registers which toggle the GPIO/UART "mode" of these pins are in the address range of the UART block.
Does your answer mean that you won't allow any other code than a UART driver to touch those registers?
Which would mean that to be able to use those pins as GPIOs, Yves must first submit the UART driver and DT node,
then modify it to somehow expose a GPIO functionality?

>> Furthermore, even if I had a driver for a device whose pins can also be GPIOs, say smartcard. If the driver is built as a module, and has not been yet loaded in, then, since you want the pinctrl node has a child node, no gpiochip struct could have been registered, and the pins can't be used as GPIOs. Does this mean that to use the smartcard's pin as GPIOs, the smartcard driver must absolutely be loaded, even though smartcards are never used? 
> I do not understand this remark. If the GPIOs are provided by the smartcard IP block inside your chip, yes then it makes sense to spawn the GPIO driver as part of the smartcard driver.
Let's talk about UART instead (as there's no real use case for a dynamic switch of pin usage on the board between
the smart card and something else).
The remark is: when the UART driver is loaded, it will start using the pins in the UART mode. And this driver is not
designed to serve GPIO requests. It seems like a big modification to add this (like a wrapper completely disabling the
function for which that driver has been written).
Do we need to do this for all the drivers which control pins which can be used as GPIOs?

I had imagined that the pin controller driver would be the one writing in the "pin mode" registers, wherever they might
be located, and we would add "pin request" calls in the other drivers (UART, smart card) which would tell the pin
controller to put those pins in the UART/smart card mode, and not allow gpio requests to them.

> Usually the GPIO hardware is a separate IP block from any others (such as smartcard) so this situation seldom occurs.
Really? I imagine we're not the only company adding muxes to use certain IP pins as GPIOs. And those muxes a necessarily
placed in those IP blocks, which (depending on the interconnect) will force the mux register address to be in the IP address range.

> Is you system such that there is an IO range for something like a smart card, and then that IO range also contains registers for reusing some or all pins as GPIO?
Yes exactly. It contains the register to reuse the smart card pins as GPIOs.
And let's say the ethernet IO range contains the regs to reuse the ethernet pins.

> Then yes, we usually write a driver for this whole IP block and let it expose a gpiochip as part of its main function.
On top of my other remarks above, what if the driver is completely standard?

Regards,
Thibaud Cornic

