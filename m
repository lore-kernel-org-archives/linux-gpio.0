From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 1/4] gpio: mpc8xxx: constify of_device_id
Date: Mon, 27 Jul 2015 14:32:22 +0200
Message-ID: <20150727123222.GI15360@pengutronix.de>
References: <1437073704-13881-1-git-send-email-u.kleine-koenig@pengutronix.de>
 <CACRpkdZL1AAEc58vT3es3pH9FS0H2LUWRC973zhm3qkQa22i4A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:41394 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752691AbbG0Mc0 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 27 Jul 2015 08:32:26 -0400
Content-Disposition: inline
In-Reply-To: <CACRpkdZL1AAEc58vT3es3pH9FS0H2LUWRC973zhm3qkQa22i4A@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Sascha Hauer <kernel@pengutronix.de>

Hello Linus,

On Mon, Jul 27, 2015 at 12:21:26PM +0200, Linus Walleij wrote:
> On Thu, Jul 16, 2015 at 9:08 PM, Uwe Kleine-K=F6nig
> <u.kleine-koenig@pengutronix.de> wrote:
>=20
> > This variable is not modified in the driver and all functions it it
> > passed to don't change it either. So it can and should be marked co=
nst.
> >
> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
>=20
> Patch applied.
>=20
> I'll push the tree later today, pls verify that your diacritics look
> right now!
It's not urgent, right? (i.e. you pushed for inclusion in next, not for
the other Linus.) Then I have a script that will catch you :-)

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
