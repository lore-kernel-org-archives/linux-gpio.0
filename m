From: Keerthy <j-keerthy@ti.com>
Subject: Re: [PATCH v2] gpio: davinci: Assign first bank regs for unbanked
 case
Date: Fri, 24 Nov 2017 12:54:50 +0530
Message-ID: <15cfc870-272e-0e40-31a5-7dc1c348fe11@ti.com>
References: <1510312397-29040-1-git-send-email-j-keerthy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from lelnx193.ext.ti.com ([198.47.27.77]:63020 "EHLO
        lelnx193.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751620AbdKXHYx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 24 Nov 2017 02:24:53 -0500
In-Reply-To: <1510312397-29040-1-git-send-email-j-keerthy@ti.com>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, t-kristo@ti.com



On Friday 10 November 2017 04:43 PM, Keerthy wrote:
> As per the re-design assign the first bank regs for unbanked
> irq case. This was missed out in the original patch.

Linus,

A gentle ping.

- Keerthy

> 
> Signed-off-by: Keerthy <j-keerthy@ti.com>
> Fixes: b5cf3fd827d2e1 ("gpio: davinci: Redesign driver to accommodate ngpios in one gpio chip")
> ---
> 
> Changes in v2:
> 
>   * Fixed $Author
> 
>  drivers/gpio/gpio-davinci.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpio/gpio-davinci.c b/drivers/gpio/gpio-davinci.c
> index f75d844..e4b3d7d 100644
> --- a/drivers/gpio/gpio-davinci.c
> +++ b/drivers/gpio/gpio-davinci.c
> @@ -383,7 +383,7 @@ static int gpio_irq_type_unbanked(struct irq_data *data, unsigned trigger)
>  	u32 mask;
>  
>  	d = (struct davinci_gpio_controller *)irq_data_get_irq_handler_data(data);
> -	g = (struct davinci_gpio_regs __iomem *)d->regs;
> +	g = (struct davinci_gpio_regs __iomem *)d->regs[0];
>  	mask = __gpio_mask(data->irq - d->base_irq);
>  
>  	if (trigger & ~(IRQ_TYPE_EDGE_FALLING | IRQ_TYPE_EDGE_RISING))
> 
