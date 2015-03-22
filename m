From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: configuration for nc pins without pull
Date: Sun, 22 Mar 2015 11:00:59 +0100
Message-ID: <20150322100059.GH5664@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:43531 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751685AbbCVKBB (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 22 Mar 2015 06:01:01 -0400
Content-Disposition: inline
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org

Hello,

for a machine I want to configure a pin that is actually not connected
to minimize floating. (I think this is sensible, isn't it?)

=46or the pinctrl I can use a hog group of the pinctrl device. At least
one of the pins doesn't have a pullup/pulldown configuration though, so
I want to mux it to its gpio function and set the gpio to output and th=
e
desired value.

Is there something nicer than defining an always-on regulator with gpio=
s
=3D <&gpio4 3 0> to accomplish that without additional code?

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
