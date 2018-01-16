From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [RFC PATCH 1/2] pinctrl: add consumer variant for gpio request
Date: Tue, 16 Jan 2018 16:33:29 +0200
Message-ID: <CAHp75Vd9qrp_gjMcZAHQrg8BsG5zQC6jZrkseo222=Xepce+ew@mail.gmail.com>
References: <20180115162233.6205-1-ludovic.desroches@microchip.com>
 <20180115162233.6205-2-ludovic.desroches@microchip.com> <CAHp75VdGp1_hwK7rUq4u_gKpypdV7LYhV4+kQoVb_u7D+a6pwA@mail.gmail.com>
 <20180116090109.GL2989@rfolt0960.corp.atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qt0-f193.google.com ([209.85.216.193]:36723 "EHLO
        mail-qt0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751015AbeAPOdb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Jan 2018 09:33:31 -0500
In-Reply-To: <20180116090109.GL2989@rfolt0960.corp.atmel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, Linus Walleij <linus.walleij@linaro.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, nicolas.free@microchip.com
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>

On Tue, Jan 16, 2018 at 11:01 AM, Ludovic Desroches
<ludovic.desroches@microchip.com> wrote:
> On Mon, Jan 15, 2018 at 10:19:39PM +0200, Andy Shevchenko wrote:
>> On Mon, Jan 15, 2018 at 6:22 PM, Ludovic Desroches
>> <ludovic.desroches@microchip.com> wrote:
>>
>> Did I miss cover letter for this?
> It seems: https://lkml.org/lkml/2018/1/15/841

>> > Add a consumer variant to GPIO request relative functions. The goal
>> > is to fix the bad ownership, which is arbitrary set to
>> > "range->name:gpio", of a GPIO.
>>
>> Hmm... It's supposed to be name of the owner of the pin range (pin
>> control device name IIUC).

> Yes, the owner is the pinctrl device.

> There is an interesting thread here:
> https://www.spinics.net/lists/linux-gpio/msg16769.html

Okay, I have dove into all links provided. Below a set of my thoughts
with regard to topic.

> If things have changed and I missed it, please tell me. I have seen some
> improvements but it still don't fit my needs.

First of all, the main architectural issue with current pin control
design is so called "states". It's quite artificial entity which is
not represented by hardware per se.

Instead we better to provide an API to pin configuration and pin
muxing: I would like to switch to *this* pin function with *this* pin
configuration.

Second, the pin control and GPIOs are orthogonal as your hardware
confirms. The propagating pin configuration or muxing via GPIO API
looks to me a wrong direction.

To the point of the specific issue you are trying to solve.  I would
rather agree with Maxime:

"Something like "if the configuration is a gpio, and my pinctrl driver
is also a gpio controller, and that gpiod_request is being called on
that pin, hand over the reference"

Just in case of architectural review imagine a below case. We have two
UART devices which share same pins, and at the same time their pins
can be switched to GPIO function. So, use cases and questions:
- allow potential driver to switch between UARTs at run time
- allow UART driver to switch mode between no flow control (2 wire
mode) and HW flow (4 wire mode), though not specifically at run time
- allow GPIO function for some pins at run time to support OOB wake
up, for example, when UART is a console

More caveats:
- switching and reconfiguring pins at run time is a bad idea for the
start (only some exceptions can be applied, see above) because of
electrical properties of the devices and potential damage to the
hardware
- switching to GPIO is allowed at run time for the purpose of OOB wake source
- after switching to GPIO and freeing it the pin configuration (and
perhaps muxing) would return back to previous (before GPIO) settings
(this would be helpful to case described above: OOB wake up)

-- 
With Best Regards,
Andy Shevchenko
