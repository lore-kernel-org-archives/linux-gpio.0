From: Keerthy <j-keerthy@ti.com>
Subject: Re: [PATCH -next] gpio: davinci: drop pointless static qualifier
Date: Wed, 23 Jan 2019 16:02:41 +0530
Message-ID: <f1c0c8d3-49de-bf5d-32c1-1717ea238107@ti.com>
References: <20190123084912.13376-1-yuehaibing@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190123084912.13376-1-yuehaibing@huawei.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: YueHaibing <yuehaibing@huawei.com>, linus.walleij@linaro.org, bgolaszewski@baylibre.com
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On 23/01/19 2:19 PM, YueHaibing wrote:
> There is no need to have the 'gpio_unbanked' variable static since
> new value always be assigned before use it.

Acked-by: Keerthy <j-keerthy@ti.com>

> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  drivers/gpio/gpio-davinci.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-davinci.c b/drivers/gpio/gpio-davinci.c
> index bdb29e5..f250454 100644
> --- a/drivers/gpio/gpio-davinci.c
> +++ b/drivers/gpio/gpio-davinci.c
> @@ -465,7 +465,7 @@ static const struct irq_domain_ops davinci_gpio_irq_ops = {
>  
>  static struct irq_chip *davinci_gpio_get_irq_chip(unsigned int irq)
>  {
> -	static struct irq_chip_type gpio_unbanked;
> +	struct irq_chip_type gpio_unbanked;
>  
>  	gpio_unbanked = *irq_data_get_chip_type(irq_get_irq_data(irq));
>  
> @@ -474,7 +474,7 @@ static struct irq_chip *davinci_gpio_get_irq_chip(unsigned int irq)
>  
>  static struct irq_chip *keystone_gpio_get_irq_chip(unsigned int irq)
>  {
> -	static struct irq_chip gpio_unbanked;
> +	struct irq_chip gpio_unbanked;
>  
>  	gpio_unbanked = *irq_get_chip(irq);
>  	return &gpio_unbanked;
> 
