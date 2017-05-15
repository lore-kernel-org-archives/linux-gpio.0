From: "A.S. Dong" <aisheng.dong@nxp.com>
Subject: RE: [PATCH 5/5] pinctrl: imx: fix debug message for
 SHARE_MUX_CONF_REG case
Date: Mon, 15 May 2017 12:08:22 +0000
Message-ID: <AM3PR04MB306832D30685F0239BA37BC80E10@AM3PR04MB306.eurprd04.prod.outlook.com>
References: <1494592686-30967-1-git-send-email-aisheng.dong@nxp.com>
 <1494592686-30967-7-git-send-email-aisheng.dong@nxp.com>
 <20170515120555.GR8471@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-eopbgr30044.outbound.protection.outlook.com ([40.107.3.44]:55938
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1750937AbdEOMIY (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 15 May 2017 08:08:24 -0400
In-Reply-To: <20170515120555.GR8471@dragon>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Andy Duan <fugang.duan@nxp.com>, Jacky Bai <ping.bai@nxp.com>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "stefan@agner.ch" <stefan@agner.ch>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

> -----Original Message-----
> From: Shawn Guo [mailto:shawnguo@kernel.org]
> Sent: Monday, May 15, 2017 8:06 PM
> To: A.S. Dong
> Cc: linux-gpio@vger.kernel.org; Andy Duan; Jacky Bai;
> linus.walleij@linaro.org; stefan@agner.ch; kernel@pengutronix.de; linux-
> arm-kernel@lists.infradead.org
> Subject: Re: [PATCH 5/5] pinctrl: imx: fix debug message for
> SHARE_MUX_CONF_REG case
>=20
> On Fri, May 12, 2017 at 08:38:06PM +0800, Dong Aisheng wrote:
> > The original implemented debug message does not work for
> > SHARE_MUX_CONF_REG case. This patch fixes it.
> >
> > Cc: Linus Walleij <linus.walleij@linaro.org>
> > Cc: Shawn Guo <shawnguo@kernel.org>
> > Fixes: bf5a530971af ("pinctrl: imx: add VF610 support to imx pinctrl
> > framework")
> > Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
>=20
> Fixes should go first in a patch series.
>=20

That's true.
Thanks for the suggestion.

Regards
Dong Aisheng

> Shawn
