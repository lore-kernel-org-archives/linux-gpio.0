From: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [v2, PATCH] pinctrl: mt8173: set GPIO16 to usb iddig mode
Date: Mon, 5 Dec 2016 09:50:34 +0800
Message-ID: <1480902634.6851.2.camel@mhfsdcap03>
References: <1480901933-6971-1-git-send-email-chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1480901933-6971-1-git-send-email-chunfeng.yun@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, Biao Huang <biao.huang@mediatek.com>, Hongzhou Yang <hongzhou.yang@mediatek.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Hi,
On Mon, 2016-12-05 at 09:38 +0800, Chunfeng Yun wrote:
> the default mode of GPIO16 pin is gpio, when set EINT16 to
> IRQ_TYPE_LEVEL_HIGH, no interrupt is triggered, it can be
> fixed when set its default mode as usb iddig.
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> Acked-by: Hongzhou Yang <hongzhou.yang@mediatek.com>

Please ignore the v2 patch, just add Acked-by, sorry

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
