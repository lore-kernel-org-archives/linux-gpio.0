From: Grygorii Strashko <grygorii.strashko@ti.com>
Subject: Re: [PATCH 2/2] gpio: davinci: Fix the number of controllers
 allocated
Date: Thu, 28 Jan 2016 16:18:52 +0200
Message-ID: <56AA234C.4010707@ti.com>
References: <1453988331-17111-1-git-send-email-j-keerthy@ti.com>
 <1453988331-17111-3-git-send-email-j-keerthy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1453988331-17111-3-git-send-email-j-keerthy@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Keerthy <j-keerthy@ti.com>, linus.walleij@linaro.org, gnurou@gmail.com
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, lokeshvutla@ti.com, Santosh Shilimkar <ssantosh@kernel.org>, Sekhar Nori <nsekhar@ti.com>
List-Id: linux-gpio@vger.kernel.org

On 01/28/2016 03:38 PM, Keerthy wrote:
> From: Lokesh Vutla <lokeshvutla@ti.com>
>
> Driver only needs to allocate for [ngpio / 32] controllers,
> as each controller handles 32 gpios. But the current driver
> allocates for ngpio of which the extra allocated are unused.
> Fix it be registering only the required number of controllers.
>
> Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
> Signed-off-by: Keerthy <j-keerthy@ti.com>

Reviewed-by: Grygorii Strashko <grygorii.strashko@ti.com>

> ---
>   drivers/gpio/gpio-davinci.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpio/gpio-davinci.c b/drivers/gpio/gpio-davinci.c
> index c889f31..cd007a6 100644
> --- a/drivers/gpio/gpio-davinci.c
> +++ b/drivers/gpio/gpio-davinci.c
> @@ -195,7 +195,7 @@ static int davinci_gpio_of_xlate(struct gpio_chip *gc,
>   static int davinci_gpio_probe(struct platform_device *pdev)
>   {
>   	int i, base;
> -	unsigned ngpio;
> +	unsigned ngpio, nbank;
>   	struct davinci_gpio_controller *chips;
>   	struct davinci_gpio_platform_data *pdata;
>   	struct davinci_gpio_regs __iomem *regs;
> @@ -224,8 +224,9 @@ static int davinci_gpio_probe(struct platform_device *pdev)
>   	if (WARN_ON(ARCH_NR_GPIOS < ngpio))
>   		ngpio = ARCH_NR_GPIOS;
>
> +	nbank = DIV_ROUND_UP(ngpio, 32);
>   	chips = devm_kzalloc(dev,
> -			     ngpio * sizeof(struct davinci_gpio_controller),
> +			     nbank * sizeof(struct davinci_gpio_controller),
>   			     GFP_KERNEL);
>   	if (!chips)
>   		return -ENOMEM;
>


-- 
regards,
-grygorii
