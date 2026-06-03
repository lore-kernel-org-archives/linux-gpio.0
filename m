Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45DE53B47CF;
	Wed,  3 Jun 2026 15:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780500987; cv=none; b=hMcfzwGGWTuUf7+b4CpKef2D4JcTnlyLV4uRiM5/of9/UTXnJ35g7rhORYliPh+uvGi1Xzh8KDG4LFKSLv1/7UDvCpkaPN87tIWkFuQQS3t6Hp21AfZwi/hFW4aZlQUFaN7P8bEK79yKmRPeRiPNlGyLgZTg+jCctIWjpJnvLSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780500987; c=relaxed/simple;
	bh=WWl0wCb3pfPSLTyKbZGLBc+OPYdYxOFfCypVd82uDUk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=VQWmtvwy726Xw3nsv0QsjErA2RGCCxyQ78h0ujnn7MXaVGBEiWMAGXBoaw549FbeGawaj69XhlYpNs3oTdhl5pdPIMkPBGW87C6ZK8QvLnNkeetZxmyQ8AlijdwIARpoCgHeTJyRpH0xwgNJUPugtwOEuufXzGkr0N2GIgUJJFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hHrV/x+P; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hHrV/x+P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E2391F00893;
	Wed,  3 Jun 2026 15:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780500985;
	bh=SAkb5V6NtcCPmSvzm4+V97K1xoD0UopH40bZ8VjeIHw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=hHrV/x+PdTiushR0xNqUS/JtV+j0xltOIxRB/FiBKo8zKJqcILCvPurAh/xvON40n
	 u+c9irCJKkqd+80iJHfmqbSmgruuIYUJ6jA3gzKSiQ+HIU9g7EN5I4JILM3K6Tb4Ck
	 eztfJYNQ24L9nQfdBXFuMi1Pah/sGCuxpRBR19+Roiq9lg5ixmMBlL2TSZHBeQ5I3s
	 T40/FZMFy8rSO8qe08cLSvV+N7zXUEqtJlo6d81GCQMIPLthC0ygGDF7u6ghhPkeoE
	 nQOiXUrlRIx+YayPEXXy1EuwT3xdMSqguvCuFgOoOGke8omCS7ONP6mAW0oec1Jxnf
	 IEW/cmQKGPNqQ==
From: Thomas Gleixner <tglx@kernel.org>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>, Bjorn Andersson
 <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, Sneh Mankad
 <sneh.mankad@oss.qualcomm.com>, Maulik Shah <maulik.shah@oss.qualcomm.com>
Subject: Re: [PATCH v2 5/8] irqchip/qcom-pdc: Configure PDC to pass through
 mode
In-Reply-To: <20260526-hamoa_pdc-v2-5-f6857af1ce91@oss.qualcomm.com>
References: <20260526-hamoa_pdc-v2-0-f6857af1ce91@oss.qualcomm.com>
 <20260526-hamoa_pdc-v2-5-f6857af1ce91@oss.qualcomm.com>
Date: Wed, 03 Jun 2026 17:36:22 +0200
Message-ID: <87zf1b63gp.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, May 26 2026 at 16:24, Maulik Shah wrote:
 
> +static inline bool pdc_pin_uses_seconary_mode(int pin_out)
> +{
> +	if (pdc->mode == PDC_SECONDARY_MODE && pin_out >= pdc->num_spis)
> +		return true;

  return pdcc>mode == ... && ...;

Perhaps?

> +static void qcom_pdc_ack(struct irq_data *d)
> +{
> +	if (pdc_pin_uses_seconary_mode(d->hwirq) && !irqd_is_level_type(d))
> +		pdc->clear_gpio(d->hwirq);
> +}
> +
> +static void qcom_pdc_gic_eoi(struct irq_data *d)
> +{
> +	if (pdc_pin_uses_seconary_mode(d->hwirq) && irqd_is_level_type(d))
> +		pdc->clear_gpio(d->hwirq);
> +
> +	irq_chip_eoi_parent(d);
> +}

Not that I care about the performance of your SoC, but those
conditionals can be completely avoided with separate irq chips.

