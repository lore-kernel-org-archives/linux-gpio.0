From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: Add helpers to determin direction of gpiods
Date: Wed, 13 Dec 2017 15:54:25 +0100
Message-ID: <CACRpkdbK1D6cPm__2DRd0LOi=3RgjBj9ubd1_fWE-=KLcEEbjA@mail.gmail.com>
References: <20171210002340.18460-1-linus.walleij@linaro.org> <20171212224207.xi4yiuyhp5radivr@ninjato>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <20171212224207.xi4yiuyhp5radivr@ninjato>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Wolfram Sang <wsa@the-dreams.de>
Cc: linux-gpio@vger.kernel.org, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Dec 12, 2017 at 11:42 PM, Wolfram Sang <wsa@the-dreams.de> wrote:

>>  Documentation/gpio/consumer.txt | 14 +++++++++++---
>
> You need to fix the kerneldoc for 'gpiod_get_direction", too. It still
> mentions GPIOF_DIR_*.

More places? I can't find them!

I thought the patch removed that here:

-This function will return either GPIOF_DIR_IN or GPIOF_DIR_OUT.
+This function will return either 1 (input) or 0 (output). There are also
+these convenience helpers:

I can only find it in Documentation/gpio/gpio-legacy.txt which is
fine.

>> +static inline bool gpiod_is_input(struct gpio_desc *desc)
>> +{
>> +     int ret = gpiod_get_direction(desc);
>> +     if (ret < 0) {
>> +             pr_err("GPIO: failed to get direction\n");
>
> Is that really helpful for the user if we don't say which GPIO failed?

I would have to add yet more APIs to do that.

Hm.

Together with Geert's comments I start to lean towards actually
just creating two new #defines in <linux/consumer.h>.

It has the upside that we can also check the return value
for errors.

Yours,
Linus Walleij
