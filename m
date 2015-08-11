From: Daniel Kurtz <djkurtz@chromium.org>
Subject: Re: [PATCH] pinctrl: mediatek: Fix multiple registeration issue.
Date: Tue, 11 Aug 2015 15:45:21 +0800
Message-ID: <CAGS+omAE2AXpwnYtvetcjvP_6jUbE2HDuPfKfy=aLook2M-8LQ@mail.gmail.com>
References: <1439268571-10895-1-git-send-email-hongzhou.yang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-yk0-f178.google.com ([209.85.160.178]:32848 "EHLO
	mail-yk0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755353AbbHKHpm (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 11 Aug 2015 03:45:42 -0400
Received: by ykaz130 with SMTP id z130so52877760yka.0
        for <linux-gpio@vger.kernel.org>; Tue, 11 Aug 2015 00:45:41 -0700 (PDT)
In-Reply-To: <1439268571-10895-1-git-send-email-hongzhou.yang@mediatek.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Hongzhou Yang <hongzhou.yang@mediatek.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Maoguang Meng <maoguang.meng@mediatek.com>, Axel Lin <axel.lin@ingics.com>, linux-gpio@vger.kernel.org, Antoine Tenart <antoine.tenart@free-electrons.com>, =?UTF-8?B?RWRkaWUgSHVhbmcgKOm7g+aZuuWCkSk=?= <eddie.huang@mediatek.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-mediatek@lists.infradead.org, Sascha Hauer <kernel@pengutronix.de>, Yingjoe Chen <yingjoe.chen@mediatek.com>, biao.huang@mediatek.com, dandan.he@mediatek.com, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On Tue, Aug 11, 2015 at 12:49 PM, Hongzhou Yang
<hongzhou.yang@mediatek.com> wrote:
> Use dynamic allocation to fix multiple registeration issue.

s/registeration/registration   - here and in the patch subject.

>
> --------------8<--------------------

I don't think this is required.

> Since our common driver need support main chip and PMU
> at the same time, that means it will register two
> pinctrl device, and the pinctrl_desc structure should
> be used two times.
>
> But pinctrl_desc use global static definition, then
> the latest registered pinctrl device will overwrite
> the old one's, all members in pinctrl_desc will set to
> the new one's, such as name, pins and pins numbers, etc.
> This is a bug. Changing to use devm_kzalloc to fix it.
>
> Cc: stable@vger.kernel.org # v4.1+
> Signed-off-by: Hongzhou Yang <hongzhou.yang@mediatek.com>
> ---
>  drivers/pinctrl/mediatek/pinctrl-mtk-common.c |   27 +++++++++++++++----------
>  1 file changed, 16 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
> index ad1ea16..2bba504 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
> @@ -1202,17 +1202,12 @@ static int mtk_pctrl_build_state(struct platform_device *pdev)
>         return 0;
>  }
>
> -static struct pinctrl_desc mtk_pctrl_desc = {
> -       .confops        = &mtk_pconf_ops,
> -       .pctlops        = &mtk_pctrl_ops,
> -       .pmxops         = &mtk_pmx_ops,
> -};
> -
>  int mtk_pctrl_init(struct platform_device *pdev,
>                 const struct mtk_pinctrl_devdata *data,
>                 struct regmap *regmap)
>  {
>         struct pinctrl_pin_desc *pins;
> +       struct pinctrl_desc *mtk_pctrl_desc;
>         struct mtk_pinctrl *pctl;
>         struct device_node *np = pdev->dev.of_node, *node;
>         struct property *prop;
> @@ -1265,12 +1260,22 @@ int mtk_pctrl_init(struct platform_device *pdev,
>
>         for (i = 0; i < pctl->devdata->npins; i++)
>                 pins[i] = pctl->devdata->pins[i].pin;
> -       mtk_pctrl_desc.name = dev_name(&pdev->dev);
> -       mtk_pctrl_desc.owner = THIS_MODULE;
> -       mtk_pctrl_desc.pins = pins;
> -       mtk_pctrl_desc.npins = pctl->devdata->npins;
> +
> +       mtk_pctrl_desc = devm_kzalloc(&pdev->dev, sizeof(*mtk_pctrl_desc),
> +                               GFP_KERNEL);
> +       if (!mtk_pctrl_desc)
> +               return -ENOMEM;

Just embed a struct pinctrl_desc in your struct mtk_pinctrl.

Best Regards,
-Dan

> +
> +       mtk_pctrl_desc->name = dev_name(&pdev->dev);
> +       mtk_pctrl_desc->owner = THIS_MODULE;
> +       mtk_pctrl_desc->pins = pins;
> +       mtk_pctrl_desc->npins = pctl->devdata->npins;
> +       mtk_pctrl_desc->confops = &mtk_pconf_ops;
> +       mtk_pctrl_desc->pctlops = &mtk_pctrl_ops;
> +       mtk_pctrl_desc->pmxops = &mtk_pmx_ops;
>         pctl->dev = &pdev->dev;
> -       pctl->pctl_dev = pinctrl_register(&mtk_pctrl_desc, &pdev->dev, pctl);
> +
> +       pctl->pctl_dev = pinctrl_register(mtk_pctrl_desc, &pdev->dev, pctl);
>         if (IS_ERR(pctl->pctl_dev)) {
>                 dev_err(&pdev->dev, "couldn't register pinctrl driver\n");
>                 return PTR_ERR(pctl->pctl_dev);
> --
> 1.7.9.5
>
>
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek
