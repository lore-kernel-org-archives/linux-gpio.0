From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: winbond: add driver
Date: Thu, 21 Dec 2017 13:49:03 +0100
Message-ID: <CACRpkdaE7ZfVaMggDh1xa0ziVQ2e3jyyST_Tp2s3dh3TOJs4BQ@mail.gmail.com>
References: <f105bdb7-9b29-517f-1fb6-935ee9e2045c@maciej.szmigiero.name>
 <CACRpkdZAmUtPrh0Ku+vHbY-gYsCr4+3ORYuygtOaC6X0FNPVYA@mail.gmail.com>
 <73983ef2-ab7e-cc31-042e-d7831bb6fee0@maciej.szmigiero.name>
 <CACRpkdbOdKJnSookBnnrSzhgM8zACEXG0CEa-C1tmXCsJcxhfg@mail.gmail.com> <31aab2cd-a21e-537b-d1e2-dc8c1be62225@maciej.szmigiero.name>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f43.google.com ([209.85.214.43]:38780 "EHLO
        mail-it0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752285AbdLUMtE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 21 Dec 2017 07:49:04 -0500
Received: by mail-it0-f43.google.com with SMTP id r6so10716282itr.3
        for <linux-gpio@vger.kernel.org>; Thu, 21 Dec 2017 04:49:04 -0800 (PST)
In-Reply-To: <31aab2cd-a21e-537b-d1e2-dc8c1be62225@maciej.szmigiero.name>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: William Breathitt Gray <vilhelm.gray@gmail.com>, linux-kernel <linux-kernel@vger.kernel.org>, linux-gpio@vger.kernel.org

On Thu, Dec 21, 2017 at 12:13 AM, Maciej S. Szmigiero
<mail@maciej.szmigiero.name> wrote:
> On 20.12.2017 13:06, Linus Walleij wrote:
>> On Tue, Dec 19, 2017 at 12:07 AM, Maciej S. Szmigiero
>> <mail@maciej.szmigiero.name> wrote:
>>> On 18.12.2017 22:22, Linus Walleij wrote:
>>
> (..)
>>>>> +static void winbond_gpio_warn_conflict(unsigned int idx, const char *otherdev)
>>>>> +{
>>>>> +       pr_warn(WB_GPIO_DRIVER_NAME
>>>>> +               ": enabled GPIO%u share pins with active %s\n", idx + 1,
>>>>> +               otherdev);
>>>>> +}
>>>>
>>>> I don't understand this otherdev business, is it pin multiplexing?
>>>
>>> Yes, some GPIO pins are shared with some other devices and functions.
>>>
>>> But this is a x86 Super I/O chip so we don't really have a general
>>> ability to detect which should be configured how (and a BIOS might not
>>> have configured pins that it didn't care about correctly).
>>
>> I see. That is unfortunate, users having to provide module parameters
>> for this is just so 1990ies, not your fault.
>>
>> I'm just wondering if there is something, anything you can grab onto
>> to detect the type of system you're running on and configure accordingly.
>> Like SMBIOS magic. Or subsystem type on the PCI devices. It's
>> scary to have to insert by hand.
>>
>> Am I guessing right when assuming this is not really a slot-in card
>> but more a, say, internal bridge om some misc machines?
>>
>> I'm just thinking that somewhere on this machine there must be some
>> entity that knows what we're running on.
>
> This driver was developed and tested on a Axiomtek CAPA800 board, which
> has a GPIO header allowing easy access to these Super I/O pins.
> A manual for this board specifically documents poking at hardcoded SIO
> I/O space as the way to read / write them, so yes, it is very much a
> 1990's style of operation.
> BTW: DMI data for this board is full of "To Be Filled By O.E.M." as far
> as I can see.

Let's loop in the x86 platform drivers maintainer Andy Shevchenko and
check what he has to say about these beasts.

>> Maybe I misunderstand the usecase: is this an off-the-shelf product
>> support thing (like, to get LEDs on the case of a laptop or read magic
>> switches on a workstation or so) or is it intended for random hacking and
>> special-purpose machines?
>
> Well, currently this driver has just a one "hard" user of CAPA800 board
> (where the GPIO signals themselves are a part of the platform but it is
> left unspecified what is their intended use).
> But since SIO GPIO lines are often used internally to implement switching
> of various motherboard functions (I know motherboards with other SIO
> models use them for LED control, main / backup BIOS swapping, etc.) I
> think random hacking and reverse engineering of motherboard signals is
> also a sensible use case for this driver.

OK

> For things like LED control and input switches reading, where these
> are a permanent part of some off-the-shelf platform, I think a specific
> driver that registers with LED and input layer should be used instead.

Agreed.

>>>>> +                         "push-pull" :
>>>>> +                         "open drain");
>>>>
>>>> If your hardware supports open drain then implement .set_config() for
>>>> it in the gpio_chip so you can use the hardware open drain with the driver.
>>>
>>> The problem here is that the device doesn't support per-pin
>>> output driver configuration, only per-GPIO device (8 pins)
>>> configuration.
>>
>> Hm. That is well supported by pin control while GPIO does not support
>> it since it is line-oriented. Pin control on the other hand, supports
>> group-wise multiplexing and config.
>>
>> I don't know how much you looked into pin control. It might be a bit
>> heavy for an ISA-type device as this appears to be.
>
> Yes, I think pin control is more a thing for complicated SoCs than for
> a few Super I/O chip signals (especially that nothing on any x86
> platform that I have seems to make use of it).

Ah, I bet you will get one sooner or later. All the later x86 Chromebooks
use drivers/pinctrl/intel/* it's their model for future deeply embedded
x86 SoC things as far as I can tell.

> Besides, it would need adding a support for requesting the proper pins
> on boards with this chip to, for example, the 8250 serial driver.

Actually the device core grabs the pin control handles right before
probing the device so in many cases for just default muxing no
code is needed. Dmitry Tarnyagin once pointed out we should do
it that way. (drivers/base/pinctrl.c)

But if you don't need it, no need to worry.

>> But it falls back to the question of autodetect, naturally. This set of
>> parameters is OK if hacking around like this is necessary.
>
> Since random hacking and reverse engineering will probably represent
> the most common use case for this driver I think they should stay.

OK

Yours,
Linus Walleij
