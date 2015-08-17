From: Yingjoe Chen <yingjoe.chen@mediatek.com>
Subject: Re: [PATCH v4] pinctrl: mediatek: Implement wake handler and
 suspend resume
Date: Mon, 17 Aug 2015 15:52:54 +0800
Message-ID: <1439797974.22004.2.camel@mtksdaap41>
References: <1439541486-22203-1-git-send-email-maoguang.meng@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mailgw01.mediatek.com ([210.61.82.183]:60957 "EHLO
	mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
	with ESMTP id S1750942AbbHQHw6 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Aug 2015 03:52:58 -0400
In-Reply-To: <1439541486-22203-1-git-send-email-maoguang.meng@mediatek.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: maoguang.meng@mediatek.com
Cc: Linus Walleij <linus.walleij@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Hongzhou Yang <hongzhou.yang@mediatek.com>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org

On Fri, 2015-08-14 at 16:38 +0800, maoguang.meng@mediatek.com wrote:
> From: Maoguang Meng <maoguang.meng@mediatek.com>
> 
> This patch implement irq_set_wake to get who is wakeup source and
> setup on suspend resume.
> 
> Signed-off-by: Maoguang Meng <maoguang.meng@mediatek.com>
> 
> ---
> changes since v3:
> -add a comment in mtk_eint_chip_read_mask.
> -delete ALIGN when allocate eint_offsets.ports.
> -fix unrelated change.
> 
> changes since v2:
> -modify irq_wake to handle irq wakeup source.
> -allocate two buffers separately.
> -fix some codestyle.
> 
> Changes since v1:
> -implement irq_wake handler.
> ---
> 
>  drivers/pinctrl/mediatek/pinctrl-mt8173.c     |  1 +
>  drivers/pinctrl/mediatek/pinctrl-mtk-common.c | 91 ++++++++++++++++++++++++++-
>  drivers/pinctrl/mediatek/pinctrl-mtk-common.h |  4 ++
>  3 files changed, 95 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8173.c b/drivers/pinctrl/mediatek/pinctrl-mt8173.c
> index d0c811d..ad27184 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mt8173.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-mt8173.c
> @@ -385,6 +385,7 @@ static struct platform_driver mtk_pinctrl_driver = {
>  	.driver = {
>  		.name = "mediatek-mt8173-pinctrl",
>  		.of_match_table = mt8173_pctrl_match,
> +		.pm = &mtk_eint_pm_ops,
>  	},
>  };
>  
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
> index ad1ea16..fe34ce9 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
> @@ -33,6 +33,7 @@
>  #include <linux/mfd/syscon.h>
>  #include <linux/delay.h>
>  #include <linux/interrupt.h>
> +#include <linux/pm.h>
>  #include <dt-bindings/pinctrl/mt65xx.h>
>  
>  #include "../core.h"
> @@ -1062,6 +1063,77 @@ static int mtk_eint_set_type(struct irq_data *d,
>  	return 0;
>  }
>  
> +static int mtk_eint_irq_set_wake(struct irq_data *d, unsigned int on)
> +{
> +	struct mtk_pinctrl *pctl = irq_data_get_irq_chip_data(d);
> +	int shift = d->hwirq & 0x1f;
> +	int reg = d->hwirq >> 5;
> +
> +	if (on)
> +		pctl->wake_mask[reg] |= BIT(shift);
> +	else
> +		pctl->wake_mask[reg] &= ~BIT(shift);
> +
> +	return 0;
> +}

Hi Maoguang,

You changed from set_bit/clear_bit to this, but didn't add any locking.
Since this is basic read/modify/write, is it OK to do it without
locking?

Joe.C


