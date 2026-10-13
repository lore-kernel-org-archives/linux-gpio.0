Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C9563A4F50
	for <linux-gpio@vger.kernel.org>; Tue, 13 Oct 2026 08:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791880243; cv=none; b=LgjO/xZYcf7aol3m9BSEuBkJ7Fsijz17gtWl6eIFMmHED35T+m+6huR5JXRurtUaFGjZV9jxOVsR3MHqh2JTAieHY1t8anm4gtGR4hQnqLSOLNH2qHlDd9vrsIv7r4MvHp2CdAv4EMag5aZbIPsJ0u8ky2poxggXRn6/SxqCOio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791880243; c=relaxed/simple;
	bh=yLrk0cBqYH3PFeizMjg50U6BDvhrPR6Q3MKWYVZWpNQ=;
	h=Message-ID:From:Subject:To:In-Reply-To:References:Content-Type:
	 Date; b=LX8l+JX+h+n7pg7sOfl94h1+kcejv+NPiq4vukg/tv+LcGJYD7fGsP+Bcexhcigz4ApTnxxbTSlxDX7evI5Xjw6HSQn2jHiomPp50/bXGTejn5OfBEzCJfh0DJAxFdA0jxinj/x7BWM0C9qnD7uWPhaaG0UuSIAMlNCLLMpjNJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HrgQuUVs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HrgQuUVs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BB4A1F000FF;
	Tue, 13 Oct 2026 08:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791880241;
	bh=fCSiJyTJIE41ceTY249+de+LcOZlP20VVQj7xRdloY4=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=HrgQuUVsgtLY0CMWb1zxxMin9e6f1LzT9996mllrb7AjMjJLaTzH9NvtUUk2J2X7q
	 jlqaVf6ABR91hWmsluD0c2xjG77ezjDg+UuSWiMHaCOT9I34NxWPaCAnHyWiS2cQbu
	 hr0MNMvQN7g0dzto5HG7yu9bg7gaBsuLPJ+5xKqW7HR/R8jMuf8H7S/qjzNlZDIpoS
	 BTEAR2nDOZxMZCrtY7RGKgi0JsaPQfdevLJknydDlnfChtRgdnwNMsDAG3TK/Fuyxh
	 MPhGyhHm8Ivuqhrx/CT+TmQ6I4yQyDmajTmC1YdSyKVPmWqXrV34ClYS9RYgVu6xBJ
	 NRvECh0rXEvKQ==
Message-ID: <sashiko-outbox-169255@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] gpio: amdptpci: add support for AMD PT PCI
 controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Szuying Chen" <Chloe_Chen@asmedia.com.tw>, linux-gpio@vger.kernel.org
In-Reply-To: <20261013081631.5841-1-Chloe_Chen@asmedia.com.tw>
References: <20261013081631.5841-1-Chloe_Chen@asmedia.com.tw>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 08:30:41 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 8 potential issue(=
s) to consider:
- [High] gpio: amdptpci: hardware access occurs after failed device resume
- [High] gpio: amdptpci: pending wakeup interrupts are destroyed during res=
ume
- [High] pm: ISR accesses suspended MMIO due to irq_pm_held flag race
- [High] gpio: interrupt storm due to registering GPIO chip before parent I=
RQ
- [Medium] gpio: amdptpci: invalid bitmask writes to reserved bits during s=
uspend
- [Medium] gpio: amdptpci: device can never runtime suspend if wake IRQ is =
configured
- [Medium] gpio: amdptpci: S3 wakeups broken if device autosuspends before =
system suspend
- [Low] gpio: amdptpci: missing pm_runtime_dont_use_autosuspend() on probe =
error path
--

commit 84767db1836e202d0ec481c787ac2cf3407a669a
Author: Szuying Chen <Chloe_Chen@asmedia.com.tw>

gpio: amdptpci: add support for AMD PT PCI controller

This commit implements the new gpio-amdptpci driver to support the
GPIO functionality on AMD PT PCI platforms.

> diff --git a/drivers/gpio/gpio-amdptpci.c b/drivers/gpio/gpio-amdptpci.c
> new file mode 100644
> index 0000000000000..c63e9b6dcf7ad
> --- /dev/null
> +++ b/drivers/gpio/gpio-amdptpci.c
[ ... ]
> +static void pt27_restore_regs(struct pt27_gpio *chip)
> +{
[ ... ]
> +	pt27_wr16(chip, PT27_REG_WAKE_LVL,  chip->saved.wake_lvl);
> +	pt27_wr16(chip, PT27_REG_WAKE_MODE, chip->saved.wake_mode);
> +	pt27_wr16(chip, PT27_REG_WAKE_EN,   chip->saved.wake_en);
> +
> +	pt27_wr32(chip, PT27_REG_INT_STAT,  PT27_GPIO_MASK);
> +	pt27_wr16(chip, PT27_REG_WAKE_STAT, PT27_WAKE_MASK);

[Severity: High]
Does writing the mask to the status register here clear all pending interru=
pts
unconditionally before the ISR can service them?=20

When the system wakes up due to a GPIO event, the hardware logs the event in
the status register. If pt27_restore_regs() clears them assuming W1C
semantics, won't the core IRQ handler read 0 pending interrupts and return
IRQ_NONE, permanently losing the wakeup interrupt?

> +
> +	pt27_wr32(chip, PT27_REG_INT_EN,   chip->saved.int_en);
> +	pt27_wr32(chip, PT27_REG_INT_MASK, chip->saved.int_mask);
> +
> +}
[ ... ]
> +static bool pt27_irq_regs_accessible(struct pt27_gpio *chip)
> +{
> +
> +	return READ_ONCE(chip->irq_bus_active) ||
> +	       READ_ONCE(chip->irq_pm_held);
> +}

[Severity: High]
Will this OR condition cause the device to be accessed even if it failed to
resume?=20

In pt27_irq_bus_lock() below, a failed resume sets chip->irq_bus_active to
false, but chip->irq_pm_held is already set to true by
pt27_irq_request_resources(). This means pt27_irq_regs_accessible() will
evaluate to true, and subsequent IRQ operations will attempt to write to MM=
IO
registers of a powered-down device.

[ ... ]
> +static int pt27_irq_request_resources(struct irq_data *d)
> +{
[ ... ]
> +	raw_spin_lock_irqsave(&chip->lock, flags);
> +	chip->requested_irq_mask |=3D BIT(hwirq);
> +	if (!chip->irq_pm_held) {
> +		chip->irq_pm_held =3D true;
> +
> +		pm_runtime_get_noresume(chip->dev);
> +	}
> +	raw_spin_unlock_irqrestore(&chip->lock, flags);

[Severity: High]
Is there a race condition here where the ISR might access suspended MMIO
hardware?=20

This sets chip->irq_pm_held to true and calls pm_runtime_get_noresume(),
which only increments the usage counter but does not wake the device from D=
3.
The device is not actually woken until pt27_irq_bus_lock() runs.=20

If a shared PCI INTx interrupt fires in this window, the ISR pt27_gpio_isr()
will see chip->irq_pm_held is true and bypass its suspend safeguard, leading
to an invalid MMIO read. Should this use pm_runtime_get_if_active() instead?

[ ... ]
> +static void pt27_irq_bus_lock(struct irq_data *d)
> +{
> +	struct gpio_chip *gc   =3D irq_data_get_irq_chip_data(d);
> +	struct pt27_gpio *chip =3D gpiochip_get_data(gc);
> +	int ret;
> +
> +	mutex_lock(&chip->irq_bus_lock);
> +
> +	ret =3D pm_runtime_resume_and_get(chip->dev);
> +	if (ret < 0) {
> +		WRITE_ONCE(chip->irq_bus_active, false);
> +		dev_err_ratelimited(chip->dev,
> +				    "%s: cannot resume for IRQ configuration: %d\n",
> +				     __func__, ret);
> +		return;
> +	}

[Severity: High]
If pm_runtime_resume_and_get() fails here, it correctly records that the bus
is inactive. Since the core IRQ operation is not aborted, and the static fl=
ag
forces pt27_irq_regs_accessible() to evaluate to true, will the outer IRQ
code proceed to interact with the device despite this failure?

[ ... ]
> +static irqreturn_t pt27_gpio_isr(int irq, void *data)
> +{
> +	struct pt27_gpio *chip =3D data;
> +	unsigned long pending;
> +	unsigned long flags;
> +
> +	raw_spin_lock_irqsave(&chip->lock, flags);
> +	/*
> +	 * No requested IRQ means nothing to dispatch, and the device may be
> +	 * runtime-suspended (D3): a shared INTx line can still call us, so do
> +	 * not touch MMIO unless the PM hold keeps the device in D0.
> +	 */
> +	if (!chip->irq_pm_held) {
> +		raw_spin_unlock_irqrestore(&chip->lock, flags);
> +		return IRQ_NONE;
> +	}
> +	pending =3D pt27_pending_irqs_locked(chip);

[Severity: High]
Could this ISR bypass its suspend safeguard based on the static flag race
discussed earlier? If the hardware is suspended but the flag evaluates to
true, could this lead to a bus error or spurious interrupt?

[ ... ]
> +static int pt27_gpio_probe(struct pci_dev *pdev, const struct pci_device=
_id *id)
> +{
[ ... ]
> +	ret =3D devm_gpiochip_add_data(dev, &chip->gc, chip);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to register GPIO chip\n");
> +
> +	ret =3D devm_request_irq(dev, chip->irq, pt27_gpio_isr, irq_flags | IRQ=
F_NO_THREAD, dev_name(dev), chip);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to request IRQ %d\n", chip->irq=
);

[Severity: High]
Can this initialization sequence lead to an unhandled interrupt storm?=20

By calling devm_gpiochip_add_data() before devm_request_irq(), the GPIO chip
is exposed to consumers before its parent ISR is registered. If a consumer
immediately requests and unmasks a GPIO IRQ, the hardware will assert the
shared PCI IRQ line, but pt27_gpio_isr() will not yet be registered to hand=
le
it.

Reversing the order is safe because if a spurious shared interrupt occurs
before the domain is initialized, chip->irq_pm_held will be false, and the
ISR will safely return IRQ_NONE without dereferencing anything.

[Severity: Low]
If either of these registration steps fail, the probe function returns
directly. Does this leak the PM configuration by missing a call to
pm_runtime_dont_use_autosuspend(dev) to revert the PM state?

[ ... ]
> +static int __maybe_unused pt27_gpio_suspend(struct device *dev)
> +{
> +	struct pt27_gpio *chip =3D dev_get_drvdata(dev);
> +	unsigned long flags;
> +	u32 int_mask;
> +
> +	if (pm_runtime_status_suspended(dev)) {
> +		dev_dbg(dev, "%s: already runtime-suspended, skipping save\n",
> +			__func__);
> +		return 0;
> +	}

[Severity: Medium]
Will returning early here break S3 wakeups if the device autosuspends before
system suspend?=20

pt27_gpio_runtime_suspend() masks all interrupts, configuring no wake event=
s.
By skipping the resume preparation when already suspended, this function
never unmasks wake-capable pins, completely breaking the controller's abili=
ty
to wake the system.

> +
> +	raw_spin_lock_irqsave(&chip->lock, flags);
> +	pt27_save_regs(chip);
> +	pt27_wr32(chip, PT27_REG_INT_EN,    0);
> +	int_mask =3D 0xFFFFFFFF & ~chip->wake_mask;
> +	//int_mask =3D PT27_REG_INT_MASK & ~chip->wake_mask;
> +	pt27_wr32(chip, PT27_REG_INT_MASK,  int_mask);

[Severity: Medium]
Does this write invalid bitmasks to reserved hardware bits?=20

The controller supports 24 GPIOs (PT27_GPIO_MASK is 0x00FFFFFF). By using
0xFFFFFFFF, the bitwise NOT operation will write 1s to bits 24-31 of the
PT27_REG_INT_MASK register, which could trigger unintended hardware faults.

> +	pt27_wr32(chip, PT27_REG_INT_STAT,  PT27_GPIO_MASK);
> +	pt27_wr16(chip, PT27_REG_WAKE_STAT, PT27_WAKE_MASK);
> +	raw_spin_unlock_irqrestore(&chip->lock, flags);
> +
> +	synchronize_irq(chip->irq);
> +	return 0;
> +}
[ ... ]
> +static int __maybe_unused pt27_gpio_runtime_suspend(struct device *dev)
> +{
> +	struct pt27_gpio *chip =3D dev_get_drvdata(dev);
> +	unsigned long flags;
> +	int ret =3D 0;
> +
> +	raw_spin_lock_irqsave(&chip->lock, flags);
> +
> +	if (chip->irq_pm_held || chip->requested_irq_mask) {
> +		ret =3D -EBUSY;
> +		goto out_unlock;
> +	}
> +
> +	if (chip->wake_mask && !device_may_wakeup(dev)) {
> +		ret =3D -EBUSY;
> +		goto out_unlock;
> +	}

[Severity: Medium]
Does the first check unintentionally prevent the device from ever entering
runtime suspend when a wake IRQ is configured?=20

A wake IRQ is inherently a requested IRQ, meaning chip->requested_irq_mask
will always be non-zero if chip->wake_mask is non-zero. The first block will
therefore unconditionally abort the suspend with -EBUSY, making the
subsequent wake_mask check dead code and preventing the PCI device from
reaching D3.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013081631.5841=
-1-Chloe_Chen@asmedia.com.tw?part=3D1
