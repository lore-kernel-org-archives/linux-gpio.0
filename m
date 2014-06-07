From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH 1/2][v4] gpiolib: allow simultaneous setting of multiple
 GPIO outputs
Date: Sat, 7 Jun 2014 22:24:52 +0900
Message-ID: <CAAVeFuLTo_KqQ6dTi_B0kfV=qMF0rwtvxua_cb3XXCwYSRO7AQ@mail.gmail.com>
References: <2025835.bJlicUAVfz@pcimr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-vc0-f175.google.com ([209.85.220.175]:49838 "EHLO
	mail-vc0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750745AbaFGNZO (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 7 Jun 2014 09:25:14 -0400
Received: by mail-vc0-f175.google.com with SMTP id hy4so187183vcb.6
        for <linux-gpio@vger.kernel.org>; Sat, 07 Jun 2014 06:25:13 -0700 (PDT)
In-Reply-To: <2025835.bJlicUAVfz@pcimr>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Rojhalat Ibrahim <imr@rtschenk.de>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Grant Likely <grant.likely@linaro.org>, Mark Brown <broonie@kernel.org>, Gerhard Sittig <gsi@denx.de>

On Tue, Jun 3, 2014 at 12:28 AM, Rojhalat Ibrahim <imr@rtschenk.de> wrote:
> Introduce new functions gpiod_set_array & gpiod_set_raw_array to the consumer
> interface which allow setting multiple outputs with just one function call.
> Also add an optional set_multiple function to the driver interface. Without an
> implementation of that function in the chip driver outputs are set
> sequentially.
>
> Implementing the set_multiple function in a chip driver allows for:
> - Improved performance for certain use cases. The original motivation for this
>   was the task of configuring an FPGA. In that specific case, where 9 GPIO
>   lines have to be set many times, configuration time goes down from 48 s to
>   20 s when using the new function.
> - Simultaneous glitch-free setting of multiple pins on any kind of parallel
>   bus attached to GPIOs provided they all reside on the same chip and bank.
>
> Limitations:
>   Performance is only improved for normal high-low outputs. Open drain and
>   open source outputs are always set separately from each other. Those kinds
>   of outputs could probably be accelerated in a similar way if we could
>   forgo the error checking when setting GPIO directions.
>
> Signed-off-by: Rojhalat Ibrahim <imr@rtschenk.de>
> ---
> Change log:
>   v4: - add gpiod_set_array function for setting logical values
>       - change interface of the set_multiple driver function to use
>         unsigned long as type for the bit fields
>       - use generic bitops (which also use unsigned long for bit fields)
>       - do not use ARCH_NR_GPIOS any more
>   v3: - add documentation
>       - change commit message
>   v2: - use descriptor interface
>       - allow arbitrary groups of GPIOs spanning multiple chips
>
>  Documentation/gpio/consumer.txt |  23 +++++
>  drivers/gpio/gpiolib.c          | 180 ++++++++++++++++++++++++++++++++++++++++
>  include/linux/gpio/consumer.h   |  38 +++++++++
>  include/linux/gpio/driver.h     |   4 +
>  4 files changed, 245 insertions(+)
>
> diff --git a/Documentation/gpio/consumer.txt b/Documentation/gpio/consumer.txt
> index 09854fe..ba02b84 100644
> --- a/Documentation/gpio/consumer.txt
> +++ b/Documentation/gpio/consumer.txt
> @@ -163,6 +163,29 @@ The active-low state of a GPIO can also be queried using the following call:
>  Note that these functions should only be used with great moderation ; a driver
>  should not have to care about the physical line level.
>
> +Set multiple GPIO outputs with a single function call
> +-----------------------------------------------------
> +The following functions set the output values of an array of GPIOs:
> +
> +       void gpiod_set_array(unsigned int array_size,
> +                            struct gpio_desc **desc_array,
> +                            int *value_array)
> +       void gpiod_set_raw_array(unsigned int array_size,
> +                                struct gpio_desc **desc_array,
> +                                int *value_array)
> +       void gpiod_set_array_cansleep(unsigned int array_size,
> +                                     struct gpio_desc **desc_array,
> +                                     int *value_array)
> +       void gpiod_set_raw_array_cansleep(unsigned int array_size,
> +                                         struct gpio_desc **desc_array,
> +                                         int *value_array)
> +
> +The array can be an arbitrary set of GPIOs. The functions will try to set
> +GPIOs belonging to the same bank or chip simultaneously if supported by the
> +corresponding chip driver. In that case a significantly improved performance
> +can be expected. If simultaneous setting is not possible the GPIOs will be set
> +sequentially.
> +
>  GPIOs mapped to IRQs
>  --------------------
>  GPIO lines can quite often be used as IRQs. You can get the IRQ number
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index f48817d..a2be195 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -2345,6 +2345,84 @@ static void _gpiod_set_raw_value(struct gpio_desc *desc, bool value)
>                 chip->set(chip, gpio_chip_hwgpio(desc), value);
>  }
>
> +/*
> + * set multiple outputs on the same chip;
> + * use the chip's set_multiple function if available;
> + * otherwise set the outputs sequentially;
> + * @mask: bit mask array; one bit per output; BITS_PER_LONG bits per word
> + *        defines which outputs are to be changed
> + * @bits: bit value array; one bit per output; BITS_PER_LONG bits per word
> + *        defines the values the outputs specified by mask are to be set to
> + */
> +static void gpio_chip_set_multiple(struct gpio_chip *chip,
> +                                  unsigned long *mask, unsigned long *bits)
> +{
> +       if (chip->set_multiple) {
> +               chip->set_multiple(chip, mask, bits);
> +       } else {
> +               int i;
> +               for (i = 0; i < chip->ngpio; i++) {
> +                       if (mask[BIT_WORD(i)] == 0) {
> +                               /* no more set bits in this mask word;
> +                                * skip ahead to the next word */
> +                               i = (BIT_WORD(i) + 1) * BITS_PER_LONG - 1;
> +                               continue;
> +                       }
> +                       /* set outputs if the corresponding mask bit is set */
> +                       if (__test_and_clear_bit(i, mask)) {
> +                               chip->set(chip, i, test_bit(i, bits));

Shouldn't this be

        chip->set(chip, i, test_bit(i, bits[BIT_WORD(i)]);

?

> +                       }
> +               }
> +       }
> +}
> +
> +static void gpiod_set_array_priv(bool raw, unsigned int array_size,
> +                                struct gpio_desc **desc_array,
> +                                int *value_array)
> +{
> +       int i = 0;
> +
> +       while (i < array_size) {
> +               struct gpio_chip *chip = desc_array[i]->chip;
> +               unsigned long mask[BITS_TO_LONGS(chip->ngpio)];
> +               unsigned long bits[BITS_TO_LONGS(chip->ngpio)];

Nice, you fixed this even better than I suggested. Great to see the
variable-length array seems to be ok.

> +               int count = 0;
> +
> +               memset(mask, 0, sizeof(mask));
> +               do {
> +                       struct gpio_desc *desc = desc_array[i];
> +                       int hwgpio = gpio_chip_hwgpio(desc);
> +                       int value = value_array[i];
> +
> +                       if (!raw && test_bit(FLAG_ACTIVE_LOW, &desc->flags))
> +                               value = !value;
> +                       trace_gpio_value(desc_to_gpio(desc), 0, value);
> +                       /*
> +                        * collect all normal outputs belonging to the same chip
> +                        * open drain and open source outputs are set individually
> +                        */
> +                       if (test_bit(FLAG_OPEN_DRAIN, &desc->flags)) {
> +                               _gpio_set_open_drain_value(desc,value);
> +                       } else if (test_bit(FLAG_OPEN_SOURCE, &desc->flags)) {
> +                               _gpio_set_open_source_value(desc, value);
> +                       } else {
> +                               __set_bit(hwgpio, mask);
> +                               if (value) {
> +                                       __set_bit(hwgpio, bits);
> +                               } else {
> +                                       __clear_bit(hwgpio, bits);

Same here, no more divisions or modulos in the code: great use of the
bit operations!

> +                               }
> +                               count++;
> +                       }
> +                       i++;
> +               } while ((i < array_size) && (desc_array[i]->chip == chip));
> +               /* push collected bits to outputs */
> +               if (count != 0) {
> +                       gpio_chip_set_multiple(chip, mask, bits);
> +               }
> +       }
> +}

So this function will perform optimally if GPIOs belonging to the same
chip are contiguous in the array of gpio_desc. I.e. if you have
interleaved GPIO chips, gpio_chip_set_multiple() will be called
multiple times per chip. It might be worth to mention this in the
documentation of the public functions.

> +
>  /**
>   * gpiod_set_raw_value() - assign a gpio's raw value
>   * @desc: gpio whose value will be assigned
> @@ -2390,6 +2468,60 @@ void gpiod_set_value(struct gpio_desc *desc, int value)
>  EXPORT_SYMBOL_GPL(gpiod_set_value);
>
>  /**
> + * gpiod_set_raw_array() - assign values to an array of GPIOs
> + * @array_size: number of elements in the descriptor / value arrays
> + * @desc_array: array of GPIO descriptors whose values will be assigned
> + * @value_array: array of values to assign
> + *
> + * Set the raw values of the GPIOs, i.e. the values of the physical lines
> + * without regard for their ACTIVE_LOW status.
> + *
> + * This function should be called from contexts where we cannot sleep, and will
> + * complain if the GPIO chip functions potentially sleep.
> + */
> +void gpiod_set_raw_array(unsigned int array_size,
> +                        struct gpio_desc **desc_array, int *value_array)
> +{
> +       if (array_size == 0)
> +               return;
> +       if (!desc_array)
> +               return;
> +       if (!desc_array[0])
> +               return;

I'm still not convinced we need that last one. If any descriptor is
NULL gpiod_set_array_priv() will crash anyway, so we might as well
crash earlier... The user needs to provide valid data, and here in
particular you cannot check every faulty case without parsing the GPIO
array several times. If you want to validate the GPIOs this should be
done for each of them in gpiod_set_array_priv().

> +       /* Should be using gpiod_set_raw_array_cansleep() */
> +       WARN_ON(desc_array[0]->chip->can_sleep);

This will only check for the first chip in the array, but again you
would need to make another array pass to check everything properly
here.

However, if you pass an additional can_sleep parameter to
gpiod_set_array_priv, you can have the can_sleep property of each chip
tested there. Maybe this should be moved there?

Moving these tests would also simplify your 4 public functions.

So in conclusion for these functions:
1) check the validity of each individual GPIO in
gpiod_set_array_priv() (if you want to check their validity at all!)
2) add a can_sleep parameter to gpiod_set_array_priv() and check each
chip as it comes by
3) Remove the check against array_size since gpiod_set_array_priv()
will return immediatly if it is 0.

And voila! Simpler and safer functions. :)

> +       gpiod_set_array_priv(true, array_size, desc_array, value_array);
> +}
> +EXPORT_SYMBOL_GPL(gpiod_set_raw_array);
> +
> +/**
> + * gpiod_set_array() - assign values to an array of GPIOs
> + * @array_size: number of elements in the descriptor / value arrays
> + * @desc_array: array of GPIO descriptors whose values will be assigned
> + * @value_array: array of values to assign
> + *
> + * Set the logical values of the GPIOs, i.e. taking their ACTIVE_LOW status
> + * into account.
> + *
> + * This function should be called from contexts where we cannot sleep, and will
> + * complain if the GPIO chip functions potentially sleep.
> + */
> +void gpiod_set_array(unsigned int array_size,
> +                    struct gpio_desc **desc_array, int *value_array)
> +{
> +       if (array_size == 0)
> +               return;
> +       if (!desc_array)
> +               return;
> +       if (!desc_array[0])
> +               return;
> +       /* Should be using gpiod_set_array_cansleep() */
> +       WARN_ON(desc_array[0]->chip->can_sleep);
> +       gpiod_set_array_priv(false, array_size, desc_array, value_array);
> +}
> +EXPORT_SYMBOL_GPL(gpiod_set_array);
> +
> +/**
>   * gpiod_cansleep() - report whether gpio value access may sleep
>   * @desc: gpio to check
>   *
> @@ -2559,6 +2691,54 @@ void gpiod_set_value_cansleep(struct gpio_desc *desc, int value)
>  EXPORT_SYMBOL_GPL(gpiod_set_value_cansleep);
>
>  /**
> + * gpiod_set_raw_array_cansleep() - assign values to an array of GPIOs
> + * @array_size: number of elements in the descriptor / value arrays
> + * @desc_array: array of GPIO descriptors whose values will be assigned
> + * @value_array: array of values to assign
> + *
> + * Set the raw values of the GPIOs, i.e. the values of the physical lines
> + * without regard for their ACTIVE_LOW status.
> + *
> + * This function is to be called from contexts that can sleep.
> + */
> +void gpiod_set_raw_array_cansleep(unsigned int array_size,
> +                                 struct gpio_desc **desc_array,
> +                                 int *value_array)
> +{
> +       might_sleep_if(extra_checks);

This one can stay here, as I suppose the compiler will optimize it
away, something we could not do in gpiod_set_array_priv().

This patch is turning into something really nice. It is very clear,
well documented and makes smart use of bit ops. Great job. I guess I
will have nothing to say after one or two more passes.

Alex.
