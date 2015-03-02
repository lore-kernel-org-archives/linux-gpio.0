From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] pinctrl: imx: do not implicitly set pin regs to -1
Date: Mon, 2 Mar 2015 13:59:35 +0100
Message-ID: <20150302125935.GC7865@pengutronix.de>
References: <1423240256-27210-1-git-send-email-stefan@agner.ch>
 <20150302114516.GC3040@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:43280 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751258AbbCBM7n (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 2 Mar 2015 07:59:43 -0500
Content-Disposition: inline
In-Reply-To: <20150302114516.GC3040@dragon>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Shawn Guo <shawn.guo@linaro.org>
Cc: Stefan Agner <stefan@agner.ch>, linus.walleij@linaro.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org

Hello Shawn

On Mon, Mar 02, 2015 at 07:45:17PM +0800, Shawn Guo wrote:
> On Fri, Feb 06, 2015 at 05:30:56PM +0100, Stefan Agner wrote:
> > Commit 3dac1918a491 ("pinctrl: imx: detect uninitialized pins") nee=
ds
> > the values in struct imx_pin_reg to be -1. This has been done in a
> > rather unorthodox way by setting the memory to 0xff using memset...
> > Use a proper for loop to initialize the whole array with -1.
> >=20
> > Signed-off-by: Stefan Agner <stefan@agner.ch>
>=20
> Acked-by: Shawn Guo <shawn.guo@linaro.org>
too late. This patch is part of 4.0-rc1 (4ff0f034e95d).

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig        =
    |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
