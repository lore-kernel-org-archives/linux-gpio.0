From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: Re: configuration for nc pins without pull
Date: Thu, 28 May 2015 09:26:31 +0200
Message-ID: <20150528072631.GE24769@pengutronix.de>
References: <20150322100059.GH5664@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:56972 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753395AbbE1H0e (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 28 May 2015 03:26:34 -0400
Content-Disposition: inline
In-Reply-To: <20150322100059.GH5664@pengutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de

On Sun, Mar 22, 2015 at 11:00:59AM +0100, Uwe Kleine-K=F6nig wrote:
> Hello,
>=20
> for a machine I want to configure a pin that is actually not connecte=
d
> to minimize floating. (I think this is sensible, isn't it?)
>=20
> For the pinctrl I can use a hog group of the pinctrl device. At least
> one of the pins doesn't have a pullup/pulldown configuration though, =
so
> I want to mux it to its gpio function and set the gpio to output and =
the
> desired value.
>=20
> Is there something nicer than defining an always-on regulator with gp=
ios
> =3D <&gpio4 3 0> to accomplish that without additional code?
=46or the archive: Yes, there is something nicer in the meantime:

Since commit f625d4601759 (gpio: add GPIO hogging mechanism) which is
included in v4.1-rc1 you can do something like

&gpio3 {
        pinctrl-names =3D "default";
        pinctrl-0 =3D <&pinctrl_gpio3hog>;

        ext-armclk {
                gpio-hog;
                gpios =3D <15 0>;
                output-low;
        };
};

in the devicetree (here for an i.MX25).

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
