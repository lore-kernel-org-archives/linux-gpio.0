Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794818575;
	b=3Igfmrby6EJv+gVebnMj4pGJBpcQ8nLMQKpqf4jVTZlwfPkpNksLT3rCvfvg5GH4Whyc
	 +x7YVo+a+ZZ6Z8OzYf2DiBEcUWAXy5qu0NmG9jcPyFaudX9ymibZWtQSpKFX5RfJGhlkf
	 fG88V+CzBzbBPKcvVDfgaz5CAwZaXt4b82lwCk1ofqMMSzvICTpRTeen9GfW7SDuRzn+L
	 Ucin8c9mTTbk4Byf6ruh3KQ3Z8yb5h4nKcTe1LbRWxO978wbYPjIjlO2BUgKI2dyE2vhI
	 U+hw5A/3rxFLi0oVLmHUEzR7+ylSIIZ4+Q8YNAz9LqEZ6aT/O8cXRLMJVEa7jigXLKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794818575;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=MI2wa5tIRxNuAKlHwQZvP5i3Pz2FmBeOINblj22hSo8=;
	b=MwttaHqIPuVYUBKfZpfuFoK6Pg/wClWRc06rODf8t322DZiOf7jFBNzD3qEm7yVj33Pn
	 J7g2tSAKSiepdGrR/EXGU3Ck0y0kny6woHbjzB5TPfIRtyZIGVGVbn8wLToaRZH+d5+nf
	 C+peWX3bthvT9pdi26GgHtPhoIkmxogEq4fH/uc0lENRoMhEiLafLHcBPIAlh2OhBfO/x
	 2wxd08ErJYQwhkVQPo6WP1iQSdMCVx8t7qmLZ/DYHxqYhbgSBk4sieUqFbZx/uAaHbxX9
	 W75PJN5YQ18HxuHpWsbDOGp5bdkhW7Xau/XJnfWpXOjFspNaXaV5rkxY2hIjZ6S9HDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V5mLsuJa;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1854C606A331
	for <linux-gpio@vger.kernel.org>; Mon, 16 Nov 2026 08:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V5mLsuJa
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E1091F000C4;
	Mon, 16 Nov 2026 08:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794818574;
	bh=MI2wa5tIRxNuAKlHwQZvP5i3Pz2FmBeOINblj22hSo8=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=V5mLsuJavvH10wXTgIJZ/gfCyANQP9kWpHfI7fVduPhtffLr6izEsB2bFalFKSGe9
	 +Dr3gJpCTbjQ601D7L1cEJ5A/WGbxDQ2UGjNrkWODUHRGVyhMHtOnpFYH166aSKsB7
	 nbTXskeNCsz3vZBvedti31So/kE8wd6Jm5uaQdNITfrBCTjfFp+/1Waes7XnR+xarE
	 9kPB9tYvG56gzEkYMVf30LDrGuGMxe6d7G8ysgwL1Tkts0jE4S6gsKdDSeiLGWvsZK
	 7/FlSZb761YjwFoD8enVy3rTZydh7HF1FZc1qPFV5K6xX/ULwR1rzs8BD+8uNFU0HQ
	 yw5TAtornFJ+Q==
Message-ID: <sashiko-outbox-216556@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4] gpio: amdptpci: add support for AMD PT PCI
 controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Szuying Chen" <Chloe_Chen@asmedia.com.tw>, linux-gpio@vger.kernel.org
In-Reply-To: <20261116075510.5722-1-Chloe_Chen@asmedia.com.tw>
References: <20261116075510.5722-1-Chloe_Chen@asmedia.com.tw>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 08:42:54 +0000
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 6 potential
issues to consider:
- [High] gpio: amdptpci: devres order in pt27_gpio_probe() frees
  irq_domain early
- [High] gpio: amdptpci: MMIO access while suspended and clobber in
  pt27_restore_regs()
- [High] gpio: amdptpci: runtime PM calls in pt27_gpio_isr() break IRQs
  and lockdep
- [Medium] gpio: amdptpci: sleep ops in pt27_gpio_pm_ops race noirq wake
  IRQ handling
- [Medium] gpio: amdptpci: unmasked wake_status and skipped wake disable
  on suspend
- [Medium] gpio: amdptpci: duplicate wake IRQ dispatch in
  pt27_gpio_resume()
--

commit afe67f7f6f93220edaeaabd38709a16694605523
Author: Szuying Chen <Chloe_Chen@asmedia.com.tw>

gpio: amdptpci: add support for AMD PT PCI controller

This commit adds a PCI GPIO and interrupt controller driver for AMD
Promontory (PT27) platforms, including runtime PM and system wakeup support.

> diff --git a/drivers/gpio/gpio-amdptpci.c b/drivers/gpio/gpio-amdptpci.c
> new file mode 100644
> index 0000000000000..d676fd8c0b1c7
> --- /dev/null
> +++ b/drivers/gpio/gpio-amdptpci.c
[ ... ]
> +static void pt27_restore_regs(struct pt27_gpio *chip)
> +{
> +	iowrite32(chip->saved.out,       chip->base + PT27_REG_OUT);
> +	iowrite32(chip->saved.dir,       chip->base + PT27_REG_DIR);
> +
> +	iowrite32(chip->saved.int_lvl,   chip->base + PT27_REG_INT_LVL);
> +	iowrite32(chip->saved.int_mode0, chip->base + PT27_REG_INT_MODE0);
> +	iowrite16(chip->saved.int_mode1, chip->base + PT27_REG_INT_MODE1);
> +	iowrite8(chip->saved.int_ctl,    chip->base + PT27_REG_INT_CTL);
> +
> +	iowrite16(chip->saved.wake_lvl,  chip->base + PT27_REG_WAKE_LVL);
> +	iowrite16(chip->saved.wake_mode, chip->base + PT27_REG_WAKE_MODE);
> +	iowrite16(chip->saved.wake_en,   chip->base + PT27_REG_WAKE_EN);
> +
> +	iowrite32(chip->saved.int_en,   chip->base + PT27_REG_INT_EN);
> +	iowrite32(chip->saved.int_mask, chip->base + PT27_REG_INT_MASK);
> +}
[ ... ]
> +static int pt27_irq_reqres(struct irq_data *d)
> +{
> +	struct gpio_chip *gc   =3D irq_data_get_irq_chip_data(d);
> +	int   ret;
> +
> +	ret =3D pm_runtime_resume_and_get(gc->parent);
> +	if (ret < 0) {
> +		dev_err(gc->parent, "%s: Fail to resume controller for IRQ: %d\n",  __=
func__, ret);
> +		return ret;
> +	}
> +
> +	ret =3D gpiochip_reqres_irq(gc, irqd_to_hwirq(d));
> +	if (ret) {
> +		pm_runtime_put_autosuspend(gc->parent);
> +		return ret;
> +	}
> +	return 0;
> +}
[ ... ]
> +static int pt27_irq_set_type(struct irq_data *d, unsigned int type)
> +{
[ ... ]
> +	scoped_guard(raw_spinlock_irqsave, &chip->gen.lock) {
> +		lvl_reg =3D ioread32(chip->base + PT27_REG_INT_LVL);
> +		if (lvl_bit)
> +			lvl_reg |=3D BIT(hwirq);
> +		else
> +			lvl_reg &=3D ~BIT(hwirq);
> +
> +		iowrite32(lvl_reg, chip->base + PT27_REG_INT_LVL);
> +
> +		if (hwirq < 16) {
> +			u32 reg =3D ioread32(chip->base + PT27_REG_INT_MODE0);
> +
> +			shift  =3D hwirq * 2;
> +			reg   &=3D ~(PT27_INT_MODE_MASK << shift);
> +			reg   |=3D ((u32)mode_val << shift);
> +			iowrite32(reg, chip->base + PT27_REG_INT_MODE0);
> +		} else {
> +			u16 reg =3D ioread16(chip->base + PT27_REG_INT_MODE1);
> +
> +			shift  =3D (hwirq - 16) * 2;
> +			reg   &=3D ~((u16)(PT27_INT_MODE_MASK << shift));
> +			reg   |=3D (u16)((u16)mode_val << shift);
> +			iowrite16(reg, chip->base + PT27_REG_INT_MODE1);
> +		}
> +
> +		iowrite32(BIT(hwirq), chip->base + PT27_REG_INT_STAT);
> +
> +	}
[ ... ]
> +static int pt27_irq_set_wake(struct irq_data *d, unsigned int on)
> +{
[ ... ]
> +	guard(raw_spinlock_irqsave)(&chip->gen.lock);
> +
> +	wake_en   =3D ioread16(chip->base + PT27_REG_WAKE_EN);
> +	wake_lvl  =3D ioread16(chip->base + PT27_REG_WAKE_LVL);
> +	wake_mode =3D ioread16(chip->base + PT27_REG_WAKE_MODE);

[Severity: High]
Can GPIO IRQ setup access MMIO while the PCI device is in D3 and then have
pt27_restore_regs() overwrite the configuration on resume?

Runtime PM references are only taken in pt27_gpio_request() and
pt27_irq_reqres().  Standard IRQ mapping paths such as
acpi_dev_gpio_irq_wake_get_by() configure input direction via
gpiod_direction_input_nonotify() -> gpio_mmio_dir_in() and trigger type via
irq_set_irq_type() -> pt27_irq_set_type() before request_irq() is called and
without calling gpiod_request().

If the controller has already runtime-suspended after probe, those MMIO
reads and writes happen while the device is in D3hot/D3cold and do not
update chip->saved.  When request_threaded_irq() then calls
pt27_irq_reqres(), pm_runtime_resume_and_get() runs pt27_restore_regs(),
clobbering PT27_REG_DIR, PT27_REG_INT_LVL, PT27_REG_INT_MODE0/1, and
PT27_REG_WAKE_* with the pre-suspend values in chip->saved.  Right after
that, gpiochip_reqres_irq() -> gpiochip_lock_as_irq() reads PT27_REG_DIR
from hardware via gpio_mmio_get_dir() and fails with -EIO if the pin was
previously an output, or leaves the interrupt trigger unconfigured.

Also, if irq_set_irq_type() is called after enable_irq_wake(),
pt27_irq_set_type() does not update PT27_REG_WAKE_LVL or PT27_REG_WAKE_MODE.

[ ... ]

> +static irqreturn_t pt27_gpio_isr(int irq, void *data)
> +{
> +	struct pt27_gpio *chip =3D data;
> +	irqreturn_t ret =3D IRQ_NONE;
> +	unsigned long pending;
> +
> +	if (pm_runtime_get_if_in_use(chip->dev) <=3D 0)
> +		return IRQ_NONE;
[ ... ]
> +	pm_runtime_put(chip->dev);
> +	return ret;
> +}

[Severity: High]
Does calling pm_runtime_get_if_in_use() and pm_runtime_put() in
pt27_gpio_isr() break interrupt handling when CONFIG_PM is disabled and take
a sleeping spinlock in hardirq context?

GPIO_AMDPTPCI does not depend on PM, and when CONFIG_PM=3Dn,
pm_runtime_get_if_in_use() returns -EINVAL, causing pt27_gpio_isr() to
return IRQ_NONE on every interrupt.  Even with CONFIG_PM=3Dy,
pm_runtime_get_if_in_use() returns 0 while runtime_status is still
RPM_RESUMING (after pt27_restore_regs() unmasks interrupts in
pt27_gpio_runtime_resume()) and returns -EINVAL during early system resume
before runtime PM is re-enabled.

In addition, pt27_gpio_isr() is requested with IRQF_NO_THREAD, so calling
pm_runtime_get_if_in_use() and pm_runtime_put() acquires dev->power.lock (a
non-raw spinlock_t) from hardirq context, triggering lockdep invalid wait
context warnings under CONFIG_PROVE_RAW_LOCK_NESTING and sleeping in atomic
context on PREEMPT_RT.

> +static void pt27_hw_clear(void *data)
> +{
> +	struct pt27_gpio *chip =3D data;
> +
> +	iowrite32(0, chip->base + PT27_REG_INT_EN);
> +	iowrite32(PT27_GPIO_MASK, chip->base + PT27_REG_INT_MASK);
> +	iowrite32(PT27_GPIO_MASK, chip->base + PT27_REG_INT_STAT);
> +	iowrite16(0, chip->base + PT27_REG_WAKE_EN);
> +	iowrite16(PT27_WAKE_MASK, chip->base + PT27_REG_WAKE_STAT);
> +}
[ ... ]
> +static int pt27_gpio_probe(struct pci_dev *pdev, const struct pci_device=
_id *id)
> +{
[ ... ]
> +	ret =3D devm_request_irq(dev, chip->irq, pt27_gpio_isr,
> +			       irq_flags | IRQF_NO_THREAD, dev_name(dev), chip);
> +	if (ret) {
> +		dev_err_probe(dev, ret, "failed to request IRQ %d\n", chip->irq);
> +		goto err_pm_disable;
> +	}
> +
> +	ret =3D devm_add_action_or_reset(dev, pt27_hw_clear, chip);
> +	if (ret)
> +		goto err_pm_disable;
> +
> +	ret =3D devm_gpiochip_add_data(dev, gc, chip);

[Severity: High]
Does this devres registration order in pt27_gpio_probe() cause a
use-after-free of chip->gen.gc.irq.domain in pt27_gpio_isr() during unbind?

Because devm_request_irq() and pt27_hw_clear() are registered before
devm_gpiochip_add_data(), devres teardown runs in reverse order when the
driver is unbound:

CPU0                                  CPU1
pci_device_remove()
  pt27_gpio_remove()
    pm_runtime_forbid(dev)
      pt27_restore_regs()
  devres_release_all()
    gpiochip_remove()
      irq_domain_remove(gc->irq.domain)
                                      <hardirq>
                                      pt27_gpio_isr()
                                        generic_handle_domain_irq(
                                          chip->gen.gc.irq.domain, hwirq)
                                          <-- use-after-free
    pt27_hw_clear()
    devm_irq_release()

During probe, chip->gen.gc.irq.domain is also still NULL between
devm_request_irq() and devm_gpiochip_add_data().  In addition,
pt27_hw_clear() modifies PT27_REG_INT_EN, PT27_REG_INT_MASK, and
PT27_REG_INT_STAT without holding chip->gen.lock while pt27_gpio_isr() is
still active, and pt27_gpio_isr() does not mask pending with PT27_GPIO_MASK.

Registering devm_gpiochip_add_data() before pt27_hw_clear() and
devm_request_irq() ensures the IRQ handler is freed first on teardown.

[ ... ]

> +static int __maybe_unused pt27_gpio_suspend(struct device *dev)
> +{
> +	struct pt27_gpio *chip =3D dev_get_drvdata(dev);
> +
> +	if (pm_runtime_status_suspended(dev)) {
> +		dev_dbg(dev, "%s: already runtime-suspended, skipping save\n", __func_=
_);
> +		return 0;
> +	}
> +
> +	scoped_guard(raw_spinlock_irqsave, &chip->gen.lock) {
> +		pt27_save_regs(chip);
> +		iowrite32(0, chip->base + PT27_REG_INT_EN);
> +		iowrite32(PT27_GPIO_MASK, chip->base + PT27_REG_INT_MASK);
> +		iowrite32(PT27_GPIO_MASK, chip->base + PT27_REG_INT_STAT);
> +
> +	if (!device_may_wakeup(dev))
> +		iowrite16(0, chip->base + PT27_REG_WAKE_EN);
> +
> +		iowrite16(PT27_WAKE_MASK, chip->base + PT27_REG_WAKE_STAT);
> +	}
> +
> +	synchronize_irq(chip->irq);
> +	return 0;
> +}
> +
> +static int __maybe_unused pt27_gpio_resume(struct device *dev)
> +{
> +	struct pt27_gpio *chip =3D dev_get_drvdata(dev);
> +	unsigned long replay;
> +	unsigned int hwirq;
> +	u16 wake_status;
> +
> +	if (pm_runtime_status_suspended(dev))
> +		return 0;
> +
> +	scoped_guard(raw_spinlock_irqsave, &chip->gen.lock) {
> +		wake_status =3D ioread16(chip->base + PT27_REG_WAKE_STAT) & PT27_WAKE_=
MASK;
> +		iowrite16(wake_status, chip->base + PT27_REG_WAKE_STAT);
> +		pt27_restore_regs(chip);
> +
> +		replay =3D wake_status &
> +			 ioread32(chip->base + PT27_REG_INT_EN) &
> +			 ~ioread32(chip->base + PT27_REG_INT_MASK);
> +	}
> +
> +	if (!wake_status)
> +		return 0;
> +
> +	pm_wakeup_event(dev, 0);

[Severity: Medium]
Should wake_status in pt27_gpio_resume() be masked with chip->wake_mask, and
what happens in pt27_gpio_suspend() if wakeup was disabled after the device
entered runtime suspend?

In pt27_gpio_resume() (which is also called by pt27_gpio_runtime_resume()),
wake_status is only masked with PT27_WAKE_MASK, so any latched status bits
on pins 0..11 that do not have wakeup enabled in chip->wake_mask will still
report pm_wakeup_event() and replay interrupts.

In pt27_gpio_suspend(), if the device entered runtime suspend with
PT27_REG_WAKE_EN enabled and wakeup was then disabled via sysfs before
system suspend, returning early when pm_runtime_status_suspended(dev) is
true skips clearing PT27_REG_WAKE_EN, leaving hardware wakeup active during
system sleep.

> +
> +	for_each_set_bit(hwirq, &replay, PT27_WAKE_GPIOS)
> +		generic_handle_domain_irq_safe(chip->gen.gc.irq.domain, hwirq);

[Severity: Medium]
Can pt27_gpio_resume() dispatch the same wake interrupt twice?

Inside the lock scope above, pt27_restore_regs() writes PT27_REG_INT_EN and
PT27_REG_INT_MASK without clearing PT27_REG_INT_STAT, and then computes
replay.  As soon as the scoped_guard releases chip->gen.lock and restores
local interrupts, an asserted level-triggered wake line or a latched bit in
PT27_REG_INT_STAT can fire chip->irq and run pt27_gpio_isr() ->
generic_handle_domain_irq().  When pt27_gpio_isr() returns, this loop still
iterates over the pre-computed replay bitmap and calls
generic_handle_domain_irq_safe() a second time for the same hwirq, which
invokes handle_irq_event() again even if the interrupt was already serviced
and masked.

[ ... ]

> +static const struct dev_pm_ops pt27_gpio_pm_ops __maybe_unused =3D {
> +	SYSTEM_SLEEP_PM_OPS(pt27_gpio_suspend, pt27_gpio_resume)
> +	RUNTIME_PM_OPS(pt27_gpio_runtime_suspend, pt27_gpio_runtime_resume, NUL=
L)
> +};

[Severity: Medium]
Should pt27_gpio_suspend() and pt27_gpio_resume() be wired as noirq sleep
callbacks instead of SYSTEM_SLEEP_PM_OPS()?

With SYSTEM_SLEEP_PM_OPS(), pt27_gpio_suspend() saves PT27_REG_WAKE_EN and
masks interrupts during dpm_suspend(), before dpm_suspend_noirq() runs
device_wakeup_arm_wake_irqs() and suspend_device_irqs().  On resume,
dpm_resume_noirq() runs device_wakeup_disarm_wake_irqs() (calling
pt27_irq_set_wake(d, 0)) before pt27_gpio_resume() runs in dpm_resume(), so
pt27_restore_regs() overwrites PT27_REG_WAKE_EN with chip->saved.wake_en and
clobbers any GPIO or wake state updated during the late/noirq/early phases.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116075510.5722=
-1-Chloe_Chen@asmedia.com.tw?part=3D1
