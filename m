From: Aisheng Dong <aisheng.dong@nxp.com>
Subject: RE: [PATCH] pinctrl: freescale: Break dependency on SOC_IMX8MQ for
 i.MX8MQ
Date: Sun, 23 Dec 2018 09:07:45 +0000
Message-ID: <AM0PR04MB421177E54921ED4BB6B59EB580BA0@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <1545548891-24671-1-git-send-email-abel.vesa@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1545548891-24671-1-git-send-email-abel.vesa@nxp.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Abel Vesa <abel.vesa@nxp.com>, Stefan Agner <stefan.agner@toradex.com>, Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <fabio.estevam@nxp.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, dl-linux-imx <linux-imx@nxp.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

> -----Original Message-----
> From: Abel Vesa
> Sent: Sunday, December 23, 2018 3:09 PM
>=20
> The CONFIG_SOC_IMX8MQ will go away, so the dependency can be based on
> ARCH_MXC && ARM64.
>=20
> Signed-off-by: Abel Vesa <abel.vesa@nxp.com>

Acked-by: Dong Aisheng <aisheng.dong@nxp.com>

Regards
Dong Aisheng
