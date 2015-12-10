From: Clemens Gruber <clemens.gruber@pqgruber.com>
Subject: Re: gpio-mxc: gpiod_get_value returns INT_MIN when the GPIO is off
Date: Thu, 10 Dec 2015 18:18:21 +0100
Message-ID: <20151210171820.GA18828@archie.tuxnet.lan>
References: <20151128230200.GA21951@archie.tuxnet.lan>
 <CACRpkdaWPnzMU+Dmn0Ng4bHGsk2mSUSKT22VWEfd3n5985YZAA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.pqgruber.com ([178.189.19.235]:44261 "EHLO
	mail.pqgruber.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751827AbbLJRSZ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Dec 2015 12:18:25 -0500
Content-Disposition: inline
In-Reply-To: <CACRpkdaWPnzMU+Dmn0Ng4bHGsk2mSUSKT22VWEfd3n5985YZAA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Ulises Brindis <ubrindis56@gmail.com>, u.kleine-koenig@pengutronix.de, fabio.estevam@freescale.com
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, gnurou@gmail.com, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hi Linus,

On Thu, Dec 10, 2015 at 03:58:39PM +0100, Linus Walleij wrote:
> On Sun, Nov 29, 2015 at 12:02 AM, Clemens Gruber
> <clemens.gruber@pqgruber.com> wrote:
> 
> > I am writing a module which reads several GPIO input states from a
> > Freescale i.MX6Q. I can control the input states through hardware
> > buttons attached to my development board. They are all connected exactly
> > the same, with external pull up resistors.
> > I am using the current torvalds/linux master branch.
> >
> > The list in my DT looks like this:
> > my-gpios = <&gpio1 7 GPIO_ACTIVE_LOW>,
> >         <&gpio1 8 GPIO_ACTIVE_LOW>,
> >         /* .... */
> >         <&gpio6 31 GPIO_ACTIVE_LOW>,
> >         <&gpio7 11 GPIO_ACTIVE_LOW>;
> 
> So IIUC this us using drivers/gpio/gpio-mxc.c, correct?

Yes.

> 
> > In my platform driver module, I first call gpiod_get_array(dev, "my",
> > GPIOD_IN);
> >
> > Then I can successfully read in the input states of my GPIOs and get
> > "correct" values for all but one of them: GPIO6_31
> > Meaning: When no button is pressed, every call to
> > gpiod_get_value(my_gpios->desc[i]) returns 0 and if one of the buttons
> > is pressed, it returns 1.
> > Except for gpio6 31: It returns -2^31 (INT_MIN) when no button is
> > pressed and 1 if a button is pressed.
> >
> > I double checked the pinmuxing and the hardware, the input state should
> > be off / 0 and not -2^31. The internal pull up is also enabled.
> > Muxing: fsl,pins = <MX6QDL_PAD_EIM_BCLK__GPIO6_IO31 0x1b099>;
> >
> > I read through the source of gpio-generic.c and came across
> > bgpio_get_set. If I interpret the code correctly, it is set as the get
> > function of the gpio chip. (because BGPIOF_READ_OUTPUT_REG_SET is passed
> > as flags argument when bgpio_init is called from gpio-mxc.c)
> > In the case of gpio6_31, the pin2mask function would return 1 << 31 as
> > unsigned long, meaning 2^31 and then the unsigned long return value of
> > read_reg is bitmasked with 2^31 which would result in 2^31 if it is on
> > and 0 if it is off.
> > But because gpiod_get_value returns an int, the 2^31 unsigned long is
> > casted to a signed int, which means it returns -2^31 if it is active.
> > But in this case, it returns -2^31 if it is inactive and 1 if it is
> > active...
> >
> > I can workaround by checking gpiod_get_value(desc) == 1 but I'd really
> > like to know what's causing this (odd?) behavior.
> >
> > Am I doing something wrong here?
> 
> No it looks like a bug to me, sadly I'm not really using generic GPIO
> with any hardware enough. I cooked up the following patch, can you test
> it (tell me if you want me to send it separately):

Thank you, your patch fixes the problem.
Although I thought I tried something like this before and it did not
work, your change works, so I probably messed something up back then.

> 
> From 6e9a115f7a9f70fede21e63630e0d7b01661cf7c Mon Sep 17 00:00:00 2001
> From: Linus Walleij <linus.walleij@linaro.org>
> Date: Thu, 10 Dec 2015 15:55:29 +0100
> Subject: [PATCH] gpio: generic: clamp values from bgpio_get_set()
> 
> The bgpio_get_set() call should return a value clamped to [0,1],
> the current code will return a negative value if reading
> bit 31, which gets interpreted as an error by the gpiolib core.
> 
> Reported-by: Clemens Gruber <clemens.gruber@pqgruber.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/gpio/gpio-generic.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-generic.c b/drivers/gpio/gpio-generic.c
> index 72088028d7a9..ea581dc23d44 100644
> --- a/drivers/gpio/gpio-generic.c
> +++ b/drivers/gpio/gpio-generic.c
> @@ -141,9 +141,9 @@ static int bgpio_get_set(struct gpio_chip *gc,
> unsigned int gpio)
>      unsigned long pinmask = bgc->pin2mask(bgc, gpio);
> 
>      if (bgc->dir & pinmask)
> -        return bgc->read_reg(bgc->reg_set) & pinmask;
> +        return !!(bgc->read_reg(bgc->reg_set) & pinmask);
>      else
> -        return bgc->read_reg(bgc->reg_dat) & pinmask;
> +        return !!(bgc->read_reg(bgc->reg_dat) & pinmask);
>  }
> 
>  static int bgpio_get(struct gpio_chip *gc, unsigned int gpio)
> -- 
> 2.4.3
> 
> Yours,
> Linus Walleij

Thanks,
Clemens
