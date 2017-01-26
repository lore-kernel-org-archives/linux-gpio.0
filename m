From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 2/2] gpio: aspeed: Add banks Y, Z, AA, AB and AC
Date: Thu, 26 Jan 2017 14:51:41 +0100
Message-ID: <CACRpkdZ4hZY1j5U1xfn=trnDJMG1A=K2DbMWxD=79MzmEgouaw@mail.gmail.com>
References: <20170124061646.9317-1-andrew@aj.id.au> <20170124061646.9317-3-andrew@aj.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170124061646.9317-3-andrew@aj.id.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Joel Stanley <joel@jms.id.au>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Jan 24, 2017 at 7:16 AM, Andrew Jeffery <andrew@aj.id.au> wrote:

> This is less straight-forward than one would hope, as some banks only
> have 4 pins rather than 8, others are output only, yet more (W and
> X, already supported) are input-only, and in the case of the g4 SoC bank
> AC doesn't exist.
>
> Add some structs to describe the varying properties of different banks
> and integrate mechanisms to deny requests for unsupported
> configurations.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

(...)
> +#include <linux/gpio.h>

NAK don't do that. (I will explain below...)

(...)

> @@ -189,6 +258,12 @@ static int aspeed_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
>         unsigned long flags;
>         u32 val;
>
> +       if (!have_input(gpio, offset))
> +               return GPIOF_DIR_OUT;
> +
> +       if (!have_output(gpio, offset))
> +               return GPIOF_DIR_IN;

Please refrain from using GPIOF_* in drivers like this.

These flags are part of the consumer API, not the driver API.

Make sure the only header you include in your driver is
<linux/gpio/driver.h> and just return 0/1 instead of these
constants.

> +static void set_irq_valid_mask(struct aspeed_gpio *gpio)
> +{
> +       const struct aspeed_bank_props *props = gpio->config->props;
> +
> +       while (!is_bank_props_sentinel(props)) {
> +               unsigned int offset;
> +               const unsigned long int input = props->input;
> +
> +               /* Pretty crummy approach, but similar to GPIO core */
> +               for_each_clear_bit(offset, &input, 32) {
> +                       unsigned int i = props->bank * 32 + offset;
> +
> +                       if (i >= gpio->config->nr_gpios)
> +                               break;
> +
> +                       clear_bit(i, gpio->chip.irq_valid_mask);
> +               }
> +
> +               props++;
> +       }
> +}

Nice that you use this feature!

> +/*
> + * Any banks not specified in a struct aspeed_bank_props array are assumed to
> + * have the properties:
> + *
> + *     { .input = 0xffffffff, .output = 0xffffffff }
> + */
> +
> +static const struct aspeed_bank_props ast2400_bank_props[] = {
> +       /*     input      output   */
> +       { 5, 0xffffffff, 0x0000ffff }, /* U/V/W/X */
> +       { 6, 0x0000000f, 0x0fffff0f }, /* Y/Z/AA/AB, two 4-GPIO holes */
> +       { },
> +};
> +
> +static const struct aspeed_gpio_config ast2400_config =
> +       /* 220 for simplicity, really 216 with two 4-GPIO holes, four at end */
> +       { .nr_gpios = 220, .props = ast2400_bank_props, };
> +
> +static const struct aspeed_bank_props ast2500_bank_props[] = {
> +       /*     input      output   */
> +       { 5, 0xffffffff, 0x0000ffff }, /* U/V/W/X */
> +       { 6, 0x0fffffff, 0x0fffffff }, /* Y/Z/AA/AB, 4-GPIO hole */
> +       { 7, 0x000000ff, 0x000000ff }, /* AC */
> +       { },
> +};

A bit of magic values but there are comments to explain it so OK.

You could consider using the GENMASK() macro from <linux/bitops.h>
to indicate the bits here but no big deal.

Yours,
Linus Walleij
