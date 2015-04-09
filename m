From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH v2] pinctrl: make of_device_ids const
Date: Thu, 9 Apr 2015 13:00:34 +0200
Message-ID: <20150409110034.GE9188@pengutronix.de>
References: <1427407231-2253-1-git-send-email-u.kleine-koenig@pengutronix.de>
 <CACRpkdbWm3TJc_oHdZccT73qUH7jwpu2Q4BR2gn2gz-tizn0wQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:60583 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751537AbbDILAl (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 9 Apr 2015 07:00:41 -0400
Content-Disposition: inline
In-Reply-To: <CACRpkdbWm3TJc_oHdZccT73qUH7jwpu2Q4BR2gn2gz-tizn0wQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Fabian Frederick <fabf@skynet.be>, Sascha Hauer <kernel@pengutronix.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Tue, Apr 07, 2015 at 11:09:57AM +0200, Linus Walleij wrote:
> On Thu, Mar 26, 2015 at 11:00 PM, Uwe Kleine-K=F6nig
> <u.kleine-koenig@pengutronix.de> wrote:
>=20
> > of_device_ids (i.e. compatible strings and the respective data) are=
 not
> > supposed to change at runtime. All functions working with of_device=
_ids
> > provided by <linux/of.h> work with const of_device_ids. This allows=
 to
> > mark all struct of_device_id below drivers/pinctrl const, too.
> >
> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
>=20
> I already have a patch like this from Fabian Frederick in my
> devel branch.
I applied my patch to today's next. The diffstat looks similar to the
original submission. Also

	git log linus/master..next/master --author=3DFabian drivers/pinctrl

is empty?!

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
