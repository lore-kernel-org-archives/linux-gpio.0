From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH] extcon: gpio: Request reasonable interrupts
Date: Tue, 4 Jun 2019 10:31:42 +0900
Message-ID: <28b92b86-19ac-0bf3-57d8-c7ab4557a45b@samsung.com>
References: <CGME20190530183941epcas5p4688d5fa80df649e4184a296ea78e6256@epcas5p4.samsung.com>
        <20190530183932.4132-1-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190530183932.4132-1-linus.walleij@linaro.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, MyungJoo Ham <myungjoo.ham@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Hi Linus,

On 19. 5. 31. 오전 3:39, Linus Walleij wrote:
> The only thing that makes sense is to request a falling edge interrupt
> if the line is active low and a rising edge interrupt if the line is
> active high, so just do that and get rid of the assignment from
> platform data. The GPIO descriptor knows if the line is active high
> or low.
> 
> Also make irq a local variable in probe(), it's not used anywhere else.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/extcon/extcon-gpio.c | 27 ++++++++++++++++++---------
>  1 file changed, 18 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/extcon/extcon-gpio.c b/drivers/extcon/extcon-gpio.c
> index 13ba3a6e81d5..a0674f1f3849 100644
> --- a/drivers/extcon/extcon-gpio.c
> +++ b/drivers/extcon/extcon-gpio.c
> @@ -30,26 +30,22 @@
>  /**
>   * struct gpio_extcon_data - A simple GPIO-controlled extcon device state container.
>   * @edev:		Extcon device.
> - * @irq:		Interrupt line for the external connector.
>   * @work:		Work fired by the interrupt.
>   * @debounce_jiffies:	Number of jiffies to wait for the GPIO to stabilize, from the debounce
>   *			value.
>   * @gpiod:		GPIO descriptor for this external connector.
>   * @extcon_id:		The unique id of specific external connector.
>   * @debounce:		Debounce time for GPIO IRQ in ms.
> - * @irq_flags:		IRQ Flags (e.g., IRQF_TRIGGER_LOW).
>   * @check_on_resume:	Boolean describing whether to check the state of gpio
>   *			while resuming from sleep.
>   */
>  struct gpio_extcon_data {
>  	struct extcon_dev *edev;
> -	int irq;
>  	struct delayed_work work;
>  	unsigned long debounce_jiffies;
>  	struct gpio_desc *gpiod;
>  	unsigned int extcon_id;
>  	unsigned long debounce;
> -	unsigned long irq_flags;
>  	bool check_on_resume;
>  };
>  
> @@ -77,6 +73,8 @@ static int gpio_extcon_probe(struct platform_device *pdev)
>  {
>  	struct gpio_extcon_data *data;
>  	struct device *dev = &pdev->dev;
> +	unsigned long irq_flags;
> +	int irq;
>  	int ret;
>  
>  	data = devm_kzalloc(dev, sizeof(struct gpio_extcon_data), GFP_KERNEL);
> @@ -96,9 +94,20 @@ static int gpio_extcon_probe(struct platform_device *pdev)
>  	data->gpiod = devm_gpiod_get(dev, "extcon", GPIOD_IN);
>  	if (IS_ERR(data->gpiod))
>  		return PTR_ERR(data->gpiod);
> -	data->irq = gpiod_to_irq(data->gpiod);
> -	if (data->irq <= 0)
> -		return data->irq;
> +	irq = gpiod_to_irq(data->gpiod);
> +	if (irq <= 0)
> +		return irq;
> +
> +	/*
> +	 * It is unlikely that this is an acknowledged interrupt that goes
> +	 * away after handling, what we are looking for are falling edges
> +	 * if the signal is active low, and rising edges if the signal is
> +	 * active high.
> +	 */
> +	if (gpiod_is_active_low(data->gpiod))
> +		irq_flags = IRQF_TRIGGER_FALLING;

If gpiod_is_active_low(data->gpiod) is true, irq_flags might be
IRQF_TRIGGER_LOW instead of IRQF_TRIGGER_FALLING. How can we sure
that irq_flags is always IRQF_TRIGGER_FALLING?

> +	else
> +		irq_flags = IRQF_TRIGGER_RISING;
>  
>  	/* Allocate the memory of extcon devie and register extcon device */
>  	data->edev = devm_extcon_dev_allocate(dev, &data->extcon_id);
> @@ -117,8 +126,8 @@ static int gpio_extcon_probe(struct platform_device *pdev)
>  	 * Request the interrupt of gpio to detect whether external connector
>  	 * is attached or detached.
>  	 */
> -	ret = devm_request_any_context_irq(dev, data->irq,
> -					gpio_irq_handler, data->irq_flags,
> +	ret = devm_request_any_context_irq(dev, irq,
> +					gpio_irq_handler, irq_flags,
>  					pdev->name, data);
>  	if (ret < 0)
>  		return ret;
> 


-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
