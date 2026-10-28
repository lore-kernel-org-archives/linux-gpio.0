Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793178406;
	b=GnZn75FmhovnIZCf0DySqlZUMD66G1nrcjn04cFjKikBpGxqZL3MYCoC99KvZuncyhXu
	 CTwzsOTXilJdx+AE9givBt6BVOeEgcspKIGD9olYhWyu+nS8hg4TiBPygaoE3ncb0eO2k
	 1wAjSYDtP2bXDOB9cSa7ip5RQKCPHwA09eCLIUdm/Jsmyt3BQqLYL4rPUjt32vJPwLe+P
	 0Mee64EWBNqhWolUbV4EekPkXMHZ3W+QFZdNcPMio+9ym2mcWuE1mKPprFvfPVrsEhK5P
	 I557Lpfj2s/KTbMGr99FqutRYATatjlmGXkiICtDfU+LlsMi2MquCjusBk1S9GYQZHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793178406;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=BDCJFdJZcnQEMHXJS0m8pZ0oJlwSfEfJ/dPNIsgN730=;
	b=IukhvaZeLBaOFvT5JXvrR6uafC2B6X2nhn2FRozL6Qj0HYR5+i0RgAzuCbkEGPlTXhwJ
	 T/BqUjpB5lua2o7u7elQpncSZFSORydixC2bDp5dJXxoGy89rkT8cn4cEWO3jSe5NMqWK
	 MolNwp/8p0etKRxRFoyZYDQSr0FJmxy2VU9Aq9lu7cWN2s8sk2lBbuejfB0pmZjvxJ7V5
	 SE1VWxYLb4N+OAkdwGMLJ4gvT+4+HUpUyl4ujJ1yPAG4RxuRgm6ITKa0qAltabfXtFVUk
	 4vB5TQjpLaKffGqPHzu1SjWk7EtrhjwbC/W1gAnfPpO4Abqz3e7LCunYPUfoiTSgUCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O+8dNVOa;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36893606A31A
	for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 09:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O+8dNVOa
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A87981F01825;
	Wed, 28 Oct 2026 09:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793178405;
	bh=BDCJFdJZcnQEMHXJS0m8pZ0oJlwSfEfJ/dPNIsgN730=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=O+8dNVOaBZA1SXGD2rPGFxJ6pPAmOgGPaluP4srtuQ6ulEU3B1vZQFrY6QEMwHw1y
	 zGfbxtNT1ebSc14K8bUrQjZSsWMaOgOHf47bFGPsVJ7VX0wsOQX8SHuH7bNJd4cU8Q
	 7so/ECzjmILiVmRjLkW1XoJADlvu0gF8zaRNAeTrt1C65r0s+8sFEFQKAwOrOXlMtL
	 JZvkPB9Rre+dm5mTEdQjX6ipOK6F8Syo8Qv79SBUVzEPoMmsMIje2tPyo2MF8y8uns
	 gdm0X8izfYGKcgNKQIf0jw8lqNCX3En6wu3JWGOEXng3dSXDhUtnEFIId5zsi3Hpze
	 PebAhEJfRAxdw==
Message-ID: <sashiko-outbox-187649@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] gpio: amdptpci: add support for AMD PT PCI
 controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Szuying Chen" <Chloe_Chen@asmedia.com.tw>, linux-gpio@vger.kernel.org
In-Reply-To: <20261028084531.6237-1-Chloe_Chen@asmedia.com.tw>
References: <20261028084531.6237-1-Chloe_Chen@asmedia.com.tw>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 28 Oct 2026 09:06:45 +0000
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 9 potential issue(=
s) to consider:
- [High] gpio: amdptpci: missing runtime PM reference in pt27_irq_reqres()
- [High] gpio: amdptpci: MMIO access while runtime-suspended in pt27_gpio_i=
sr()
- [High] gpio: amdptpci: pt27_irq_set_wake() accesses MMIO while runtime-su=
spended
- [Medium] gpio: amdptpci: invalid break and unlocked wake_mask in runtime =
suspend
- [Medium] gpio: amdptpci: fix devres ordering and PM cleanup in pt27_gpio_=
probe()
- [Medium] gpio: amdptpci: race on DIR and OUT registers due to wrong lock =
in PM callbacks
- [Medium] gpio: amdptpci: missing wake IRQ dispatch in pt27_gpio_resume() =
and wake_en gate
- [Low] gpio: amdptpci: missing space in struct pt27_gpio gen member declar=
ation
- [Low] gpio: amdptpci: missing select GPIO_GENERIC and GPIOLIB_IRQCHIP in =
Kconfig
--

commit aad2d02577183448f2ddceeabe365624f8d6d152
Author: Szuying Chen <Chloe_Chen@asmedia.com.tw>

gpio: amdptpci: add support for AMD PT PCI controller

This commit adds the gpio-amdptpci driver to support the GPIO controller,
interrupt handling, and wakeup capabilities on AMD Promontory PCI
platforms.

> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index 55e4280029d86..bcfb653a09804 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -1890,6 +1890,12 @@ config GPIO_TC9563
>  menu "PCI GPIO expanders"
>  	depends on PCI
> =20
> +config GPIO_AMDPTPCI
> +	tristate "AMD Promontory PCI GPIO support"
> +	depends on X86
> +	help
> +	  Driver for Promontory IOHub PCI GPIO functionality.

[Severity: Low]
Should config GPIO_AMDPTPCI select GPIO_GENERIC and GPIOLIB_IRQCHIP?

In drivers/gpio/gpio-amdptpci.c, pt27_gpio_probe() unconditionally calls
gpio_generic_chip_init() (which requires CONFIG_GPIO_GENERIC) and sets up
gc->irq via gpio_irq_chip_set_chip() while the IRQ callbacks use
gpiochip_reqres_irq(), gpiochip_relres_irq(), gpiochip_enable_irq(), and
gpiochip_disable_irq() (which require CONFIG_GPIOLIB_IRQCHIP). Without
selecting those symbols, builds where no other enabled driver selects them
will fail at compile or link time.

> diff --git a/drivers/gpio/gpio-amdptpci.c b/drivers/gpio/gpio-amdptpci.c
> new file mode 100644
> index 0000000000000..171c6811a33e1
> --- /dev/null
> +++ b/drivers/gpio/gpio-amdptpci.c

[ ... ]

> +struct pt27_gpio {
> +struct device                     *dev;
> +struct gpio_generic_chipgen;
> +	void __iomem              *base;
> +	struct pt27_saved_regs	  saved;
> +	raw_spinlock_t            lock;
> +	u16                       wake_mask;
> +	bool                      use_msi;
> +	int                       irq;
> +};

[Severity: Low]
There is a missing space between struct gpio_generic_chip and gen in
struct pt27_gpio, which causes compilation to fail when pt27_gpio_isr()
and pt27_gpio_probe() reference chip->gen.

> +
> +static void pt27_save_regs(struct pt27_gpio *chip)
> +{
> +	chip->saved.dir       =3D ioread32(chip->base + PT27_REG_DIR);
> +	chip->saved.out       =3D ioread32(chip->base + PT27_REG_OUT);

[ ... ]

> +static void pt27_restore_regs(struct pt27_gpio *chip)
> +{
> +	iowrite32(chip->saved.dir,       chip->base + PT27_REG_DIR);
> +	iowrite32(chip->saved.out,       chip->base + PT27_REG_OUT);

[Severity: Medium]
Can saving and restoring PT27_REG_DIR and PT27_REG_OUT under chip->lock
race with gpio-mmio operations and desynchronize the shadow registers?

In pt27_gpio_probe(), gpio_generic_chip_init() configures gpio-mmio to
manage PT27_REG_OUT and PT27_REG_DIR using chip->gen.lock as well as the
shadow state in chip->gen.sdata and chip->gen.sdir. However,
pt27_gpio_suspend(), pt27_gpio_runtime_suspend(), and pt27_gpio_resume()
call pt27_save_regs() and pt27_restore_regs() while holding only
chip->lock instead of chip->gen.lock (via gpio_generic_lock_irqsave()).

Because gc->can_sleep is false and the system sleep callbacks run during
the normal suspend/resume phase, concurrent atomic GPIO consumers calling
gpiod_set_value() or gpiod_direction_output() are not serialized against
pt27_save_regs() and pt27_restore_regs(), which can overwrite register
updates on resume and leave the hardware out of sync with chip->gen.sdata
and chip->gen.sdir.

[ ... ]

> +static int pt27_irq_reqres(struct irq_data *d)
> +{
> +	struct gpio_chip *gc   =3D irq_data_get_irq_chip_data(d);
> +	irq_hw_number_t   hwirq =3D irqd_to_hwirq(d);
> +	int ret;
> +
> +	ret =3D gpiochip_reqres_irq(gc, hwirq);
> +	return ret;
> +}
> +
> +static void pt27_irq_relres(struct irq_data *d)
> +{
> +	struct gpio_chip *gc   =3D irq_data_get_irq_chip_data(d);
> +	irq_hw_number_t   hwirq =3D irqd_to_hwirq(d);
> +
> +	gpiochip_relres_irq(gc, hwirq);
> +}

[Severity: High]
Should pt27_irq_reqres() and pt27_irq_relres() also manage runtime PM
references for the device?

Currently, pm_runtime_resume_and_get() and pm_runtime_put_autosuspend()
are only called in pt27_gpio_request() and pt27_gpio_free(). When a
consumer requests a GPIO interrupt directly through the irq_domain (for
example via request_irq() or ACPI GpioInt) without calling gpiod_request(),
gpiochip_reqres_irq() does not invoke gc->request().

If the controller has already runtime-suspended into PCI D3hot after the
2000 ms autosuspend delay, gpiochip_reqres_irq() -> gpiochip_lock_as_irq()
reads PT27_REG_DIR while in D3, gets 0xffffffff, treats the pin as an
output, and fails with -EIO. Furthermore, even if the device is in D0 when
the interrupt is requested, nothing holds a runtime PM reference, so the
device will autosuspend after 2000 ms and pt27_gpio_runtime_suspend() will
clear PT27_REG_INT_EN and mask all interrupts in PT27_REG_INT_MASK while
the IRQ is active.

[ ... ]

> +static int pt27_irq_set_wake(struct irq_data *d, unsigned int on)
> +{
> +	struct gpio_chip  *gc   =3D irq_data_get_irq_chip_data(d);
> +	struct pt27_gpio  *chip =3D gpiochip_get_data(gc);
> +	irq_hw_number_t   hwirq =3D irqd_to_hwirq(d);
> +	unsigned int      trig  =3D irqd_get_trigger_type(d);
> +	u16               wake_en, wake_lvl, wake_mode;
> +
> +	if (hwirq >=3D PT27_WAKE_GPIOS) {
> +		dev_dbg(chip->dev, "%s: GPIO%lu does not support wake (max GPIO%u)\n",=
 __func__, hwirq, PT27_WAKE_GPIOS - 1);
> +		return -EINVAL;
> +	}
> +
> +	if (on && trig =3D=3D IRQ_TYPE_NONE)
> +		return -EINVAL;
> +
> +	guard(raw_spinlock_irqsave)(&chip->lock);
> +
> +	wake_en   =3D ioread16(chip->base + PT27_REG_WAKE_EN);
> +	wake_lvl  =3D ioread16(chip->base + PT27_REG_WAKE_LVL);
> +	wake_mode =3D ioread16(chip->base + PT27_REG_WAKE_MODE);

[Severity: High]
What happens when pt27_irq_set_wake() is called while the controller is
runtime-suspended, or when the device later resumes?

When a consumer calls enable_irq_wake() during system suspend (or
disable_irq_wake() during system resume) while the GPIO controller is
runtime-suspended in PCI D3, pt27_irq_set_wake() performs ioread16() and
iowrite16() directly on PT27_REG_WAKE_EN, PT27_REG_WAKE_LVL, and
PT27_REG_WAKE_MODE without ensuring the PCI device is in D0 and without
updating chip->saved.wake_en, chip->saved.wake_lvl, and
chip->saved.wake_mode.

In addition to the MMIO accesses failing in D3, when pt27_gpio_resume() or
pt27_gpio_runtime_resume() subsequently calls pt27_restore_regs(), it
writes the stale chip->saved.wake_* values back to the hardware registers,
overwriting any wake configuration changes made after pt27_save_regs().

[ ... ]

> +static irqreturn_t pt27_gpio_isr(int irq, void *data)
> +{
> +	struct pt27_gpio *chip =3D data;
> +	unsigned long pending;
> +	u32 stat, en, mask;
> +
> +	scoped_guard(raw_spinlock_irqsave, &chip->lock) {
> +
> +	  stat =3D ioread32(chip->base + PT27_REG_INT_STAT);
> +	  en   =3D ioread32(chip->base + PT27_REG_INT_EN);
> +	  mask =3D ioread32(chip->base + PT27_REG_INT_MASK);
> +
> +	  pending =3D  stat & en & ~mask & PT27_GPIO_MASK;
> +	}

[Severity: High]
When MSI/MSI-X is not used, pt27_gpio_probe() requests the interrupt with
IRQF_SHARED. If the PT27 controller is runtime-suspended in PCI D3 and
another device on the shared INTx line asserts an interrupt, won't
pt27_gpio_isr() read BAR0 MMIO registers while the device is powered down?

Should pt27_gpio_isr() check whether the device is runtime-active (for
example with pm_runtime_get_if_active()) before accessing hardware
registers?

[ ... ]

> +static int pt27_gpio_probe(struct pci_dev *pdev, const struct pci_device=
_id *id)
> +{

[ ... ]

> +	pt27_hw_init(chip);
> +
> +	ret =3D devm_add_action_or_reset(dev, pt27_hw_clear, chip);
> +	if (ret)
> +		return ret;

[ ... ]

> +	pm_runtime_set_autosuspend_delay(dev, PT27_AUTOSUSPEND_DELAY_MS);
> +	pm_runtime_use_autosuspend(dev);
> +
> +	ret =3D devm_gpiochip_add_data(dev, gc, chip);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to register GPIO chip\n");
> +
> +	ret =3D devm_request_irq(dev, chip->irq, pt27_gpio_isr,
> +			       irq_flags | IRQF_NO_THREAD, dev_name(dev), chip);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to request IRQ %d\n", chip->irq=
);

[Severity: Medium]
Is the devres registration order and runtime PM error cleanup in
pt27_gpio_probe() safe during probe and unbind?

First, devm_gpiochip_add_data() registers the GPIO chip and IRQ domain
before devm_request_irq() installs pt27_gpio_isr(). Consumers (including
acpi_gpiochip_request_interrupts() inside gpiochip_add_irqchip()) can
request and unmask GPIO interrupts before the parent IRQ handler is
registered. On driver unbind, reverse devres ordering frees chip->irq
before removing the gpiochip and before running pt27_hw_clear(), leaving a
window where hardware interrupts remain unmasked after the IRQ handler has
been removed.

Second, if devm_gpiochip_add_data() or devm_request_irq() fails after
pm_runtime_use_autosuspend(dev), pt27_gpio_probe() returns without calling
pm_runtime_dont_use_autosuspend(dev), leaving use_autosuspend enabled on
the PCI device.

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
> +	scoped_guard(raw_spinlock_irqsave, &chip->lock) {
> +	  pt27_save_regs(chip);
> +	  iowrite32(0, chip->base + PT27_REG_INT_EN);
> +	  iowrite32(PT27_GPIO_MASK, chip->base + PT27_REG_INT_MASK);
> +	  iowrite32(PT27_GPIO_MASK, chip->base + PT27_REG_INT_STAT);
> +	  iowrite16(PT27_WAKE_MASK, chip->base + PT27_REG_WAKE_STAT);
> +	}
> +
> +	synchronize_irq(chip->irq);
> +	return 0;
> +}
> +
> +static int __maybe_unused pt27_gpio_resume(struct device *dev)
> +{
> +	struct pt27_gpio *chip =3D dev_get_drvdata(dev);
> +	u16 wake_status;
> +
> +	if (pm_runtime_status_suspended(dev))
> +		return 0;
> +
> +	scoped_guard(raw_spinlock_irqsave, &chip->lock) {
> +	  wake_status =3D ioread16(chip->base + PT27_REG_WAKE_STAT) & PT27_WAKE=
_MASK;
> +	  iowrite16(wake_status, chip->base + PT27_REG_WAKE_STAT);
> +	  pt27_restore_regs(chip);
> +	}
> +
> +	if (wake_status)
> +		pm_wakeup_event(dev, 0);
> +
> +	return 0;
> +}

[Severity: Medium]
When a wake-enabled GPIO interrupt fires while the controller is suspended,
how does the consumer's interrupt handler get invoked on resume?

In pt27_gpio_suspend() and pt27_gpio_runtime_suspend(), PT27_REG_INT_EN is
cleared to 0 and PT27_REG_INT_MASK is set to PT27_GPIO_MASK, so wake events
occurring during suspend are only latched in PT27_REG_WAKE_STAT. In
pt27_gpio_resume(), wake_status is read and cleared from
PT27_REG_WAKE_STAT, and pm_wakeup_event(dev, 0) is called, but
generic_handle_domain_irq() is never called for the set bits in
wake_status, so edge-triggered wakeup interrupts are dropped.

Also, in pt27_gpio_suspend(), if !device_may_wakeup(dev) (for example when
wakeup is disabled via sysfs), PT27_REG_WAKE_EN is left enabled in hardware
rather than being cleared before entering system sleep.

> +
> +static int __maybe_unused pt27_gpio_runtime_suspend(struct device *dev)
> +{
> +	struct pt27_gpio *chip =3D dev_get_drvdata(dev);
> +	int ret =3D 0;
> +
> +	if (chip->wake_mask && !device_may_wakeup(dev)) {
> +		ret =3D -EBUSY;
> +		break;
> +	}
> +
> +	scoped_guard(raw_spinlock_irqsave, &chip->lock) {
> +
> +	  pt27_save_regs(chip);
> +	  iowrite32(0, chip->base + PT27_REG_INT_EN);
> +	  iowrite32(PT27_GPIO_MASK, chip->base + PT27_REG_INT_MASK);
> +	  iowrite32(PT27_GPIO_MASK, chip->base + PT27_REG_INT_STAT);
> +	  iowrite16(PT27_WAKE_MASK, chip->base + PT27_REG_WAKE_STAT);
> +	}

[Severity: Medium]
In pt27_gpio_runtime_suspend(), the break statement is not inside a loop or
switch statement, which causes a build error when CONFIG_PM is enabled:

  error: break statement not within loop or switch

Should this check be performed inside scoped_guard(raw_spinlock_irqsave,
&chip->lock) (since pt27_irq_set_wake() updates chip->wake_mask under
chip->lock) and return -EBUSY directly so it does not fall through and
disable PT27_REG_INT_EN when aborting runtime suspend?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261028084531.6237=
-1-Chloe_Chen@asmedia.com.tw?part=3D1
