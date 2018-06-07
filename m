From: Grygorii Strashko <grygorii.strashko@ti.com>
Subject: Re: [PATCH 2/2] gpio: davinci: Do not assume continuous IRQ numbering
Date: Thu, 7 Jun 2018 14:28:30 -0500
Message-ID: <fa15890c-756e-0821-df69-302fdd451283@ti.com>
References: <1528276734-1483-1-git-send-email-j-keerthy@ti.com>
 <1528276734-1483-2-git-send-email-j-keerthy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1528276734-1483-2-git-send-email-j-keerthy@ti.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Keerthy <j-keerthy@ti.com>, linus.walleij@linaro.org
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, t-kristo@ti.com
List-Id: linux-gpio@vger.kernel.org



On 06/06/2018 04:18 AM, Keerthy wrote:
> Currently the driver assumes that the interrupts are continuous
> and does platform_get_irq only once and assumes the rest are continuous,
> instead call platform_get_irq for all the interrupts and store them
> in an array for later use.
> 
> Signed-off-by: Keerthy <j-keerthy@ti.com>
> ---
> 
> Tested for GPIO Interrupts on da850-lcdk and keystone-k2g-evm boards.
> 
>   drivers/gpio/gpio-davinci.c | 49 ++++++++++++++++++++++++++++++---------------
>   1 file changed, 33 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-davinci.c b/drivers/gpio/gpio-davinci.c
> index 861f35b..375578c 100644
> --- a/drivers/gpio/gpio-davinci.c
> +++ b/drivers/gpio/gpio-davinci.c
> @@ -42,6 +42,7 @@ struct davinci_gpio_regs {
>   
>   #define BINTEN	0x8 /* GPIO Interrupt Per-Bank Enable Register */
>   #define MAX_LABEL_SIZE 20
> +#define MAX_INT_PER_BANK 32
>   
>   static void __iomem *gpio_base;
>   static unsigned int offset_array[5] = {0x10, 0x38, 0x60, 0x88, 0xb0};
> @@ -55,7 +56,7 @@ static inline struct davinci_gpio_regs __iomem *irq2regs(struct irq_data *d)
>   	return g;
>   }
>   
> -static int davinci_gpio_irq_setup(struct platform_device *pdev, int bank_irq);
> +static int davinci_gpio_irq_setup(struct platform_device *pdev, int *bank_irq);
>   
>   /*--------------------------------------------------------------------------*/
>   
> @@ -168,7 +169,8 @@ static int davinci_gpio_probe(struct platform_device *pdev)
>   {
>   	static int ctrl_num, bank_base;
>   	int gpio, bank, ret = 0;
> -	unsigned ngpio, nbank, bank_irq;
> +	unsigned int ngpio, nbank, nirq;
> +	int bank_irq[MAX_INT_PER_BANK], i;
>   	struct davinci_gpio_controller *chips;
>   	struct davinci_gpio_platform_data *pdata;
>   	struct device *dev = &pdev->dev;
> @@ -197,6 +199,16 @@ static int davinci_gpio_probe(struct platform_device *pdev)
>   	if (WARN_ON(ARCH_NR_GPIOS < ngpio))
>   		ngpio = ARCH_NR_GPIOS;
>   
> +	/*
> +	 * If there are unbanked interrupts then the number of
> +	 * interrupts is equal to number of gpios else all are banked so
> +	 * number of interrupts is equal to number of banks(each with 16 gpios)
> +	 */
> +	if (pdata->gpio_unbanked)
> +		nirq = pdata->gpio_unbanked;
> +	else
> +		nirq = DIV_ROUND_UP(ngpio, 16);
> +
>   	nbank = DIV_ROUND_UP(ngpio, 32);
>   	chips = devm_kzalloc(dev,
>   			     nbank * sizeof(struct davinci_gpio_controller),
> @@ -209,10 +221,13 @@ static int davinci_gpio_probe(struct platform_device *pdev)
>   	if (IS_ERR(gpio_base))
>   		return PTR_ERR(gpio_base);
>   
> -	bank_irq = platform_get_irq(pdev, 0);
> -	if (bank_irq < 0) {
> -		dev_dbg(dev, "IRQ not populated\n");
> -		return bank_irq;
> +	for (i = 0; i < nirq; i++) {
> +		bank_irq[i] = platform_get_irq(pdev, i);
> +		if (bank_irq[i] < 0) {
> +			dev_info(dev, "IRQ not populated, err = %d\n",
> +				 bank_irq[i]);
> +			return bank_irq[i];
> +		}
>   	}
>   
>   	snprintf(label, MAX_LABEL_SIZE, "davinci_gpio.%d", ctrl_num++);
> @@ -458,7 +473,7 @@ static struct irq_chip *keystone_gpio_get_irq_chip(unsigned int irq)
>    * (dm6446) can be set appropriately for GPIOV33 pins.
>    */
>   
> -static int davinci_gpio_irq_setup(struct platform_device *pdev, int bank_irq)
> +static int davinci_gpio_irq_setup(struct platform_device *pdev, int *bank_irq)
>   {
>   	unsigned	gpio, bank;
>   	int		irq;
> @@ -492,6 +507,7 @@ static int davinci_gpio_irq_setup(struct platform_device *pdev, int bank_irq)
>   		dev_err(dev, "Error %ld getting gpio clock\n", PTR_ERR(clk));
>   		return PTR_ERR(clk);
>   	}
> +
>   	ret = clk_prepare_enable(clk);
>   	if (ret)
>   		return ret;
> @@ -531,12 +547,12 @@ static int davinci_gpio_irq_setup(struct platform_device *pdev, int bank_irq)
>   	if (pdata->gpio_unbanked) {
>   		/* pass "bank 0" GPIO IRQs to AINTC */
>   		chips->chip.to_irq = gpio_to_irq_unbanked;
> -		chips->base_irq = bank_irq;
> +		chips->base_irq = bank_irq[0];


i think, you need to update gpio_to_irq_unbanked() also, which
probably would require to save array of irqs.


and gpio_irq_type_unbanked()



[...]
> 

-- 
regards,
-grygorii
