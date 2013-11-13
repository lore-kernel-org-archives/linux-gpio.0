From: Ben Gamari <bgamari.foss@gmail.com>
Subject: Re: [PATCH v3] gpio: add export with name from dts
Date: Wed, 13 Nov 2013 10:20:18 -0500
Message-ID: <871u2k49cd.fsf@gmail.com>
References: <CACRpkdbG9emZg-6oOO8MgwUgCkqQB6+QqYuNAOo-QN0e+wYq2g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha1; protocol="application/pgp-signature"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qa0-f42.google.com ([209.85.216.42]:36268 "EHLO
	mail-qa0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754418Ab3KMPUY (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Nov 2013 10:20:24 -0500
Received: by mail-qa0-f42.google.com with SMTP id ii20so3851526qab.15
        for <linux-gpio@vger.kernel.org>; Wed, 13 Nov 2013 07:20:23 -0800 (PST)
In-Reply-To: <CACRpkdbG9emZg-6oOO8MgwUgCkqQB6+QqYuNAOo-QN0e+wYq2g@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Mark Rutland <mark.rutland@arm.com>, jiri.prchal@aksignal.cz
Cc: linux-gpio@vger.kernel.org

--=-=-=
Content-Type: text/plain


Linus Walleij wrote,
> I think what Mark is saying is that you should not define a new node
> for exports, but instead use the node for the gpiochip and extend
> those existing gpiochip bindings, if you want to do this.
>
What might this look like? Should each exported pin have a node under
the gpio-controller? If we want to allow for pins to be exported to
userspace, a name alone is not sufficient; we also need to provide the
allowed directions. I think this precludes the use of a plain /aliases
node.

Perhaps something like this (please excuse my ignorance of devicetree
norms)?

	gpio1: gpio-controller@1400 {
		#gpio-cells = <2>;
		compatible = "fsl,qe-pario-bank-a", "fsl,qe-pario-bank";
		reg = <0x1400 0x18>;
		gpio-controller;

                pin_a: gpio {
                          gpio-name = "pin-a";
                          gpio = <&gpio1 2 0>;
                          output;
                          init-high;
                };
	};

One issue with this is the redundancy of specifying both the
gpio-controller in the `gpio` attribute and by virtue of it being a
child of the controller. Other suggestions?

Cheers,

- Ben

--=-=-=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.14 (GNU/Linux)

iQEcBAEBAgAGBQJSg5iyAAoJEErkyLZmeNiD184H/2Nl5bWE6NlttdwMShV7eUCg
xpwBTWe2XBHS6lKQnb7gPn9I3H9twW7oXV3Jf2inroapz4XTUxMPTeFHV7camTH9
NnHG0OY9iiBwKTGVj52ZojPZyKcWhzddYqkq9UxtDV6sWjSDo54bZJjkqBxwm48d
Wulrp3mploMIynObTHlGzJ+TIb9NmC1hSXUQit1/fIivhqi1MDoGTYcfcsjc1mTm
u6qmrlcZ2YHxYfdwBOH9ii4g3R4JVX1X8mScIu+iGXrYLS3eBfIoex32bY2saJVM
d32YVr6QFlE5345UPIJImy+yT9iQF7KNYWD/8RUi8J6gy5sD2RcG3QqVs4MjDXU=
=sg7t
-----END PGP SIGNATURE-----
--=-=-=--
