From: =?UTF-8?Q?Antonio_Fiol_Bonn=C3=ADn?= <antonio@fiol.es>
Subject: Re: [PATCH] gpio: mcp23s08: create default gpio base if neither
 device node nor platform data is defined
Date: Tue, 20 Jan 2015 17:03:00 +0100
Message-ID: <CAEmm_TY6ophCi-3bhQJfaH+QXqxRfzdmL5G9c18rnQib_yd8tA@mail.gmail.com>
References: <1421744408-8837-1-git-send-email-sonic.adi@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f46.google.com ([209.85.218.46]:54954 "EHLO
	mail-oi0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753746AbbATQDB (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 20 Jan 2015 11:03:01 -0500
Received: by mail-oi0-f46.google.com with SMTP id a141so7061431oig.5
        for <linux-gpio@vger.kernel.org>; Tue, 20 Jan 2015 08:03:00 -0800 (PST)
In-Reply-To: <1421744408-8837-1-git-send-email-sonic.adi@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Sonic Zhang <sonic.adi@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, adi-buildroot-devel@lists.sourceforge.net, Sonic Zhang <sonic.zhang@analog.com>

On Tue, Jan 20, 2015 at 10:00 AM, Sonic Zhang <sonic.adi@gmail.com> wrote:
> From: Sonic Zhang <sonic.zhang@analog.com>
>
> Signed-off-by: Sonic Zhang <sonic.zhang@analog.com>

Tested-by: Antonio Fiol <antonio@fiol.es>

> ---
>  drivers/gpio/gpio-mcp23s08.c |   17 ++++++++++-------
>  1 file changed, 10 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpio/gpio-mcp23s08.c b/drivers/gpio/gpio-mcp23s08.c
> index da9c316..eea5d7e 100644
> --- a/drivers/gpio/gpio-mcp23s08.c
> +++ b/drivers/gpio/gpio-mcp23s08.c
> @@ -801,9 +801,11 @@ static int mcp230xx_probe(struct i2c_client *client,
>                 client->irq = irq_of_parse_and_map(client->dev.of_node, 0);
>         } else {
>                 pdata = dev_get_platdata(&client->dev);
> -               if (!pdata || !gpio_is_valid(pdata->base)) {
> -                       dev_dbg(&client->dev, "invalid platform data\n");
> -                       return -EINVAL;
> +               if (!pdata) {
> +                       pdata = devm_kzalloc(&client->dev,
> +                                       sizeof(struct mcp23s08_platform_data),
> +                                       GFP_KERNEL);
> +                       pdata->base = -1;
>                 }
>         }
>
> @@ -924,10 +926,11 @@ static int mcp23s08_probe(struct spi_device *spi)
>         } else {
>                 type = spi_get_device_id(spi)->driver_data;
>                 pdata = dev_get_platdata(&spi->dev);
> -               if (!pdata || !gpio_is_valid(pdata->base)) {
> -                       dev_dbg(&spi->dev,
> -                                       "invalid or missing platform data\n");
> -                       return -EINVAL;
> +               if (!pdata) {
> +                       pdata = devm_kzalloc(&spi->dev,
> +                                       sizeof(struct mcp23s08_platform_data),
> +                                       GFP_KERNEL);
> +                       pdata->base = -1;
>                 }
>
>                 for (addr = 0; addr < ARRAY_SIZE(pdata->chip); addr++) {
> --
> 1.7.9.5
>

Thank you Sonic for the patch, and Alexander for your patience,
understanding and guidance.

This patch is working in my scenario. It is assigning the same base as
it was on the version before the patch that broke the behavior in the
past.

If you wish me to test in other scenarios (e.g. creating a device tree
file, or using platform data), I'd appreciate pointers to learn the
basics, or some help preparing the kernel tree to build with the
needed definitions (if that's what needs to be done).

I am saying this because seeing the commit logs it appears that effort
is being put into the driver to work in scenarios that differ from
mine, and I definitely do not want to break them.

Kind regards,
-- 
Antonio
