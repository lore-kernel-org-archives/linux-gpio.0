From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v2] gpio: pca953x: add PCAL9535 interrupt support for
 Galileo Gen2
Date: Thu, 07 Apr 2016 14:07:49 +0300
Message-ID: <1460027269.6620.18.camel@linux.intel.com>
References: <1460004992-16210-1-git-send-email-yong.b.li@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:52595 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755384AbcDGLGx (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Thu, 7 Apr 2016 07:06:53 -0400
In-Reply-To: <1460004992-16210-1-git-send-email-yong.b.li@intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Yong Li <yong.b.li@intel.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linus.walleij@linaro.org, gnurou@gmail.com
Cc: ismo.puustinen@intel.com, preid@electromag.com.au

On Thu, 2016-04-07 at 12:56 +0800, Yong Li wrote:
> Galileo Gen2 board uses the PCAL9535 as the GPIO expansion,
> it is different from PCA9535 and includes interrupt mask/status
> registers,
> The current driver does not support the interrupt registers
> configuration,
> it causes some gpio pins cannot trigger interrupt events,
> this patch fix this issue. The original patch was submitted by
> Josef Ahmad <josef.ahmad@linux.intel.com>
> http://git.yoctoproject.org/cgit/cgit.cgi/meta-intel-quark/tree/recip=
e
> s-kernel/linux/files/0015-Quark-GPIO-1-2-quark.patch
>=20

=46WIW:
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Signed-off-by: Yong Li <yong.b.li@intel.com>
> ---
> =C2=A0drivers/gpio/gpio-pca953x.c | 42
> +++++++++++++++++++++++++++++++++++++++++-
> =C2=A01 file changed, 41 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.=
c
> index e66084c..5e3be32 100644
> --- a/drivers/gpio/gpio-pca953x.c
> +++ b/drivers/gpio/gpio-pca953x.c
> @@ -38,8 +38,13 @@
> =C2=A0#define PCA957X_MSK		6
> =C2=A0#define PCA957X_INTS		7
> =C2=A0
> +#define PCAL953X_IN_LATCH	34
> +#define PCAL953X_INT_MASK	37
> +#define PCAL953X_INT_STAT	38
> +
> =C2=A0#define PCA_GPIO_MASK		0x00FF
> =C2=A0#define PCA_INT			0x0100
> +#define PCA_PCAL			0x0200
> =C2=A0#define PCA953X_TYPE		0x1000
> =C2=A0#define PCA957X_TYPE		0x2000
> =C2=A0#define PCA_TYPE_MASK		0xF000
> @@ -77,7 +82,7 @@ static const struct i2c_device_id pca953x_id[] =3D =
{
> =C2=A0MODULE_DEVICE_TABLE(i2c, pca953x_id);
> =C2=A0
> =C2=A0static const struct acpi_device_id pca953x_acpi_ids[] =3D {
> -	{ "INT3491", 16 | PCA953X_TYPE | PCA_INT, },
> +	{ "INT3491", 16 | PCA953X_TYPE | PCA_INT | PCA_PCAL, },
> =C2=A0	{ }
> =C2=A0};
> =C2=A0MODULE_DEVICE_TABLE(acpi, pca953x_acpi_ids);
> @@ -437,6 +442,18 @@ static void pca953x_irq_bus_sync_unlock(struct
> irq_data *d)
> =C2=A0	struct pca953x_chip *chip =3D gpiochip_get_data(gc);
> =C2=A0	u8 new_irqs;
> =C2=A0	int level, i;
> +	u8 invert_irq_mask[MAX_BANK];
> +
> +	if (chip->driver_data & PCA_PCAL) {
> +		/* Enable latch on interrupt-enabled inputs */
> +		pca953x_write_regs(chip, PCAL953X_IN_LATCH, chip-
> >irq_mask);
> +
> +		for (i =3D 0; i < NBANK(chip); i++)
> +			invert_irq_mask[i] =3D ~chip->irq_mask[i];
> +
> +		/* Unmask enabled interrupts */
> +		pca953x_write_regs(chip, PCAL953X_INT_MASK,
> invert_irq_mask);
> +	}
> =C2=A0
> =C2=A0	/* Look for any newly setup interrupt */
> =C2=A0	for (i =3D 0; i < NBANK(chip); i++) {
> @@ -498,6 +515,29 @@ static bool pca953x_irq_pending(struct
> pca953x_chip *chip, u8 *pending)
> =C2=A0	u8 trigger[MAX_BANK];
> =C2=A0	int ret, i, offset =3D 0;
> =C2=A0
> +	if (chip->driver_data & PCA_PCAL) {
> +		/* Read the current interrupt status from the device
> */
> +		ret =3D pca953x_read_regs(chip, PCAL953X_INT_STAT,
> trigger);
> +		if (ret)
> +			return false;
> +
> +		/* Check latched inputs and clear interrupt status */
> +		ret =3D pca953x_read_regs(chip, PCA953X_INPUT,
> cur_stat);
> +		if (ret)
> +			return false;
> +
> +		for (i =3D 0; i < NBANK(chip); i++) {
> +			/* Apply filter for rising/falling edge
> selection */
> +			pending[i] =3D (~cur_stat[i] & chip-
> >irq_trig_fall[i]) |
> +				(cur_stat[i] & chip-
> >irq_trig_raise[i]);
> +			pending[i] &=3D trigger[i];
> +			if (pending[i])
> +				pending_seen =3D true;
> +		}
> +
> +		return pending_seen;
> +	}
> +
> =C2=A0	switch (chip->chip_type) {
> =C2=A0	case PCA953X_TYPE:
> =C2=A0		offset =3D PCA953X_INPUT;

--=20
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy

--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
