From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: Consistently use the BIT() macro
Date: Tue, 1 Sep 2015 11:45:19 +0200
Message-ID: <55E573AF.4060408@gmail.com>
References: <1440804302-6903-1-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1440804302-6903-1-git-send-email-javier@osg.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>, linux-kernel@vger.kernel.org
Cc: Hongzhou Yang <hongzhou.yang@mediatek.com>, Axel Lin <axel.lin@ingics.com>, Rob Herring <robh@kernel.org>, linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Maoguang Meng <maoguang.meng@mediatek.com>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Yingjoe Chen <yingjoe.chen@mediatek.com>, Colin Ian King <colin.king@canonical.com>
List-Id: linux-gpio@vger.kernel.org



On 29/08/15 01:25, Javier Martinez Canillas wrote:
> The mediatek pinctrl driver uses the BIT() macro instead of open
> coding 1 << n in all but one place. Replace this occurrence with
> the BIT() macro for consistency.
>
> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
>
> ---
>
>   drivers/pinctrl/mediatek/pinctrl-mtk-common.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
> index 23f2de07f598..497b9125342a 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
> @@ -898,7 +898,7 @@ static int mtk_eint_flip_edge(struct mtk_pinctrl *pctl, int hwirq)
>   	int start_level, curr_level;
>   	unsigned int reg_offset;
>   	const struct mtk_eint_offsets *eint_offsets = &(pctl->devdata->eint_offsets);
> -	u32 mask = 1 << (hwirq & 0x1f);
> +	u32 mask = BIT(hwirq & 0x1f);
>   	u32 port = (hwirq >> 5) & eint_offsets->port_mask;
>   	void __iomem *reg = pctl->eint_reg_base + (port << 2);
>   	const struct mtk_desc_pin *pin;
>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
