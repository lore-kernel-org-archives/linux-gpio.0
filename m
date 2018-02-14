From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: RE: [PATCH/RFT v4] gpio: gpio-rcar: Support S2RAM
Date: Wed, 14 Feb 2018 05:27:39 +0000
Message-ID: <TY1PR06MB099277F0F160247B270EE165D8F50@TY1PR06MB0992.apcprd06.prod.outlook.com>
References: <1517771702-16984-1-git-send-email-ykaneko0929@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from relmlor2.renesas.com ([210.160.252.172]:24875 "EHLO
        relmlie1.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751375AbeBNF1o (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 14 Feb 2018 00:27:44 -0500
In-Reply-To: <1517771702-16984-1-git-send-email-ykaneko0929@gmail.com>
Content-Language: ja-JP
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Yoshihiro Kaneko <ykaneko0929@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, DUNG NGUYEN <dung.nguyen.aj@renesas.com>

Hi,

> From: Yoshihiro Kaneko, Sent: Monday, February 5, 2018 4:15 AM
>=20
> From: Hien Dang <hien.dang.eb@renesas.com>
>=20
> This patch adds an implementation that saves and restores the state of
> GPIO configuration on suspend and resume.
>=20
> Signed-off-by: Hien Dang <hien.dang.eb@renesas.com>
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> [Modify structure of the bank info to simplify a saving registers]
> [Remove DEV_PM_OPS macro]
> Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
> ---

Thank you for the patch. Our team tested this patch and
an issue that an SD card detection pin doesn't work after resumed is resolv=
ed.
So,

Tested-by: Nguyen Viet Dung <dung.nguyen.aj@renesas.com>

Best regards,
Yoshihiro Shimoda

> This patch is based on the for-next branch of linux-gpio tree.
>=20
> v2 [Yoshihiro Kaneko]
> * Modify structure of the bank info as suggested by Geert Uytterhoeven
>=20
> v3 [Yoshihiro Kaneko]
> * Remove DEV_PM_OPS macro as suggested by Vladimir Zapolskiy
>=20
> v4 [Yoshihiro Kaneko]
> * As suggested by Geert Uytterhoeven
>   - make the name of all members of gpio_rcar_bank_info accord with the
>     name of the registers
>   - fix type of the 'offset' variable in unsigned int
>   - fix the inverted logic in gpio_rcar_resume()
>=20
>  drivers/gpio/gpio-rcar.c | 66 ++++++++++++++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 66 insertions(+)
>=20
> diff --git a/drivers/gpio/gpio-rcar.c b/drivers/gpio/gpio-rcar.c
> index e76de57..e5b0dbe 100644
> --- a/drivers/gpio/gpio-rcar.c
> +++ b/drivers/gpio/gpio-rcar.c
> @@ -31,6 +31,16 @@
>  #include <linux/spinlock.h>
>  #include <linux/slab.h>
>=20
> +struct gpio_rcar_bank_info {
> +	u32 iointsel;
> +	u32 inoutsel;
> +	u32 outdt;
> +	u32 posneg;
> +	u32 edglevel;
> +	u32 bothedge;
> +	u32 intmsk;
> +};
> +
>  struct gpio_rcar_priv {
>  	void __iomem *base;
>  	spinlock_t lock;
> @@ -41,6 +51,7 @@ struct gpio_rcar_priv {
>  	unsigned int irq_parent;
>  	bool has_both_edge_trigger;
>  	bool needs_clk;
> +	struct gpio_rcar_bank_info bank_info;
>  };
>=20
>  #define IOINTSEL 0x00	/* General IO/Interrupt Switching Register */
> @@ -531,11 +542,66 @@ static int gpio_rcar_remove(struct platform_device =
*pdev)
>  	return 0;
>  }
>=20
> +#ifdef CONFIG_PM_SLEEP
> +static int gpio_rcar_suspend(struct device *dev)
> +{
> +	struct gpio_rcar_priv *p =3D dev_get_drvdata(dev);
> +
> +	p->bank_info.iointsel =3D gpio_rcar_read(p, IOINTSEL);
> +	p->bank_info.inoutsel =3D gpio_rcar_read(p, INOUTSEL);
> +	p->bank_info.outdt =3D gpio_rcar_read(p, OUTDT);
> +	p->bank_info.intmsk =3D gpio_rcar_read(p, INTMSK);
> +	p->bank_info.posneg =3D gpio_rcar_read(p, POSNEG);
> +	p->bank_info.edglevel =3D gpio_rcar_read(p, EDGLEVEL);
> +	if (p->has_both_edge_trigger)
> +		p->bank_info.bothedge =3D gpio_rcar_read(p, BOTHEDGE);
> +
> +	return 0;
> +}
> +
> +static int gpio_rcar_resume(struct device *dev)
> +{
> +	struct gpio_rcar_priv *p =3D dev_get_drvdata(dev);
> +	unsigned int offset;
> +	u32 mask;
> +
> +	for (offset =3D 0; offset < p->gpio_chip.ngpio; offset++) {
> +		mask =3D BIT(offset);
> +		/* I/O pin */
> +		if (!(p->bank_info.iointsel & mask)) {
> +			if (p->bank_info.inoutsel & mask)
> +				gpio_rcar_direction_output(
> +					&p->gpio_chip, offset,
> +					!!(p->bank_info.outdt & mask));
> +			else
> +				gpio_rcar_direction_input(&p->gpio_chip,
> +							  offset);
> +		} else {
> +			/* Interrupt pin */
> +			gpio_rcar_config_interrupt_input_mode(
> +				p,
> +				offset,
> +				!(p->bank_info.posneg & mask),
> +				!(p->bank_info.edglevel & mask),
> +				!!(p->bank_info.bothedge & mask));
> +
> +			if (p->bank_info.intmsk & mask)
> +				gpio_rcar_write(p, MSKCLR, mask);
> +		}
> +	}
> +
> +	return 0;
> +}
> +#endif /* CONFIG_PM_SLEEP*/
> +
> +static SIMPLE_DEV_PM_OPS(gpio_rcar_pm_ops, gpio_rcar_suspend, gpio_rcar_=
resume);
> +
>  static struct platform_driver gpio_rcar_device_driver =3D {
>  	.probe		=3D gpio_rcar_probe,
>  	.remove		=3D gpio_rcar_remove,
>  	.driver		=3D {
>  		.name	=3D "gpio_rcar",
> +		.pm     =3D &gpio_rcar_pm_ops,
>  		.of_match_table =3D of_match_ptr(gpio_rcar_of_table),
>  	}
>  };
> --
> 1.9.1
>=20
> --
> To unsubscribe from this list: send the line "unsubscribe linux-gpio" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
