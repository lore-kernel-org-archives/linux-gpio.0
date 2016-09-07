From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl/amd: Configure GPIO register using BIOS settings
Date: Wed, 7 Sep 2016 21:56:05 +0200
Message-ID: <CACRpkdZueiySFjk0+iLO1CGdg54+XHqxmOqgp1bXHr7+OmDH_A@mail.gmail.com>
References: <CY1PR12MB00420E90B52B0F478D9DF1CDDCE30@CY1PR12MB0042.namprd12.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f54.google.com ([209.85.218.54]:36223 "EHLO
        mail-oi0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755453AbcIGT4G (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 7 Sep 2016 15:56:06 -0400
Received: by mail-oi0-f54.google.com with SMTP id w78so41289675oie.3
        for <linux-gpio@vger.kernel.org>; Wed, 07 Sep 2016 12:56:06 -0700 (PDT)
In-Reply-To: <CY1PR12MB00420E90B52B0F478D9DF1CDDCE30@CY1PR12MB0042.namprd12.prod.outlook.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "Agrawal, Nitesh-kumar" <Nitesh-kumar.Agrawal@amd.com>, Wei Yongjun <yongjun_wei@trendmicro.com.cn>, Wang Hongcheng <annie.wang@amd.com>, Ken Xue <Ken.Xue@amd.com>
Cc: "S-k, Shyam-sundar" <Shyam-sundar.S-k@amd.com>, "Sen, Pankaj" <Pankaj.Sen@amd.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Wed, Aug 31, 2016 at 10:50 AM, Agrawal, Nitesh-kumar
<Nitesh-kumar.Agrawal@amd.com> wrote:

I'm adding Wei and Wang to the patch as they worked on the driver in the
past and I'd like to hear what they say. Could you folks provide
some ACK or comments?

The indentation is horrible in the patch, I don't know if it is a result
of the mailer though, the it's not your fault and I can fix it up for sure
if you have a problem getting it right.

Just make sure you run scripts/checkpatch.pl before sending the patches.

> In the function amd_gpio_irq_set_type, use the settings provided by
> the BIOS,when the LevelTrig is Edge and activeLevel is HIGH, to configure
> the GPIO registers. Ignore the settings from client.
>
> Reviewed-by:Pankaj Sen <Pankaj.Sen@amd.com>
> Signed-off-by:Nitesh Kumar Agrawal <Nitesh-kumar.Agrawal@amd.com>
> ---
>  drivers/pinctrl/pinctrl-amd.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
> index 828148d..a645082 100644
> --- a/drivers/pinctrl/pinctrl-amd.c
> +++ b/drivers/pinctrl/pinctrl-amd.c
> @@ -385,12 +385,26 @@ static int amd_gpio_irq_set_type(struct irq_data *d, unsigned int type)
>         int ret = 0;
>         u32 pin_reg;
>         unsigned long flags;
> +        u32 levelTrig;

Please refrain from using CamelCase, just call it level_trig.

Also: this seems to be a bool.

> +        u32 activeLevel;

No CamelCase. This doesn't seem to be a bool though, can't really tell.

>         struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
>         struct amd_gpio *gpio_dev = gpiochip_get_data(gc);
>
>         spin_lock_irqsave(&gpio_dev->lock, flags);
>         pin_reg = readl(gpio_dev->base + (d->hwirq)*4);
>
> +        /*
> +         When LevelTrig is set EDGE and activeLevel is set HIGH in BIOS
> +         default settings, ignore incoming settings from client and use
> +         BIOS settings to configure GPIO register.
> +        */

/*
 * Please comment like this
 * with a star in the beginning on every line
 * I know I am picky.
 */

> +        levelTrig = pin_reg & (LEVEL_TRIGGER << LEVEL_TRIG_OFF);

So if this was a bool it would be:

level_trig = !!(pin_reg & (LEVEL_TRIGGER << LEVEL_TRIG_OFF));

Notice how the double-bang (!!) clamps the result to a bool.

> +        activeLevel = pin_reg & (ACTIVE_LEVEL_MASK << ACTIVE_LEVEL_OFF);
> +
> +        if((!levelTrig)&&((activeLevel>> ACTIVE_LEVEL_OFF) == ACTIVE_HIGH)) {
> +           type = IRQ_TYPE_EDGE_FALLING;
> +        }

The thing looks a bit unorthodox but I guess you know what you're doing.

Yours,
Linus Walleij
