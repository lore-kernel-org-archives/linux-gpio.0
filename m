From: Hongzhou Yang <hongzhou.yang@mediatek.com>
Subject: Re: [RESEND PATCH] pinctrl: mt8173: set GPIO16 to usb iddig mode
Date: Wed, 30 Nov 2016 16:45:57 -0800
Message-ID: <1480553157.29122.8.camel@mussux00>
References: <1480472491-4644-1-git-send-email-chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mailgw01.mediatek.com ([69.46.227.141]:38991 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752720AbcLAAqC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Nov 2016 19:46:02 -0500
In-Reply-To: <1480472491-4644-1-git-send-email-chunfeng.yun@mediatek.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, Biao Huang <biao.huang@mediatek.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org

On Wed, 2016-11-30 at 10:21 +0800, Chunfeng Yun wrote:
> the default mode of GPIO16 pin is gpio, when set EINT16 to
> IRQ_TYPE_LEVEL_HIGH, no interrupt is triggered, it can be
> fixed when set its default mode as usb iddig.
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
>  drivers/pinctrl/mediatek/pinctrl-mtk-mt8173.h |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-mt8173.h b/drivers/pinctrl/mediatek/pinctrl-mtk-mt8173.h
> index 13e5b68..9b018fd 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mtk-mt8173.h
> +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-mt8173.h
> @@ -201,7 +201,7 @@
>  	MTK_PIN(
>  		PINCTRL_PIN(16, "IDDIG"),
>  		NULL, "mt8173",
> -		MTK_EINT_FUNCTION(0, 16),
> +		MTK_EINT_FUNCTION(1, 16),
>  		MTK_FUNCTION(0, "GPIO16"),
>  		MTK_FUNCTION(1, "IDDIG"),
>  		MTK_FUNCTION(2, "CMFLASH"),

Acked-by: Hongzhou Yang <hongzhou.yang@mediatek.com>

Thanks,
Hongzhou

