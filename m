From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 1/3] gpio: Use __gpiod_request directly
Date: Mon, 7 Sep 2015 10:05:54 +0200
Message-ID: <20150907080554.GP9999@pengutronix.de>
References: <1439979512-3894-1-git-send-email-mpa@pengutronix.de>
 <1439979512-3894-2-git-send-email-mpa@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:46574 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751362AbbIGIGB (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Sep 2015 04:06:01 -0400
Content-Disposition: inline
In-Reply-To: <1439979512-3894-2-git-send-email-mpa@pengutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Markus Pargmann <mpa@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Arun Bharadwaj <arun@gumstix.com>, Johan Hovold <johan@kernel.org>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de, Markus Pargmann <mpa@devmp.org>

On Wed, Aug 19, 2015 at 12:18:30PM +0200, Markus Pargmann wrote:
> From: Markus Pargmann <mpa@devmp.org>
>=20
> There is no reason to find out chip and hwnum to use to request a gpi=
o
> and get another gpio descriptor. We already have the descriptor we wa=
nt
> to use so we can directly use it.
>=20
> Signed-off-by: Markus Pargmann <mpa@pengutronix.de>

Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

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
