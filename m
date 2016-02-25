From: Joshua Henderson <joshua.henderson@microchip.com>
Subject: Re: [PATCH 42/50] pinctrl: pic32: Use devm_pinctrl_register() for
 pinctrl registration
Date: Thu, 25 Feb 2016 13:30:43 -0700
Message-ID: <56CF6473.4020804@microchip.com>
References: <1456319775-3216-1-git-send-email-ldewangan@nvidia.com>
 <1456319775-3216-43-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1456319775-3216-43-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>, linus.walleij@linaro.org, corbet@lwn.net, lee@kernel.org
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com, linux-mediatek@lists.infradead.org
List-Id: linux-gpio@vger.kernel.org

On 02/24/2016 06:16 AM, Laxman Dewangan wrote:
> Use devm_pinctrl_register() for pin control registration.
> 
> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>

Reviewed-by: Joshua Henderson <joshua.henderson@microchip.com>

Thanks,
Josh

> ---
>  drivers/pinctrl/pinctrl-pic32.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-pic32.c b/drivers/pinctrl/pinctrl-pic32.c
> index 0b07d4b..2a3fcd6 100644
> --- a/drivers/pinctrl/pinctrl-pic32.c
> +++ b/drivers/pinctrl/pinctrl-pic32.c
> @@ -2194,7 +2194,8 @@ static int pic32_pinctrl_probe(struct platform_device *pdev)
>  	pic32_pinctrl_desc.custom_params = pic32_mpp_bindings;
>  	pic32_pinctrl_desc.num_custom_params = ARRAY_SIZE(pic32_mpp_bindings);
>  
> -	pctl->pctldev = pinctrl_register(&pic32_pinctrl_desc, &pdev->dev, pctl);
> +	pctl->pctldev = devm_pinctrl_register(&pdev->dev, &pic32_pinctrl_desc,
> +					      pctl);
>  	if (IS_ERR(pctl->pctldev)) {
>  		dev_err(&pdev->dev, "Failed to register pinctrl device\n");
>  		return PTR_ERR(pctl->pctldev);
> 
