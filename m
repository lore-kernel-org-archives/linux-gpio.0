From: Javier Martinez Canillas <javier@dowhile0.org>
Subject: Re: [PATCH] gpiolib: Fix docs for gpiochip_add_pingroup_range
Date: Mon, 29 Jun 2015 17:05:42 +0200
Message-ID: <CABxcv=mSembBjxsR9GSL0cxhP8YrS9wqxfEkba2Jb69pHYsKmw@mail.gmail.com>
References: <1435589806-31079-1-git-send-email-tomeu.vizoso@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-yk0-f173.google.com ([209.85.160.173]:33736 "EHLO
	mail-yk0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752625AbbF2PFm (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 29 Jun 2015 11:05:42 -0400
Received: by ykdt186 with SMTP id t186so117115624ykd.0
        for <linux-gpio@vger.kernel.org>; Mon, 29 Jun 2015 08:05:42 -0700 (PDT)
In-Reply-To: <1435589806-31079-1-git-send-email-tomeu.vizoso@collabora.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Linux GPIO List <linux-gpio@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>

Hello Tomeu,

On Mon, Jun 29, 2015 at 4:56 PM, Tomeu Vizoso
<tomeu.vizoso@collabora.com> wrote:
> gpiochip_add_pingroup_range() has a pctldev argument, not pinctrl.
>
> Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
> ---
>  drivers/gpio/gpiolib.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index bf4bd1d..b1b08b3 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -671,7 +671,7 @@ static void gpiochip_irqchip_remove(struct gpio_chip *gpiochip) {}
>  /**
>   * gpiochip_add_pingroup_range() - add a range for GPIO <-> pin mapping
>   * @chip: the gpiochip to add the range for
> - * @pinctrl: the dev_name() of the pin controller to map to
> + * @pctldev: the pin controller to map to
>   * @gpio_offset: the start offset in the current gpio_chip number space
>   * @pin_group: name of the pin group inside the pin controller
>   */

Reviewed-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>

Best regards,
Javier
