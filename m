From: Baolin Wang <baolin.wang@linaro.org>
Subject: Re: [PATCH v2] drivers: gpio: sprd: use devm_platform_ioremap_resource()
Date: Tue, 12 Mar 2019 16:49:07 +0800
Message-ID: <CAMz4kuJaFtsmk1sWw_cSc+b0tdNabt_1jZB8hjrJrOgdQkqzmA@mail.gmail.com>
References: <AMz4kuKC5haGbhyVJ4gQ6nMRzdaxJnd3SmeCSM-096p7TAp8cA@mail.gmail.com>
 <1552378134-3678-1-git-send-email-info@metux.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1552378134-3678-1-git-send-email-info@metux.net>
Sender: linux-kernel-owner@vger.kernel.org
To: "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc: LKML <linux-kernel@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Orson Zhai <orsonzhai@gmail.com>, Chunyan Zhang <zhang.lyra@gmail.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, 12 Mar 2019 at 16:08, Enrico Weigelt, metux IT consult
<info@metux.net> wrote:
>
> Use the new helper that wraps the calls to platform_get_resource()
> and devm_ioremap_resource() together.
>
> Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>
> ---
>  drivers/gpio/gpio-eic-sprd.c | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpio/gpio-eic-sprd.c b/drivers/gpio/gpio-eic-sprd.c
> index f0223ce..462cdf4 100644
> --- a/drivers/gpio/gpio-eic-sprd.c
> +++ b/drivers/gpio/gpio-eic-sprd.c
> @@ -567,7 +567,6 @@ static int sprd_eic_probe(struct platform_device *pdev)
>         const struct sprd_eic_variant_data *pdata;
>         struct gpio_irq_chip *irq;
>         struct sprd_eic *sprd_eic;
> -       struct resource *res;
>         int ret, i;
>
>         pdata = of_device_get_match_data(&pdev->dev);
> @@ -596,13 +595,9 @@ static int sprd_eic_probe(struct platform_device *pdev)
>                  * have one bank EIC, thus base[1] and base[2] can be
>                  * optional.
>                  */
> -               res = platform_get_resource(pdev, IORESOURCE_MEM, i);
> -               if (!res)
> -                       continue;
> -
> -               sprd_eic->base[i] = devm_ioremap_resource(&pdev->dev, res);
> +               sprd_eic->base[i] = devm_platform_ioremap_resource(pdev, i);
>                 if (IS_ERR(sprd_eic->base[i]))
> -                       return PTR_ERR(sprd_eic->base[i]);
> +                       continue;
>         }

I still do not think the new API is suitable for this case. Since we
can have optional multiple IO resources, so the original code will not
return errors if we did not get the IO resources, but we must cast
errors if we failed to do ioremap. But you ignore the errors of
ioremap, which is not good.

-- 
Baolin Wang
Best Regards
