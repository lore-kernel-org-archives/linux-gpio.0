From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: Re: [GIT PULL] pin control fixes for the v4.2 series, take one
Date: Tue, 21 Jul 2015 20:47:33 +0200
Message-ID: <20150721184733.GH9981@pengutronix.de>
References: <CACRpkdafhMgGtR5OS=6TMXnnsBht9AQefMAHWUfvcuXf_ymmiw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:47951 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933338AbbGUSrg (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 21 Jul 2015 14:47:36 -0400
Content-Disposition: inline
In-Reply-To: <CACRpkdafhMgGtR5OS=6TMXnnsBht9AQefMAHWUfvcuXf_ymmiw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Hello,

On Tue, Jul 21, 2015 at 08:36:04PM +0200, Linus Walleij wrote:
>       Subject: pinctrl: imx1-core: Fix debug output in .pin_config_se=
t callback
I remember seeing that "Subject: " in my patch stack, I thought I fixed
that and now it's to late for

	git filter-branch --msg-filter 'sed "1s/Subject: //"' linus/master..

?! :-(

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
