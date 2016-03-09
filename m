From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] pinctrl: pxa2xx: export symbols
Date: Wed, 9 Mar 2016 09:31:21 +0100
Message-ID: <20160309083121.GS8136@pengutronix.de>
References: <1457489509-5680-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from metis.ext.4.pengutronix.de ([92.198.50.35]:40605 "EHLO
	metis.ext.4.pengutronix.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752579AbcCIIb1 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Mar 2016 03:31:27 -0500
Content-Disposition: inline
In-Reply-To: <1457489509-5680-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org

On Wed, Mar 09, 2016 at 09:11:49AM +0700, Linus Walleij wrote:
> The pxa2xxx fails some automated builds because of unexported
> symbols.
>=20
> Reported-by: kbuild test robot <fengguang.wu@intel.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

There is 3a5242e648a8d009f0e0fd47867592e5265374b6 in linus/master which
does a part of this patch already.

Apart from that I don't understand the patch. The only user of
pxa2xx_pinctrl_init is drivers/pinctrl/pxa/pinctrl-pxa27x.c[1] and this
is built into the same module as pinctrl-pxa2xx.o. So without testing I
wonder in which configuration this fails to build.

Best regards
Uwe

[1] git grep -E pxa2xx_pinctrl_\(in\|ex\)it next/master
    git grep -E pxa2xx_pinctrl_\(in\|ex\)it linus/master

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
