From: Ray Jui <ray.jui@broadcom.com>
Subject: Re: [PATCH] pinctrl: ns2: Fix potential NULL dereference
Date: Thu, 30 May 2019 17:17:28 -0700
Message-ID: <ace57d13-6194-df8e-d2e8-fbc85d9ce21a@broadcom.com>
References: <1559097838-26070-1-git-send-email-92siuyang@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1559097838-26070-1-git-send-email-92siuyang@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Young Xiao <92siuyang@gmail.com>, rjui@broadcom.com, sbranden@broadcom.com, bcm-kernel-feedback-list@broadcom.com, linus.walleij@linaro.org, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org



On 5/28/2019 7:43 PM, Young Xiao wrote:
> platform_get_resource() may fail and return NULL, so we should
> better check it's return value to avoid a NULL pointer dereference
> a bit later in the code.
> 
> Signed-off-by: Young Xiao <92siuyang@gmail.com>
> ---
>  drivers/pinctrl/bcm/pinctrl-ns2-mux.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/pinctrl/bcm/pinctrl-ns2-mux.c b/drivers/pinctrl/bcm/pinctrl-ns2-mux.c
> index 4b5cf0e..2bf6af7 100644
> --- a/drivers/pinctrl/bcm/pinctrl-ns2-mux.c
> +++ b/drivers/pinctrl/bcm/pinctrl-ns2-mux.c
> @@ -1048,6 +1048,8 @@ static int ns2_pinmux_probe(struct platform_device *pdev)
>  		return PTR_ERR(pinctrl->base0);
>  
>  	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
> +	if (!res)
> +		return -EINVAL;

Right, usually not needed if devm_ioremap_resource is used since it was
checked there. But in this case, I do think it needs to be checked. This
change looks good to me. Thanks.

>  	pinctrl->base1 = devm_ioremap_nocache(&pdev->dev, res->start,
>  					resource_size(res));
>  	if (!pinctrl->base1) {
> 

Reviewed-by: Ray Jui <ray.jui@broadcom.com>
