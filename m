From: Daniel Kurtz <djkurtz@chromium.org>
Subject: Re: [PATCH] pinctrl: mediatek: fix a memleak when do dt maps.
Date: Tue, 17 Nov 2015 16:25:34 +0800
Message-ID: <CAGS+omCiaD-JJdvL77Y4HuvWjgC5tvLDLspsAgXPtD5AP3JA7w@mail.gmail.com>
References: <1447734177-17258-1-git-send-email-hongzhou.yang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-vk0-f42.google.com ([209.85.213.42]:34355 "EHLO
	mail-vk0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751419AbbKQIZy (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Nov 2015 03:25:54 -0500
Received: by vkha189 with SMTP id a189so842619vkh.1
        for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2015 00:25:54 -0800 (PST)
In-Reply-To: <1447734177-17258-1-git-send-email-hongzhou.yang@mediatek.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Hongzhou Yang <hongzhou.yang@mediatek.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Yingjoe Chen <yingjoe.chen@mediatek.com>, Axel Lin <axel.lin@ingics.com>, Maoguang Meng <maoguang.meng@mediatek.com>, Colin Ian King <colin.king@canonical.com>, linux-gpio@vger.kernel.org, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-mediatek@lists.infradead.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, srv_heupstream <srv_heupstream@mediatek.com>, Sascha Hauer <kernel@pengutronix.de>, biao.huang@mediatek.com

On Tue, Nov 17, 2015 at 12:22 PM, Hongzhou Yang
<hongzhou.yang@mediatek.com> wrote:
> configs will kmemdup to dup_configs in pictrl util function.
> So configs need to be freed.
>
> Signed-off-by: Hongzhou Yang <hongzhou.yang@mediatek.com>

Reviewed-by: Daniel Kurtz <djkurtz@chromium.org>

> ---
>  Fix a memleak issue.
>
>  drivers/pinctrl/mediatek/pinctrl-mtk-common.c |   24 ++++++++++++++----------
>  1 file changed, 14 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
> index bbf0230..0f9e416 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
> @@ -520,21 +520,23 @@ static int mtk_pctrl_dt_subnode_to_map(struct pinctrl_dev *pctldev,
>         if (has_config && num_pins >= 1)
>                 maps_per_pin++;
>
> -       if (!num_pins || !maps_per_pin)
> -               return -EINVAL;
> +       if (!num_pins || !maps_per_pin) {
> +               err = -EINVAL;
> +               goto exit;
> +       }
>
>         reserve = num_pins * maps_per_pin;
>
>         err = pinctrl_utils_reserve_map(pctldev, map,
>                         reserved_maps, num_maps, reserve);
>         if (err < 0)
> -               goto fail;
> +               goto exit;
>
>         for (i = 0; i < num_pins; i++) {
>                 err = of_property_read_u32_index(node, "pinmux",
>                                 i, &pinfunc);
>                 if (err)
> -                       goto fail;
> +                       goto exit;
>
>                 pin = MTK_GET_PIN_NO(pinfunc);
>                 func = MTK_GET_PIN_FUNC(pinfunc);
> @@ -543,20 +545,21 @@ static int mtk_pctrl_dt_subnode_to_map(struct pinctrl_dev *pctldev,
>                                 func >= ARRAY_SIZE(mtk_gpio_functions)) {
>                         dev_err(pctl->dev, "invalid pins value.\n");
>                         err = -EINVAL;
> -                       goto fail;
> +                       goto exit;
>                 }
>
>                 grp = mtk_pctrl_find_group_by_pin(pctl, pin);
>                 if (!grp) {
>                         dev_err(pctl->dev, "unable to match pin %d to group\n",
>                                         pin);
> -                       return -EINVAL;
> +                       err = -EINVAL;
> +                       goto exit;
>                 }
>
>                 err = mtk_pctrl_dt_node_to_map_func(pctl, pin, func, grp, map,
>                                 reserved_maps, num_maps);
>                 if (err < 0)
> -                       goto fail;
> +                       goto exit;
>
>                 if (has_config) {
>                         err = pinctrl_utils_add_map_configs(pctldev, map,
> @@ -564,13 +567,14 @@ static int mtk_pctrl_dt_subnode_to_map(struct pinctrl_dev *pctldev,
>                                         configs, num_configs,
>                                         PIN_MAP_TYPE_CONFIGS_GROUP);
>                         if (err < 0)
> -                               goto fail;
> +                               goto exit;
>                 }
>         }
>
> -       return 0;
> +       err = 0;
>
> -fail:
> +exit:
> +       kfree(configs);
>         return err;
>  }
>
> --
> 1.7.9.5
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
