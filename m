From: Ray Jui <ray.jui@broadcom.com>
Subject: Re: [PATCH 05/50] pinctrl: cygnus-mux: Use devm_pinctrl_register()
 for pinctrl registration
Date: Wed, 24 Feb 2016 10:27:13 -0800
Message-ID: <f0a27367-6b6d-602d-fd8f-c6b08fe6a1a9@broadcom.com>
References: <1456319775-3216-1-git-send-email-ldewangan@nvidia.com>
 <1456319775-3216-6-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1456319775-3216-6-git-send-email-ldewangan@nvidia.com>
Sender: linux-doc-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>, linus.walleij@linaro.org, corbet@lwn.net, lee@kernel.org
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com, linux-mediatek@lists.infradead.org, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Jon Mason <jonmason@broadcom.com>
List-Id: linux-gpio@vger.kernel.org



On 2/24/2016 5:15 AM, Laxman Dewangan wrote:
> Use devm_pinctrl_register() for pin control registration.
>
> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
> Cc: Ray Jui <rjui@broadcom.com>
> Cc: Scott Branden <sbranden@broadcom.com>
> Cc: Jon Mason <jonmason@broadcom.com>
> ---
>  drivers/pinctrl/bcm/pinctrl-cygnus-mux.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/pinctrl/bcm/pinctrl-cygnus-mux.c b/drivers/pinctrl/bcm/pinctrl-cygnus-mux.c
> index 9728f3d..9382a0a 100644
> --- a/drivers/pinctrl/bcm/pinctrl-cygnus-mux.c
> +++ b/drivers/pinctrl/bcm/pinctrl-cygnus-mux.c
> @@ -987,7 +987,7 @@ static int cygnus_pinmux_probe(struct platform_device *pdev)
>  	cygnus_pinctrl_desc.pins = pins;
>  	cygnus_pinctrl_desc.npins = num_pins;
>
> -	pinctrl->pctl = pinctrl_register(&cygnus_pinctrl_desc, &pdev->dev,
> +	pinctrl->pctl = devm_pinctrl_register(&pdev->dev, &cygnus_pinctrl_desc,
>  			pinctrl);
>  	if (IS_ERR(pinctrl->pctl)) {
>  		dev_err(&pdev->dev, "unable to register Cygnus IOMUX pinctrl\n");
>


Acked-by: Ray Jui <ray.jui@broadcom.com>

Thanks!

Ray
