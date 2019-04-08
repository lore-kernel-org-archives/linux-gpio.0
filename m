From: Aisheng Dong <aisheng.dong@nxp.com>
Subject: RE: [PATCH v2] pinctrl: pinctrl-imx8mq: Add suspend/resume ops
Date: Mon, 8 Apr 2019 11:27:37 +0000
Message-ID: <AM0PR04MB4211EFD7CA34B33F3B9CE9E7802C0@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <1554720120-6617-1-git-send-email-abel.vesa@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1554720120-6617-1-git-send-email-abel.vesa@nxp.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Abel Vesa <abel.vesa@nxp.com>, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, Stefan Agner <stefan@agner.ch>, Linus Walleij <linus.walleij@linaro.org>, Sascha Hauer <kernel@pengutronix.de>
Cc: dl-linux-imx <linux-imx@nxp.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Robin Gong <yibin.gong@nxp.com>
List-Id: linux-gpio@vger.kernel.org

> From: Abel Vesa
> Sent: Monday, April 8, 2019 6:43 PM
> Subject: [PATCH v2] pinctrl: pinctrl-imx8mq: Add suspend/resume ops

pinctrl: imx8mq: xxxx

> To support pinctl hog restore after LPSR resume back, add the generic
> suspend/resume in pinctrl-imx along with the generic pm opsto be used by
> platform specific drivers. Then make use of the newly added ops in i.MX8M=
Q
> platform specific driver.
>=20
> Signed-off-by: Robin Gong <yibin.gong@nxp.com>
> Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
> ---
>=20
> Changes since v1:
>  - Replaced the imx8mq specific ops with generic ones.
>=20
>  drivers/pinctrl/freescale/pinctrl-imx.c    | 25
> +++++++++++++++++++++++++
>  drivers/pinctrl/freescale/pinctrl-imx.h    |  4 ++++
>  drivers/pinctrl/freescale/pinctrl-imx8mq.c |  1 +
>  3 files changed, 30 insertions(+)
>=20
> diff --git a/drivers/pinctrl/freescale/pinctrl-imx.c
> b/drivers/pinctrl/freescale/pinctrl-imx.c
> index 188001b..ee120ee 100644
> --- a/drivers/pinctrl/freescale/pinctrl-imx.c
> +++ b/drivers/pinctrl/freescale/pinctrl-imx.c
> @@ -887,3 +887,28 @@ int imx_pinctrl_probe(struct platform_device *pdev,
>=20
>  	return ret;
>  }
> +
> +int imx_pinctrl_suspend(struct device *dev) {

Static __maybe_unused

> +	struct imx_pinctrl *ipctl =3D dev_get_drvdata(dev);
> +
> +	if (!ipctl)
> +		return -EINVAL;

I think we do not need this check as it's within the driver control.

> +
> +	return pinctrl_force_sleep(ipctl->pctl); }
> +
> +int imx_pinctrl_resume(struct device *dev) {

Ditto

> +	struct imx_pinctrl *ipctl =3D dev_get_drvdata(dev);
> +
> +	if (!ipctl)
> +		return -EINVAL;

Ditto

> +
> +	return pinctrl_force_default(ipctl->pctl);
> +}
> +
> +const struct dev_pm_ops imx_pinctrl_pm_ops =3D {
> +	SET_LATE_SYSTEM_SLEEP_PM_OPS(imx_pinctrl_suspend,
> +					imx_pinctrl_resume)
> +};
> diff --git a/drivers/pinctrl/freescale/pinctrl-imx.h
> b/drivers/pinctrl/freescale/pinctrl-imx.h
> index 98a4889..ae78314 100644
> --- a/drivers/pinctrl/freescale/pinctrl-imx.h
> +++ b/drivers/pinctrl/freescale/pinctrl-imx.h
> @@ -17,6 +17,7 @@
>  struct platform_device;
>=20
>  extern struct pinmux_ops imx_pmx_ops;
> +extern const struct dev_pm_ops imx_pinctrl_pm_ops;
>=20
>  /**
>   * struct imx_pin_mmio - MMIO pin configurations @@ -136,6 +137,9 @@
> struct imx_pinctrl {  int imx_pinctrl_probe(struct platform_device *pdev,
>  			const struct imx_pinctrl_soc_info *info);
>=20
> +int imx_pinctrl_suspend(struct device *dev); int
> +imx_pinctrl_resume(struct device *dev);

Not need export this two functions

Regards
Dong Aisheng

> +
>  #ifdef CONFIG_PINCTRL_IMX_SCU
>  #define BM_PAD_CTL_GP_ENABLE		BIT(30)
>  #define BM_PAD_CTL_IFMUX_ENABLE		BIT(31)
> diff --git a/drivers/pinctrl/freescale/pinctrl-imx8mq.c
> b/drivers/pinctrl/freescale/pinctrl-imx8mq.c
> index 8d39af5..50aa1c0 100644
> --- a/drivers/pinctrl/freescale/pinctrl-imx8mq.c
> +++ b/drivers/pinctrl/freescale/pinctrl-imx8mq.c
> @@ -339,6 +339,7 @@ static struct platform_driver imx8mq_pinctrl_driver =
=3D
> {
>  	.driver =3D {
>  		.name =3D "imx8mq-pinctrl",
>  		.of_match_table =3D of_match_ptr(imx8mq_pinctrl_of_match),
> +		.pm =3D &imx_pinctrl_pm_ops,
>  		.suppress_bind_attrs =3D true,
>  	},
>  	.probe =3D imx8mq_pinctrl_probe,
> --
> 2.7.4
