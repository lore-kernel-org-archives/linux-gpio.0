From: Mukesh Ojha <mojha@codeaurora.org>
Subject: Re: [PATCH] pinctrl: freescale: use devm_platform_ioremap_resource()
 to simplify code
Date: Mon, 1 Apr 2019 13:41:55 +0530
Message-ID: <f1acb40f-bc90-3241-0a6b-f26f6abe4f0c@codeaurora.org>
References: <1554094986-14897-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1554094986-14897-1-git-send-email-Anson.Huang@nxp.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <anson.huang@nxp.com>, Aisheng Dong <aisheng.dong@nxp.com>, "festevam@gmail.com" <festevam@gmail.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "stefan@agner.ch" <stefan@agner.ch>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-Id: linux-gpio@vger.kernel.org


On 4/1/2019 10:37 AM, Anson Huang wrote:
> Use the new helper devm_platform_ioremap_resource() which wraps the
> platform_get_resource() and devm_ioremap_resource() together, to
> simplify the code.
>
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
Reviewed-by: Mukesh Ojha <mojha@codeaurora.org>

Cheers,
-Mukesh

> ---
>   drivers/pinctrl/freescale/pinctrl-imx.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/pinctrl/freescale/pinctrl-imx.c b/drivers/pinctrl/freescale/pinctrl-imx.c
> index 188001b..cc6f5cc 100644
> --- a/drivers/pinctrl/freescale/pinctrl-imx.c
> +++ b/drivers/pinctrl/freescale/pinctrl-imx.c
> @@ -785,7 +785,6 @@ int imx_pinctrl_probe(struct platform_device *pdev,
>   	struct pinctrl_desc *imx_pinctrl_desc;
>   	struct device_node *np;
>   	struct imx_pinctrl *ipctl;
> -	struct resource *res;
>   	struct regmap *gpr;
>   	int ret, i;
>   
> @@ -817,8 +816,7 @@ int imx_pinctrl_probe(struct platform_device *pdev,
>   			ipctl->pin_regs[i].conf_reg = -1;
>   		}
>   
> -		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -		ipctl->base = devm_ioremap_resource(&pdev->dev, res);
> +		ipctl->base = devm_platform_ioremap_resource(pdev, 0);
>   		if (IS_ERR(ipctl->base))
>   			return PTR_ERR(ipctl->base);
>   
