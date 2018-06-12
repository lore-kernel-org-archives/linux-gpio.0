From: Alexander Stein <alexander.stein@systec-electronic.com>
Subject: Re: [PATCH v2 1/2] gpio: davinci: Shuffle IRQ resource fetching from DT to beginning of probe
Date: Tue, 12 Jun 2018 07:45:08 +0200
Message-ID: <2368406.Am5sO8QqEf@ws-stein>
References: <1528781273-18098-1-git-send-email-j-keerthy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1528781273-18098-1-git-send-email-j-keerthy@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Keerthy <j-keerthy@ti.com>
Cc: linus.walleij@linaro.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, grygorii.strashko@ti.com, t-kristo@ti.com
List-Id: linux-gpio@vger.kernel.org

On Tuesday, June 12, 2018, 7:27:52 AM CEST Keerthy wrote:
> This is needed in case of PROBE_DEFER if IRQ resource is not yet ready.
> 
> Signed-off-by: Keerthy <j-keerthy@ti.com>
> ---
> [...]
> --- a/drivers/gpio/gpio-davinci.c
> +++ b/drivers/gpio/gpio-davinci.c
> [...]
> @@ -168,7 +168,7 @@ static int davinci_gpio_probe(struct platform_device *pdev)
>  {
>  	static int ctrl_num, bank_base;
>  	int gpio, bank, ret = 0;
> -	unsigned ngpio, nbank;
> +	unsigned ngpio, nbank, bank_irq;

bank_irq should be an int, not unsigned, no?

>  	struct davinci_gpio_controller *chips;
>  	struct davinci_gpio_platform_data *pdata;
>  	struct device *dev = &pdev->dev;
> @@ -209,6 +209,12 @@ static int davinci_gpio_probe(struct platform_device *pdev)
>  	if (IS_ERR(gpio_base))
>  		return PTR_ERR(gpio_base);
>  
> +	bank_irq = platform_get_irq(pdev, 0);
> +	if (bank_irq < 0) {

This won't work using an unsigned.

Best regards,
Alexander
