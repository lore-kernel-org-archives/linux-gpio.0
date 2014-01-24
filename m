From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [RFC PATCH] gpiolib: introduce gpio_set_multiple function
Date: Fri, 24 Jan 2014 11:44:39 +0900
Message-ID: <CAAVeFuLM7jJqckd5HiLO4aSuipZ56S_=7xH3cmteex1yk03uqQ@mail.gmail.com>
References: <2473803.SebQ52F62q@pcimr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-vc0-f174.google.com ([209.85.220.174]:33350 "EHLO
	mail-vc0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750969AbaAXCpA (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Jan 2014 21:45:00 -0500
Received: by mail-vc0-f174.google.com with SMTP id im17so1549733vcb.19
        for <linux-gpio@vger.kernel.org>; Thu, 23 Jan 2014 18:44:59 -0800 (PST)
In-Reply-To: <2473803.SebQ52F62q@pcimr>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Rojhalat Ibrahim <imr@rtschenk.de>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Thu, Jan 23, 2014 at 9:19 PM, Rojhalat Ibrahim <imr@rtschenk.de> wrote:
> This patch introduces a new function gpio_set_multiple which allows setting
> multiple GPIO lines on the same chip with just one function call. If a
> corresponding set_multi function is defined for the chip performance can be
> significantly improved. Otherwise gpio_set_multiple uses the chip's set
> function and the performance stays the same as without the new function.
> For my application, where I have to frequently set 9 GPIO lines in order to
> configure an FPGA, configuration time goes down from 48 s to 15 s when I use
> this new function. (Tested with a modified gpio-mpc8xxx module.)

You seem to have a real use-case so it is probably ok to include
something like this. However there are a few points/limitations I'd
like to discuss:

- Right now your 64-bit mask means this function is limited to the
first 64 GPIOs of the chip. How would one handle chips with more
GPIOs?

- How do you guarantee that the GPIOs have been properly acquired?
This is something that we really want to enforce with the gpiod API,
and your new functions allow to completely bypass this security.

I wonder if both issues could not be addressed by extending gpiolib
(yay, more GPIO functions!) to be able to acquire a previously-defined
"group" of GPIOs (this group could be defined as a chain of
platform-defined GPIOs, or within the DT). Success upon this would
return a GPIO group descriptor that would be used with
gpiod_*_multiple(). That way it stays in the spirit of this API and
ensures bad guys cannot steal our GPIOs. *Or*, just allow a GPIO
descriptor to also describe a GPIO group, that way we don't need the
gpiod_*_multiple() functions. We will need to find a way to honor the
active-low, open drain and other flags though (gpiolib could maybe
split the group into sub-groups of 64 bits and use masks to handle
that quickly).

With his experience on pinctrl, Linus can probably come with more ideas. ;)

>
> Signed-off-by: Rojhalat Ibrahim <imr@rtschenk.de>
> ---
>  drivers/gpio/gpiolib.c        |   59 ++++++++++++++++++++++++++++++++++++++++++
>  include/asm-generic/gpio.h    |   17 ++++++++++++
>  include/linux/gpio.h          |   20 ++++++++++++++
>  include/linux/gpio/consumer.h |   14 +++++++++
>  include/linux/gpio/driver.h   |    3 ++
>  5 files changed, 113 insertions(+)
>
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 50c4922..8355acb 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -2099,6 +2099,44 @@ void gpiod_set_value(struct gpio_desc *desc, int value)
>  }
>  EXPORT_SYMBOL_GPL(gpiod_set_value);
>
> +static void _gpiod_set_raw_multiple(struct gpio_chip *chip,
> +                                   u64 mask, u64 value)
> +{
> +       if (chip->set_multi)
> +               chip->set_multi(chip, mask, value);
> +       else {
> +               int i;
> +               for (i=0; i<64; i++) {
> +                       if (i > chip->ngpio - 1)
> +                               break;

You will be looping over the 64 possible entries each and every time,
even if only the first 10 GPIOs are used. How about something like:

for (i = 0; mask != 0 && i < chip->ngpio; i++) {
    ... do stuff ...
    mask &= ~(((u64)1) << i);
}

That way you will stop as soon as all the GPIOs captured by the mask
have been processed.

I think this definitely needs some more discussion. But I find the
idea interesting.

Alex.
