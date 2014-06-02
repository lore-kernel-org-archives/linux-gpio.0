From: Rojhalat Ibrahim <imr@rtschenk.de>
Subject: Re: [PATCH 1/2][v3] gpiolib: allow simultaneous setting of multiple GPIO outputs
Date: Mon, 02 Jun 2014 10:33:10 +0200
Message-ID: <2947890.spqKnF5KLh@pcimr>
References: <7079851.LZm0BOlnTs@pcimr> <CACRpkdZq1N-C=rowPt3t1gf24Dio0LUK4HULvZ-47jHVm1pVwA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.9]:39767 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752740AbaFBIdO (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 2 Jun 2014 04:33:14 -0400
In-Reply-To: <CACRpkdZq1N-C=rowPt3t1gf24Dio0LUK4HULvZ-47jHVm1pVwA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Grant Likely <grant.likely@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Gerhard Sittig <gsi@denx.de>, Mark Brown <broonie@kernel.org>

On Thursday 29 May 2014 12:10:02 Linus Walleij wrote:
> On Tue, May 27, 2014 at 1:14 PM, Rojhalat Ibrahim <imr@rtschenk.de> wrote:
> 
> > Introduce a new function gpiod_set_raw_array to the consumer interface which
> > allows setting multiple outputs with just one function call. Also add an
> > optional set_multiple function to the driver interface. Without an
> > implementation of that function in the chip driver outputs are set
> > sequentially.
> >
> > Implementing the set_multiple function in a chip driver allows for:
> > - Improved performance for certain use cases. The original motivation for this
> >   was the task of configuring an FPGA. In that specific case, where 9 GPIO
> >   lines have to be set many times, configuration time goes down from 48 s to
> >   19 s when using the new function.
> > - Simultaneous glitch-free setting of multiple pins on any kind of parallel
> >   bus attached to GPIOs provided they all reside on the same chip and bank.
> >
> > Limitations:
> >   - Performance is only improved for normal high-low outputs. Open drain and
> >     open source outputs are always set separately from each other. Those kinds
> >     of outputs could probably be accelerated in a similar way if we could
> >     forgo the error checking when setting GPIO directions.
> >   - There is no gpiod_set_array function that regards the ACTIVE_LOW bits.
> >     The raw function should be sufficient for many use cases. So I avoided
> >     the code duplication the other functions would require.
> >
> > Signed-off-by: Rojhalat Ibrahim <imr@rtschenk.de>
> > ---
> > Change log:
> >   v3: - add documentation
> >       - change commit message
> >   v2: - use descriptor interface
> >       - allow arbitrary groups of GPIOs spanning multiple chips
> 
> This concept has been brought up before. Please keep Grant Likley in
> the loop on these postings as he has some history with this.
> 

Will do.

> As this is a speed optimization basically, do you have performance
> numbers? Like how much quicker is your code in some critical
> usecase as measured by perf or throughput whatever before and
> after doing this?
> 

As mentioned in the commit message my use case is the configuration of an
FPGA. Using the new function configuration time goes down from 48 s to 19 s.

> Notice that the SPI bitbang driver in drivers/spi/spi-gpio.c was one
> of the most important consumers of this API IIRC. So I'm CC:ing
> Mark Brown.
> 
> > +The following two functions set the raw output values of an array of GPIOs:
> > +
> > +       void gpiod_set_raw_array(unsigned int array_size,
> > +                                struct gpio_desc **desc_array,
> > +                                int *value_array)
> > +       void gpiod_set_raw_array_cansleep(unsigned int array_size,
> > +                                         struct gpio_desc **desc_array,
> > +                                         int *value_array)
> 
> So this interface looks quite nice.
> 

Thanks.

> I don't see why the complex loop in the raw setter
> below cannot actually also handle non-raw (cooked? hehe)
> values with some single-liner to invert the value if it
> is active low.
> 

I will look into that. I did not want to invert the active-low values in
the array first and then pass the array of partly inverted values to the
_gpiod_set_raw_array function because that would change the array values
passed by the user.
Another way to handle the non-raw values would of course be to do it in the
same function as the raw values. That would require additional checks and
would possibly degrade performance for the raw case. But the performance
impact could also be negligible. So as I said I will look into it.

> > +static void _gpio_chip_set_multiple(struct gpio_chip *chip,
> 
> I hate _underscored function names, just call it
> gpio_chip_set_multiple_offsets() or  whatever.
> 

Ok.

> > +                                   u32 mask[ARCH_NR_GPIOS/32],
> > +                                   u32 bits[ARCH_NR_GPIOS/32])
> > +{
> 
> First: NO, you NEVER tie any code into ARCH_NR_GPIOS
> because that is something we want to get rid of. Just use
> regular pointers, add a count argument if need be.
> 

Will do.

> > +       if (chip->set_multiple) {
> > +               chip->set_multiple(chip, mask, bits);
> 
> Simple and quick OK. But even this is making a quite
> nasty assumption...
> 

Could you elaborate? What's the nasty assumption?

> > +       } else {
> > +               int i;
> > +               for (i = 0; i < ARCH_NR_GPIOS; i++) {
> 
> As I said you cannot depend on ARCH_NR_GPIOS and not
> introduce more dependencies to it. Figure out something else.
> Like using chip->ngpio to iterate.
> 

Ok.

> > +                       if (i > chip->ngpio - 1)
> > +                               break;
> > +                       if (mask[i/32] == 0) {
> > +                               /* skip ahead */
> > +                               i = (i/32 + 1) * 32 - 1;
> > +                               continue;
> > +                       }
> > +                       if (mask[i/32] & (1 << (i % 32))) {
> > +                               chip->set(chip, i, (bits[i/32] >> (i % 32)) & 1);
> > +                               mask[i/32] &= ~(1 << (i % 32));
> > +                       }
> > +               }
> > +       }
> > +}
> 
> This code is a bit convoluted but I *guess* the idea is to iterate
> over the 32 bits in the argument word by word. Add some
> comments describing what's going on.
> 

Will do.

> Some chips have 8bit or 16bit registers actually but AFAICT
> that is not what this is about, rather about the fact that the
> function takes 32bit arguments.
> 

Right.

> > +static void _gpiod_set_raw_array(unsigned int array_size,
> 
> No underscored function name.
> 

Ok.

> > +                                struct gpio_desc **desc_array,
> > +                                int *value_array)
> > +{
> > +       struct gpio_chip *chip = desc_array[0]->chip;
> > +       u32 mask[ARCH_NR_GPIOS/32];
> > +       u32 bits[ARCH_NR_GPIOS/32];
> 
> Again dependency to ARCH_NR_GPIOS. Don't do it.
> 

Ok.

> > +       int count = 0;
> > +       int i;
> > +
> > +       memset(mask, 0, sizeof(mask));
> > +       for (i = 0; i < array_size; i++) {
> > +               struct gpio_desc *desc = desc_array[i];
> > +               int hwgpio = gpio_chip_hwgpio(desc);
> > +               int value = value_array[i];
> > +
> > +               /* another chip; push collected bits to outputs */
> > +               if (desc->chip != chip) {
> 
> Clever logic!
> 

Thanks.

> > +                       if (count != 0) {
> > +                               _gpio_chip_set_multiple(chip, mask, bits);
> > +                               memset(mask, 0, sizeof(mask));
> > +                               count = 0;
> > +                       }
> > +                       chip = desc->chip;
> > +               }
> > +               /* collect all normal outputs belonging to the same chip */
> > +               /* open drain and open source outputs are set individually */
> > +               trace_gpio_value(desc_to_gpio(desc), 0, value);
> > +               if (test_bit(FLAG_OPEN_DRAIN, &desc->flags)) {
> > +                       _gpio_set_open_drain_value(desc, value);
> > +               } else if (test_bit(FLAG_OPEN_SOURCE, &desc->flags)) {
> > +                       _gpio_set_open_source_value(desc, value);
> > +               } else {
> > +                       mask[hwgpio/32] |= (1 << (hwgpio % 32));
> > +                       if (value) {
> > +                               bits[hwgpio/32] |= (1 << (hwgpio % 32));
> > +                       } else {
> > +                               bits[hwgpio/32] &= ~(1 << (hwgpio % 32));
> > +                       }
> > +                       count++;
> > +               }
> 
> This is also real smart and nice code.
> 

Thanks again.

> The assumption is that this iteration hotloop will be quicker
> to run, and the driver can take shortcuts improving performance.
> As mentione above we need some proof of that as it complicates
> the code a lot for this performance improvement.
> 

See above.

> > +       }
> > +       if (count != 0) {
> > +               _gpio_chip_set_multiple(chip, mask, bits);
> > +       }
> > +}
> > +
> 
> (...)
> 
> >  static inline int gpiod_set_debounce(struct gpio_desc *desc, unsigned debounce)
> >  {
> > diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
> > index 1827b43..d7968c8 100644
> > --- a/include/linux/gpio/driver.h
> > +++ b/include/linux/gpio/driver.h
> > @@ -32,6 +32,7 @@ struct seq_file;
> >   * @get: returns value for signal "offset"; for output signals this
> >   *     returns either the value actually sensed, or zero
> >   * @set: assigns output value for signal "offset"
> > + * @set_multiple: assigns output values for multiple signals defined by "mask"
> >   * @set_debounce: optional hook for setting debounce time for specified gpio in
> >   *      interrupt triggered gpio chips
> >   * @to_irq: optional hook supporting non-static gpio_to_irq() mappings;
> > @@ -84,6 +85,8 @@ struct gpio_chip {
> >                                                 unsigned offset);
> >         void                    (*set)(struct gpio_chip *chip,
> >                                                 unsigned offset, int value);
> > +       void                    (*set_multiple)(struct gpio_chip *chip,
> > +                                               u32 *mask, u32 *bits);
> 
> This sets the chunk size to 32bits which means that any GPIO
> controller with say 8bit registers will get a complex demuxing
> scheme.
> 
> But thinking of it I think it's a reasonable compromise given that
> so many GPIO drivers are actually 32bit.
> 
> However some of the real slow I2C expander GPIOs are 8bit.
> 

So I'll leave the chunk size at 32 bits.

> Yours,
> Linus Walleij
> 

Thanks for the review. I'll send a new revision of the patch soon.

   Rojhalat



