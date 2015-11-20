From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 1/3] gpio: 74xx: fix a possible NULL dereference
Date: Fri, 20 Nov 2015 10:22:02 +0100
Message-ID: <CAMuHMdVpVbEDgLcey2BhBpkKjfOLa9PaR6khx4bD_ryr1zrNrg@mail.gmail.com>
References: <1447273657-1668-1-git-send-email-clabbe.montjoie@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f172.google.com ([209.85.214.172]:33999 "EHLO
	mail-ob0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1161167AbbKTJWE (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 20 Nov 2015 04:22:04 -0500
In-Reply-To: <1447273657-1668-1-git-send-email-clabbe.montjoie@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: LABBE Corentin <clabbe.montjoie@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Wed, Nov 11, 2015 at 9:27 PM, LABBE Corentin
<clabbe.montjoie@gmail.com> wrote:
> of_match_device could return NULL, and so cause a NULL pointer
> dereference later at line 132:
> priv->flags = (uintptr_t) of_id->data;
>
> Reported-by: coverity (CID 1324141)

This is a DT-only driver, hence this cannot happen?

> Signed-off-by: LABBE Corentin <clabbe.montjoie@gmail.com>
> ---
>  drivers/gpio/gpio-74xx-mmio.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpio/gpio-74xx-mmio.c b/drivers/gpio/gpio-74xx-mmio.c
> index 6ed7c0f..6b18682 100644
> --- a/drivers/gpio/gpio-74xx-mmio.c
> +++ b/drivers/gpio/gpio-74xx-mmio.c
> @@ -113,13 +113,16 @@ static int mmio_74xx_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
>
>  static int mmio_74xx_gpio_probe(struct platform_device *pdev)
>  {
> -       const struct of_device_id *of_id =
> -               of_match_device(mmio_74xx_gpio_ids, &pdev->dev);
> +       const struct of_device_id *of_id;
>         struct mmio_74xx_gpio_priv *priv;
>         struct resource *res;
>         void __iomem *dat;
>         int err;
>
> +       of_id = of_match_device(mmio_74xx_gpio_ids, &pdev->dev);
> +       if (!of_id)
> +               return -ENODEV;
> +
>         priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
>         if (!priv)
>                 return -ENOMEM;

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
