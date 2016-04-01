From: Daniel Kurtz <djkurtz@chromium.org>
Subject: Re: [PATCH] pinctrl: mediatek: correct debounce time unit in mtk_gpio_set_debounce
Date: Fri, 1 Apr 2016 22:28:01 +0800
Message-ID: <CAGS+omA=xbZH04nkVddVi77xvNznjx36_rHJHhAHBLejuxZqgA@mail.gmail.com>
References: <1459518711-61619-1-git-send-email-yingjoe.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-yw0-f181.google.com ([209.85.161.181]:35408 "EHLO
	mail-yw0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759263AbcDAO2Y (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 1 Apr 2016 10:28:24 -0400
Received: by mail-yw0-f181.google.com with SMTP id g127so162972180ywf.2
        for <linux-gpio@vger.kernel.org>; Fri, 01 Apr 2016 07:28:22 -0700 (PDT)
In-Reply-To: <1459518711-61619-1-git-send-email-yingjoe.chen@mediatek.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Yingjoe Chen <yingjoe.chen@mediatek.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Hongzhou Yang <hongzhou.yang@mediatek.com>, "open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, srv_heupstream <srv_heupstream@mediatek.com>

Hi Yingjoe,

On Fri, Apr 1, 2016 at 9:51 PM, Yingjoe Chen <yingjoe.chen@mediatek.com> wrote:
> The debounce time unit for gpio_chip.set_debounce is us but
> mtk_gpio_set_debounce regard it as ms.
> Fix this by correct debounce time array dbnc_arr so it can find correct
> debounce setting.

This patch also changes the first entry to 500 usec.  At least mention why.

>
> Signed-off-by: Yingjoe Chen <yingjoe.chen@mediatek.com>
> ---
>  drivers/pinctrl/mediatek/pinctrl-mtk-common.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
> index 2bbe6f7..be72325 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
> @@ -1004,7 +1004,8 @@ static int mtk_gpio_set_debounce(struct gpio_chip *chip, unsigned offset,
>         struct mtk_pinctrl *pctl = dev_get_drvdata(chip->parent);
>         int eint_num, virq, eint_offset;
>         unsigned int set_offset, bit, clr_bit, clr_offset, rst, i, unmask, dbnc;
> -       static const unsigned int dbnc_arr[] = {0 , 1, 16, 32, 64, 128, 256};
> +       static const unsigned int dbnc_arr[] = {500, 1000, 16000, 32000, 64000,
> +                                               128000, 256000};

While you are at it, can you please rename this to something more
readable than "dbnc"?

-Dan

>         const struct mtk_desc_pin *pin;
>         struct irq_data *d;
>
> --
> 1.9.1
>
