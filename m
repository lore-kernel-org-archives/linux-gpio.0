From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] gpio: remove const modifier from gpiod_get_direction()
Date: Tue, 25 Nov 2014 09:01:22 +0100
Message-ID: <20141125080122.GY4431@pengutronix.de>
References: <1416900045-2304-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:39940 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750996AbaKYIBZ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 25 Nov 2014 03:01:25 -0500
Content-Disposition: inline
In-Reply-To: <1416900045-2304-1-git-send-email-acourbot@nvidia.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, gnurou@gmail.com

Hello Alexandre,

just some minor nitpicking on the commit log:

On Tue, Nov 25, 2014 at 04:20:45PM +0900, Alexandre Courbot wrote:
> Although gpiod_get_direction() can be considered side-effect free for
> consumers, its internals involve setting or clearing bits in the
> affected GPIO descriptor, for which we need to force-cast the const
> descriptor parameter. This could lead to incorrect behavior is the
s/ is/ if/, and I think s/parameter/variable to non-const/

> compiler decide to optimize here, so remove this const parameter. The
s/decide/decides/; s/parameter/attribute/

> intent is to make gpiod_get_direction() private anyway, so it does no=
t
> really matter.
>=20
> Reported-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

Thanks
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
