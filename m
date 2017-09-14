From: David Daney <ddaney@caviumnetworks.com>
Subject: Re: [PATCH] gpio: thunderx: remove unused .map() hook from
 irq_domain_ops
Date: Thu, 14 Sep 2017 09:59:26 -0700
Message-ID: <fe9c91d8-33a4-2ecf-8665-3031aa33547f@caviumnetworks.com>
References: <1505356645-19765-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-bn3nam01on0074.outbound.protection.outlook.com ([104.47.33.74]:56192
        "EHLO NAM01-BN3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751277AbdINQ7h (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 14 Sep 2017 12:59:37 -0400
In-Reply-To: <1505356645-19765-1-git-send-email-yamada.masahiro@socionext.com>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, David Daney <david.daney@cavium.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, linux-kernel@vger.kernel.org

On 09/13/2017 07:37 PM, Masahiro Yamada wrote:
> This driver implements .alloc() hook, so .map() is not used.
> 

Have you tested this?

I will have to test this on a real system next week before I can really 
comment on it.

David.



> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
> 
>   drivers/gpio/gpio-thunderx.c | 13 -------------
>   1 file changed, 13 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-thunderx.c b/drivers/gpio/gpio-thunderx.c
> index 57efb25..b5adb79 100644
> --- a/drivers/gpio/gpio-thunderx.c
> +++ b/drivers/gpio/gpio-thunderx.c
> @@ -417,18 +417,6 @@ static struct irq_chip thunderx_gpio_irq_chip = {
>   	.flags			= IRQCHIP_SET_TYPE_MASKED
>   };
>   
> -static int thunderx_gpio_irq_map(struct irq_domain *d, unsigned int irq,
> -				 irq_hw_number_t hwirq)
> -{
> -	struct thunderx_gpio *txgpio = d->host_data;
> -
> -	if (hwirq >= txgpio->chip.ngpio)
> -		return -EINVAL;
> -	if (!thunderx_gpio_is_gpio_nowarn(txgpio, hwirq))
> -		return -EPERM;
> -	return 0;
> -}
> -
>   static int thunderx_gpio_irq_translate(struct irq_domain *d,
>   				       struct irq_fwspec *fwspec,
>   				       irq_hw_number_t *hwirq,
> @@ -455,7 +443,6 @@ static int thunderx_gpio_irq_alloc(struct irq_domain *d, unsigned int virq,
>   }
>   
>   static const struct irq_domain_ops thunderx_gpio_irqd_ops = {
> -	.map		= thunderx_gpio_irq_map,
>   	.alloc		= thunderx_gpio_irq_alloc,
>   	.translate	= thunderx_gpio_irq_translate
>   };
> 
