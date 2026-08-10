Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B540E3B841D
	for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2026 10:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786356856; cv=none; b=Km+nTNnnYqWVP7wuAyMAauUZk+7Jokvy1QXYWts50liMr2c6K0qPIOurFhdykPgsnRJaeBHXJMnjdDgbiDGd7eATqXJH1RsKmXCeiK7YCli4JpIidy1MxvomA7yGmtHR5VLmcrH/aUmR4+kuq5KSlo/AzBxd/wEzpf994GEJefE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786356856; c=relaxed/simple;
	bh=IZfjOCDZda2QM4OsqzzZYlded+DNx+RlwJFGYaclHis=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kIizpQx5pJCpbFNKJyDH+wAg0KTR2G5sH5Z1NCYopEI+dlTGHT+E0IuhC/Mzwx8GCKVl4h7Z22eXszYIaj4h3fVBJs00hwvZzPDxO7D4S43pMx9RKp1fW3WFUyY2aQvjyZPTDaEAKjSKkKGDMoRBJ7JLE0eHa1Pcf8GJEmeQh/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aLaPmUis; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aLaPmUis"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BA9D1F00ADF
	for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2026 10:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786356854;
	bh=WnBOfXGhtTI8rLENZpdOKZdlG3mosue/CTpAJ+tFpQk=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=aLaPmUis+9PoMaDyYWMloXEoYkGOAJQeO9QxXb/nRsOtVKeynjhf8b2SnJH+STHiv
	 S9Rva1bAfxtiUd4oRN/9Z7qsFo2sBaQuG/9FC0pSkkdGpbbAxBLkWTDKQuHawz3n1I
	 c8Cf0eT3ggm35C7RXkupk834ZqyWHlJUopsj+ERzniDgM+gyGZyfwQF777XuS6FjZU
	 7pQA0Yv6YaZa7CdyZLANGWigS7lIK+O1ycUW9eRx9VePxt98n7Y8ArkeqnmxbwC1CK
	 Nmk5+3ObGe3bxbBeuWj7ZdS5GOa20ULWA4VW5vQpvoIXd6X6qFc9G40wI2Damm1CHD
	 2BcZA7UpeU7Rw==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5b2a4359d16so1451101e87.3
        for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2026 03:14:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrVDgBLD+z0o9gexrDg/rF8Ms61//T3kAHp7E9kjHkJGHYydIsLQzHqce5yLNZPs5L5MLsTCUHbK7jE@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6NfOmRTx4OKNCsV6jsJaCLhCUWmhWPwtfhPVGtHBfjfheICMf
	zMyWLOvL0HTNpiKkq1MoOQqFBPs8AM1iUbPtdPlwLwdD++pBGiD+5OVt8UksLsGMrAMf4T2lUVe
	WljOZxfHIByC6UImfYaYwp/ZTpsStzNKz0Nqgz2/OuQ==
X-Received: by 2002:a05:6512:12d2:b0:5b1:5fb6:5cf6 with SMTP id
 2adb3069b0e04-5b3181a640amr101620e87.17.1786356852951; Mon, 10 Aug 2026
 03:14:12 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 10 Aug 2026 05:14:11 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 10 Aug 2026 05:14:11 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260805-ls2kbmc-mod-v6-7-16ccde412d86@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260805-ls2kbmc-mod-v6-0-16ccde412d86@gmail.com> <20260805-ls2kbmc-mod-v6-7-16ccde412d86@gmail.com>
Date: Mon, 10 Aug 2026 05:14:11 -0500
X-Gmail-Original-Message-ID: <CAMRc=Me0DVNYfZJYesvpzTwkVzYZyVzNH+aOAM+DojfV_M9mww@mail.gmail.com>
X-Gm-Features: AUfX_mzZRCuYVh1IibpEgjsa3wIe1G7ZEocHFOzRorAtuAKLbmR4TjxTIG77wKQ
Message-ID: <CAMRc=Me0DVNYfZJYesvpzTwkVzYZyVzNH+aOAM+DojfV_M9mww@mail.gmail.com>
Subject: Re: [PATCH RFC v6 7/7] mfd: ls2kbmc: Capture the reset event of BMC
 through GPIO
To: shankerwangmiao@gmail.com
Cc: Miao Wang via B4 Relay <devnull+shankerwangmiao.gmail.com@kernel.org>, 
	Xi Ruoyao <xry111@xry111.site>, WANG Xuerui <kernel@xen0n.name>, Yinbo Zhu <zhuyinbo@loongson.cn>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, mfd@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, openipmi-developer@lists.sourceforge.net, 
	Binbin Zhou <zhoubinbin@loongson.cn>, Chong Qiao <qiaochong@loongson.cn>, 
	Lee Jones <lee@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, 
	Corey Minyard <corey@minyard.net>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 4 Aug 2026 21:14:25 +0200, Miao Wang via B4 Relay
<devnull+shankerwangmiao.gmail.com@kernel.org> said:
> From: Miao Wang <shankerwangmiao@gmail.com>
>
> The reset event of BMC is captured through GPIO. However, this driver
> bypasses the GPIO framework and directly accesses the GPIO controller
> through the fixed address. When the same GPIO controller is also
> exposed through ACPI and probed by the corresponding GPIO driver,
> there would be a conflict between the two drivers.
>
> This patch will try to find the GPIO through declared GPIO pin in the
> _CRS resources of the ACPI node. If no such delaration is found, the
> driver will fall back to search for the correct GPIO controller and pin
> according to the fixed address and pin number. A possible DSDT
> declaration for the GPIO pin might be as follows:
>
>     Device (BMC0) {
>         Name (_ADR, ...) // Match the PCI address of the BMC device
>         // \_SB.GPO1 is the ACPI path of the GPIO controller
>         Name (_CRS, ResourceTemplate () {
>             GpioInt (Edge, ActiveLow, Exclusive, PullNone, 0,
>                      "\\_SB.GPO1", 0) {
>                 14 // 14 is the GPIO pin number
>             }
>     }
>
> Signed-off-by: Miao Wang <shankerwangmiao@gmail.com>
> ---
>  drivers/mfd/ls2k-bmc-core.c | 163 +++++++++++++++++++++++++++++++-------------
>  1 file changed, 116 insertions(+), 47 deletions(-)
>
> diff --git a/drivers/mfd/ls2k-bmc-core.c b/drivers/mfd/ls2k-bmc-core.c
> index e7bebfe696ac4554eb6283279811a27ed865ab73..97a666a136fe41ed4268cb70770201533aebb1d5 100644
> --- a/drivers/mfd/ls2k-bmc-core.c
> +++ b/drivers/mfd/ls2k-bmc-core.c
> @@ -26,6 +26,10 @@
>  #include <linux/stop_machine.h>
>  #include <linux/vt_kern.h>
>  #include <linux/console.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/gpio/driver.h>
> +#include <linux/gpio/property.h>
> +#include <linux/gpio/machine.h>
>
>  /* LS2K BMC resources */
>  #define LS2K_DISPLAY_RES_START		(SZ_16M + SZ_2M)
> @@ -81,18 +85,6 @@
>
>  #define PCI_REG_STRIDE			0x4
>
> -#define LS2K_BMC_RESET_GPIO		14
> -#define LOONGSON_GPIO_REG_BASE		0x1FE00500
> -#define LOONGSON_GPIO_REG_SIZE		0x18
> -#define LOONGSON_GPIO_OEN		0x0
> -#define LOONGSON_GPIO_FUNC		0x4
> -#define LOONGSON_GPIO_INTPOL		0x10
> -#define LOONGSON_GPIO_INTEN		0x14
> -
> -#define LOONGSON_IO_INT_BASE		16
> -#define LS2K_BMC_RESET_GPIO_INT_VEC	(LS2K_BMC_RESET_GPIO % 8)
> -#define LS2K_BMC_RESET_GPIO_GSI		(LOONGSON_IO_INT_BASE + LS2K_BMC_RESET_GPIO_INT_VEC)
> -
>  enum {
>  	LS2K_BMC_DISPLAY,
>  	LS2K_BMC_IPMI0,
> @@ -186,6 +178,7 @@ struct ls2k_bmc_ddata {
>  	struct work_struct bmc_reset_work;
>  	struct ls2k_bmc_pci_data bmc_pci_data;
>  	struct ls2k_bmc_bridge_pci_data bridge_pci_data;
> +	struct gpio_desc *reset_gpio;
>  };
>
>  static bool ls2k_bmc_bar0_addr_is_set(struct pci_dev *pdev)
> @@ -375,6 +368,91 @@ static void ls2k_bmc_save_pci_data(struct pci_dev *pdev, struct ls2k_bmc_ddata *
>  	pci_read_config_dword(pdev, PCI_INTERRUPT_LINE, &ddata->bmc_pci_data.interrupt_line);
>  }
>
> +static struct fwnode_handle *gpio_dev_get_fwnode(struct gpio_device *gdev)
> +{
> +	struct device *gdev_dev;
> +
> +	gdev_dev = gpio_device_to_device(gdev);
> +	return dev_fwnode(gdev_dev);

You can just do a one-liner:

	return dev_fwnode(gpio_device_to_device(gdev));

> +}
> +
> +static int ls2k_bmc_gpiochip_find(struct gpio_chip *gc, const void *data)
> +{
> +	struct acpi_device *adev;
> +	struct list_head resource_list;
> +	struct resource_entry *rentry;
> +	struct fwnode_handle *fwnode = gpio_dev_get_fwnode(gc->gpiodev);
> +	phys_addr_t start_addr = (phys_addr_t) data;
> +	int ret, found = 0;
> +
> +	if (!is_acpi_node(fwnode))
> +		goto out;
> +
> +	adev = to_acpi_device_node(fwnode);
> +	if (!adev)
> +		goto out;
> +
> +	INIT_LIST_HEAD(&resource_list);
> +
> +	ret = acpi_dev_get_memory_resources(adev, &resource_list);
> +	if (ret < 0)
> +		goto out;
> +	/*
> +	 * ACPI memory resources are ordered and only the first one is
> +	 * considered by the driver of the expected GPIO controller. So
> +	 * here we also only check the first one to see if it matches the
> +	 * expected address.
> +	 */
> +	rentry = list_first_entry_or_null(&resource_list, struct resource_entry, node);
> +	if (!rentry)
> +		goto free_resource_list;
> +	if (rentry->res->start == start_addr)
> +		found = 1;
> +
> +free_resource_list:
> +	acpi_dev_free_resource_list(&resource_list);
> +out:
> +	return found;
> +}
> +
> +static struct gpio_desc *ls2k_bmc_find_gpio(struct ls2k_bmc_ddata *ddata)
> +{
> +	/*
> +	 * In conventional way, the GPIO should be obtained through ACPI or
> +	 * device tree. However, when the information is not available,
> +	 * we should find the GPIO according to the convention of the server
> +	 * boards with LS2K BMC, the gpio signal reflecting the reset event
> +	 * of the BMC should be connected to pin 14 of the GPIO input of
> +	 * the first CPU node. The address of that GPIO controller is fixed.
> +	 */
> +	static const phys_addr_t LOONGSON_GPIO_REG_BASE = 0x1FE00500;
> +	static const unsigned int LS2K_BMC_RESET_GPIO = 14;
> +	int ret;
> +	struct gpio_device *gdev __free(gpio_device_put) = NULL;

Please declare the variable where you initialize it when using __free().

> +	struct property_entry ls2k_bmc_swnode_properties[2] = { 0 };

Prefer `= { };`.

> +
> +	dev_dbg(ddata->dev, "Searching for GPIO chip at address %pa\n", &LOONGSON_GPIO_REG_BASE);
> +
> +	gdev = gpio_device_find((void *)LOONGSON_GPIO_REG_BASE, ls2k_bmc_gpiochip_find);
> +

No need for a blank line here.

> +	if (!gdev) {
> +		dev_dbg(ddata->dev, "cannot find GPIO chip at address %pa, deferring\n",
> +			&LOONGSON_GPIO_REG_BASE);
> +		return ERR_PTR(-EPROBE_DEFER);
> +	}
> +
> +	ls2k_bmc_swnode_properties[0] = PROPERTY_ENTRY_GPIO("gpio",
> +		gpio_dev_get_fwnode(gdev), LS2K_BMC_RESET_GPIO, GPIO_ACTIVE_HIGH);

TBH this could become a GPIOLIB function as gpio_device_get_fwnode().

> +
> +	ret = device_create_managed_software_node(ddata->dev, ls2k_bmc_swnode_properties, NULL);
> +	if (ret) {
> +		dev_err(ddata->dev, "Failed to create software node for GPIO reset: %d\n", ret);
> +		return ERR_PTR(ret);

return dev_err_probe()? This can only be called from probe().

> +	}
> +
> +	return devm_gpiod_get_index(ddata->dev, NULL, 0, GPIOD_IN);
> +}
> +
>  static void ls2k_bmc_cancel_wq(void *data)
>  {
>  	struct ls2k_bmc_ddata *ddata = data;
> @@ -384,8 +462,7 @@ static void ls2k_bmc_cancel_wq(void *data)
>  static int ls2k_bmc_init(struct ls2k_bmc_ddata *ddata)
>  {
>  	struct pci_dev *pdev = to_pci_dev(ddata->dev);
> -	void __iomem *gpio_base;
> -	int gpio_irq, ret, val;
> +	int gpio_irq, ret;
>
>  	ls2k_bmc_save_pci_data(pdev, ddata);
>
> @@ -402,44 +479,36 @@ static int ls2k_bmc_init(struct ls2k_bmc_ddata *ddata)
>  		return ret;
>  	}
>
> -	gpio_base = ioremap(LOONGSON_GPIO_REG_BASE, LOONGSON_GPIO_REG_SIZE);
> -	if (!gpio_base)
> -		return -ENOMEM;
> -
> -	/* Disable GPIO output */
> -	val = readl(gpio_base + LOONGSON_GPIO_OEN);
> -	writel(val | BIT(LS2K_BMC_RESET_GPIO), gpio_base + LOONGSON_GPIO_OEN);
> -
> -	/* Enable GPIO functionality */
> -	val = readl(gpio_base + LOONGSON_GPIO_FUNC);
> -	writel(val & ~BIT(LS2K_BMC_RESET_GPIO), gpio_base + LOONGSON_GPIO_FUNC);
> -
> -	/* Set GPIO interrupts to low-level active */
> -	val = readl(gpio_base + LOONGSON_GPIO_INTPOL);
> -	writel(val & ~BIT(LS2K_BMC_RESET_GPIO), gpio_base + LOONGSON_GPIO_INTPOL);
> -
> -	/* Enable GPIO interrupts */
> -	val = readl(gpio_base + LOONGSON_GPIO_INTEN);
> -	writel(val | BIT(LS2K_BMC_RESET_GPIO), gpio_base + LOONGSON_GPIO_INTEN);
> +	ddata->reset_gpio = devm_gpiod_get_index_optional(&pdev->dev, NULL, 0, GPIOD_IN);
> +	if (IS_ERR(ddata->reset_gpio)) {
> +		ret = PTR_ERR(ddata->reset_gpio);
> +		ddata->reset_gpio = NULL;
> +		return dev_err_probe(ddata->dev, ret, "Failed to get GPIO pin for reset signal\n");
> +	}
> +	if (ddata->reset_gpio == NULL) {
> +		ddata->reset_gpio = ls2k_bmc_find_gpio(ddata);
> +		if (IS_ERR(ddata->reset_gpio)) {
> +			ret = PTR_ERR(ddata->reset_gpio);
> +			ddata->reset_gpio = NULL;
> +			return dev_err_probe(ddata->dev, ret,
> +					     "Failed to find GPIO pin for reset signal\n");

Why not just:

	return dev_err_probe(ddata->dev, PTR_ERR(ddata->reset_gpio), ...)?

> +		}
> +	}
>
> -	iounmap(gpio_base);
> +	gpio_irq = gpiod_to_irq(ddata->reset_gpio);
>
> -	/*
> -	 * Since gpio_chip->to_irq is not implemented in the Loongson-3 GPIO driver,
> -	 * acpi_register_gsi() is used to obtain the GPIO IRQ. The GPIO interrupt is a
> -	 * watchdog interrupt that is triggered when the BMC resets.
> -	 */
> -	gpio_irq = acpi_register_gsi(NULL, LS2K_BMC_RESET_GPIO_GSI, ACPI_EDGE_SENSITIVE,
> -				     ACPI_ACTIVE_LOW);
>  	if (gpio_irq < 0)
> -		return gpio_irq;
> +		return dev_err_probe(ddata->dev, gpio_irq,
> +				     "Failed to get IRQ for GPIO reset signal input\n");
>
> -	ret = devm_request_irq(ddata->dev, gpio_irq, ls2k_bmc_interrupt,
> -			       IRQF_SHARED | IRQF_TRIGGER_FALLING, "ls2kbmc gpio", ddata);
> -	if (ret)
> -		dev_err(ddata->dev, "Failed to request LS2KBMC GPIO IRQ %d.\n", gpio_irq);
> +	ret = devm_request_irq(&pdev->dev, gpio_irq, ls2k_bmc_interrupt,
> +			       IRQF_SHARED | IRQF_TRIGGER_FALLING, "ls2kbmc reset", ddata);
> +
> +	if (ret != 0)
> +		return dev_err_probe(ddata->dev, ret,
> +				     "Failed to request IRQ %d for GPIO reset signal input.\n",
> +				     gpio_irq);
>
> -	acpi_unregister_gsi(LS2K_BMC_RESET_GPIO_GSI);
>  	return ret;
>  }
>
>
> --
> 2.49.0
>
>
>


Obviously this is ugly but I understand the need for this workaround so with
the issues above addressed, this will work for me.

Bart
