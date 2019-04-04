From: Aisheng Dong <aisheng.dong@nxp.com>
Subject: RE: [PATCH v2 2/2] pinctrl: pinctrl-imx8mq: Add support PM operations
Date: Thu, 4 Apr 2019 06:51:25 +0000
Message-ID: <VI1PR04MB422278BD9C029E7332BB3C0A80500@VI1PR04MB4222.eurprd04.prod.outlook.com>
References: <1553522352-20214-1-git-send-email-abel.vesa@nxp.com>
 <1553522352-20214-2-git-send-email-abel.vesa@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1553522352-20214-2-git-send-email-abel.vesa@nxp.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Abel Vesa <abel.vesa@nxp.com>, Robin Gong <yibin.gong@nxp.com>, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, Stefan Agner <stefan@agner.ch>, Linus Walleij <linus.walleij@linaro.org>, Sascha Hauer <kernel@pengutronix.de>
Cc: dl-linux-imx <linux-imx@nxp.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

> From: Abel Vesa
> Sent: Monday, March 25, 2019 10:00 PM
>=20
> Add suspend/resume pm ops to the pinctrl i.MX8MQ driver.
> Make the suspend late and the resume early since some of the pins might b=
e
> needed active very late.
> These call the pinctrl-imx generic handlers.
>=20
> Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
> ---
>  drivers/pinctrl/freescale/pinctrl-imx8mq.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>=20
> diff --git a/drivers/pinctrl/freescale/pinctrl-imx8mq.c
> b/drivers/pinctrl/freescale/pinctrl-imx8mq.c
> index 8d39af5..2a212bc 100644
> --- a/drivers/pinctrl/freescale/pinctrl-imx8mq.c
> +++ b/drivers/pinctrl/freescale/pinctrl-imx8mq.c
> @@ -335,10 +335,26 @@ static int imx8mq_pinctrl_probe(struct
> platform_device *pdev)
>  	return imx_pinctrl_probe(pdev, &imx8mq_pinctrl_info);  }
>=20
> +static int imx8mq_pinctrl_suspend(struct device *dev) {
> +	return imx_pinctrl_suspend(dev);
> +}
> +
> +static int imx8mq_pinctrl_resume(struct device *dev) {
> +	return imx_pinctrl_resume(dev);
> +}
> +
> +static const struct dev_pm_ops imx8mq_pinctrl_pm_ops =3D {

It looks we did not nothing special on the dev_pm_ops for platform drivers.
So do you think if we can move this into common pinctrl-imx.c?
Then platform driver does not need to implement the duplicated things?

Regards
Dong Aisheng

> +	SET_LATE_SYSTEM_SLEEP_PM_OPS(imx8mq_pinctrl_suspend,
> +					imx8mq_pinctrl_resume)
> +};
> +
>  static struct platform_driver imx8mq_pinctrl_driver =3D {
>  	.driver =3D {
>  		.name =3D "imx8mq-pinctrl",
>  		.of_match_table =3D of_match_ptr(imx8mq_pinctrl_of_match),
> +		.pm =3D &imx8mq_pinctrl_pm_ops,
>  		.suppress_bind_attrs =3D true,
>  	},
>  	.probe =3D imx8mq_pinctrl_probe,
> --
> 2.7.4
