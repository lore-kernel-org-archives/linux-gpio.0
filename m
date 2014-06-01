From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH 1/2][v3] gpiolib: allow simultaneous setting of multiple
 GPIO outputs
Date: Sun, 1 Jun 2014 18:36:32 +0900
Message-ID: <CAAVeFuJgMr4U0Rwzc3ucYsSNU6ucnED8+b=vJPVaA7BqC97BtA@mail.gmail.com>
References: <7079851.LZm0BOlnTs@pcimr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ve0-f173.google.com ([209.85.128.173]:54630 "EHLO
	mail-ve0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752096AbaFAJgy (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 1 Jun 2014 05:36:54 -0400
Received: by mail-ve0-f173.google.com with SMTP id pa12so3972102veb.18
        for <linux-gpio@vger.kernel.org>; Sun, 01 Jun 2014 02:36:53 -0700 (PDT)
In-Reply-To: <7079851.LZm0BOlnTs@pcimr>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Rojhalat Ibrahim <imr@rtschenk.de>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Gerhard Sittig <gsi@denx.de>, Linus Walleij <linus.walleij@linaro.org>, Grant Likely <grant.likely@linaro.org>

On Tue, May 27, 2014 at 8:14 PM, Rojhalat Ibrahim <imr@rtschenk.de> wrote:
> Introduce a new function gpiod_set_raw_array to the consumer interface which
> allows setting multiple outputs with just one function call. Also add an
> optional set_multiple function to the driver interface. Without an
> implementation of that function in the chip driver outputs are set
> sequentially.
>
> Implementing the set_multiple function in a chip driver allows for:
> - Improved performance for certain use cases. The original motivation for this
>   was the task of configuring an FPGA. In that specific case, where 9 GPIO
>   lines have to be set many times, configuration time goes down from 48 s to
>   19 s when using the new function.
> - Simultaneous glitch-free setting of multiple pins on any kind of parallel
>   bus attached to GPIOs provided they all reside on the same chip and bank.
>
> Limitations:
>   - Performance is only improved for normal high-low outputs. Open drain and
>     open source outputs are always set separately from each other. Those kinds
>     of outputs could probably be accelerated in a similar way if we could
>     forgo the error checking when setting GPIO directions.
>   - There is no gpiod_set_array function that regards the ACTIVE_LOW bits.
>     The raw function should be sufficient for many use cases. So I avoided
>     the code duplication the other functions would require.

How much effort would it be to also implement this function? IIUC it
should just require one extra pass of the values array prior to
calling gpiod_set_raw_array().

>
> Signed-off-by: Rojhalat Ibrahim <imr@rtschenk.de>
> ---
> Change log:
>   v3: - add documentation
>       - change commit message
>   v2: - use descriptor interface
>       - allow arbitrary groups of GPIOs spanning multiple chips
>
>  Documentation/gpio/consumer.txt |  17 ++++++
>  drivers/gpio/gpiolib.c          | 116 ++++++++++++++++++++++++++++++++++++++++
>  include/linux/gpio/consumer.h   |  18 +++++++
>  include/linux/gpio/driver.h     |   3 ++
>  4 files changed, 154 insertions(+)
>
> diff --git a/Documentation/gpio/consumer.txt b/Documentation/gpio/consumer.txt
> index 09854fe..affcd9b 100644
> --- a/Documentation/gpio/consumer.txt
> +++ b/Documentation/gpio/consumer.txt
> @@ -163,6 +163,23 @@ The active-low state of a GPIO can also be queried using the following call:
>  Note that these functions should only be used with great moderation ; a driver
>  should not have to care about the physical line level.
>
> +Set multiple GPIO outputs with a single function call
> +-----------------------------------------------------
> +The following two functions set the raw output values of an array of GPIOs:
> +
> +       void gpiod_set_raw_array(unsigned int array_size,
> +                                struct gpio_desc **desc_array,
> +                                int *value_array)
> +       void gpiod_set_raw_array_cansleep(unsigned int array_size,
> +                                         struct gpio_desc **desc_array,
> +                                         int *value_array)
> +
> +The array can be an arbitrary set of GPIOs. The functions will try to set
> +GPIOs belonging to the same bank or chip simultaneously if supported by the
> +corresponding chip driver. In that case a significantly improved performance
> +can be expected. If simultaneous setting is not possible the GPIOs will be set
> +sequentially.

Nice and clean interface, taking advantage of the descriptor interface.

> +
>  GPIOs mapped to IRQs
>  --------------------
>  GPIO lines can quite often be used as IRQs. You can get the IRQ number
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index f48817d..ee67ef1 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -2345,6 +2345,77 @@ static void _gpiod_set_raw_value(struct gpio_desc *desc, bool value)
>                 chip->set(chip, gpio_chip_hwgpio(desc), value);
>  }
>
> +static void _gpio_chip_set_multiple(struct gpio_chip *chip,
> +                                   u32 mask[ARCH_NR_GPIOS/32],
> +                                   u32 bits[ARCH_NR_GPIOS/32])
> +{
> +       if (chip->set_multiple) {
> +               chip->set_multiple(chip, mask, bits);
> +       } else {
> +               int i;
> +               for (i = 0; i < ARCH_NR_GPIOS; i++) {

As Linus already said, please avoid using the deprecated
ARCH_NR_GPIOS. chip->ngpio should be just as usable in your case...

> +                       if (i > chip->ngpio - 1)
> +                               break;

... and it would allow you to remove that test.

> +                       if (mask[i/32] == 0) {
> +                               /* skip ahead */
> +                               i = (i/32 + 1) * 32 - 1;
> +                               continue;
> +                       }
> +                       if (mask[i/32] & (1 << (i % 32))) {

BIT(i % 32)? (and everywhere else where it applies)

> +                               chip->set(chip, i, (bits[i/32] >> (i % 32)) & 1);

Why are you putting a space around the operator in "i % 32" but not in "i/32" ?

> +                               mask[i/32] &= ~(1 << (i % 32));

There are lots of mask[i/32] and bits[i/32] here. I'm sure the
compiler will optimize them away, but for code clarity it might be
worth to have each set of u32 be processed by another (inline)
function.

> +                       }
> +               }
> +       }
> +}
> +
> +static void _gpiod_set_raw_array(unsigned int array_size,
> +                                struct gpio_desc **desc_array,
> +                                int *value_array)
> +{
> +       struct gpio_chip *chip = desc_array[0]->chip;
> +       u32 mask[ARCH_NR_GPIOS/32];
> +       u32 bits[ARCH_NR_GPIOS/32];

If ARCH_NR_GPIOS is not a multiple of 32, your array will miss one
element. You should use DIV_ROUND_UP(ARCH_NR_GPIOS, 32), but even
better, let's not use ARCH_NR_GPIOS at all.

Maybe someone will kill me for suggesting this, but I wonder if you
could not use C99's VLA-on-stack feature here? Please rap my knuckles
if this is taboo in the kernel, but something like this may work
(untested though):

i = 0;

while (i < array_size) {
       struct gpio_chip *chip = desc_array[i]->chip;
       u32 mask[DIV_ROUND_UP(chip->ngpios, 32)];
        ....

        do {
             /* Process values for GPIOs of the same chip */
        } while (++i < array_size && desc_array[i]->chip != chip);

        _gpio_chip_set_multiple(...);
    }
}

Something like this. It should also avoid some of the repetitions in
your code. That is, *if* the stack VLAs are usable at all and someone
does not fall on us shouting how evil this is.

> +       int count = 0;
> +       int i;
> +
> +       memset(mask, 0, sizeof(mask));
> +       for (i = 0; i < array_size; i++) {
> +               struct gpio_desc *desc = desc_array[i];
> +               int hwgpio = gpio_chip_hwgpio(desc);
> +               int value = value_array[i];
> +
> +               /* another chip; push collected bits to outputs */
> +               if (desc->chip != chip) {
> +                       if (count != 0) {
> +                               _gpio_chip_set_multiple(chip, mask, bits);
> +                               memset(mask, 0, sizeof(mask));
> +                               count = 0;
> +                       }
> +                       chip = desc->chip;
> +               }
> +               /* collect all normal outputs belonging to the same chip */
> +               /* open drain and open source outputs are set individually */
> +               trace_gpio_value(desc_to_gpio(desc), 0, value);
> +               if (test_bit(FLAG_OPEN_DRAIN, &desc->flags)) {
> +                       _gpio_set_open_drain_value(desc, value);
> +               } else if (test_bit(FLAG_OPEN_SOURCE, &desc->flags)) {
> +                       _gpio_set_open_source_value(desc, value);
> +               } else {
> +                       mask[hwgpio/32] |= (1 << (hwgpio % 32));

__set_bit(&mask[hwgpio / 32], BIT(hwgpio % 32))

> +                       if (value) {
> +                               bits[hwgpio/32] |= (1 << (hwgpio % 32));

__set_bit(&bits[hwgpio / 32], BIT(hwgpio % 32))

> +                       } else {
> +                               bits[hwgpio/32] &= ~(1 << (hwgpio % 32));

__clear_bit(&bits[hwgpio / 32], BIT(hwgpio % 32));

> +                       }
> +                       count++;
> +               }
> +       }
> +       if (count != 0) {
> +               _gpio_chip_set_multiple(chip, mask, bits);
> +       }
> +}
> +
>  /**
>   * gpiod_set_raw_value() - assign a gpio's raw value
>   * @desc: gpio whose value will be assigned
> @@ -2390,6 +2461,30 @@ void gpiod_set_value(struct gpio_desc *desc, int value)
>  EXPORT_SYMBOL_GPL(gpiod_set_value);
>
>  /**
> + * gpiod_set_raw_array() - assign values to an array of GPIOs

Miss documentation for array_size here.

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
> +       if (!desc_array)
> +               return;
> +       if (!desc_array[0])
> +               return;

What if array_size == 0? This seems to be more important to check that
the value of desc_array[0].

> +       /* Should be using gpiod_set_raw_array_cansleep() */
> +       WARN_ON(desc_array[0]->chip->can_sleep);
> +       _gpiod_set_raw_array(array_size, desc_array, value_array);
> +}
> +EXPORT_SYMBOL_GPL(gpiod_set_raw_array);
> +
> +/**
>   * gpiod_cansleep() - report whether gpio value access may sleep
>   * @desc: gpio to check
>   *
> @@ -2559,6 +2654,27 @@ void gpiod_set_value_cansleep(struct gpio_desc *desc, int value)
>  EXPORT_SYMBOL_GPL(gpiod_set_value_cansleep);
>
>  /**
> + * gpiod_set_raw_array_cansleep() - assign values to an array of GPIOs

array_size documentation missing here as well.

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
> +       if (!desc_array)
> +               return;

What happened to the other test here?

> +       _gpiod_set_raw_array(array_size, desc_array, value_array);
> +}
> +EXPORT_SYMBOL_GPL(gpiod_set_raw_array_cansleep);
> +
> +/**
>   * gpiod_add_lookup_table() - register GPIO device consumers
>   * @table: table of consumers to register
>   */
> diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.h
> index bed128e..1d0bab3 100644
> --- a/include/linux/gpio/consumer.h
> +++ b/include/linux/gpio/consumer.h
> @@ -42,12 +42,17 @@ int gpiod_get_value(const struct gpio_desc *desc);
>  void gpiod_set_value(struct gpio_desc *desc, int value);
>  int gpiod_get_raw_value(const struct gpio_desc *desc);
>  void gpiod_set_raw_value(struct gpio_desc *desc, int value);
> +void gpiod_set_raw_array(unsigned int array_size,
> +                        struct gpio_desc **desc_array, int *value_array);
>
>  /* Value get/set from sleeping context */
>  int gpiod_get_value_cansleep(const struct gpio_desc *desc);
>  void gpiod_set_value_cansleep(struct gpio_desc *desc, int value);
>  int gpiod_get_raw_value_cansleep(const struct gpio_desc *desc);
>  void gpiod_set_raw_value_cansleep(struct gpio_desc *desc, int value);
> +void gpiod_set_raw_array_cansleep(unsigned int array_size,
> +                                 struct gpio_desc **desc_array,
> +                                 int *value_array);
>
>  int gpiod_set_debounce(struct gpio_desc *desc, unsigned debounce);
>
> @@ -150,6 +155,12 @@ static inline void gpiod_set_raw_value(struct gpio_desc *desc, int value)
>         /* GPIO can never have been requested */
>         WARN_ON(1);
>  }
> +void gpiod_set_raw_array(unsigned int array_size,
> +                        struct gpio_desc **desc_array, int *value_array)
> +{
> +       /* GPIO can never have been requested */
> +       WARN_ON(1);
> +}
>
>  static inline int gpiod_get_value_cansleep(const struct gpio_desc *desc)
>  {
> @@ -174,6 +185,13 @@ static inline void gpiod_set_raw_value_cansleep(struct gpio_desc *desc,
>         /* GPIO can never have been requested */
>         WARN_ON(1);
>  }
> +void gpiod_set_raw_array_cansleep(unsigned int array_size,
> +                                 struct gpio_desc **desc_array,
> +                                 int *value_array)
> +{
> +       /* GPIO can never have been requested */
> +       WARN_ON(1);
> +}
>
>  static inline int gpiod_set_debounce(struct gpio_desc *desc, unsigned debounce)
>  {
> diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
> index 1827b43..d7968c8 100644
> --- a/include/linux/gpio/driver.h
> +++ b/include/linux/gpio/driver.h
> @@ -32,6 +32,7 @@ struct seq_file;
>   * @get: returns value for signal "offset"; for output signals this
>   *     returns either the value actually sensed, or zero
>   * @set: assigns output value for signal "offset"
> + * @set_multiple: assigns output values for multiple signals defined by "mask"
>   * @set_debounce: optional hook for setting debounce time for specified gpio in
>   *      interrupt triggered gpio chips
>   * @to_irq: optional hook supporting non-static gpio_to_irq() mappings;
> @@ -84,6 +85,8 @@ struct gpio_chip {
>                                                 unsigned offset);
>         void                    (*set)(struct gpio_chip *chip,
>                                                 unsigned offset, int value);
> +       void                    (*set_multiple)(struct gpio_chip *chip,
> +                                               u32 *mask, u32 *bits);
>         int                     (*set_debounce)(struct gpio_chip *chip,
>                                                 unsigned offset,
>                                                 unsigned debounce);
>

All in all I think this has good chances to be merged, once the issues
are addressed. The issue of setting multiple GPIOs simulatenously
comes regularly, and the performance improvement is undeniable here.

Alex.
