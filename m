Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793780218;
	b=OVVXvJ7qOstPakevatuvGLGJgc6Y6Dv85JhDwfQYHVGRaIHiDUfZNTNL4G06R/Dwyw32
	 2eSUlNg0XrSqWmD7izn7oukDdRXoxOtKH7H2FrEMF6H8ziKFa+M81yKmDxzgxQ3vdEm90
	 nvhXiQKiijxV3Yi297q3W4bP2IXwAXQh2bSWWuca9an6BjZIdj5WN1BuYR4xzFI+CuwD1
	 Ovmskgp5My5mbvjBF8DZANw/LrRT90lqt0twZySUbD9QEzRfZ1DscUSKdGL5uXHAOuZWe
	 hg5WHKn1KSX8SObK0eI8/S3OGjVDLZh3VowTs+hgFmZoyiBVI60KVntbZSKWe+3eqvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793780218;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=bEr+E9xOtLRNx3TtttDjAZWHSeX2oKJzpJrX+6wrSs4=;
	b=s9Yw8ueeH3qFEKJvFcmL239YMxi8kw5xH+WtK1qLp4i5DSaqrJo4pxqH5Uvg8H5CBKF5
	 3LlpOILbwkC8+KZipXH/RLize3KMvAH2ocx8rL71/xcUUYRsswXoms49qpapMq/wvAJOq
	 XVBFHoBAkrjbLRDECWh/9iM0ygT11VU39j1nt++1AdG5K4lQ1vVDQe6ujlciYTozjOSJE
	 2q8mRqY5X5urTn+Bmu+DiToue5MEwHISGwCXCHcovoeRrmH5FJ9x97iB2rvemj3K78a4Z
	 cfO98lC8vPyOmmsrpdUEAa3xGB+fy1OMMDX67pAdAgu0ywvNjz9ZrJeGWGh8OQJ7ZjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eKiuBKSB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 9E9EC606A31B;
	Wed,  4 Nov 2026 08:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eKiuBKSB
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 58D751F00919;
	Wed,  4 Nov 2026 08:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793780217;
	bh=bEr+E9xOtLRNx3TtttDjAZWHSeX2oKJzpJrX+6wrSs4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eKiuBKSB3DgxcueVXgRKqwrrFsNAxAevJyyoy76e18ZSxADIFk/mBw9TmfUx747Oa
	 WtIQsAEQ5MqRqPiVNFscZltaYB5lNpz9HczZlHwHx9Bc2FhyA6qpC3lH9UEO0YLnGC
	 ePvyMdC3QUxcmum9SSez9YyeiRYO0wm7eoW0NFwcTzr1j9DbsPoOdRTl0P6bb7wfS0
	 p+Ffb8nX72sn8HywN37/ymcoxPDMoWkYDiKbadnPZ1qiWF/n01yXJfpuHP/RSb8LY4
	 eCUdB6GANEKDjLxt+fVAt7frdAyU73Yr2Psi5owtsY7FmnUNS1lbDunSllJDduy2aG
	 Yr6VcTREMOVlQ==
Date: Wed, 4 Nov 2026 09:16:53 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: joseph@telaak.dev
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Chuanhong Guo <gch981213@gmail.com>, 
	Qingfang Deng <dqfext@gmail.com>, linux-mips@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Qingfang Deng <qingfang.deng@siflower.com.cn>
Subject: Re: [PATCH 2/2] gpio: Add Siflower GPIO controller driver
Message-ID: <tjadgdqzbvjj7kn4ubibqonrk7nod2gxknzzvdtr5vzs5gv6n5@bvue2t5y4ks7>
References: <20261104-sf19a2890-gpio-v1-0-45e463c48728@telaak.dev>
 <20261104-sf19a2890-gpio-v1-2-45e463c48728@telaak.dev>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261104-sf19a2890-gpio-v1-2-45e463c48728@telaak.dev>

On Wed, Nov 04, 2026 at 02:21:38AM -0500, Joseph Telaak via B4 Relay wrote:
> From: Qingfang Deng <qingfang.deng@siflower.com.cn>
> 
> Add a driver for the GPIO controller on Siflower SoCs.
> This controller is found on all current Siflower MIPS and RISC-V
> chips including SF19A2890, SF21A6826 and SF21H8898.
> 
> Signed-off-by: Qingfang Deng <qingfang.deng@siflower.com.cn>
> Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
> [jt: from Chuanhong's siflower-7.1 branch; depend on MACH_SIFLOWER_MIPS,
>  longer Kconfig help, assert the reset through a devm action instead of in
>  .remove, which ran before the GPIO chip was removed, drop .owner and the
>  unused drvdata, drop the irq_set_affinity callback, which reached the
>  parent through irq_to_desc() (not exported with SPARSE_IRQ), call
>  gpiochip_disable_irq() and gpiochip_enable_irq() from mask and unmask as
>  an immutable irqchip must, find the group by its parent IRQ instead of
>  assuming consecutive numbers, return 0 or 1 from .get, read ngpios with
>  device_property_read_u32(), linux/math64.h and sorted includes, "Siflower"
>  spelling, subject]

Same comment as for the DT binding patch.

> Signed-off-by: Joseph Telaak <joseph@telaak.dev>
> ---
>  drivers/gpio/Kconfig         |  11 ++
>  drivers/gpio/Makefile        |   1 +
>  drivers/gpio/gpio-siflower.c | 325 +++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 337 insertions(+)
> 
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index 55e428002..6125a8452 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -721,6 +721,17 @@ config GPIO_SIFIVE
>  	help
>  	  Say yes here to support the GPIO device on SiFive SoCs.
>  
> +config GPIO_SIFLOWER
> +	tristate "Siflower GPIO support"
> +	depends on OF_GPIO
> +	depends on MACH_SIFLOWER_MIPS || COMPILE_TEST
> +	select GPIOLIB_IRQCHIP
> +	help
> +	  GPIO controller driver for Siflower MIPS and RISC-V SoCs
> +	  including SF19A2890, SF21A6826 and SF21H8898. Each line can be an
> +	  input or an output and raise an interrupt on either edge or level,
> +	  and inputs can be debounced in hardware.
> +
>  config GPIO_SIOX
>  	tristate "SIOX GPIO support"
>  	depends on SIOX
> diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
> index 88f748846..bde618108 100644
> --- a/drivers/gpio/Makefile
> +++ b/drivers/gpio/Makefile
> @@ -171,6 +171,7 @@ obj-$(CONFIG_GPIO_SCH311X)		+= gpio-sch311x.o
>  obj-$(CONFIG_GPIO_SCH)			+= gpio-sch.o
>  obj-$(CONFIG_GPIO_SHARED_PROXY)		+= gpio-shared-proxy.o
>  obj-$(CONFIG_GPIO_SIFIVE)		+= gpio-sifive.o
> +obj-$(CONFIG_GPIO_SIFLOWER)		+= gpio-siflower.o
>  obj-$(CONFIG_GPIO_SIM)			+= gpio-sim.o
>  obj-$(CONFIG_GPIO_SIOX)			+= gpio-siox.o
>  obj-$(CONFIG_GPIO_SL28CPLD)		+= gpio-sl28cpld.o
> diff --git a/drivers/gpio/gpio-siflower.c b/drivers/gpio/gpio-siflower.c
> new file mode 100644
> index 000000000..6eb560da7
> --- /dev/null
> +++ b/drivers/gpio/gpio-siflower.c
> @@ -0,0 +1,325 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * GPIO controller driver for Siflower MIPS and RISC-V SoCs including:
> + *  Siflower SF19A2890
> + *  Siflower SF21A6826
> + *  Siflower SF21H8898
> + *
> + */

Newline.

> +#include <linux/clk.h>
> +#include <linux/gpio/driver.h>
> +#include <linux/irqchip/chained_irq.h>
> +#include <linux/math64.h>
> +#include <linux/module.h>
> +#include <linux/pinctrl/consumer.h>
> +#include <linux/platform_device.h>
> +#include <linux/property.h>
> +#include <linux/reset.h>
> +
> +#define GPIO_IR(n)	(0x40 * (n) + 0x00)
> +#define GPIO_OR(n)	(0x40 * (n) + 0x04)
> +#define GPIO_OEN(n)	(0x40 * (n) + 0x08)
> +#define GPIO_IMR(n)	(0x40 * (n) + 0x0c)
> +#define GPIO_GPIMR(n)	(0x40 * (n) + 0x10)
> +#define GPIO_PIR(n)	(0x40 * (n) + 0x14)
> +#define GPIO_ITR(n)	(0x40 * (n) + 0x18)
> +#define GPIO_IFR(n)	(0x40 * (n) + 0x1c)
> +#define GPIO_ICR(n)	(0x40 * (n) + 0x20)
> +#define GPIO_GPxIR(n)	(0x4 * (n) + 0x4000)
> +
> +#define GPIOS_PER_GROUP	16
> +
> +struct sf_gpio_priv {
> +	struct gpio_chip gc;
> +	void __iomem *base;
> +	struct clk *clk;
> +	struct reset_control *rstc;
> +	unsigned int irq[];
> +};
> +
> +#define to_sf_gpio(x)	container_of(x, struct sf_gpio_priv, gc)
> +
> +static u32 sf_gpio_rd(struct sf_gpio_priv *priv, unsigned long reg)
> +{
> +	return readl_relaxed(priv->base + reg);
> +}
> +
> +static void sf_gpio_wr(struct sf_gpio_priv *priv, unsigned long reg,
> +		       u32 val)
> +{
> +	writel_relaxed(val, priv->base + reg);
> +}
> +
> +static int sf_gpio_get_value(struct gpio_chip *gc, unsigned int offset)
> +{
> +	struct sf_gpio_priv *priv = to_sf_gpio(gc);

More common pattern is to retrieve the address of priv with
gpiochip_get_data(). You already pass that address to
devm_gpiochip_add_data().

> +
> +	return !!sf_gpio_rd(priv, GPIO_IR(offset));
> +}
> +
> +static int sf_gpio_set_value(struct gpio_chip *gc, unsigned int offset,
> +			     int value)
> +{
> +	struct sf_gpio_priv *priv = to_sf_gpio(gc);
> +
> +	sf_gpio_wr(priv, GPIO_OR(offset), value);
> +	return 0;
> +}
> +
> +static int sf_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
> +{
> +	struct sf_gpio_priv *priv = to_sf_gpio(gc);
> +
> +	if (sf_gpio_rd(priv, GPIO_OEN(offset)))
> +		return GPIO_LINE_DIRECTION_IN;
> +	else

Drop the else. Or do:

    return sf_gpio_rd(priv, GPIO_OEN(offset)) ? GPIO_LINE_DIRECTION_IN : GPIO_LINE_DIRECTION_OUT;

> +		return GPIO_LINE_DIRECTION_OUT;
> +}
> +
> +static int sf_gpio_direction_input(struct gpio_chip *gc, unsigned int offset)
> +{
> +	struct sf_gpio_priv *priv = to_sf_gpio(gc);
> +
> +	sf_gpio_wr(priv, GPIO_OEN(offset), 1);
> +	return 0;
> +}
> +
> +static int sf_gpio_direction_output(struct gpio_chip *gc, unsigned int offset,
> +				    int value)
> +{
> +	struct sf_gpio_priv *priv = to_sf_gpio(gc);
> +
> +	sf_gpio_wr(priv, GPIO_OR(offset), value);
> +	sf_gpio_wr(priv, GPIO_OEN(offset), 0);
> +	return 0;
> +}
> +
> +static int sf_gpio_set_debounce(struct gpio_chip *gc, unsigned int offset,
> +				u32 debounce)
> +{
> +	struct sf_gpio_priv *priv = to_sf_gpio(gc);
> +	unsigned long freq = clk_get_rate(priv->clk);
> +	u64 mul;
> +
> +	/* (ICR + 1) * IFR = debounce_us * clkfreq_mhz / 4 */
> +	mul = (u64)debounce * freq;
> +	do_div(mul, 1000000 * 4);
> +	if (mul > 0xff00)
> +		return -EINVAL;
> +
> +	sf_gpio_wr(priv, GPIO_ICR(offset), 0xff);
> +	sf_gpio_wr(priv, GPIO_IFR(offset), DIV_ROUND_UP(mul, 0x100));
> +
> +	return 0;
> +}
> +
> +static int sf_gpio_set_config(struct gpio_chip *gc, unsigned int offset,
> +			      unsigned long config)
> +{
> +	switch (pinconf_to_config_param(config)) {
> +	case PIN_CONFIG_INPUT_DEBOUNCE:
> +		return sf_gpio_set_debounce(gc, offset,
> +			pinconf_to_config_argument(config));
> +	default:
> +		return gpiochip_generic_config(gc, offset, config);
> +	}
> +}
> +
> +static void sf_gpio_irq_ack(struct irq_data *data)
> +{
> +	struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
> +	struct sf_gpio_priv *priv = to_sf_gpio(gc);
> +	unsigned long offset = irqd_to_hwirq(data);
> +
> +	sf_gpio_wr(priv, GPIO_PIR(offset), 0);
> +}
> +
> +static void sf_gpio_irq_mask(struct irq_data *data)
> +{
> +	struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
> +	struct sf_gpio_priv *priv = to_sf_gpio(gc);
> +	unsigned long offset = irqd_to_hwirq(data);
> +
> +	sf_gpio_wr(priv, GPIO_IMR(offset), 1);
> +	sf_gpio_wr(priv, GPIO_GPIMR(offset), 1);
> +	gpiochip_disable_irq(gc, offset);
> +}
> +
> +static void sf_gpio_irq_unmask(struct irq_data *data)
> +{
> +	struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
> +	struct sf_gpio_priv *priv = to_sf_gpio(gc);
> +	unsigned long offset = irqd_to_hwirq(data);
> +
> +	gpiochip_enable_irq(gc, offset);
> +	sf_gpio_wr(priv, GPIO_IMR(offset), 0);
> +	sf_gpio_wr(priv, GPIO_GPIMR(offset), 0);
> +}
> +
> +static int sf_gpio_irq_set_type(struct irq_data *data, unsigned int flow_type)
> +{
> +	struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
> +	struct sf_gpio_priv *priv = to_sf_gpio(gc);
> +	unsigned long offset = irqd_to_hwirq(data);
> +	u32 val;
> +
> +	switch (flow_type) {
> +	case IRQ_TYPE_EDGE_RISING:
> +		val = 4;
> +		break;
> +	case IRQ_TYPE_EDGE_FALLING:
> +		val = 2;
> +		break;
> +	case IRQ_TYPE_EDGE_BOTH:
> +		val = 6;
> +		break;
> +	case IRQ_TYPE_LEVEL_HIGH:
> +		val = 1;
> +		break;
> +	case IRQ_TYPE_LEVEL_LOW:
> +		val = 0;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +	sf_gpio_wr(priv, GPIO_ITR(offset), val);
> +
> +	if (flow_type & IRQ_TYPE_LEVEL_MASK)
> +		irq_set_handler_locked(data, handle_level_irq);
> +	else

Drop else.

> +		irq_set_handler_locked(data, handle_edge_irq);
> +
> +	return 0;
> +}
> +
> +static const struct irq_chip sf_gpio_irqchip = {
> +	.name			= KBUILD_MODNAME,
> +	.irq_ack		= sf_gpio_irq_ack,
> +	.irq_mask		= sf_gpio_irq_mask,
> +	.irq_unmask		= sf_gpio_irq_unmask,
> +	.irq_set_type		= sf_gpio_irq_set_type,
> +	.flags			= IRQCHIP_IMMUTABLE,
> +	GPIOCHIP_IRQ_RESOURCE_HELPERS,
> +};
> +
> +static void sf_gpio_irq_handler(struct irq_desc *desc)
> +{
> +	struct gpio_chip *gc = irq_desc_get_handler_data(desc);
> +	struct irq_chip *ic = irq_desc_get_chip(desc);
> +	struct sf_gpio_priv *priv = to_sf_gpio(gc);
> +	unsigned int irq = irq_desc_get_irq(desc);
> +	unsigned long pending;
> +	unsigned int group, n;
> +
> +	for (group = 0; group < gc->irq.num_parents; group++)
> +		if (priv->irq[group] == irq)
> +			break;
> +	if (WARN_ON_ONCE(group == gc->irq.num_parents))
> +		return;
> +
> +	chained_irq_enter(ic, desc);
> +
> +	pending = sf_gpio_rd(priv, GPIO_GPxIR(group));
> +	for_each_set_bit(n, &pending, GPIOS_PER_GROUP) {
> +		generic_handle_domain_irq(gc->irq.domain,
> +					  n + group * GPIOS_PER_GROUP);
> +	}
> +
> +	chained_irq_exit(ic, desc);
> +}
> +
> +static void sf_gpio_reset_assert(void *data)
> +{
> +	reset_control_assert(data);
> +}
> +
> +static int sf_gpio_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct sf_gpio_priv *priv;
> +	struct gpio_irq_chip *girq;
> +	struct gpio_chip *gc;
> +	u32 ngpios, ngroups;
> +	int ret, i;
> +
> +	ret = device_property_read_u32(dev, "ngpios", &ngpios);
> +	if (ret)
> +		return ret;
> +
> +	ngroups = DIV_ROUND_UP(ngpios, GPIOS_PER_GROUP);
> +	priv = devm_kzalloc(dev, struct_size(priv, irq, ngroups), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(priv->base))
> +		return PTR_ERR(priv->base);
> +
> +	priv->clk = devm_clk_get_enabled(dev, NULL);
> +	if (IS_ERR(priv->clk))
> +		return PTR_ERR(priv->clk);
> +
> +	priv->rstc = devm_reset_control_get_optional(&pdev->dev, NULL);
> +	if (IS_ERR(priv->rstc))
> +		return PTR_ERR(priv->rstc);
> +
> +	ret = reset_control_deassert(priv->rstc);
> +	if (ret)
> +		return ret;
> +
> +	ret = devm_add_action_or_reset(dev, sf_gpio_reset_assert, priv->rstc);
> +	if (ret)
> +		return ret;
> +
> +	for (i = 0; i < ngroups; i++) {
> +		ret = platform_get_irq(pdev, i);
> +		if (ret < 0)
> +			return ret;
> +
> +		priv->irq[i] = ret;
> +	}
> +
> +	gc = &priv->gc;
> +	gc->label = KBUILD_MODNAME;
> +	gc->parent = dev;
> +	gc->owner = THIS_MODULE;
> +	gc->request = gpiochip_generic_request;
> +	gc->free = gpiochip_generic_free;
> +	gc->get_direction = sf_gpio_get_direction;
> +	gc->direction_input = sf_gpio_direction_input;
> +	gc->direction_output = sf_gpio_direction_output;
> +	gc->get = sf_gpio_get_value;
> +	gc->set = sf_gpio_set_value;
> +	gc->set_config = sf_gpio_set_config;
> +	gc->base = -1;
> +	gc->ngpio = ngpios;
> +
> +	girq = &gc->irq;
> +	gpio_irq_chip_set_chip(girq, &sf_gpio_irqchip);
> +	girq->num_parents = ngroups;
> +	girq->parents = priv->irq;
> +	girq->parent_handler = sf_gpio_irq_handler;
> +	girq->default_type = IRQ_TYPE_NONE;
> +	girq->handler = handle_bad_irq;
> +
> +	return devm_gpiochip_add_data(dev, gc, priv);
> +}
> +
> +static const struct of_device_id sf_gpio_ids[] = {
> +	{ .compatible = "siflower,sf19a2890-gpio" },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, sf_gpio_ids);
> +
> +static struct platform_driver sf_gpio_driver = {
> +	.probe		= sf_gpio_probe,
> +	.driver = {
> +		.name		= "siflower_gpio",
> +		.of_match_table	= sf_gpio_ids,
> +	},
> +};
> +module_platform_driver(sf_gpio_driver);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("Qingfang Deng <qingfang.deng@siflower.com.cn>");
> +MODULE_DESCRIPTION("GPIO driver for Siflower SoCs");
> 
> -- 
> Git-155)
> 
> 

Thanks,
Bartosz
