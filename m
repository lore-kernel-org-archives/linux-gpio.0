From: Keerthy <j-keerthy@ti.com>
Subject: Re: [PATCH 2/5] gpio: davinci: Use dev name for label and automatic
 base selection
Date: Mon, 3 Sep 2018 11:10:23 +0530
Message-ID: <2a02c241-ac91-1bac-380d-122858bb03c3@ti.com>
References: <20180831191326.25106-1-afd@ti.com>
 <20180831191326.25106-2-afd@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180831191326.25106-2-afd@ti.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "Andrew F. Davis" <afd@ti.com>, Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org



On Saturday 01 September 2018 12:43 AM, Andrew F. Davis wrote:
> Use dev_name to get a unique label and use -1 for a base to get our
> selection automatically. We pull in all GPIOs per chip now so this
> does not have the effect of out of order labels like before.
> 
> We do these both together so we can drop all the static data in one
> patch. This also lets us normalize the return paths as we don't need
> any cleanup after this change.

echo 28 > /sys/class/gpio/export
/ # echo 28 > /sys/class/gpi[   12.839205] export_store: invalid GPIO 28
o/export
echo 2 > /sys/class/gp[   22.165728] export_store: invalid GPIO 2
io/export
/ # echo 1 > /sys/class/gp[   25.961392] export_store: invalid GPIO 1
io/export
/ # echo 3 > /sys/class/gp[   29.981918] export_store: invalid GPIO 3
io/export

Export fails with this patch. I am testing this on keystone-k2g-evm.


> 
> Signed-off-by: Andrew F. Davis <afd@ti.com>
> ---
>  drivers/gpio/gpio-davinci.c | 22 ++++------------------
>  1 file changed, 4 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-davinci.c b/drivers/gpio/gpio-davinci.c
> index a5ece8ea79bc..14d1729927d3 100644
> --- a/drivers/gpio/gpio-davinci.c
> +++ b/drivers/gpio/gpio-davinci.c
> @@ -41,7 +41,6 @@ struct davinci_gpio_regs {
>  typedef struct irq_chip *(*gpio_get_irq_chip_cb_t)(unsigned int irq);
>  
>  #define BINTEN	0x8 /* GPIO Interrupt Per-Bank Enable Register */
> -#define MAX_LABEL_SIZE 20
>  
>  static void __iomem *gpio_base;
>  static unsigned int offset_array[5] = {0x10, 0x38, 0x60, 0x88, 0xb0};
> @@ -166,14 +165,12 @@ davinci_gpio_get_pdata(struct platform_device *pdev)
>  
>  static int davinci_gpio_probe(struct platform_device *pdev)
>  {
> -	static int ctrl_num, bank_base;
>  	int gpio, bank, i, ret = 0;
>  	unsigned int ngpio, nbank, nirq;
>  	struct davinci_gpio_controller *chips;
>  	struct davinci_gpio_platform_data *pdata;
>  	struct device *dev = &pdev->dev;
>  	struct resource *res;
> -	char label[MAX_LABEL_SIZE];
>  
>  	pdata = davinci_gpio_get_pdata(pdev);
>  	if (!pdata) {
> @@ -228,10 +225,7 @@ static int davinci_gpio_probe(struct platform_device *pdev)
>  		}
>  	}
>  
> -	snprintf(label, MAX_LABEL_SIZE, "davinci_gpio.%d", ctrl_num++);
> -	chips->chip.label = devm_kstrdup(dev, label, GFP_KERNEL);
> -		if (!chips->chip.label)
> -			return -ENOMEM;
> +	chips->chip.label = dev_name(dev);
>  
>  	chips->chip.direction_input = davinci_direction_in;
>  	chips->chip.get = davinci_gpio_get;
> @@ -239,7 +233,7 @@ static int davinci_gpio_probe(struct platform_device *pdev)
>  	chips->chip.set = davinci_gpio_set;
>  
>  	chips->chip.ngpio = ngpio;
> -	chips->chip.base = bank_base;
> +	chips->chip.base = -1;
>  
>  #ifdef CONFIG_OF_GPIO
>  	chips->chip.of_gpio_n_cells = 2;
> @@ -252,28 +246,20 @@ static int davinci_gpio_probe(struct platform_device *pdev)
>  	}
>  #endif
>  	spin_lock_init(&chips->lock);
> -	bank_base += ngpio;
>  
>  	for (gpio = 0, bank = 0; gpio < ngpio; gpio += 32, bank++)
>  		chips->regs[bank] = gpio_base + offset_array[bank];
>  
>  	ret = devm_gpiochip_add_data(dev, &chips->chip, chips);
>  	if (ret)
> -		goto err;
> +		return ret;
>  
>  	platform_set_drvdata(pdev, chips);
>  	ret = davinci_gpio_irq_setup(pdev);
>  	if (ret)
> -		goto err;
> +		return ret;
>  
>  	return 0;
> -
> -err:
> -	/* Revert the static variable increments */
> -	ctrl_num--;
> -	bank_base -= ngpio;
> -
> -	return ret;
>  }
>  
>  /*--------------------------------------------------------------------------*/
> 
