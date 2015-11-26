From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH RFD 1/3] gpio/mockup: add virtual gpio device
Date: Thu, 26 Nov 2015 10:34:49 +0100
Message-ID: <CACRpkdag_xkSp6uTsoK9tso5mkrGotOeMMjECvecP4ti+5-q_A@mail.gmail.com>
References: <1447491097-14799-1-git-send-email-bamvor.zhangjian@linaro.org>
	<1447491097-14799-2-git-send-email-bamvor.zhangjian@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f45.google.com ([209.85.218.45]:33965 "EHLO
	mail-oi0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753162AbbKZJeu (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 26 Nov 2015 04:34:50 -0500
Received: by oies6 with SMTP id s6so44596464oie.1
        for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2015 01:34:49 -0800 (PST)
In-Reply-To: <1447491097-14799-2-git-send-email-bamvor.zhangjian@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Mark Brown <broonie@kernel.org>, Kamlakant Patel <kamlakant.patel@broadcom.com>

On Sat, Nov 14, 2015 at 9:51 AM, Bamvor Jian Zhang
<bamvor.zhangjian@linaro.org> wrote:

> This patch add basic structure of a virtual gpio device(gpio-mockup)
> for testing gpio subsystem. The tester could manipulate such device
> through sysfs and check the result from debugfs.
>
> Currently, it support one or more gpiochip(determined by module
> parameters with base,ngpio pair). One could test the overlap of
> different gpiochip and test the direction and/or output values of
> these chips.
>
> Signed-off-by: Kamlakant Patel <kamlakant.patel@linaro.org>
> Signed-off-by: Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>

This is looking quite nice. Just minor nitpicks:

> +#include <linux/init.h>
> +#include <linux/module.h>
> +#include <linux/gpio/driver.h>
> +#include <linux/platform_device.h>
> +
> +#define GPIO_NAME      "gpio-mockup"
> +#define        MAX_GC          5
> +
> +enum direction {
> +       IN,
> +       OUT
> +};
> +
> +/*
> + * struct gpio_pin_status - structure describing a GPIO status
> + * @dir:       Configures direction of gpio as "in" or "out", 0=in, 1=out
> + * @value:     Configures status of the gpio as 0(low) or 1(high)
> + */
> +struct gpio_pin_status {
> +       enum direction  dir;
> +       int             value;

bool value

Since it is only 0/1.

> +struct mockup_gpio_controller {
> +       struct gpio_chip        gc;
> +       struct gpio_pin_status  *stats;
> +};
> +
> +int conf[MAX_GC << 1];
> +int params_nr;
> +module_param_array(conf, int, &params_nr, 0400);

I don't really understand why we need these.

"params_nr" is a way too generic name, plus such module parameters
should be documented in Documentation/kernel-parameters.txt
gpio_test_chips = n is better, but I don't really see why we need to
specify this at all, can't we just decide how many we need? Why
do we need more than one?

> +const char *pins_name[MAX_GC] = {"A", "B", "C", "D", "E"};

So this has 5 pins. Any special reason why?
I think 32 is more typical, but there may be a point in having some
odd number.

> +
> +static int
> +mockup_gpio_get(struct gpio_chip *gc, unsigned offset)
> +{
> +       struct mockup_gpio_controller *cntr = container_of(gc,
> +                       struct mockup_gpio_controller, gc);
> +
> +       return cntr->stats[offset].value;

This should still work with a bool there I think.

> +static void
> +mockup_gpio_set(struct gpio_chip *gc, unsigned offset, int value)
> +{
> +       struct mockup_gpio_controller *cntr = container_of(gc,
> +                       struct mockup_gpio_controller, gc);
> +
> +       if (value)
> +               cntr->stats[offset].value = 1;
> +       else
> +               cntr->stats[offset].value = 0;

Assign like this to do boolean clamping:

cntr->stats[offset].value = !!value;


> +int mockup_gpio_add(struct device *dev, struct mockup_gpio_controller *cntr,
> +               const char *name, int base, int ngpio)
> +{
> +       int ret;
> +
> +       cntr->gc.base = base;

I don't think base should be specified for the test chip.
We should set this to -1 and get a dynamic base, whatever
it is. Then the test scripts should deal with that.

Doing this also makes the conf array go away.

> +static int
> +mockup_gpio_probe(struct platform_device *pdev)
> +{
> +       struct device *dev = &pdev->dev;
> +       struct mockup_gpio_controller *cntr;
> +       int ret;
> +       int i, j;
> +       int base;
> +       int ngpio;
> +
> +       if (params_nr == 0) {
> +               params_nr = 2;
> +               conf[0] = 0;
> +               conf[1] = 32;
> +       }

This needs explaining. Why do we want 2 test gpio chips by default?
Why not just one?

Why is the base of the second one 32 and not 5 since there is 5 pins
on each chip?

I would think adding just one chip or two with very varying characteristics
is the way to go. Like one 32 line chip and one 5 line chip or
something.

> +
> +       cntr = devm_kzalloc(dev, sizeof(*cntr) * params_nr, GFP_KERNEL);
> +       if (!cntr)
> +               return -ENOMEM;
> +
> +       platform_set_drvdata(pdev, cntr);
> +
> +       for (i = 0; i < params_nr >> 1; i++) {
> +               base = conf[i << 1];
> +               ngpio = conf[(i << 1) + 1];

These should go away I think.

The rest looks good.

Yours,
Linus Walleij
