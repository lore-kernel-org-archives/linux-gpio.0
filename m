Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89E813314D2;
	Wed, 12 Aug 2026 12:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786537748; cv=none; b=CdqRQvjgOvlcdY1pqXEhJh+lmxtshEacAA0/n8Tj7FbqTM7LDjH8Zz19tgl0m61umOr9yuHW5P8QpUrzbUgQ141UPmASglR4JgZQ31V4ZZsDg2Ix7iIEmLAsIa7Bh8pcmTSFqNnrL+pvPvRv2hKAIB1tKa6PzEae0zdn+iETKl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786537748; c=relaxed/simple;
	bh=zktH5kzqXnE1yUNpL4lhK5TTTDphHY3JxNeGiEz4UeQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DqGrPiy8rhBiF6A6FI7+OrnIIdsTzM0bZMN6jh/uciZ3HhXJN8xudL/aETpoKHCp+uOru6jsxKtLJe5UN/hGirlgTdTkIt/M56h1fWMmr7f751FTKnz0MoiX0XwQw3hheL+R5PrlAXxTlHYmPzVXLceiT1rSmCIHCU/xWFupioo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aSiro+gT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aSiro+gT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8EB81F000E9;
	Wed, 12 Aug 2026 12:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786537747;
	bh=PmQ4K2ic4ghGx1I4FRHyH1nl1yf3HhRp2tRFCAlUY0w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aSiro+gT2LKNTq9dwrWTfs7wn7VmO36o7KhXUITOZbarVxjD9MsMnibvWKqzaXLCX
	 b1FLVMn5JWoeWz3HmusXkr5JWJJmhs0SvABHWtQBgcufd913t5beUcKqEjWZjx0ib9
	 VUkoqpbKc4xqg+z+HuUzTaR3jZUTlrpoYicCKP+sg58lGcFUU16c4YbF557H2khVPU
	 v58vIaaW0qDgHKeOJE1zp4Sfu1vhQdBE6oEEHz7Cf3CRW4jM2ztM/BaA3jxd6PFceL
	 XPOQynipgLt0H2jqbgToWxfKflv55g9rspS5Eaf1yHYI1+5/OqrLN2mgEXSOcNgDu/
	 RCL47Hi+nyrgw==
Date: Wed, 12 Aug 2026 13:29:00 +0100
From: Lee Jones <lee@kernel.org>
To: contact@alex-min.fr
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	MyungJoo Ham <myungjoo.ham@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Guru Das Srinagesh <linux@gurudas.dev>,
	Linus Walleij <linusw@kernel.org>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	phone-devel@vger.kernel.org
Subject: Re: [PATCH v5 4/6] mfd: qcom-pm8xxx: register PM8921 USB ID extcon
Message-ID: <20260812122900.GQ1072730@google.com>
References: <20260804-mainline-send-v1-sending-v5-0-149dd4372ac8@alex-min.fr>
 <20260804-mainline-send-v1-sending-v5-4-149dd4372ac8@alex-min.fr>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260804-mainline-send-v1-sending-v5-4-149dd4372ac8@alex-min.fr>

On Tue, 04 Aug 2026, Alexandre MINETTE via B4 Relay wrote:

> From: Alexandre MINETTE <contact@alex-min.fr>
> 
> PM8921 reports the USB ID pin through interrupt 49 of its interrupt
> controller. Unlike PM8941, this path has no separate addressable misc
> block to represent as a devicetree child node.
> 
> Register a child platform device for the existing Qualcomm USB extcon
> driver after creating the PMIC IRQ domain. Pass the USB ID interrupt as
> a named resource and reuse the PM8921 firmware node, allowing consumers
> to reference the PMIC node directly as their extcon provider.
> 
> Unregister the child device and dispose of the IRQ mapping when the
> PMIC is removed or probing fails.
> 
> Signed-off-by: Alexandre MINETTE <contact@alex-min.fr>
> ---
>  drivers/mfd/qcom-pm8xxx.c | 78 +++++++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 76 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mfd/qcom-pm8xxx.c b/drivers/mfd/qcom-pm8xxx.c
> index 0cf374c015ce..884fc99a1488 100644
> --- dangerously/mfd/qcom-pm8xxx.c
> +++ b/drivers/mfd/qcom-pm8xxx.c
> @@ -7,6 +7,7 @@
>  
>  #include <linux/kernel.h>
>  #include <linux/interrupt.h>
> +#include <linux/ioport.h>
>  #include <linux/irqchip/chained_irq.h>
>  #include <linux/irq.h>
>  #include <linux/irqdomain.h>
> @@ -64,12 +65,15 @@
>  
>  struct pm_irq_data {
>  	int num_irqs;
> +	int usb_id_irq;
>  	struct irq_chip *irq_chip;
>  	irq_handler_t irq_handler;
>  };
>  
>  struct pm_irq_chip {
>  	struct regmap		*regmap;
> +	struct platform_device	*usb_extcon;
> +	unsigned int		usb_id_irq;
>  	spinlock_t		pm_irq_lock;
>  	struct irq_domain	*irqdomain;
>  	unsigned int		num_blocks;
> @@ -492,6 +496,13 @@ static const struct pm_irq_data pm8xxx_data = {
>  	.irq_handler = pm8xxx_irq_handler,
>  };
>  
> +static const struct pm_irq_data pm8921_data = {
> +	.num_irqs = PM8XXX_NR_IRQS,
> +	.usb_id_irq = 49,

Magic numbers should be defined.

> +	.irq_chip = &pm8xxx_irq_chip,
> +	.irq_handler = pm8xxx_irq_handler,
> +};
> +
>  static const struct pm_irq_data pm8821_data = {
>  	.num_irqs = PM8821_NR_IRQS,
>  	.irq_chip = &pm8821_irq_chip,
> @@ -501,11 +512,60 @@ static const struct pm_irq_data pm8821_data = {
>  static const struct of_device_id pm8xxx_id_table[] = {
>  	{ .compatible = "qcom,pm8058", .data = &pm8xxx_data},
>  	{ .compatible = "qcom,pm8821", .data = &pm8821_data},
> -	{ .compatible = "qcom,pm8921", .data = &pm8xxx_data},
> +	{ .compatible = "qcom,pm8921", .data = &pm8921_data},
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, pm8xxx_id_table);
>  
> +static int pm8xxx_add_usb_extcon(struct platform_device *pdev,
> +				 struct pm_irq_chip *chip,
> +				 unsigned int hwirq)
> +{
> +	struct irq_fwspec fwspec = {
> +		.fwnode = dev_fwnode(&pdev->dev),
> +		.param_count = 2,
> +		.param = { hwirq, IRQ_TYPE_EDGE_BOTH },
> +	};
> +	struct platform_device_info pdevinfo = {
> +		.parent = &pdev->dev,
> +		.fwnode = dev_fwnode(&pdev->dev),
> +		.of_node_reused = true,
> +		.name = "qcom-pm8xxx-usb-id",
> +		.id = PLATFORM_DEVID_NONE,
> +	};
> +	struct resource resource;
> +
> +	chip->usb_id_irq = irq_create_fwspec_mapping(&fwspec);
> +	if (!chip->usb_id_irq)
> +		return -ENXIO;
> +
> +	resource = DEFINE_RES_IRQ_NAMED(chip->usb_id_irq, "usb_id");
> +	pdevinfo.res = &resource;
> +	pdevinfo.num_res = 1;
> +
> +	chip->usb_extcon = platform_device_register_full(&pdevinfo);

Why aren't you using the MFD API for this?

> +	if (IS_ERR(chip->usb_extcon)) {
> +		int ret = PTR_ERR(chip->usb_extcon);
> +
> +		chip->usb_extcon = NULL;
> +		irq_dispose_mapping(chip->usb_id_irq);
> +		chip->usb_id_irq = 0;
> +
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static void pm8xxx_remove_usb_extcon(struct pm_irq_chip *chip)
> +{
> +	if (chip->usb_extcon)
> +		platform_device_unregister(chip->usb_extcon);
> +
> +	if (chip->usb_id_irq)
> +		irq_dispose_mapping(chip->usb_id_irq);
> +}

Why not devm_*

>  static int pm8xxx_probe(struct platform_device *pdev)
>  {
>  	const struct pm_irq_data *data;
> @@ -570,9 +630,22 @@ static int pm8xxx_probe(struct platform_device *pdev)
>  
>  	irq_set_irq_wake(irq, 1);
>  
> +	if (data->usb_id_irq) {
> +		rc = pm8xxx_add_usb_extcon(pdev, chip, data->usb_id_irq);
> +		if (rc)
> +			goto err_domain;
> +	}
> +
>  	rc = of_platform_populate(pdev->dev.of_node, NULL, NULL, &pdev->dev);
>  	if (rc)
> -		irq_domain_remove(chip->irqdomain);
> +		goto err_extcon;
> +
> +	return 0;
> +
> +err_extcon:
> +	pm8xxx_remove_usb_extcon(chip);
> +err_domain:
> +	irq_domain_remove(chip->irqdomain);
>  
>  	return rc;
>  }
> @@ -582,6 +655,7 @@ static void pm8xxx_remove(struct platform_device *pdev)
>  	struct pm_irq_chip *chip = platform_get_drvdata(pdev);
>  
>  	of_platform_depopulate(&pdev->dev);
> +	pm8xxx_remove_usb_extcon(chip);
>  	irq_domain_remove(chip->irqdomain);
>  }
>  
> 
> -- 
> 2.43.0
> 
> 

-- 
Lee Jones
