From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1] gpio: merrifield: Don't use GPIOF_DIR_IN / GPIOF_DIR_OUT
Date: Thu, 23 Mar 2017 14:06:18 +0100
Message-ID: <CACRpkdZXNuDG8dgOQWMgYmMpA+VG6+_s0jTw7wwU4e_uR+mJjg@mail.gmail.com>
References: <20170323125632.89661-1-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f42.google.com ([209.85.214.42]:35562 "EHLO
        mail-it0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753654AbdCWNGV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Mar 2017 09:06:21 -0400
Received: by mail-it0-f42.google.com with SMTP id y18so39638476itc.0
        for <linux-gpio@vger.kernel.org>; Thu, 23 Mar 2017 06:06:20 -0700 (PDT)
In-Reply-To: <20170323125632.89661-1-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Thu, Mar 23, 2017 at 1:56 PM, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> The mentioned flags are dedicated solely for consumer API.
> Replace them by explicit values.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/gpio/gpio-merrifield.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-merrifield.c b/drivers/gpio/gpio-merrifield.c
> index f40088d268c1..96dc5123a58a 100644
> --- a/drivers/gpio/gpio-merrifield.c
> +++ b/drivers/gpio/gpio-merrifield.c
> @@ -166,7 +166,7 @@ static int mrfld_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
>  {
>         void __iomem *gpdr = gpio_reg(chip, offset, GPDR);
>
> -       return (readl(gpdr) & BIT(offset % 32)) ? GPIOF_DIR_OUT : GPIOF_DIR_IN;
> +       return (readl(gpdr) & BIT(offset % 32)) ? 0 : 1;

I would normally just do this to clamp to [0,1]:

return !(readl(gpdr) & BIT(offset % 32));

So did that fix in the commit.

Yours,
Linus Walleij
