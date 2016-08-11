From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] gpio: add Technologic I2C-FPGA gpio support
Date: Thu, 11 Aug 2016 15:27:43 +0200
Message-ID: <CACRpkdZYcno=LYAWXYBrErWNKe3F5gdPUO+6wvVDrqObaF4UQA@mail.gmail.com>
References: <1470408106-8078-1-git-send-email-lucile.quirion@savoirfairelinux.com>
 <1470408106-8078-3-git-send-email-lucile.quirion@savoirfairelinux.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f52.google.com ([209.85.218.52]:34212 "EHLO
	mail-oi0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751372AbcHKN1p (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 11 Aug 2016 09:27:45 -0400
Received: by mail-oi0-f52.google.com with SMTP id l203so4774945oib.1
        for <linux-gpio@vger.kernel.org>; Thu, 11 Aug 2016 06:27:44 -0700 (PDT)
In-Reply-To: <1470408106-8078-3-git-send-email-lucile.quirion@savoirfairelinux.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Lucile Quirion <lucile.quirion@savoirfairelinux.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, kernel <kernel@savoirfairelinux.com>

On Fri, Aug 5, 2016 at 4:41 PM, Lucile Quirion
<lucile.quirion@savoirfairelinux.com> wrote:

> This driver is generic and aims to support all Technologic Systems's
> boards embedding FPGA GPIOs with an I2C interface.
>
> This driver supports TS-4900, TS-7970, TS-7990 and TS-4100 series.
>
> Signed-off-by: Lucile Quirion <lucile.quirion@savoirfairelinux.com>
(...)

> +static int ts4900_gpio_write(struct i2c_client *client, u16 addr, u8 data)
> +{
> +       struct i2c_msg msg;
> +       u8 buf[3];
> +       int ret;
> +
> +       buf[0] = addr >> 8;
> +       buf[1] = addr & 0xFF;
> +       buf[2] = data;
> +
> +       msg.addr = client->addr;
> +       msg.flags = 0;
> +       msg.len = 3;
> +       msg.buf = buf;
> +
> +       ret = i2c_transfer(client->adapter, &msg, 1);
> +       if (ret != 1) {
> +               dev_err(&client->dev, "%s: write error, ret=%d\n",
> +                       __func__, ret);
> +               return -EIO;
> +       }
> +
> +       return 0;
> +}
> +
> +static int ts4900_gpio_read(struct i2c_client *client, u16 addr)
> +{
> +       struct i2c_msg msgs[2];
> +       u8 buf[2];
> +       int ret;
> +
> +       buf[0] = addr >> 8;
> +       buf[1] = addr & 0xFF;
> +
> +       msgs[0].addr = client->addr;
> +       msgs[0].flags = 0;
> +       msgs[0].len = 2;
> +       msgs[0].buf = buf;
> +
> +       msgs[1].addr = client->addr;
> +       msgs[1].flags = I2C_M_RD;
> +       msgs[1].len = 1;
> +       msgs[1].buf = buf;
> +
> +       ret = i2c_transfer(client->adapter, msgs, ARRAY_SIZE(msgs));
> +       if (ret != ARRAY_SIZE(msgs)) {
> +               dev_err(&client->dev, "%s: read error, ret=%d\n",
> +                       __func__, ret);
> +               return -EIO;
> +       }
> +
> +       return buf[0];
> +}

It appears that you can very clearly replace this stuff with an
I2C regmap. If you look in drivers/base/regmap/regmap-i2c.c
you can see that you're just reimplementing regmaps marshalling.

Look at other drivers using I2C regmap for inspiration, e.g.
drivers/mfd/stw481x.c.

select REGMAP_I2C #include <linux/regmap.h> and start by implementing
devm_regmap_init_i2c() etc.

> +static int __ts4900_gpio_direction_output(struct i2c_client *client, int gpio,
> +                                    int value)

I don't like __prefixed functions. Come up with a better name.

> +{
> +       u8 reg = 0;
> +
> +       if (value)
> +               reg = TS4900_GPIO_OD | TS4900_GPIO_OE;
> +       else
> +               reg = TS4900_GPIO_OE;
> +
> +       return ts4900_gpio_write(client, gpio, reg);
> +}

TS4900_GPIO_OD sounds like you can switch the output
between push-pull and open drain and here you are just open
coding all outputs to be open drain. That is confusing.

For controlling open drain implement
.set_single_ended() in the GPIO chip and let consumers
explicitly request that they want their line open drain.

If "OD" does not mean open drain it is extremely confusing
but OK then I am wrong...

> +static int ts4900_gpio_direction_input(struct gpio_chip *chip,
> +                                      unsigned int offset)
> +static int ts4900_gpio_direction_output(struct gpio_chip *chip,
> +                                       unsigned int offset, int value)

Also implement ts4900_gpio_get_direction()

> +static int ts4900_gpio_get(struct gpio_chip *chip, unsigned int offset)
> +{
> +       struct ts4900_gpio_priv *priv = gpiochip_get_data(chip);
> +       int ret;
> +       u8 reg;
> +
> +       reg = ts4900_gpio_read(priv->client, offset);
> +
> +       ret = (reg & priv->input_bit) ? 1 : 0;
> +
> +       return ret;

Just replace the two last lines with:

return !!(reg & priv->input_bit);

> +static void ts4900_gpio_set(struct gpio_chip *chip, unsigned int offset,
> +                           int value)
> +{
> +       struct ts4900_gpio_priv *priv = gpiochip_get_data(chip);
> +
> +       __ts4900_gpio_direction_output(priv->client, offset, value);
> +}

Why should you always set the direction to output when setting
an output value? It doesn't make sense. Make the functions
do one thing. .direction_output() sets an output value at the
same time, but .set() should not force the line as output.

(...)
> +       ret = gpiochip_add_data(&priv->gpio_chip, priv);

Use devm_gpiochip_add_data()

> +static int ts4900_gpio_remove(struct i2c_client *client)
> +{
> +       struct ts4900_gpio_priv *priv = i2c_get_clientdata(client);
> +
> +       gpiochip_remove(&priv->gpio_chip);
> +
> +       return 0;
> +}

Then this is not needed at all (handled by devm*)

Yours,
Linus Walleij
