From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: Add driver for MEN 16Z127 GPIO controller
Date: Tue, 6 Oct 2015 09:35:51 +0200
Message-ID: <CACRpkdZhdf787xAH-AY=8fY3YXOuLriVXhJHAn554YFWtDYZ7g@mail.gmail.com>
References: <1444068553-16899-1-git-send-email-andy@wernerandy.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1444068553-16899-1-git-send-email-andy@wernerandy.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Andreas Werner <andy@wernerandy.de>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Johannes Thumshirn <morbidrsa@gmail.com>
List-Id: linux-gpio@vger.kernel.org

On Mon, Oct 5, 2015 at 8:09 PM, Andreas Werner <andy@wernerandy.de> wrote:

> The 16Z127 is a GPIO controller on a MCB FPGA and has 32
> configurable GPIOs.
> The GPIOs can be configured as inputs and outputs
>
> Signed-off-by: Andreas Werner <andy@wernerandy.de>

This driver looks like it can use the generic MMIO library.

select GPIO_GENERIC
#include <linux/basic_mmio_gpio.h>

Then look at example for how to do this, e.g.
drivers/gpio/gpio-74xx-mmio.c

> +config GPIO_MENZ127
> +       tristate "MEN 16Z127 GPIO support"
> +       depends on MCB

Is this "MCB" symbol already upstream? It seems a bit short.

> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/io.h>
> +#include <linux/mcb.h>
> +#include <linux/gpio.h>

Just
#include <linux/gpio/driver.h>

> +#define MEN_Z127_CTRL  0x00
> +#define MEN_Z127_PSR   0x04
> +#define MEN_Z127_IRQR  0x08
> +#define MEN_Z127_GPIODR        0x0c
> +#define MEN_Z127_IER1  0x10
> +#define MEN_Z127_IER2  0x14

It looks like it has interrupt support?

> +#define MEN_Z127_DBER  0x18

Debounce? In that case, maybe implement .set_debounce from day 1?

> +#define MEN_Z127_ODER  0x1C

And Open Drain? Maybe you should support that from day 1?

Yours,
Linus Walleij
