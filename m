From: Sonic Zhang <sonic.adi@gmail.com>
Subject: Re: [PATCH] gpio: make driver mcp23s08 to support both device tree
 and platform data
Date: Tue, 26 Aug 2014 16:34:18 +0800
Message-ID: <CAJxxZ0Mz8DmdGCLWzwqj5fyVnPVvLF8+5EpCrFW2v=jMDY7OiA@mail.gmail.com>
References: <1408528678-22214-1-git-send-email-sonic.adi@gmail.com>
	<CAAVeFuKzjLkcrE4rKKz+yY_X2uByFDXBsN9ohKVS5VTucUR0qQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f44.google.com ([209.85.218.44]:59082 "EHLO
	mail-oi0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932353AbaHZIeT (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 26 Aug 2014 04:34:19 -0400
Received: by mail-oi0-f44.google.com with SMTP id x69so10526761oia.3
        for <linux-gpio@vger.kernel.org>; Tue, 26 Aug 2014 01:34:18 -0700 (PDT)
In-Reply-To: <CAAVeFuKzjLkcrE4rKKz+yY_X2uByFDXBsN9ohKVS5VTucUR0qQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexandre Courbot <gnurou@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, adi-buildroot-devel@lists.sourceforge.net, Sonic Zhang <sonic.zhang@analog.com>

Hi Alexandre,

On Mon, Aug 25, 2014 at 9:06 PM, Alexandre Courbot <gnurou@gmail.com> wrote:
> On Wed, Aug 20, 2014 at 2:57 AM, Sonic Zhang <sonic.adi@gmail.com> wrote:
>> From: Sonic Zhang <sonic.zhang@analog.com>
>>
>> Device tree is not enabled in some archtecture where gpio driver mcp23s08
>> is still required.
>>
>> Signed-off-by: Sonic Zhang <sonic.zhang@analog.com>
>> ---
>>  drivers/gpio/Kconfig         |  1 -
>>  drivers/gpio/gpio-mcp23s08.c | 29 +++++++++++++++++++++++------
>>  include/linux/spi/mcp23s08.h | 18 ++++++++++++++++++
>>  3 files changed, 41 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
>> index 9de1515..f155b6b 100644
>> --- a/drivers/gpio/Kconfig
>> +++ b/drivers/gpio/Kconfig
>> @@ -796,7 +796,6 @@ config GPIO_MAX7301
>>
>>  config GPIO_MCP23S08
>>         tristate "Microchip MCP23xxx I/O expander"
>> -       depends on OF_GPIO
>>         depends on (SPI_MASTER && !I2C) || I2C
>>         help
>>           SPI/I2C driver for Microchip MCP23S08/MCP23S17/MCP23008/MCP23017
>> diff --git a/drivers/gpio/gpio-mcp23s08.c b/drivers/gpio/gpio-mcp23s08.c
>> index 6f183d9..867e8c5 100644
>> --- a/drivers/gpio/gpio-mcp23s08.c
>> +++ b/drivers/gpio/gpio-mcp23s08.c
>> @@ -479,8 +479,13 @@ static int mcp23s08_irq_setup(struct mcp23s08 *mcp)
>>
>>         mutex_init(&mcp->irq_lock);
>>
>> +#ifdef CONFIG_OF
>>         mcp->irq_domain = irq_domain_add_linear(chip->of_node, chip->ngpio,
>>                                                 &irq_domain_simple_ops, mcp);
>> +#else
>> +       mcp->irq_domain = irq_domain_add_linear(NULL, chip->ngpio,
>> +                                               &irq_domain_simple_ops, mcp);
>> +#endif
>>         if (!mcp->irq_domain)
>>                 return -ENODEV;
>>
>> @@ -581,7 +586,9 @@ done:
>>
>>  static int mcp23s08_probe_one(struct mcp23s08 *mcp, struct device *dev,
>>                               void *data, unsigned addr, unsigned type,
>> -                             unsigned base, unsigned pullups)
>> +                             unsigned base, unsigned pullups,
>> +                             const struct of_device_id *match,
>> +                             struct mcp23s08_platform_data *pdata)
>>  {
>>         int status;
>>         bool mirror = false;
>> @@ -648,11 +655,20 @@ static int mcp23s08_probe_one(struct mcp23s08 *mcp, struct device *dev,
>>         if (status < 0)
>>                 goto fail;
>>
>> -       mcp->irq_controller = of_property_read_bool(mcp->chip.of_node,
>> +       if (match) {
>> +#ifdef CONFIG_OF
>> +               mcp->irq_controller = of_property_read_bool(mcp->chip.of_node,
>>                                                 "interrupt-controller");
>> -       if (mcp->irq && mcp->irq_controller && (type == MCP_TYPE_017))
>> -               mirror = of_property_read_bool(mcp->chip.of_node,
>> +               if (mcp->irq && mcp->irq_controller && (type == MCP_TYPE_017))
>> +                       mirror = of_property_read_bool(mcp->chip.of_node,
>>                                                 "microchip,irq-mirror");
>> +#endif
>> +       } else {
>> +               mcp->irq_controller = pdata->irq_controller;
>> +
>> +               if (mcp->irq && mcp->irq_controller && (type == MCP_TYPE_017))
>> +                       mirror = pdata->mirror;
>> +       }
>>
>>         if ((status & IOCON_SEQOP) || !(status & IOCON_HAEN) || mirror) {
>>                 /* mcp23s17 has IOCON twice, make sure they are in sync */
>> @@ -795,7 +811,8 @@ static int mcp230xx_probe(struct i2c_client *client,
>>
>>         mcp->irq = client->irq;
>>         status = mcp23s08_probe_one(mcp, &client->dev, client, client->addr,
>> -                                   id->driver_data, base, pullups);
>> +                                   id->driver_data, base, pullups,
>> +                                   match, pdata);
>
> It seems that some of your parameters are redundant here. Base and
> pullups are part of pdata, which also contains other informtion that
> you might also try to infer from DT. All in all this is a bit
> confusing.
>
> I believe you should do what many drivers supporting both platform and
> DT do: have a DT parsing function that fills the platform_data if DT
> is used, and only pass the properly-filled platform_data to
> mcp23s08_probe_one(). That way you will replace the base, pullups,
> match and pdata by a single pdata arguments, will have DT parsing
> isolated in a single function, and will simplify your code.

The former patch is trying to add the platform data support with
minimum change to current code structure. I am fine to convert current
i2c and spi probe functions to use pdata with or without OF. But, this
may change the SPI probe function a lot, which I have no hardware to
validate. I will have a try.

Thanks,

Sonic
