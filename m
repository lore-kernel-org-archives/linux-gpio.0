From: Rojhalat Ibrahim <imr@rtschenk.de>
Subject: Re: [PATCH 1/2][v4] gpiolib: allow simultaneous setting of multiple GPIO outputs
Date: Mon, 16 Jun 2014 10:25:38 +0200
Message-ID: <11993843.zvf2Gin9Nz@pcimr>
References: <2025835.bJlicUAVfz@pcimr> <CAAVeFuLTo_KqQ6dTi_B0kfV=qMF0rwtvxua_cb3XXCwYSRO7AQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.9]:54892 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754285AbaFPIZl (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Jun 2014 04:25:41 -0400
In-Reply-To: <CAAVeFuLTo_KqQ6dTi_B0kfV=qMF0rwtvxua_cb3XXCwYSRO7AQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexandre Courbot <gnurou@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Grant Likely <grant.likely@linaro.org>, Mark Brown <broonie@kernel.org>, Gerhard Sittig <gsi@denx.de>

On Saturday 07 June 2014 22:24:52 Alexandre Courbot wrote:
> On Tue, Jun 3, 2014 at 12:28 AM, Rojhalat Ibrahim <imr@rtschenk.de> wrote:
> > Introduce new functions gpiod_set_array & gpiod_set_raw_array to the consumer
> > interface which allow setting multiple outputs with just one function call.
> > Also add an optional set_multiple function to the driver interface. Without an
> > implementation of that function in the chip driver outputs are set
> > sequentially.
> >
> > Implementing the set_multiple function in a chip driver allows for:
> > - Improved performance for certain use cases. The original motivation for this
> >   was the task of configuring an FPGA. In that specific case, where 9 GPIO
> >   lines have to be set many times, configuration time goes down from 48 s to
> >   20 s when using the new function.
> > - Simultaneous glitch-free setting of multiple pins on any kind of parallel
> >   bus attached to GPIOs provided they all reside on the same chip and bank.
> >
> > Limitations:
> >   Performance is only improved for normal high-low outputs. Open drain and
> >   open source outputs are always set separately from each other. Those kinds
> >   of outputs could probably be accelerated in a similar way if we could
> >   forgo the error checking when setting GPIO directions.
> >
> > Signed-off-by: Rojhalat Ibrahim <imr@rtschenk.de>
> > ---
> > Change log:
> >   v4: - add gpiod_set_array function for setting logical values
> >       - change interface of the set_multiple driver function to use
> >         unsigned long as type for the bit fields
> >       - use generic bitops (which also use unsigned long for bit fields)
> >       - do not use ARCH_NR_GPIOS any more
> >   v3: - add documentation
> >       - change commit message
> >   v2: - use descriptor interface
> >       - allow arbitrary groups of GPIOs spanning multiple chips
> >
> >  Documentation/gpio/consumer.txt |  23 +++++
> >  drivers/gpio/gpiolib.c          | 180 ++++++++++++++++++++++++++++++++++++++++
> >  include/linux/gpio/consumer.h   |  38 +++++++++
> >  include/linux/gpio/driver.h     |   4 +
> >  4 files changed, 245 insertions(+)
> >
> > diff --git a/Documentation/gpio/consumer.txt b/Documentation/gpio/consumer.txt
> > index 09854fe..ba02b84 100644
> > --- a/Documentation/gpio/consumer.txt
> > +++ b/Documentation/gpio/consumer.txt
> > @@ -163,6 +163,29 @@ The active-low state of a GPIO can also be queried using the following call:
> >  Note that these functions should only be used with great moderation ; a driver
> >  should not have to care about the physical line level.
> >
> > +Set multiple GPIO outputs with a single function call
> > +-----------------------------------------------------
> > +The following functions set the output values of an array of GPIOs:
> > +
> > +       void gpiod_set_array(unsigned int array_size,
> > +                            struct gpio_desc **desc_array,
> > +                            int *value_array)
> > +       void gpiod_set_raw_array(unsigned int array_size,
> > +                                struct gpio_desc **desc_array,
> > +                                int *value_array)
> > +       void gpiod_set_array_cansleep(unsigned int array_size,
> > +                                     struct gpio_desc **desc_array,
> > +                                     int *value_array)
> > +       void gpiod_set_raw_array_cansleep(unsigned int array_size,
> > +                                         struct gpio_desc **desc_array,
> > +                                         int *value_array)
> > +
> > +The array can be an arbitrary set of GPIOs. The functions will try to set
> > +GPIOs belonging to the same bank or chip simultaneously if supported by the
> > +corresponding chip driver. In that case a significantly improved performance
> > +can be expected. If simultaneous setting is not possible the GPIOs will be set
> > +sequentially.
> > +
> >  GPIOs mapped to IRQs
> >  --------------------
> >  GPIO lines can quite often be used as IRQs. You can get the IRQ number
> > diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> > index f48817d..a2be195 100644
> > --- a/drivers/gpio/gpiolib.c
> > +++ b/drivers/gpio/gpiolib.c
> > @@ -2345,6 +2345,84 @@ static void _gpiod_set_raw_value(struct gpio_desc *desc, bool value)
> >                 chip->set(chip, gpio_chip_hwgpio(desc), value);
> >  }
> >
> > +/*
> > + * set multiple outputs on the same chip;
> > + * use the chip's set_multiple function if available;
> > + * otherwise set the outputs sequentially;
> > + * @mask: bit mask array; one bit per output; BITS_PER_LONG bits per word
> > + *        defines which outputs are to be changed
> > + * @bits: bit value array; one bit per output; BITS_PER_LONG bits per word
> > + *        defines the values the outputs specified by mask are to be set to
> > + */
> > +static void gpio_chip_set_multiple(struct gpio_chip *chip,
> > +                                  unsigned long *mask, unsigned long *bits)
> > +{
> > +       if (chip->set_multiple) {
> > +               chip->set_multiple(chip, mask, bits);
> > +       } else {
> > +               int i;
> > +               for (i = 0; i < chip->ngpio; i++) {
> > +                       if (mask[BIT_WORD(i)] == 0) {
> > +                               /* no more set bits in this mask word;
> > +                                * skip ahead to the next word */
> > +                               i = (BIT_WORD(i) + 1) * BITS_PER_LONG - 1;
> > +                               continue;
> > +                       }
> > +                       /* set outputs if the corresponding mask bit is set */
> > +                       if (__test_and_clear_bit(i, mask)) {
> > +                               chip->set(chip, i, test_bit(i, bits));
> 
> Shouldn't this be
> 
>         chip->set(chip, i, test_bit(i, bits[BIT_WORD(i)]);
> 
> ?
> 

No. The test_bit function already handles this correctly. Here's the function
from include/asm-generic/bitops/non-atomic.h:

static inline int test_bit(int nr, const volatile unsigned long *addr)
{
	return 1UL & (addr[BIT_WORD(nr)] >> (nr & (BITS_PER_LONG-1)));
}

I'll post a new revision of the patch to deal with your other comments.

Thanks for reviewing this.

   Rojhalat

