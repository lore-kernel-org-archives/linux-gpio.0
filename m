From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 02/21] regulator: fixed: Convert to use GPIO descriptor only
Date: Thu, 19 Apr 2018 14:36:00 +0200
Message-ID: <CACRpkdYXx-nbSFEasioGHTzoOo2-nJ0whk-UVMgqYNNJuoT8bA@mail.gmail.com>
References: <20180212131717.27193-1-linus.walleij@linaro.org>
 <20180212131717.27193-3-linus.walleij@linaro.org> <1518448411.22495.286.camel@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1518448411.22495.286.camel@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Alexander Shiyan <shc_work@mail.ru>, Haojian Zhuang <haojian.zhuang@gmail.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, Tony Lindgren <tony@atomide.com>, Mike Rapoport <mike@compulab.co.il>, Robert Jarzmik <robert.jarzmik@free.fr>, Philipp Zabel <philipp.zabel@gmail.com>, Daniel Mack <zonque@gmail.com>, Marc Zyngier <marc.zyngier@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: linux-gpio@vger.kernel.org

On Mon, Feb 12, 2018 at 4:13 PM, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

>> +static struct gpiod_lookup_table bcm43xx_vmmc_gpio_table = {
>> +     .dev_id = "reg-fixed-voltage.0",
>
> I'm not sure this will be always like this.
> We have DEVID_AUTO, which theoretically can be anything.
>
> Okay, it looks like we have only one static regulator for now for Intel
> MID. Though it's fragile if anything will change in the future (quite
> unlikely).

OK let's hope this doesn't blow up in our face :/
Then I have to think of something.

>> +     cfg.ena_gpiod = devm_gpiod_get_optional(&pdev->dev, NULL,
>> gflags);
>
> Shouldn't we be a little bit more stricter here, i.e. require "enable"
> name?

It sadly won't work.

The reason is the way the regulator device tree bindings look,
specifying just:

Optional properties:
- gpio: gpio to use for enable control
- startup-delay-us: startup time in microseconds
- enable-active-high: Polarity of GPIO is Active high
If this property is missing, the default assumed is Active low.
- gpio-open-drain: GPIO is open drain type.
  If this property is missing then default assumption is false.
-vin-supply: Input supply name.

Not "enable-gpios" as we would write it today.

So it has to retrieve the first (and only) GPIO.

This is another of those historical artifacts, I have tried to
contain some of them, but I don't know if I can do much
about this one :/

Yours,
Linus Walleij
