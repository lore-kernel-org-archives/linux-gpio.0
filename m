From: Aisheng Dong <aisheng.dong@nxp.com>
Subject: RE: [PATCH v3] pinctrl: imx8mq: Add suspend/resume ops
Date: Tue, 9 Apr 2019 03:30:19 +0000
Message-ID: <AM0PR04MB42112C433296FE60C7FE5646802D0@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <1554748702-2368-1-git-send-email-abel.vesa@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1554748702-2368-1-git-send-email-abel.vesa@nxp.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Abel Vesa <abel.vesa@nxp.com>, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, Stefan Agner <stefan@agner.ch>, Linus Walleij <linus.walleij@linaro.org>, Sascha Hauer <kernel@pengutronix.de>
Cc: dl-linux-imx <linux-imx@nxp.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Robin Gong <yibin.gong@nxp.com>
List-Id: linux-gpio@vger.kernel.org

> From: Abel Vesa
> Sent: Tuesday, April 9, 2019 2:39 AM
>=20
> To support pinctl hog restore after LPSR resume back, add the generic
> suspend/resume in pinctrl-imx along with the generic pm ops to be used by
> platform specific drivers. Then make use of the newly added ops in i.MX8M=
Q
> platform specific driver.
>=20
> Signed-off-by: Robin Gong <yibin.gong@nxp.com>
> Signed-off-by: Abel Vesa <abel.vesa@nxp.com>

Acked-by: Dong Aisheng <aisheng.dong@nxp.com>

Regards
Dong Aisheng
