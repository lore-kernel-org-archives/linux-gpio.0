From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH 3/5] gpio: ath79: Make the driver removable
Date: Mon, 8 Feb 2016 12:04:31 +0900
Message-ID: <CAAVeFuL4c6PNnf+YdRZ2ePfk1FVOYmbsg9WnV_1hJe-OHv=77w@mail.gmail.com>
References: <1454010273-21513-1-git-send-email-albeu@free.fr> <1454010273-21513-3-git-send-email-albeu@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f179.google.com ([209.85.223.179]:34441 "EHLO
	mail-io0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754681AbcBHDEv (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 7 Feb 2016 22:04:51 -0500
In-Reply-To: <1454010273-21513-3-git-send-email-albeu@free.fr>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alban Bedel <albeu@free.fr>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Antony Pavlov <antonynpavlov@gmail.com>, Gabor Juhos <juhosg@openwrt.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Fri, Jan 29, 2016 at 4:44 AM, Alban Bedel <albeu@free.fr> wrote:
> As we now allow the driver to be built as a module it should be
> removable.
>
> Signed-off-by: Alban Bedel <albeu@free.fr>
> ---
>  drivers/gpio/gpio-ath79.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/drivers/gpio/gpio-ath79.c b/drivers/gpio/gpio-ath79.c
> index afb535e..6b15792 100644
> --- a/drivers/gpio/gpio-ath79.c
> +++ b/drivers/gpio/gpio-ath79.c
> @@ -46,6 +46,7 @@ static int ath79_gpio_probe(struct platform_device *pdev)
>         ctrl = devm_kzalloc(&pdev->dev, sizeof(*ctrl), GFP_KERNEL);
>         if (!ctrl)
>                 return -ENOMEM;
> +       platform_set_drvdata(pdev, ctrl);
>
>         if (np) {
>                 err = of_property_read_u32(np, "ngpios", &ath79_gpio_count);
> @@ -97,12 +98,21 @@ static int ath79_gpio_probe(struct platform_device *pdev)
>         return 0;
>  }
>
> +static int ath79_gpio_remove(struct platform_device *pdev)
> +{
> +       struct ath79_gpio_ctrl *ctrl = platform_get_drvdata(pdev);

platform_get_drvdata will return a gpio_chip *. I agree the address
will be the same, but for correctness you should use the expected
type. Especially since you will not use a member of ath79_gpio_ctrl in
this function anyway.

> +
> +       gpiochip_remove(&ctrl->gc);
> +       return 0;
> +}

I suspect this removal pattern to be quite common, maybe we should
just export bgpio_pdev_remove() to allow other drivers to use it
instead of rewriting their own version?
