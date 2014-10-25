From: Shawn Guo <shawn.guo@linaro.org>
Subject: Re: [PATCH] pinctrl: mxs: warn if functions are not grouped by name
Date: Sat, 25 Oct 2014 20:24:35 +0800
Message-ID: <20141025122433.GD3648@tiger>
References: <1413884445-28347-1-git-send-email-u.kleine-koenig@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f44.google.com ([209.85.220.44]:47697 "EHLO
	mail-pa0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751355AbaJYTUy (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 25 Oct 2014 15:20:54 -0400
Received: by mail-pa0-f44.google.com with SMTP id et14so3007588pad.31
        for <linux-gpio@vger.kernel.org>; Sat, 25 Oct 2014 12:20:54 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1413884445-28347-1-git-send-email-u.kleine-koenig@pengutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, kernel@pengutronix.de

On Tue, Oct 21, 2014 at 11:40:45AM +0200, Uwe Kleine-K=F6nig wrote:
> The mxs pinctrl driver cannot handle when functions are not grouped b=
y
> name (which IMO is a bug). This happens for example if a
> imx28-somemachine.dts provides a function that has the same name as a
> function defined in imx28.dtsi.
>=20
> The proper way to fix that would be to check for duplicates in the lo=
ops
> (which increases parsing time) or parse the groups first and sort the
> resulting array.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

Acked-by: Shawn Guo <shawn.guo@linaro.org>
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
