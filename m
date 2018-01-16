From: Ludovic Desroches <ludovic.desroches@microchip.com>
Subject: Re: [RFC PATCH 1/2] pinctrl: add consumer variant for gpio request
Date: Tue, 16 Jan 2018 10:01:09 +0100
Message-ID: <20180116090109.GL2989@rfolt0960.corp.atmel.com>
References: <20180115162233.6205-1-ludovic.desroches@microchip.com>
 <20180115162233.6205-2-ludovic.desroches@microchip.com>
 <CAHp75VdGp1_hwK7rUq4u_gKpypdV7LYhV4+kQoVb_u7D+a6pwA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from esa3.microchip.iphmx.com ([68.232.153.233]:53093 "EHLO
        esa3.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750816AbeAPJBV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Jan 2018 04:01:21 -0500
Content-Disposition: inline
In-Reply-To: <CAHp75VdGp1_hwK7rUq4u_gKpypdV7LYhV4+kQoVb_u7D+a6pwA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, Linus Walleij <linus.walleij@linaro.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, nicolas.free@microchip.com

Hi,

On Mon, Jan 15, 2018 at 10:19:39PM +0200, Andy Shevchenko wrote:
> On Mon, Jan 15, 2018 at 6:22 PM, Ludovic Desroches
> <ludovic.desroches@microchip.com> wrote:
> 
> Did I miss cover letter for this?
> 

It seems: https://lkml.org/lkml/2018/1/15/841

> > Add a consumer variant to GPIO request relative functions. The goal
> > is to fix the bad ownership, which is arbitrary set to
> > "range->name:gpio", of a GPIO.
> 
> Hmm... It's supposed to be name of the owner of the pin range (pin
> control device name IIUC).
>

Yes, the owner is the pinctrl device.

> > There is a lack of configuration features for GPIO. For instance,
> > we can't set the bias. Some pin controllers manage both device's
> > pins and GPIOs. GPIOs can benefit from pin configuration. Usually,
> > a pinctrl node is used to mux the pin as a GPIO and to set up its
> > configuration.
> 
> Don't we have means to do that?
> 

I don't think so. I am not the only one to have this issue for a long
time.

There is an interesting thread here:
https://www.spinics.net/lists/linux-gpio/msg16769.html

If things have changed and I missed it, please tell me. I have seen some
improvements but it still don't fit my needs.

> At least that what I see in aspeed_gpio_set_config().
> 

Yes this is part of the improvements I have seen. The set_config
operation is used at several places in the gpiolib:
- gpio_set_drive_single_ended
- gpiod_set_debounce
- gpiod_set_transitory

It doesn't cover all my needs. In the cover letter, I mentionned that I
based my job on this adding parameters I need. Someone told me it may be
difficult to pul all the parameters in one cell. For instance, the drive
strength is a numeric value using several bits.

I am not sure duplicating the parameters we have for pinconf is the
appropriate solution. Then I prepare a second set of patches to add a
cell with a phandle on the pin configuration. I was going to send it
when I realize that fixing the ownership issue is probably a better
solution. It may involve more code change but less duplication.

> Or I missed a point here?
> 
> > The pinmuxing strict mode involves that a pin which is muxed can't
> > be requested as a GPIO if the owner is not the same.
> 
> Any elaborated example?
> 

More details in the thread I mentionned earlier. I want to enable the
strict mode to prevent weird behavior using the sysfs (or the char
device). Moreover, the strict mode fits the behavior of my pin
controller.

In my DTS, at the moment, if a device needs GPIOs, then I add a pinctrl
node where I put the pinmuxing of the pins as GPIOs and I set the
configuration (for instance, bias pull-up, debounce). If the strict mode
is enabled, when the driver will request the GPIOs, it will fail even if
it's the owner of the pinmuxing.

> > Unfortunately,
> > the ownership of a GPIO is set arbitrarily to "range->name:gpio".
> > So there is a mismatch about the ownership which prevents a device
> > from being the owner of the pinmuxing and requesting the same pin as
> > a GPIO.
> 
> > Adding some consumer variants for GPIO request stuff will allow to
> > pass the name of the device which requests the GPIO to not return an
> > error if it's also the owner of the pinmuxing.
> 
> I think we need something more generic in core than producing more API
> functions.
> 

I didn't want to introduce too many changes to keep it safe and I didn't
want to break current API by adding a parameter.

> But I would like to get problem first.
> 
> > +       if (consumer)
> > +               return pin_request(pctldev, pin, consumer, range);
> > +
> 
> Hmm... My understanding that GPIO is just a (special) function out of
> pin muxing. So, doing musing is essential to get proper function out
> of it.
> 
> Does your hardware considers this differently? If so, I would really
> want to see some datasheets.

No you're right about the behavior of my hardware.

Regards

Ludovic
