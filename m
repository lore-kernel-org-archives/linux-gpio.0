From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/4] gpio: Introduce ->get_multiple callback
Date: Thu, 31 Aug 2017 15:48:15 +0200
Message-ID: <CACRpkdZo5EzJJUwF8uYqchDC1JC3uZnp9LCpR0DxOdy2K4J_wg@mail.gmail.com>
References: <cover.1503319573.git.lukas@wunner.de> <46dea76d0adfe25f30b564d9dc5b3f2b4de099c9.1503319573.git.lukas@wunner.de>
 <CACRpkdYfHGHNGKKMs+Yqhfeyhs=L0G4K_6OYneDG1RkNpxLXkA@mail.gmail.com> <20170827173459.GB13399@wunner.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f50.google.com ([209.85.218.50]:36426 "EHLO
        mail-oi0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750895AbdHaNsQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 31 Aug 2017 09:48:16 -0400
Received: by mail-oi0-f50.google.com with SMTP id t75so5823202oie.3
        for <linux-gpio@vger.kernel.org>; Thu, 31 Aug 2017 06:48:16 -0700 (PDT)
In-Reply-To: <20170827173459.GB13399@wunner.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Lukas Wunner <lukas@wunner.de>
Cc: Mathias Duckeck <m.duckeck@kunbus.de>, Phil Elwell <phil@raspberrypi.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Sun, Aug 27, 2017 at 7:34 PM, Lukas Wunner <lukas@wunner.de> wrote:
> On Wed, Aug 23, 2017 at 09:38:21AM +0200, Linus Walleij wrote:
>> On Mon, Aug 21, 2017 at 3:12 PM, Lukas Wunner <lukas@wunner.de> wrote:
>> > SPI-attached GPIO controllers typically read out all inputs in one go.
>> > If callers desire the values of multipe inputs, ideally a single readout
>> > should take place to return the desired values.  However the current
>> > driver API only offers a ->get callback but no ->get_multiple (unlike
>> > ->set_multiple, which is present).  Thus, to read multiple inputs, a
>> > full readout needs to be performed for every single value (barring
>> > driver-internal caching), which is inefficient.
>> >
>> > In fact, the lack of a ->get_multiple callback has been bemoaned
>> > repeatedly by the gpio subsystem maintainer:
>> > http://www.spinics.net/lists/linux-gpio/msg10571.html
>> > http://www.spinics.net/lists/devicetree/msg121734.html
>> >
>> > Introduce the missing callback.  Add corresponding consumer functions
>> > such as gpiod_get_array_value().  Amend linehandle_ioctl() to take
>> > advantage of the newly added infrastructure.
>>
>> Could you please patch
>> Documentation/gpio/consumer.txt
>> to mention the new functions as well?
>
> Missed that, will fix in v2.  There is an oddity in that document
> in that it claims gpiod_get_value() / gpiod_set_value() do not return
> errors.  The kerneldoc in gpiolib.c and driver.h says otherwise,
> it allows the get functions to return a negative errno.  Now what?

Probably errors in the documentation.

Feel free to correct it.

> At least with SPI-attached GPIO controllers, the transmission is never
> guaranteed to succeed, so errors can occur both for input and output
> GPIOs.  The MAX3191x is input-only and does pass SPI errors back to
> the caller.  Output drivers such as gpio-74x164.c silently ignore
> SPI errors, which is arguably a problem.

This has historical reasons.

>> Maybe we should have a section in Documentation/gpio/driver.txt,
>> that doc is a bit incomplete right now.
>
> First time I've seen that file. :-)  I used the kerneldoc as guidance
> when writing the gpio-max3191x.c driver and found it sufficient, so I'm
> not sure how driver.txt could be expanded?

Don't worry about it if you feel it's superfluous.

Yours,
Linus Walleij
