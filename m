Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D57093BCD2C;
	Fri, 16 Oct 2026 04:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792125912; cv=none; b=PIyjmTfReARL5Tv7PKVBH4DO+xZuZMMeS2WO7xTFLCypP4nhPngsMpC2t4VRdRabu1Ny+30yCObJypNwmQaiHMeUv7p94ZOG98VDxmmOBaoGO8rtkrsgMZvGEJobFt9YRDXtJ/9JVRkwhMubVDJLV5Xf0qPG9d0xdV+1FlE0feY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792125912; c=relaxed/simple;
	bh=8ugGpefqG7m/oWEA+PNMalpDBDg19f32T9hSQabimfI=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=Lh8mfzRnaq+xT3FwUsC8uPk/p78+auFK/bU29METUqx+pODLTF6VSgRk7pfwVKryT7juaSepjGw2UaSS/rqRiSzJdybQgb2Dx9tB9fmyV1JCvPu7oBzvm0jtCgEUfBsrRHg15aN5L3OE6aUAfIjW1HF1SSvUIas/B6hzfe3xf+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LR/E78b1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LR/E78b1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24CAA1F000C4;
	Fri, 16 Oct 2026 04:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792125910;
	bh=8ugGpefqG7m/oWEA+PNMalpDBDg19f32T9hSQabimfI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LR/E78b1FjJOPbl1cqe01gCcG6tp/iUGbzW++sNsGCSCufMU+Fri31fmfYX8IgHHk
	 xlK4UQbSb4BpGzDVCjh8jnGkGbty5e5Tc/ZWZzFHTy47Va5Gxb3rjb0aqXpuIg1q2F
	 WNJ9KivC8BBvd7vh+mQPCYBsehu9GisrWOFLduarbT9W/HRXbLENTF8uQmvQEKi/tM
	 q71FhKC5chwgix8z5/3SxWLPaz4ZTIP0JCMo+DSwMD0d8fCfsht2PzI0qsLnvQ8I4W
	 hitbQJ186b1XMEGcZ4UAJjaQEUMLRzqXJBdV3pHDu0+XP6+M44YiwElNs0HqFQb41F
	 /Io7yRmAXptTg==
Message-ID: <sashiko-outbox-173801@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/4] gpio: davinci: Add support for level-triggered
 interrupts
Reply-To: sashiko-reviews@lists.linux.dev
To: "Aniket Limaye" <a-limaye@ti.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261016-upstream-tda54-gpio-v2-3-5c4f8b10cdbc@ti.com>
References: <20261016-upstream-tda54-gpio-v2-0-5c4f8b10cdbc@ti.com>
 <20261016-upstream-tda54-gpio-v2-3-5c4f8b10cdbc@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Oct 2026 04:45:09 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] irq: unbanked level interrupts fail to update flow handler and ove=
rwrite parent irq_set_type
- [High] gpio: davinci: missing irq_ack causes spurious level interrupts
- [High] gpio: davinci: out-of-bounds array access due to unvalidated ti,ng=
pio
- [Medium] gpio: TOCTOU race and massive overhead due to gpiochip_[dis|en]a=
ble_irq in mask/unmask callbacks
- [Medium] gpio: davinci: W1S registers not cleared on resume
--

commit f6da5fa1d3ffb73b515603cd9539eceb04b2addc
Author: Aniket Limaye <a-limaye@ti.com>
Subject: gpio: davinci: Add support for level-triggered interrupts

This patch adds support for IRQ_TYPE_LEVEL_HIGH and IRQ_TYPE_LEVEL_LOW trig=
gers to the DaVinci GPIO driver by utilizing extended registers. It clears =
level enables on setup and only sets them when a level trigger is explicitl=
y requested to preserve the default both-edges trigger.

Link: https://lore.kernel.org/r/20260923-upstream-tda54-gpio-v1-2-d1a0a199c=
836@ti.com

[Severity: High]
In drivers/gpio/gpio-davinci.c, around line 623 in davinci_gpio_irq_setup, =
the code overwrites the parent controller's irq_set_type callback with gpio=
_irq_type_unbanked.

Then, around line 472 in gpio_irq_type_unbanked, it configures the new leve=
l registers but returns 0 without calling irq_set_handler_locked to set han=
dle_level_irq, and without chaining to the parent's original irq_set_type c=
allback.

Because unbanked GPIO interrupts bypass the local IRQ domain and use the pa=
rent controller directly, won't this leave the parent controller unaware of=
 the level trigger configuration? Does this mean the flow handler remains h=
andle_edge_irq, meaning we miss the required mask/ack sequence and risk an =
immediate interrupt storm when the line is held active?

[Severity: Medium]
In drivers/gpio/gpio-davinci.c, handle_level_irq is used for the new level-=
triggered interrupts, which means the irq_mask and irq_unmask callbacks are=
 invoked on every single interrupt.

Around line 302 in gpio_irq_mask and line 315 in gpio_irq_unmask, the drive=
r calls gpiochip_disable_irq and gpiochip_enable_irq. Since these gpiolib f=
unctions take spinlocks, won't this add massive overhead on every level int=
errupt?

Furthermore, clearing the GPIOD_FLAG_IRQ_IS_ENABLED flag during the interru=
pt allows a concurrent userspace thread to successfully change the GPIO dir=
ection to output. When the interrupt finishes and gpiochip_enable_irq is ca=
lled, could this trigger a WARN_ON because the pin is now an output? Should=
 these gpiolib calls be moved to irq_enable and irq_disable instead?

[Severity: High]
In drivers/gpio/gpio-davinci.c around line 364, the newly added gpio_irqchi=
p_ext irq_chip lacks an irq_ack or irq_mask_ack callback.

In the chained handler gpio_irq_handler around line 404, it reads and clear=
s intstat before calling generic_handle_domain_irq. For level-triggered int=
errupts, the hardware will immediately re-latch the intstat bit since the e=
xternal line is still active.

When handle_level_irq masks the interrupt, it cannot clear this re-latched =
intstat due to the missing ack callback. Even after the device ISR runs and=
 de-asserts the line, intstat remains latched. Could this cause the while l=
oop in gpio_irq_handler to see a stale intstat bit and fire a spurious inte=
rrupt upon return, eventually causing the spurious interrupt detector to pe=
rmanently disable the IRQ line?

[Severity: Medium]
In drivers/gpio/gpio-davinci.c around line 757, davinci_gpio_restore_contex=
t attempts to restore the extension registers set_high and set_low upon sys=
tem resume.

Since these appear to be Write-1-to-Set registers in hardware, writing a 0 =
to a bit position has no effect. If firmware enabled a bit during suspend a=
nd it is 0 in the saved context, writing the 0 fails to clear it.

Could this leave level-triggered interrupts improperly enabled after resume=
? Would it be better to write the negated context to the corresponding clr_=
high and clr_low registers to properly clear bits?

[Severity: High]
In drivers/gpio/gpio-davinci.c around line 262 in davinci_gpio_probe, the i=
nitialization loop iterates nbank times to initialize chips->regs_ext and r=
eads from offset_array_ext.

If a malformed Device Tree provides a ti,ngpio value greater than 160, nban=
k will exceed MAX_REGS_BANKS which is 5.

Could this cause an out-of-bounds read past the static offset_array_ext and=
 a heap buffer overflow when writing past the end of the chips->regs_ext ar=
ray? Since the only sanity check on nirq uses gpio_unbanked rather than ngp=
io, should we validate ngpio against MAX_REGS_BANKS before iterating?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261016-upstream-t=
da54-gpio-v2-0-5c4f8b10cdbc@ti.com?part=3D3
