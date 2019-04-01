From: Mukesh Ojha <mojha@codeaurora.org>
Subject: Re: [PATCH] gpio: mxc: use devm_platform_ioremap_resource() to
 simplify code
Date: Mon, 1 Apr 2019 13:41:16 +0530
Message-ID: <ce7c8e36-39d0-efef-eb0c-d403d8eb8801@codeaurora.org>
References: <1554095107-15003-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1554095107-15003-1-git-send-email-Anson.Huang@nxp.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <anson.huang@nxp.com>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-Id: linux-gpio@vger.kernel.org


On 4/1/2019 10:39 AM, Anson Huang wrote:
> Use the new helper devm_platform_ioremap_resource() which wraps the
> platform_get_resource() and devm_ioremap_resource() together, to
> simplify the code.
>
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
Reviewed-by: Mukesh Ojha <mojha@codeaurora.org>

Cheers,
-Mukesh

> ---
>   drivers/gpio/gpio-mxc.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
> index e86e61d..b281358 100644
> --- a/drivers/gpio/gpio-mxc.c
> +++ b/drivers/gpio/gpio-mxc.c
> @@ -411,7 +411,6 @@ static int mxc_gpio_probe(struct platform_device *pdev)
>   {
>   	struct device_node *np = pdev->dev.of_node;
>   	struct mxc_gpio_port *port;
> -	struct resource *iores;
>   	int irq_base;
>   	int err;
>   
> @@ -423,8 +422,7 @@ static int mxc_gpio_probe(struct platform_device *pdev)
>   
>   	port->dev = &pdev->dev;
>   
> -	iores = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	port->base = devm_ioremap_resource(&pdev->dev, iores);
> +	port->base = devm_platform_ioremap_resource(pdev, 0);
>   	if (IS_ERR(port->base))
>   		return PTR_ERR(port->base);
>   
