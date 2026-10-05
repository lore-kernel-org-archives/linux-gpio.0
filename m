Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2ECC21FF29
	for <linux-gpio@vger.kernel.org>; Mon,  5 Oct 2026 04:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791173212; cv=none; b=o8cNTiWhqLU1/NTHkReLy5lkAbqEXcWCc3kmo+5lhq5Z3es0lKFsge6di/55Q4NBy/kYAnoDlUtTCmbs4hBnJCrv+fg1z/9VcujJc7EOWIs/AHChn0NKHKZRKHG2IIBWYi/yLOilGXui3RmwSsirfPAhRn0oxPMMo0rz9xh7yrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791173212; c=relaxed/simple;
	bh=021d0bWTyxn0LzFISdZKY+7zLE26nrr3ZZj8RLWfN10=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mvNnq4zQVce/04BgH6uVOYlRYZazf5/QtumllQTZJNdADaVY6c5G60pAEtzhDkgBhqWf6l7V3ZW9Cwoc1BuwGkYlQtUqaf+vvh6A0b1WR2/rkhgN8mrELC8cHO6sTmhEc5Y5sNQuYnxpoDB5llEclYJp9GRKtCVfLKUOMALpuds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a9O3T2GX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a9O3T2GX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 038E91F000FF;
	Mon,  5 Oct 2026 04:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791173210;
	bh=5a1z+dOwv+r/MY/KE/ThXEWfdxYKTT3FKxuSELCMM+0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=a9O3T2GX/dHSB7mlE19iKQuX38s7E6cAwbsZfbPV2TclJ3eaa293oZnqj61PKfXpH
	 0sIUClyqetf4dcCk7ikj2ffUN6y0+T9cLS1daD0pox6bcQvzZIJlztin/vBYld3fqd
	 lh+XMvIKZPVuCn6UCS+Wjt0TecfMZ1qE2GCcXNdiVkaQ8HEt+XMUh0tkLQdxptnC6O
	 uBlY5oQL7S92DDSUja11wzYBhkQ4EeoXe3k5JNwkZLZNMcfqtPyYshGj5cWwfW6kq1
	 gpGzTEcf2fRerR3mitJcfXwAGCwZRa8D3M+Wn8f4QvrrfLvwv8fIhmiTV+9oyoMqoM
	 HK1ygVRlXetPQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] gpio: amdptpci: add support for AMD PT PCI controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Szuying Chen" <Chloe_Chen@asmedia.com.tw>
Cc: linux-gpio@vger.kernel.org
In-Reply-To: <20261005035410.18899-1-Chloe_Chen@asmedia.com.tw>
References: <20261005035410.18899-1-Chloe_Chen@asmedia.com.tw>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 05 Oct 2026 04:06:49 +0000
Message-Id: <20261005040650.038E91F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:
- [High] pm: shared IRQ handler accesses hardware registers while suspended
- [High] pm: missing synchronize_irq() in runtime_suspend for shared IRQ
- [High] gpio: incorrect macro usage unmasks all interrupts during system s=
uspend
- [High] devres: gpiochip remains active after IRQ vectors are freed
- [High] locking: pm_runtime_put_autosuspend called under raw_spinlock
- [High] pm: concurrent mask and unmask race leads to hardware access in D3
- [High] irq: masking drops PM hold causing unmask to fail for level IRQs
--

commit 91c25cdd13553e16d22acf9d04f5ee20824cbf4b
Author: Szuying Chen <Chloe_Chen@asmedia.com.tw>

gpio: amdptpci: add support for AMD PT PCI controller
   =20
This commit implements the new gpio-amdptpci driver to support the GPIO
functionality on AMD PT PCI platforms.

> diff --git a/drivers/gpio/gpio-amdptpci.c b/drivers/gpio/gpio-amdptpci.c
> new file mode 100644
> index 0000000000000..ac2a7b46c3cde
> --- /dev/null
> +++ b/drivers/gpio/gpio-amdptpci.c
> @@ -274,40 +274,38 @@ static bool pt27_irq_regs_accessible(struct pt27_gp=
io *chip)
[ ... ]
> +static void pt27_irq_take_pm_hold(struct pt27_gpio *chip)
> +{
> +	unsigned long flags;
> +	bool take =3D false;
> +
> +	raw_spin_lock_irqsave(&chip->lock, flags);
> +	if (!chip->irq_pm_held) {
> +		chip->irq_pm_held =3D true;
> +		take =3D true;
> +	}
> +	raw_spin_unlock_irqrestore(&chip->lock, flags);
> +
> +	if (take)
> +		pm_runtime_get_noresume(chip->dev);
                ^^^^

[Severity: High]
Does this non-resuming PM call race with the put on another CPU, allowing
execution to proceed while the device is in D3?

If CPU 1 executes pt27_irq_mask() and clears chip->irq_pm_held, then is
preempted before calling pm_runtime_put_autosuspend():

CPU 0 could execute pt27_irq_unmask(), set chip->irq_pm_held to true, and
call pm_runtime_get_noresume().=20

When CPU 1 resumes, it suspends the device. Then CPU 0 proceeds to perform
MMIO writes in pt27_irq_unmask() while the device is in D3.

[ ... ]
> +static void pt27_irq_mask(struct irq_data *d)
> +{
[ ... ]
> +	chip->enabled_irq_mask &=3D ~BIT(hwirq);
> +	if (!chip->enabled_irq_mask && chip->irq_pm_held) {
> +		chip->irq_pm_held =3D false;
> +		drop_pm =3D true;
> +	}
        ^^^^

[Severity: High]
Would dropping the PM hold here cause the unmask operation to fail for
level-triggered or threaded IRQs?

For a level-triggered IRQ, the core genirq subsystem calls irq_mask() before
handling and irq_unmask() after.=20

In pt27_irq_mask(), if it is the only enabled IRQ, enabled_irq_mask becomes
0, so the driver sets irq_pm_held =3D false and drops its PM reference.

> +
> +	raw_spin_unlock_irqrestore(&chip->lock, flags);
> +
> +	if (drop_pm)
> +		pt27_runtime_put_autosuspend(chip);
                ^^^^

[Severity: High]
Can calling this here cause a lockdep splat and system crash on PREEMPT_RT
kernels?=20

The genirq core invokes pt27_irq_mask() with the per-IRQ descriptor lock
(desc->lock) held, which is a raw_spinlock_t.=20

Calling pt27_runtime_put_autosuspend() acquires dev->power.lock, which is a
sleepable spinlock_t. Nesting a sleepable spinlock inside a raw spinlock
violates RT lock nesting rules.

> +}
> +
> +static void pt27_irq_unmask(struct irq_data *d)
> +{
[ ... ]
> +	if (!pt27_irq_regs_accessible(chip)) {
> +		dev_err_ratelimited(chip->dev,
> +				    "%s: cannot unmask GPIO%lu; PT27 is not in D0\n",
> +				     __func__, hwirq);
> +		return;
> +	}
        ^^^^

[Severity: High]
Following the irq_mask() check above, later, pt27_irq_unmask() checks
pt27_irq_regs_accessible(), which evaluates to false because irq_pm_held
is now false and irq_bus_active is not held by genirq during standard
handling.=20

Will this unmask abort and leave the IRQ permanently masked?

[ ... ]
> +static u32 pt27_pending_irqs_locked(struct pt27_gpio *chip)
> +{
> +	u32 stat =3D pt27_rd32(chip, PT27_REG_INT_STAT);
                   ^^^^

[Severity: High]
Can this register read fail if the device is runtime-suspended?

> +	u32 en   =3D pt27_rd32(chip, PT27_REG_INT_EN);
> +	u32 mask =3D pt27_rd32(chip, PT27_REG_INT_MASK);
> +
> +	return stat & en & ~mask & PT27_GPIO_MASK;
> +}
[ ... ]
> +static irqreturn_t pt27_gpio_isr(int irq, void *data)
> +{
> +	struct pt27_gpio *chip =3D data;
> +	unsigned long pending;
> +	unsigned long flags;
> +
> +	raw_spin_lock_irqsave(&chip->lock, flags);
> +	pending =3D pt27_pending_irqs_locked(chip);
                  ^^^^

[Severity: High]
Does this code access hardware registers unconditionally without ensuring t=
he
device is powered on?

Because the driver can fall back to a shared INTx interrupt in probe():

		chip->use_msi =3D false;
		irq_flags     =3D IRQF_SHARED;

another device sharing the INTx line could trigger this handler while this
device is in a runtime suspended state (D3hot). Accessing registers of a
suspended PCI device causes invalid reads or PCIe bus errors.

[ ... ]
> +static void pt27_gpio_remove(struct pci_dev *pdev)
> +{
[ ... ]
> +	device_init_wakeup(dev, false);
> +
> +	devm_free_irq(dev, chip->irq, chip);
> +	pci_free_irq_vectors(pdev);
> +	pci_clear_master(pdev);
> +
> +	mutex_unlock(&chip->irq_bus_lock);
        ^^^^

[Severity: High]
Can userspace operations concurrent with device removal access freed IRQ
vectors here?

probe() uses devm_gpiochip_add_data() to register the GPIO chip, which
defers unregistration until after pt27_gpio_remove() returns.=20

However, this manually frees the backend IRQ vectors via
pci_free_irq_vectors().=20

This creates a window where the GPIO chip is fully visible and usable by
userspace or gpiolib, but its backing IRQ resources have been destroyed,
potentially leading to use-after-free crashes or invalid hardware accesses.

[ ... ]
> +static int __maybe_unused pt27_gpio_suspend(struct device *dev)
> +{
[ ... ]
> +	raw_spin_lock_irqsave(&chip->lock, flags);
> +	pt27_save_regs(chip);
> +	pt27_wr32(chip, PT27_REG_INT_EN,    0);
> +	int_mask =3D PT27_REG_INT_MASK & ~chip->wake_mask;
> +	pt27_wr32(chip, PT27_REG_INT_MASK,  int_mask);
                                            ^^^^

[Severity: High]
Is an incorrect bitmask written to the hardware here, breaking the system
wake functionality?

PT27_REG_INT_MASK is a register offset (0x0020), not a bitmask of all GPIOs.

Since hardware interprets bit 0 as unmasked (based on unmask function logic=
),
writing 0x0020 & ~... clears bits 0-4 and 6-23, unmasking almost all GPIO
interrupts when the system sleeps, causing a severe interrupt storm.

[ ... ]
> +static int __maybe_unused pt27_gpio_runtime_suspend(struct device *dev)
> +{
[ ... ]
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
        ^^^^

[Severity: High]
Should synchronize_irq(chip->irq) be called outside the spinlock here?

During runtime suspend, the hardware is configured for suspend here, but it
returns and allows the PM core to power off the device (e.g., to D3) without
waiting for concurrent irq handlers to finish.=20

Because it lacks synchronize_irq(), a concurrently executing pt27_gpio_isr
on another CPU will continue to access the device's MMIO registers after
power is removed.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261005035410.1889=
9-1-Chloe_Chen@asmedia.com.tw?part=3D1
