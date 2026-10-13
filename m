Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC6A83955CA
	for <linux-gpio@vger.kernel.org>; Tue, 13 Oct 2026 07:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791878219; cv=none; b=hbW7gBnav962imU9HBpQyJwHJ5GQaT/o+LnZ9dxF6/03I5Majr4/ntYxkaKFrwfgP5s+qpDFgoE9UWE/bSWMSXofK1t2zBfxSB6ovE1D6QLjuLt34Opa26uH5z8vfTixhUv0EKYDbwYp6YD82quuPMfdFYhf7OwjWN6G7Od1nvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791878219; c=relaxed/simple;
	bh=Gbk0JXD50qae7QzYjcRg8ZF/rHUWCsfAA9LZ7uRCsO4=;
	h=Message-ID:From:Subject:To:In-Reply-To:References:Content-Type:
	 Date; b=VlRU4ROXZDI67XXns7UF2VYyOtILebhxs3AQf/IExRt7juHtsgNudkdM7gJRKcwfb5PMtEfQEyQjkisDYzNKW4WkypGpVTU+zSvD07A5KJwB9UemGOP0MlbZgwiMYByAXISN+mQX6dfmM4mMTuc5V5kuJyyIg4gCtGn5T9WaLqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P0Gj51jO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P0Gj51jO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 685B71F000FF;
	Tue, 13 Oct 2026 07:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791878217;
	bh=OIdqYrCKs66RPj3hpDjEfJcU2IE8vK9WKuiKynZXcLU=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=P0Gj51jOgj9N+KP8iulyCY3ruWhoMJjyh/r1sRlImVNktl8+Paz8PV1fCTv66lrot
	 DVfIN7m5phyMpLOIHZe6Hflzu3OZ5bHZvrfkvf1LVIJWYM6qnGJQvYf0yvfxnbkAcF
	 oQ53CT2R4afkKG6jkwwUA9crKpuX/N+3iUi3BBd3/GOwD1ShJYW24i66Ujem2B3uue
	 xXYmlLS3dkgAV0bYGd7xlovhfiB+DjNFG/Zmi8pgzgCtUEkHBkLHN7NXfKVlbM+Q43
	 r7P8sQ8eJGIYQZySNzhZvo+RHZs7Vt6H+H2ichJCvq2hLsph65ULr8EnGkqRgSXAKg
	 jGymnyaq4IvLw==
Message-ID: <sashiko-outbox-169216@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] gpio: amdptpci: add support for AMD PT PCI
 controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Szuying Chen" <Chloe_Chen@asmedia.com.tw>, linux-gpio@vger.kernel.org
In-Reply-To: <20261013074327.4961-1-Chloe_Chen@asmedia.com.tw>
References: <20261013074327.4961-1-Chloe_Chen@asmedia.com.tw>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 07:56:57 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 8 potential issue(=
s) to consider:
- [High] pm: irq handler accesses hardware registers without runtime PM che=
ck
- [High] pm: missing synchronize_irq() in runtime suspend callback
- [High] gpio: system suspend erroneously unmasks all interrupts due to inc=
orrect mask calculation
- [High] gpio: PREEMPT_RT lock nesting violation in pt27_irq_mask()
- [Medium] gpio: level-triggered interrupts permanently masked due to PM st=
ate drop
- [Medium] gpio: TOCTOU race in PM reference tracking between mask and unma=
sk
- [Medium] gpio: teardown ordering violation due to mixed devm and manual c=
leanup
- [Medium] pci: runtime PM state leak in probe error path
--

commit 0c4bfe0b69469a3b6087533b773e271439cdda28
Author: Szuying Chen <Chloe_Chen@asmedia.com.tw>

gpio: amdptpci: add support for AMD PT PCI controller

This commit implements the new gpio-amdptpci driver to support the
GPIO functionality on AMD PT PCI platforms.

> diff --git a/drivers/gpio/gpio-amdptpci.c b/drivers/gpio/gpio-amdptpci.c
> new file mode 100644
> index 0000000000000..ac2a7b46c3cde
> --- /dev/null
> +++ b/drivers/gpio/gpio-amdptpci.c
> @@ -0,0 +1,891 @@

[ ... ]

> +static void pt27_irq_mask(struct irq_data *d)
> +{
> +	struct gpio_chip *gc   =3D irq_data_get_irq_chip_data(d);
> +	struct pt27_gpio *chip =3D gpiochip_get_data(gc);
> +	irq_hw_number_t   hwirq =3D irqd_to_hwirq(d);
> +	unsigned long flags;
> +	u32 val;
> +	bool drop_pm =3D false;
> +
> +	gpiochip_disable_irq(gc, hwirq);
> +
> +	if (!pt27_irq_regs_accessible(chip)) {
> +		dev_err_ratelimited(chip->dev,
> +				    "%s: GPIO%lu remains masked; PT27 is not in D0\n",
> +				     __func__, hwirq);
> +		return;
> +	}
> +
> +	raw_spin_lock_irqsave(&chip->lock, flags);
> +
> +	val  =3D pt27_rd32(chip, PT27_REG_INT_MASK);
> +	val |=3D BIT(hwirq);
> +	pt27_wr32(chip, PT27_REG_INT_MASK, val);
> +
> +	val  =3D pt27_rd32(chip, PT27_REG_INT_EN);
> +	val &=3D ~BIT(hwirq);
> +	pt27_wr32(chip, PT27_REG_INT_EN, val);
> +
> +	chip->enabled_irq_mask &=3D ~BIT(hwirq);
> +	if (!chip->enabled_irq_mask && chip->irq_pm_held) {
> +		chip->irq_pm_held =3D false;
> +		drop_pm =3D true;
> +	}
> +
> +	raw_spin_unlock_irqrestore(&chip->lock, flags);

[Severity: Medium]
Will this logic permanently mask level-triggered interrupts?

handle_level_irq() temporarily masks the interrupt by calling .irq_mask() a=
nd
unmasks it afterward with .irq_unmask(). If this is the only active interru=
pt,
this clears enabled_irq_mask to 0, setting chip->irq_pm_held to
false and dropping the PM reference.=20

When handle_level_irq() subsequently calls pt27_irq_unmask(), it will fail =
the
pt27_irq_regs_accessible(chip) check because irq_pm_held is false and
irq_bus_active is false, leaving the interrupt permanently masked.

> +
> +	if (drop_pm)
> +		pt27_runtime_put_autosuspend(chip);

[Severity: High]
Does this code call a sleepable PM runtime function while running in atomic
context under the IRQ core's raw spinlock?

pt27_irq_mask() is called by the IRQ core with the descriptor lock held, wh=
ich
is a raw_spinlock_t. If drop_pm is true, the driver calls
pt27_runtime_put_autosuspend(chip), which internally acquires dev->power.lo=
ck
(a spinlock_t).

On PREEMPT_RT, spinlock_t is a sleepable rt_mutex. Acquiring a sleepable lo=
ck
inside a raw_spinlock_t critical section is a strict lock nesting violation
and triggers a sleeping in atomic context BUG.

> +
> +}
> +
> +static void pt27_irq_unmask(struct irq_data *d)
> +{
> +	struct gpio_chip *gc   =3D irq_data_get_irq_chip_data(d);
> +	struct pt27_gpio *chip =3D gpiochip_get_data(gc);
> +	irq_hw_number_t   hwirq =3D irqd_to_hwirq(d);
> +	unsigned long flags;
> +	u32 val;
> +
> +	if (!pt27_irq_regs_accessible(chip)) {
> +		dev_err_ratelimited(chip->dev,
> +				    "%s: cannot unmask GPIO%lu; PT27 is not in D0\n",
> +				     __func__, hwirq);
> +		return;
> +	}
> +
> +	pt27_irq_take_pm_hold(chip);
> +
> +	gpiochip_enable_irq(gc, hwirq);
> +
> +	raw_spin_lock_irqsave(&chip->lock, flags);

[Severity: Medium]
Can a TOCTOU race occur here in PM reference tracking between mask and unma=
sk?

If CPU 0 executes pt27_irq_unmask() for hwirq 0, it calls
pt27_irq_take_pm_hold(), which sees irq_pm_held =3D=3D true, skips incremen=
ting
the PM usage count, and drops the lock.

Before CPU 0 re-acquires the lock, CPU 1 could execute pt27_irq_mask() for
the only active hwirq 1, clear enabled_irq_mask, set irq_pm_held to false,
and call pm_runtime_put_autosuspend().

CPU 0 then re-acquires the lock and sets enabled_irq_mask |=3D BIT(0), but
irq_pm_held remains false. The PM usage count is now unbalanced and the dev=
ice
may enter runtime suspend while hwirq 0 is actively relying on it.

[ ... ]

> +static irqreturn_t pt27_gpio_isr(int irq, void *data)
> +{
> +	struct pt27_gpio *chip =3D data;
> +	unsigned long pending;
> +	unsigned long flags;
> +
> +	raw_spin_lock_irqsave(&chip->lock, flags);
> +	pending =3D pt27_pending_irqs_locked(chip);
> +	raw_spin_unlock_irqrestore(&chip->lock, flags);

[Severity: High]
Does this ISR access hardware registers without checking if the device is
active?

The device supports shared INTx interrupts via IRQF_SHARED, which means the
interrupt can fire at any time, including when the AMD PT GPIO controller is
in a suspended PM state (D3hot/D3cold).

pt27_gpio_isr() unconditionally calls pt27_pending_irqs_locked(), which
performs MMIO reads. Reading MMIO from a suspended PCI device typically
returns 0xffffffff and can cause PCIe target aborts, system hangs, or
interrupt storms.

Could we use pm_runtime_get_if_active() before accessing hardware registers?

[ ... ]

> +static int pt27_gpio_probe(struct pci_dev *pdev, const struct pci_device=
_id *id)
> +{
> +	struct device    *dev =3D &pdev->dev;
> +	struct pt27_gpio *chip;

[ ... ]

> +err_free_irq:
> +	devm_free_irq(dev, chip->irq, chip);
> +err_wakeup:
> +	device_init_wakeup(dev, false);
> +err_free_vectors:
> +	pci_free_irq_vectors(pdev);
> +err_clear_master:
> +	pci_clear_master(pdev);
> +	return ret;
> +}

[Severity: Medium]
Are we leaking the runtime PM state in the probe error paths?

Since pm_runtime_use_autosuspend(dev) is called earlier in probe, if probe
fails at devm_request_irq() or devm_gpiochip_add_data(), it will jump to th=
ese
error labels without calling pm_runtime_dont_use_autosuspend(dev).

This leaves the PCI device with use_autosuspend =3D true. If another driver
binds to this device later, it will unexpectedly inherit an active autosusp=
end
configuration.

> +static void pt27_gpio_remove(struct pci_dev *pdev)
> +{
> +	struct device     *dev  =3D &pdev->dev;
> +	struct pt27_gpio  *chip =3D pci_get_drvdata(pdev);
> +	unsigned long flags;
> +	bool drop_pm;

[ ... ]

> +	devm_free_irq(dev, chip->irq, chip);
> +	pci_free_irq_vectors(pdev);
> +	pci_clear_master(pdev);
> +
> +	mutex_unlock(&chip->irq_bus_lock);
> +}

[Severity: Medium]
Does manual cleanup of the IRQ vectors invert the teardown order?

Because the gpiochip was registered using devm_gpiochip_add_data(), it won't
be unregistered until after pt27_gpio_remove() returns. However,
pci_free_irq_vectors() is called manually here, destroying the backing
hardware resources while the logical device remains active and exposed.

Userspace could successfully request GPIO interrupts during this window that
will silently never fire, breaking the hardware-to-software dependency chai=
n.
Could we use devm_add_action_or_reset() for freeing the IRQ vectors?

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
> +
> +	raw_spin_lock_irqsave(&chip->lock, flags);
> +	pt27_save_regs(chip);
> +	pt27_wr32(chip, PT27_REG_INT_EN,    0);
> +	int_mask =3D PT27_REG_INT_MASK & ~chip->wake_mask;
> +	pt27_wr32(chip, PT27_REG_INT_MASK,  int_mask);

[Severity: High]
Does this bitwise operation use a register offset address instead of a valid
mask?

PT27_REG_INT_MASK is a register offset macro (0x0020), not the GPIO bitmask
(PT27_GPIO_MASK). This bitwise AND limits int_mask to only bit 5, forcing a=
ll
other 23 bits to 0.

Since writing 0 to the mask register enables/unmasks the interrupt, this wr=
ites
a corrupted state to the device that inadvertently unmasks almost all inter=
rupts
during system sleep, potentially causing an interrupt storm and preventing
sleep.

> +	pt27_wr32(chip, PT27_REG_INT_STAT,  PT27_GPIO_MASK);
> +	pt27_wr16(chip, PT27_REG_WAKE_STAT, PT27_WAKE_MASK);
> +	raw_spin_unlock_irqrestore(&chip->lock, flags);
> +
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
> +	if (chip->irq_pm_held || chip->enabled_irq_mask) {
> +		ret =3D -EBUSY;
> +		goto out_unlock;
> +	}
> +
> +	if (chip->wake_mask && !device_may_wakeup(dev)) {
> +		ret =3D -EBUSY;
> +		goto out_unlock;
> +	}
> +
> +	if (pt27_pending_irqs_locked(chip)) {
> +		ret =3D -EBUSY;
> +		goto out_unlock;
> +	}
> +
> +	pt27_save_regs(chip);
> +
> +	pt27_wr32(chip, PT27_REG_INT_EN,    0);
> +	pt27_wr32(chip, PT27_REG_INT_MASK,  PT27_GPIO_MASK);
> +	pt27_wr32(chip, PT27_REG_INT_STAT,  PT27_GPIO_MASK);
> +	pt27_wr16(chip, PT27_REG_WAKE_STAT, PT27_WAKE_MASK);
> +
> +out_unlock:
> +	raw_spin_unlock_irqrestore(&chip->lock, flags);
> +	return ret;
> +}

[Severity: High]
Should this function call synchronize_irq(chip->irq)?

The device can use shared interrupts (IRQF_SHARED). When drivers use shared
IRQs, the PM subsystem guidelines strictly require calling synchronize_irq()
in the runtime suspend callback.

This initiates power-down and masks interrupts without previously synchroni=
zing
the shared IRQ line, allowing the hardware to be powered down while the sha=
red
IRQ handler is still executing mid-flight on another CPU, leading to invalid
MMIO accesses and potential crashes.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013074327.4961=
-1-Chloe_Chen@asmedia.com.tw?part=3D1
