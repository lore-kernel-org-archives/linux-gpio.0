From: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Subject: Re: [PATCH 1/2] x86: gpio: AMD G-Series pch gpio platform driver
Date: Thu, 14 Feb 2019 10:56:25 +0100
Message-ID: <55cfbefe-5ff7-9f8d-4507-a5a2f9c78d13@metux.net>
References: <1549588593-4856-1-git-send-email-lkml@metux.net>
 <CACRpkdaSEZMR7LuLbO1V0k9QEBu4FWxFbq4ZL1pE9dAvNT1z_Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdaSEZMR7LuLbO1V0k9QEBu4FWxFbq4ZL1pE9dAvNT1z_Q@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Enrico Weigelt, metux IT consult" <info@metux.net>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86 <platform-driver-x86@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On 08.02.19 15:25, Linus Walleij wrote:

Hi,

>> +config GPIO_AMD_FCH
>> +       tristate "GPIO support for AMD Fusion Controller Hub (G-series SOCs)"
>> +       select GPIO_GENERIC
> 
> You are selecting GPIO_GENERIC, is this necessary? I thought
> X86 was already selecting this.

Doesn't look so - at least haven't found anything where it's
automatically selected on x86. OTOH, that wouldn't make much
sense to me  - I somewhat doubt that x86 can't run w/o that.

Maybe ACPI selects it (haven't checked yet), but my driver is
completely independent from ACPI (the board's BIOS doesn't
provide any useful entries here), ACPI isn't x86 specific
(anymore), and I'd guess x86 boards can run w/o ACPI.
(actually, I'm considering hacking up a completely oftree
based bootup on x86 ;-)).

IMHO, dependencies should always be direct - indirect ones could
suddenly change in subtle ways.

> I think checkpatch will complain on that SPDX thing.
> Copy something from one of the other drivers, it should be
> on the first line of the file.

Yeah, that's a really helpful tool. Maybe I should do some more
automatisation on handling/editing whole patch queues ...
(unless somebody else already did it).

> Cut down the excessive newlines.

Is there some standard rule on this ? Maybe something that checkpatch.pl
could automatically catch ?

>> +static void amd_fch_gpio_dbg_show(struct seq_file *s, struct gpio_chip *gc)
>> +{
>> +       struct amd_fch_gpio_priv *priv = gpiochip_get_data(gc);
>> +       (void)priv;
>> +
>> +       seq_printf(s, "debug info not implemented yet\n");
>> +}
> 
> I think you can just skip implementing this then.

Yep, forgot to clean that up.

>> +static int amd_fch_gpio_request(struct gpio_chip *chip, unsigned gpio_pin)
>> +{
>> +       if (gpio_pin < chip->ngpio)
>> +               return 0;
>> +
>> +       return -EINVAL;
>> +}
> 
> You can probably skip this too. The core already does this check.

Okay, wasn't sure about that, so I preferred defensive programming.

>> +       priv->gc.owner                  = THIS_MODULE;
>> +       priv->gc.parent                 = &pdev->dev;
>> +       priv->gc.label                  = dev_name(&pdev->dev);
>> +       priv->gc.base                   = priv->pdata->gpio_base;
> 
> No please, use priv->gc.base = -1;

Could I also leave that field untouched (IOW: =0) ?

>> +/*
>> + * struct amd_fch_gpio_reg - GPIO register definition
>> + * @reg: register index
>> + * @name: signal name
>> + */
>> +struct amd_fch_gpio_reg {
>> +    int         reg;
>> +    const char* name;
>> +};
> 
> Can't you put this in the driver file?

See other mails.
Need to pass in the board specific register assignments.

>> +struct amd_fch_gpio_pdata {
>> +    struct resource          res;
>> +    int                      gpio_num;
>> +    struct amd_fch_gpio_reg *gpio_reg;
>> +    int                      gpio_base;
>> +};
> 
> Drop gpio_base. We don't hardcode the GPIO base anymore.

Done. I had to patch gpio-keys-polled driver first.


--mtx

-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
