Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDCE233260D;
	Tue, 30 Jun 2026 15:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782832042; cv=none; b=pqW3Ig3JqqER0b2GHJmaeIFvOmJ6OOOLnNpfXsAFceEuApZGiTA+QV7HrqSS+9j8rJ4u6JmytINnUqSxFJDJCarbQ3RPD80VgswKRgsoGGFWNMkuwrBJnxwt3mezoAzFtDctuqazNxdJv80DQ2FoSCKeZ9eAritjK8yGsXTh6kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782832042; c=relaxed/simple;
	bh=cKm2TQWYYDVT3YFdxldD0hjiBGzE9D9hlUxi+G5hJR4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Q3uGyzqSSFY8BAIqbGZmpH9wh8OAYEncg/6BSQWfBxV1D9/q7sZfebjxqRU73rwLAGggf8iuXNPgWg8SKQDlTz9LRPZ4eckAU1ve50hbs/xwdUOZy3uEp6pWfzCr5qbKCDhucs8DCf6FUP8PRnSHTXNi8B7bXo6nMlA1Du3P3OY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VWo5d/zm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VWo5d/zm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8B281F000E9;
	Tue, 30 Jun 2026 15:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782832041;
	bh=wTHt9bkGo2z8+HbJjndW5De4w7Z8ltkhBocl59q8cBI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=VWo5d/zmJmON1qOV9AYJDW/ctJYJXLJQkVA1HC4UdF7pdDRpnvQH41EoBBVa7ws/k
	 5iPO1Xt7AhEZ5Paecu0wP52kd7P1UPDArD6vb6Tja32/Ffk2pFmy98SJ58ulYCg1Nm
	 x3w+Qxgc7EsqTsEnuIV67CnFbp814Bs0pK2peHLvY48cyjpybiedpnHhCwezM7+kZH
	 psRtDQAjpWKXDIaHh8X8vQuEagwfFsQs1aZZf8ROI/lBfmjYrfiJEZW/T6ckihnoRC
	 NVlw9NuBNUdg6u8Wg0O7KsRYe81hcMQtSTHdoPr8A5R4J6i49vg8R2hYbxpqQXw139
	 a8FRPWQ3krRPQ==
From: Thomas Gleixner <tglx@kernel.org>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>, Bjorn Andersson
 <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, Sneh Mankad
 <sneh.mankad@oss.qualcomm.com>, Maulik Shah <maulik.shah@oss.qualcomm.com>
Subject: Re: [PATCH v3 5/8] irqchip/qcom-pdc: Configure PDC to pass through
 mode
In-Reply-To: <20260616-hamoa_pdc_v3-v3-5-4d8e1504ea75@oss.qualcomm.com>
References: <20260616-hamoa_pdc_v3-v3-0-4d8e1504ea75@oss.qualcomm.com>
 <20260616-hamoa_pdc_v3-v3-5-4d8e1504ea75@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 17:07:18 +0200
Message-ID: <87echoqd7d.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, Jun 16 2026 at 14:55, Maulik Shah wrote:
> All PDC irqchip supports pass through mode in which both Direct SPIs and

All PDC variants support pass .. ??

> GPIO IRQs (as SPIs) are sent to GIC without latching at PDC.
>
> Newer PDCs (v3.0 onwards) also support additional secondary controller mode
> where PDC latches GPIO IRQs and sends to GIC as level type IRQ. Direct SPIs

latches the GPIO interrupts and sends them to GIC as level type interrupts.

> still works same as pass through mode without latching at PDC even in

SPIs .. work the same as pass-through mode ....

> secondary controller mode.
>
> All the SoCs so far default uses pass through mode with the exception of

SoCs ... use pass-through 

> x1e. x1e PDC may be set to secondary controller mode for builds on CRD
> boards whereas it may be set to pass through mode for IoT-EVK boards.
> The mode configuration is done in firmware and initially shipped windows
> firmware did not have SCM interface to read or modify the PDC mode.
> Later only write access is opened up for non secure world.

.. for the non-secure ..

> +/**
> + * qcom_pdc_gic_set_type: Configure PDC for the interrupt
> + *
> + * @d: the interrupt data
> + * @type: the interrupt type

https://docs.kernel.org/process/maintainer-tip.html#struct-declarations-and-initializers

I'm sure I pointed you to that document before.

> + *
> + * All @type are forwarded as Level type to parent GIC
> + */
> +static int qcom_pdc_gic_secondary_set_type(struct irq_data *d, unsigned int type)
> +{
> +	enum pdc_irq_config_bits pdc_type;
> +	enum pdc_irq_config_bits old_pdc_type;

Chapter before the above ...

> @@ -449,8 +628,13 @@ static int pdc_setup_pin_mapping(struct device *dev, struct device_node *np)
>  		if (ret)
>  			return ret;
>  
> -		for (int i = 0; i < pdc->region[n].cnt; i++)
> -			pdc->enable_intr(i + pdc->region[n].pin_base, 0);
> +		for (int i = 0; i < pdc->region[n].cnt; i++) {
> +			if (pdc_pin_is_gpio(i + pdc->region[n].pin_base) &&
> +			    pdc->mode == PDC_SECONDARY_MODE)
> +				pdc->clear_gpio(i + pdc->region[n].pin_base);
> +

Requires guard(irqsave)(...)

