From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 1/1] gpio: mpc8xxx: Convert mpc8xxx_gpio_chip.lock to
 raw_spinlock
Date: Mon, 27 Jul 2015 16:08:57 +0200
Message-ID: <20150727140857.GN15360@pengutronix.de>
References: <1437486870-11135-1-git-send-email-alexander.stein@systec-electronic.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:49095 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753281AbbG0OJA (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 27 Jul 2015 10:09:00 -0400
Content-Disposition: inline
In-Reply-To: <1437486870-11135-1-git-send-email-alexander.stein@systec-electronic.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexander Stein <alexander.stein@systec-electronic.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org

Hello,

On Tue, Jul 21, 2015 at 03:54:30PM +0200, Alexander Stein wrote:
> mpc8xxx_gpio_chip.lock needs to be a real spinlock in preempt-rt.
> Especially the interrupt related functions can not be converted to a
> sleeping lock.
>=20
> Signed-off-by: Alexander Stein <alexander.stein@systec-electronic.com=
>
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
