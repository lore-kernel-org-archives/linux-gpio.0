Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70A993546D0;
	Thu, 10 Sep 2026 13:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789048628; cv=none; b=Nl9ExjxRPoJoeU8PpYb0mlPgMlqZtLlzf1DrBzVn0n/J5uB5WCPOlctI7OE0imreuRFM1GTsIdEqJaC3g0UuD02jT+VrBl/stoN1CcHWZQSyejz4yAzvIQJODUVSxZbof3dFfwujStlDqNVTmibd2sCrtK+vJ0sX9dHzr8Iq3yM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789048628; c=relaxed/simple;
	bh=/V5WNdZ1RPhuheJlhxOVq0Ydh2//1gFKC0DOj17EII0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CMOkggypqedhHdiokzN0wDXkZkg47MiBWVNInYvKhQ7PyLOp3SxhAmnHrhSRXQJdTlLnTXJG2MUht3LNoTgRGnTIfhy49rVnv4FwHRWwyLflXrnB9TBajCPa2HR28NXcdLSebkfyc0cirjXy0W88I8ld1oAV2h5FrFNOgAA05mA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cJF89swD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cJF89swD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97D631F000FF;
	Thu, 10 Sep 2026 13:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789048627;
	bh=DQns45W+7r5KCS8RR0S25TqH8Uxqu3GnDAmnybjH4WQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cJF89swDw3fKORJfS1aHX4foh1nkbh0ygT2k8E8ydHdueT7aqP/Nh5833f4IsCxkq
	 Ulq+C5dMsczrtxpktfXxWIPQjzLqyuvhLlGYN2zf1pHD4AnKsgAd6JmVpSLmILus54
	 7t/zxQSANfjq/w506Co6X8IoFyMAvWoxkLyIy6slpBXZ1gMxkMLBUMJJs0EqiDGOZ5
	 wMK4V2CvRswT+OyFSEH8+shPaBT0ffVizKMsadd/8AMJZ7RlTs1YrF/eQJVUF2VcI0
	 Eri6eu/deM1iVa0w+DKK3Y1wzBQk32LIqujAApwdy5PMsJcMzTryhjg6usmVcYRH2B
	 VDqjaCwr4y1yg==
Date: Thu, 10 Sep 2026 14:56:59 +0100
From: Lee Jones <lee@kernel.org>
To: MINETTE Alexandre <contact@alex-min.fr>
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
Message-ID: <20260910135659.GC1051768@google.com>
References: <20260804-mainline-send-v1-sending-v5-0-149dd4372ac8@alex-min.fr>
 <20260804-mainline-send-v1-sending-v5-4-149dd4372ac8@alex-min.fr>
 <20260812122900.GQ1072730@google.com>
 <646d46b1-7c59-4d73-b033-f4afaf19bdd7@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <646d46b1-7c59-4d73-b033-f4afaf19bdd7@app.fastmail.com>

On Sun, 30 Aug 2026, MINETTE Alexandre wrote:

> Hi Lee, 
> 
> Thanks for the feedback!
> 
> For the v6 series, I'll add a proper define for the 49 IRQ and use the devm api indeed.
> 
> About using the MFD api: I looked at it, but devm_mfd_add_devices()  
> doesn't seem to let me reuse the parent firmware node, which I need here  
> because the DT consumer uses extcon = <&pm8921>. 
> So I kept  platform_device_register_full().
> Let me know if I missed something here.

Please reply inline.

Top-posts are generally not allowed for this kind of discussion.

If you're not using the MFD API or of_platform_populate(), then this is
not an MFD and therefore could and should live elsewhere.

Can you explain to me the problem in depth please?

> Mer 12 août 2026, à 14:29, Lee Jones a écrit :
> > On Tue, 04 Aug 2026, Alexandre MINETTE via B4 Relay wrote:
> >
> >> From: Alexandre MINETTE <contact@alex-min.fr>
> >> 
> >> PM8921 reports the USB ID pin through interrupt 49 of its interrupt
> >> controller. Unlike PM8941, this path has no separate addressable misc
> >> block to represent as a devicetree child node.
> >> 
> >> Register a child platform device for the existing Qualcomm USB extcon
> >> driver after creating the PMIC IRQ domain. Pass the USB ID interrupt as
> >> a named resource and reuse the PM8921 firmware node, allowing consumers
> >> to reference the PMIC node directly as their extcon provider.
> >> 
> >> Unregister the child device and dispose of the IRQ mapping when the
> >> PMIC is removed or probing fails.
> >> 
> >> Signed-off-by: Alexandre MINETTE <contact@alex-min.fr>
> >> ---
> >>  drivers/mfd/qcom-pm8xxx.c | 78 +++++++++++++++++++++++++++++++++++++++++++++--
> >>  1 file changed, 76 insertions(+), 2 deletions(-)
> >> 
> >> diff --git a/drivers/mfd/qcom-pm8xxx.c b/drivers/mfd/qcom-pm8xxx.c
> >> index 0cf374c015ce..884fc99a1488 100644
> >> --- dangerously/mfd/qcom-pm8xxx.c
> >> +++ b/drivers/mfd/qcom-pm8xxx.c
> >> @@ -7,6 +7,7 @@
> >>  
> >>  #include <linux/kernel.h>
> >>  #include <linux/interrupt.h>
> >> +#include <linux/ioport.h>

Should we sort the '#include' directives alphabetically here?

>>  #include <linux/irqchip/chained_irq.h>
>>  #include <linux/irq.h>
>>  #include <linux/irqdomain.h>
>> @@ -64,12 +65,15 @@
>>  
>>  struct pm_irq_data {
>>  	int num_irqs;
>> +	int usb_id_irq;
>>  	struct irq_chip *irq_chip;
>>  	irq_handler_t irq_handler;
>>  };
>>  
>>  struct pm_irq_chip {
>>  	struct regmap		*regmap;
>> +	struct platform_device	*usb_extcon;
>> +	unsigned int		usb_id_irq;
>>  	spinlock_t		pm_irq_lock;
>>  	struct irq_domain	*irqdomain;
>>  	unsigned int		num_blocks;
>> @@ -492,6 +496,13 @@ static const struct pm_irq_data pm8xxx_data = {
>>  	.irq_handler = pm8xxx_irq_handler,
>>  };
>>  
>> +static const struct pm_irq_data pm8921_data = {
>> +	.num_irqs = PM8XXX_NR_IRQS,
>> +	.usb_id_irq = 49,

Should we define '49' with a descriptive macro rather than using a magic 
number?

>> +	.irq_chip = &pm8xxx_irq_chip,
>> +	.irq_handler = pm8xxx_irq_handler,
>> +};
>> +
>>  static const struct pm_irq_data pm8821_data = {
>>  	.num_irqs = PM8821_NR_IRQS,
>>  	.irq_chip = &pm8821_irq_chip,
>> @@ -501,11 +512,60 @@ static const struct pm_irq_data pm8821_data = {
>>  static const struct of_device_id pm8xxx_id_table[] = {
>>  	{ .compatible = "qcom,pm8058", .data = &pm8xxx_data},
>>  	{ .compatible = "qcom,pm8821", .data = &pm8821_data},
>> -	{ .compatible = "qcom,pm8921", .data = &pm8xxx_data},
>> +	{ .compatible = "qcom,pm8921", .data = &pm8921_data},
>>  	{ }
>>  };
>>  MODULE_DEVICE_TABLE(of, pm8xxx_id_table);
>>  
>> +static int pm8xxx_add_usb_extcon(struct platform_device *pdev,
>> +				 struct pm_irq_chip *chip,
>> +				 unsigned int hwirq)
>> +{
>> +	struct irq_fwspec fwspec = {
>> +		.fwnode = dev_fwnode(&pdev->dev),
>> +		.param_count = 2,
>> +		.param = { hwirq, IRQ_TYPE_EDGE_BOTH },
>> +	};
>> +	struct platform_device_info pdevinfo = {
>> +		.parent = &pdev->dev,
>> +		.fwnode = dev_fwnode(&pdev->dev),
>> +		.of_node_reused = true,
>> +		.name = "qcom-pm8xxx-usb-id",
>> +		.id = PLATFORM_DEVID_NONE,
>> +	};
>> +	struct resource resource;
>> +
>> +	chip->usb_id_irq = irq_create_fwspec_mapping(&fwspec);
>> +	if (!chip->usb_id_irq)
>> +		return -ENXIO;
>> +
>> +	resource = DEFINE_RES_IRQ_NAMED(chip->usb_id_irq, "usb_id");
>> +	pdevinfo.res = &resource;
>> +	pdevinfo.num_res = 1;
>> +
>> +	chip->usb_extcon = platform_device_register_full(&pdevinfo);

Should we use 'devm_platform_device_register_full()' here to simplify 
resource management?

>> +	if (IS_ERR(chip->usb_extcon)) {
>> +		int ret = PTR_ERR(chip->usb_extcon);
>> +
>> +		chip->usb_extcon = NULL;
>> +		irq_dispose_mapping(chip->usb_id_irq);
>> +		chip->usb_id_irq = 0;
>> +
>> +		return ret;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static void pm8xxx_remove_usb_extcon(struct pm_irq_chip *chip)
>> +{
>> +	if (chip->usb_extcon)
>> +		platform_device_unregister(chip->usb_extcon);
>> +
>> +	if (chip->usb_id_irq)
>> +		irq_dispose_mapping(chip->usb_id_irq);
>> +}
> >
> > Why not devm_*
> >
> >>  static int pm8xxx_probe(struct platform_device *pdev)
> >>  {
> >>  	const struct pm_irq_data *data;
> >> @@ -570,9 +630,22 @@ static int pm8xxx_probe(struct platform_device *pdev)
> >>  
> >>  	irq_set_irq_wake(irq, 1);
> >>  
> >> +	if (data->usb_id_irq) {
> >> +		rc = pm8xxx_add_usb_extcon(pdev, chip, data->usb_id_irq);

Should we rename 'rc' to 'ret' here to align with the standard naming 
convention for return values?

>> +		if (rc)
>> +			goto err_domain;
>> +	}
>> +
>>  	rc = of_platform_populate(pdev->dev.of_node, NULL, NULL, &pdev->dev);
>>  	if (rc)
>> -		irq_domain_remove(chip->irqdomain);
>> +		goto err_extcon;
>> +
>> +	return 0;
>> +
>> +err_extcon:
>> +	pm8xxx_remove_usb_extcon(chip);
>> +err_domain:
>> +	irq_domain_remove(chip->irqdomain);
>>  
> >>  	return rc;
> >>  }
> >> @@ -582,6 +655,7 @@ static void pm8xxx_remove(struct platform_device *pdev)
> >>  	struct pm_irq_chip *chip = platform_get_drvdata(pdev);
> >>  
> >>  	of_platform_depopulate(&pdev->dev);
> >> +	pm8xxx_remove_usb_extcon(chip);
> >>  	irq_domain_remove(chip->irqdomain);
> >>  }
> >>  
> >> 
> >> -- 
> >> 2.43.0
> >> 
> >> 
> >
> > -- 
> > Lee Jones

-- 
Lee Jones
