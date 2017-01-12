From: Keerthy <j-keerthy@ti.com>
Subject: Re: [PATCH 2/3] gpio: davinci: Redesign driver to accommodate ngpios
 in one gpio chip
Date: Thu, 12 Jan 2017 07:30:51 +0530
Message-ID: <3a017847-abad-f215-30d9-764a0cb07041@ti.com>
References: <1484110841-2391-1-git-send-email-j-keerthy@ti.com>
 <1484110841-2391-3-git-send-email-j-keerthy@ti.com>
 <e2b903a2-24e2-43ef-ef08-d50c0748d046@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from fllnx210.ext.ti.com ([198.47.19.17]:43507 "EHLO
        fllnx210.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754960AbdALCA6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Jan 2017 21:00:58 -0500
In-Reply-To: <e2b903a2-24e2-43ef-ef08-d50c0748d046@ti.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Grygorii Strashko <grygorii.strashko@ti.com>, linus.walleij@linaro.org, t-kristo@ti.com
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, gnurou@gmail.com



On Wednesday 11 January 2017 11:23 PM, Grygorii Strashko wrote:
>
>
> On 01/10/2017 11:00 PM, Keerthy wrote:
>> The Davinci GPIO driver is implemented to work with one monolithic
>> Davinci GPIO platform device which may have up to Y(144) gpios.
>> The Davinci GPIO driver instantiates number of GPIO chips with
>> max 32 gpio pins per each during initialization and one IRQ domain.
>> So, the current GPIO's  opjects structure is:
>>
>> <platform device> Davinci GPIO controller
>>  |- <gpio0_chip0> ------|
>>  ...                    |--- irq_domain (hwirq [0..143])
>>  |- <gpio0_chipN> ------|
>>
>> Current driver creates one chip for every 32 GPIOs in a controller.
>> This was a limitation earlier now there is no need for that. Hence
>> redesigning the driver to create one gpio chip for all the ngpio
>> in the controller.
>>
>> |- <gpio0_chip0> ------|--- irq_domain (hwirq [0..143]).
>>
>> The previous discussion on this can be found here:
>> https://www.spinics.net/lists/linux-omap/msg132869.html
>
> nice rework.

Thanks!

>
>>
>> Signed-off-by: Keerthy <j-keerthy@ti.com>
>> ---
>>
>> Boot tested on Davinci platform.
>>
>>  drivers/gpio/gpio-davinci.c                | 127 +++++++++++++++++------------
>>  include/linux/platform_data/gpio-davinci.h |  13 ++-
>>  2 files changed, 84 insertions(+), 56 deletions(-)
>>
>> diff --git a/drivers/gpio/gpio-davinci.c b/drivers/gpio/gpio-davinci.c
>> index 26b874a..6c1c00a 100644
>> --- a/drivers/gpio/gpio-davinci.c
>> +++ b/drivers/gpio/gpio-davinci.c
>> @@ -63,11 +63,13 @@ static inline int __davinci_direction(struct gpio_chip *chip,
>>  			unsigned offset, bool out, int value)
>>  {
>>  	struct davinci_gpio_controller *d = gpiochip_get_data(chip);
>> -	struct davinci_gpio_regs __iomem *g = d->regs;
>> +	struct davinci_gpio_regs __iomem *g;
>>  	unsigned long flags;
>>  	u32 temp;
>> -	u32 mask = 1 << offset;
>> +	int bank = offset / 32;
>> +	u32 mask = 1 << (offset % 32);
>>
>> +	g = d->regs[bank];
>>  	spin_lock_irqsave(&d->lock, flags);
>>  	temp = readl_relaxed(&g->dir);
>>  	if (out) {
>> @@ -103,9 +105,12 @@ static int davinci_direction_in(struct gpio_chip *chip, unsigned offset)
>>  static int davinci_gpio_get(struct gpio_chip *chip, unsigned offset)
>>  {
>>  	struct davinci_gpio_controller *d = gpiochip_get_data(chip);
>> -	struct davinci_gpio_regs __iomem *g = d->regs;
>> +	struct davinci_gpio_regs __iomem *g;
>> +	int bank = offset / 32;
>>
>> -	return !!((1 << offset) & readl_relaxed(&g->in_data));
>> +	g = d->regs[bank];
>> +
>> +	return !!((1 << (offset % 32)) & readl_relaxed(&g->in_data));
>
> (1 << (offset % 32) is __gpio_mask()

Okay. I can try and use that here.

>
>>  }
>>
>>  /*
>> @@ -115,9 +120,13 @@ static int davinci_gpio_get(struct gpio_chip *chip, unsigned offset)
>>  davinci_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
>>  {
>>  	struct davinci_gpio_controller *d = gpiochip_get_data(chip);
>> -	struct davinci_gpio_regs __iomem *g = d->regs;
>> +	struct davinci_gpio_regs __iomem *g;
>> +	int bank = offset / 32;
>>
>> -	writel_relaxed((1 << offset), value ? &g->set_data : &g->clr_data);
>> +	g = d->regs[bank];
>> +
>> +	writel_relaxed((1 << (offset % 32)),
>> +		       value ? &g->set_data : &g->clr_data);
>>  }
>>
>>  static struct davinci_gpio_platform_data *
>> @@ -165,7 +174,7 @@ static int davinci_gpio_of_xlate(struct gpio_chip *gc,
>>  	if (gpiospec->args[0] > pdata->ngpio)
>>  		return -EINVAL;
>>
>> -	if (gc != &chips[gpiospec->args[0] / 32].chip)
>> +	if (gc != &chips->chip)
>>  		return -EINVAL;
>>
>>  	if (flags)
>> @@ -177,11 +186,11 @@ static int davinci_gpio_of_xlate(struct gpio_chip *gc,
>>
>>  static int davinci_gpio_probe(struct platform_device *pdev)
>>  {
>> -	int i, base;
>> +	static int ctrl_num;
>> +	int gpio, bank;
>>  	unsigned ngpio, nbank;
>>  	struct davinci_gpio_controller *chips;
>>  	struct davinci_gpio_platform_data *pdata;
>> -	struct davinci_gpio_regs __iomem *regs;
>>  	struct device *dev = &pdev->dev;
>>  	struct resource *res;
>>  	char label[MAX_LABEL_SIZE];
>> @@ -220,38 +229,30 @@ static int davinci_gpio_probe(struct platform_device *pdev)
>>  	if (IS_ERR(gpio_base))
>>  		return PTR_ERR(gpio_base);
>>
>> -	for (i = 0, base = 0; base < ngpio; i++, base += 32) {
>> -		snprintf(label, MAX_LABEL_SIZE, "davinci_gpio.%d", i);
>> -		chips[i].chip.label = devm_kstrdup(dev, label, GFP_KERNEL);
>> -		if (!chips[i].chip.label)
>> +	snprintf(label, MAX_LABEL_SIZE, "davinci_gpio.%d", ctrl_num++);
>> +	chips->chip.label = devm_kstrdup(dev, label, GFP_KERNEL);
>> +		if (!chips->chip.label)
>>  			return -ENOMEM;
>>
>> -		chips[i].chip.direction_input = davinci_direction_in;
>> -		chips[i].chip.get = davinci_gpio_get;
>> -		chips[i].chip.direction_output = davinci_direction_out;
>> -		chips[i].chip.set = davinci_gpio_set;
>> +	chips->chip.direction_input = davinci_direction_in;
>> +	chips->chip.get = davinci_gpio_get;
>> +	chips->chip.direction_output = davinci_direction_out;
>> +	chips->chip.set = davinci_gpio_set;
>>
>> -		chips[i].chip.base = base;
>> -		chips[i].chip.ngpio = ngpio - base;
>> -		if (chips[i].chip.ngpio > 32)
>> -			chips[i].chip.ngpio = 32;
>> +	chips->chip.ngpio = ngpio;
>>
>>  #ifdef CONFIG_OF_GPIO
>> -		chips[i].chip.of_gpio_n_cells = 2;
>> -		chips[i].chip.of_xlate = davinci_gpio_of_xlate;
>> -		chips[i].chip.parent = dev;
>> -		chips[i].chip.of_node = dev->of_node;
>> +	chips->chip.of_gpio_n_cells = 2;
>> +	chips->chip.of_xlate = davinci_gpio_of_xlate;
>
> I think It's not necessary to have custom .xlate() and
> it can be removed, then gpiolib will assign default one of_gpio_simple_xlate().

Okay. Can i do that as a separate patch?

>
>> +	chips->chip.parent = dev;
>> +	chips->chip.of_node = dev->of_node;
>>  #endif
>> -		spin_lock_init(&chips[i].lock);
>> -
>> -		regs = gpio_base + offset_array[i];
>> -		if (!regs)
>> -			return -ENXIO;
>> -		chips[i].regs = regs;
>> +	spin_lock_init(&chips->lock);
>>
>> -		gpiochip_add_data(&chips[i].chip, &chips[i]);
>> -	}
>> +	for (gpio = 0, bank = 0; gpio < ngpio; gpio += 32, bank++)
>> +		chips->regs[bank] = gpio_base + offset_array[bank];
>>
>> +	gpiochip_add_data(&chips->chip, chips);
>>  	platform_set_drvdata(pdev, chips);
>>  	davinci_gpio_irq_setup(pdev);
>>  	return 0;
>> @@ -312,16 +313,19 @@ static int gpio_irq_type(struct irq_data *d, unsigned trigger)
>>
>>  static void gpio_irq_handler(struct irq_desc *desc)
>>  {
>> -	unsigned int irq = irq_desc_get_irq(desc);
>>  	struct davinci_gpio_regs __iomem *g;
>>  	u32 mask = 0xffff;
>> +	int bank_num;
>>  	struct davinci_gpio_controller *d;
>> +	struct davinci_gpio_irq_data *irqdata;
>>
>> -	d = (struct davinci_gpio_controller *)irq_desc_get_handler_data(desc);
>> -	g = (struct davinci_gpio_regs __iomem *)d->regs;
>> +	irqdata = (struct davinci_gpio_irq_data *)irq_desc_get_handler_data(desc);
>> +	bank_num = irqdata->bank_num;
>> +	g = irqdata->regs;
>> +	d = irqdata->chip;
>>
>>  	/* we only care about one bank */
>> -	if (irq & 1)
>> +	if ((bank_num % 2) == 1)
>>  		mask <<= 16;
>>
>>  	/* temporarily mask (level sensitive) parent IRQ */
>> @@ -329,6 +333,7 @@ static void gpio_irq_handler(struct irq_desc *desc)
>>  	while (1) {
>>  		u32		status;
>>  		int		bit;
>> +		irq_hw_number_t hw_irq;
>>
>>  		/* ack any irqs */
>>  		status = readl_relaxed(&g->intstat) & mask;
>> @@ -341,9 +346,13 @@ static void gpio_irq_handler(struct irq_desc *desc)
>>  		while (status) {
>>  			bit = __ffs(status);
>>  			status &= ~BIT(bit);
>> +			/* Max number of gpios per controller is 144 so
>> +			 * hw_irq will be in [0..143]
>> +			 */
>> +			hw_irq = (bank_num / 2) * 32 + bit;
>> +
>>  			generic_handle_irq(
>> -				irq_find_mapping(d->irq_domain,
>> -						 d->chip.base + bit));
>> +				irq_find_mapping(d->irq_domain, hw_irq));
>>  		}
>>  	}
>>  	chained_irq_exit(irq_desc_get_chip(desc), desc);
>> @@ -355,7 +364,7 @@ static int gpio_to_irq_banked(struct gpio_chip *chip, unsigned offset)
>>  	struct davinci_gpio_controller *d = gpiochip_get_data(chip);
>>
>>  	if (d->irq_domain)
>> -		return irq_create_mapping(d->irq_domain, d->chip.base + offset);
>> +		return irq_create_mapping(d->irq_domain, offset);
>>  	else
>>  		return -ENXIO;
>>  }
>> @@ -369,7 +378,7 @@ static int gpio_to_irq_unbanked(struct gpio_chip *chip, unsigned offset)
>>  	 * can provide direct-mapped IRQs to AINTC (up to 32 GPIOs).
>>  	 */
>>  	if (offset < d->gpio_unbanked)
>> -		return d->gpio_irq + offset;
>> +		return d->base_irq + offset;
>>  	else
>>  		return -ENODEV;
>>  }
>> @@ -382,7 +391,7 @@ static int gpio_irq_type_unbanked(struct irq_data *data, unsigned trigger)
>>
>>  	d = (struct davinci_gpio_controller *)irq_data_get_irq_handler_data(data);
>>  	g = (struct davinci_gpio_regs __iomem *)d->regs;
>> -	mask = __gpio_mask(data->irq - d->gpio_irq);
>> +	mask = __gpio_mask(data->irq - d->base_irq);
>>
>>  	if (trigger & ~(IRQ_TYPE_EDGE_FALLING | IRQ_TYPE_EDGE_RISING))
>>  		return -EINVAL;
>> @@ -401,7 +410,7 @@ static int gpio_irq_type_unbanked(struct irq_data *data, unsigned trigger)
>>  {
>>  	struct davinci_gpio_controller *chips =
>>  				(struct davinci_gpio_controller *)d->host_data;
>> -	struct davinci_gpio_regs __iomem *g = chips[hw / 32].regs;
>> +	struct davinci_gpio_regs __iomem *g = chips->regs[hw / 32];
>>
>>  	irq_set_chip_and_handler_name(irq, &gpio_irqchip, handle_simple_irq,
>>  				"davinci_gpio");
>> @@ -459,6 +468,7 @@ static int davinci_gpio_irq_setup(struct platform_device *pdev)
>>  	struct irq_domain	*irq_domain = NULL;
>>  	const struct of_device_id *match;
>>  	struct irq_chip *irq_chip;
>> +	struct davinci_gpio_irq_data *irqdata[MAX_BANKED_IRQS];
>
> You declare irqdata as array here but it has not been used anywhere
> except for assignment. Could you remove this array and MAX_BANKED_IRQS define?

irq_set_chained_handler_and_data(bank_irq, gpio_irq_handler,
						 &chips[gpio / 32]);
						 irqdata[bank]);

That is hooked as data for each bank. As there is only one controller 
now and the differentiating parameters per bank is the irqdata data 
structure with the registers pointer and the bank number.
This structure makes it very easy in the irq handler to identify the 
register sets that need to be modified and the bank irqs.

>
> Seems you can just use struct davinci_gpio_irq_data *irqdata;
>
>>  	gpio_get_irq_chip_cb_t gpio_get_irq_chip;
>>
>>  	/*
>> @@ -514,10 +524,8 @@ static int davinci_gpio_irq_setup(struct platform_device *pdev)
>>  	 * IRQs, while the others use banked IRQs, would need some setup
>>  	 * tweaks to recognize hardware which can do that.
>>  	 */
>> -	for (gpio = 0, bank = 0; gpio < ngpio; bank++, gpio += 32) {
>> -		chips[bank].chip.to_irq = gpio_to_irq_banked;
>> -		chips[bank].irq_domain = irq_domain;
>> -	}
>> +	chips->chip.to_irq = gpio_to_irq_banked;
>> +	chips->irq_domain = irq_domain;
>>
>>  	/*
>>  	 * AINTC can handle direct/unbanked IRQs for GPIOs, with the GPIO
>> @@ -526,9 +534,9 @@ static int davinci_gpio_irq_setup(struct platform_device *pdev)
>>  	 */
>>  	if (pdata->gpio_unbanked) {
>>  		/* pass "bank 0" GPIO IRQs to AINTC */
>> -		chips[0].chip.to_irq = gpio_to_irq_unbanked;
>> -		chips[0].gpio_irq = bank_irq;
>> -		chips[0].gpio_unbanked = pdata->gpio_unbanked;
>> +		chips->chip.to_irq = gpio_to_irq_unbanked;
>> +		chips->base_irq = bank_irq;
>> +		chips->gpio_unbanked = pdata->gpio_unbanked;
>>  		binten = GENMASK(pdata->gpio_unbanked / 16, 0);
>>
>>  		/* AINTC handles mask/unmask; GPIO handles triggering */
>> @@ -538,14 +546,14 @@ static int davinci_gpio_irq_setup(struct platform_device *pdev)
>>  		irq_chip->irq_set_type = gpio_irq_type_unbanked;
>>
>>  		/* default trigger: both edges */
>> -		g = chips[0].regs;
>> +		g = chips->regs[0];
>>  		writel_relaxed(~0, &g->set_falling);
>>  		writel_relaxed(~0, &g->set_rising);
>>
>>  		/* set the direct IRQs up to use that irqchip */
>>  		for (gpio = 0; gpio < pdata->gpio_unbanked; gpio++, irq++) {
>>  			irq_set_chip(irq, irq_chip);
>> -			irq_set_handler_data(irq, &chips[gpio / 32]);
>> +			irq_set_handler_data(irq, chips);
>>  			irq_set_status_flags(irq, IRQ_TYPE_EDGE_BOTH);
>>  		}
>>
>> @@ -558,7 +566,7 @@ static int davinci_gpio_irq_setup(struct platform_device *pdev)
>>  	 */
>>  	for (gpio = 0, bank = 0; gpio < ngpio; bank++, bank_irq++, gpio += 16) {
>>  		/* disabled by default, enabled only as needed */
>> -		g = chips[bank / 2].regs;
>> +		g = chips->regs[bank / 2];
>>  		writel_relaxed(~0, &g->clr_falling);
>>  		writel_relaxed(~0, &g->clr_rising);
>>
>> @@ -567,8 +575,19 @@ static int davinci_gpio_irq_setup(struct platform_device *pdev)
>>  		 * gpio irqs. Pass the irq bank's corresponding controller to
>>  		 * the chained irq handler.
>>  		 */
>> +		irqdata[bank] = devm_kzalloc(&pdev->dev,
>> +					     sizeof(struct
>> +						    davinci_gpio_irq_data),
>> +					     GFP_KERNEL);
>> +		if (!irqdata[bank])
>> +			return -ENOMEM;
>> +
>> +		irqdata[bank]->regs = g;
>> +		irqdata[bank]->bank_num = bank;
>> +		irqdata[bank]->chip = chips;
>> +
>>  		irq_set_chained_handler_and_data(bank_irq, gpio_irq_handler,
>> -						 &chips[gpio / 32]);
>> +						 irqdata[bank]);
>>
>>  		binten |= BIT(bank);
>>  	}
>> diff --git a/include/linux/platform_data/gpio-davinci.h b/include/linux/platform_data/gpio-davinci.h
>> index 18127c4..ca09686 100644
>> --- a/include/linux/platform_data/gpio-davinci.h
>> +++ b/include/linux/platform_data/gpio-davinci.h
>> @@ -21,19 +21,28 @@
>>
>>  #include <asm-generic/gpio.h>
>>
>> +#define MAX_BANKS		5
>
> probably MAX_REGS_BANKS will be better, as it defines
> max number of idnetical registers sets and not number of gpio banks.

Yes that makes it more meaningful. I will do that.

>
>> +#define MAX_BANKED_IRQS		9
>> +
>>  struct davinci_gpio_platform_data {
>>  	u32	ngpio;
>>  	u32	gpio_unbanked;
>>  };
>>
>> +struct davinci_gpio_irq_data {
>> +	void __iomem			*regs;
>> +	struct davinci_gpio_controller	*chip;
>> +	int				bank_num;
>> +};
>> +
>>  struct davinci_gpio_controller {
>>  	struct gpio_chip	chip;
>>  	struct irq_domain	*irq_domain;
>>  	/* Serialize access to GPIO registers */
>>  	spinlock_t		lock;
>> -	void __iomem		*regs;
>> +	void __iomem		*regs[MAX_BANKS];
>>  	int			gpio_unbanked;
>> -	unsigned		gpio_irq;
>> +	unsigned int		base_irq;
>>  };
>>
>>  /*
>>
>
