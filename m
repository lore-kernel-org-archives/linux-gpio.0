From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [RFC] pinctrl: sh-pfc: only use dummy states for non-DT platforms
Date: Wed, 9 Mar 2016 16:37:53 +0100
Message-ID: <20160309153753.GA9443@katana>
References: <1457376072-755-1-git-send-email-wsa@the-dreams.de>
 <CAMuHMdXPH0+YE=cRk7pjvoVEYtEGNcb_83-z5taXSLHRhtgMQA@mail.gmail.com>
 <56DDDE6E.6090908@cogentembedded.com>
 <CAMuHMdWis_knSv0Lgw+8O3LXp9thEX3SdGX6qo_4UyFrxFVuHA@mail.gmail.com>
 <56DDE5CB.60204@cogentembedded.com>
 <CAMuHMdUVFk47u+LPdfh+fq8vvPQAULyM8X_DrizCtrgf-1YwaA@mail.gmail.com>
 <20160309095805.GA1506@katana>
 <CACRpkdZzbp5MwD6uH=GbkYbvB=HsGOHYi+HcYpn5gZacmRwHwg@mail.gmail.com>
 <56E01C3D.1060600@cogentembedded.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qMm9M+Fa2AknHoGS"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from sauhun.de ([89.238.76.85]:51888 "EHLO pokefinder.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932847AbcCIPiH (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Wed, 9 Mar 2016 10:38:07 -0500
Content-Disposition: inline
In-Reply-To: <56E01C3D.1060600@cogentembedded.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-renesas-soc@vger.kernel.org, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Kuninori Morimoto <kuninori.morimoto.gx@gmail.com>, Magnus Damm <magnus.damm@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>


--qMm9M+Fa2AknHoGS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

>    I'd only like that the "Fixes:" and "Cc:" tags were added to it.

To make it easier for you, Linus:

Fixes: ef0eebc05130 ("drivers/pinctrl: Add the concept of an "init" state")
CC: stable@vger.kernel.org


--qMm9M+Fa2AknHoGS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJW4ENRAAoJEBQN5MwUoCm26gYQAK7O/AdUwTAAudv95/m4pGG2
h74Stn53undaojWN+zp69ydaVUiyQdHQG5YHGvXBhBGetBGutf9ao/uRL+v0UUle
tDy4dhaCIN+jzLyoX2WOkt9XRUO1h1cIDot5z2oNRptnp82sqe+1GPPJXMzztJD+
wfL1Zmj/nF9MplsdgFUB07f8tvwCDIsOdNo0v4WjiucMaL6s6wCjkuOJyshon46K
ylZixF5lmYoXb6PrIFM0B/K1hUoclxrOwb5UxkSuvootIioJH/dtVVj80Hk1FquZ
9MCIeXq9TIYrIX1GF4E2gH4o/vHWCUPs8tZQDJXdpBoPon8o2b3un74n3Q32ZTH6
+ell0cYPKvgxVulrf0rV4AcbmLXpqsxSG4nTEpHJjGnm/gUlc2JbefXdzmVHVeV3
WLjQ55IAwN1hX8dvSrHHStOAlRsPig9hWF9ATWIC+UvYDFN/Q7qOmjjxKWOUgahA
Fg+fVHsIEZk7dYw+jmSL+H6SDcwuoM7z4gpr+5ST3Uam0rlSnkQSqiGsB+kEExYx
LO4fWydFY8dxwWsHrkp5ctjk6dhSTnydPbfcz+myjIYCIScz4BbZsas5aD5XdMbF
i972uKTDUvoaqVnMTIbFW7b6urWmgyjGLGPPqYaYxUC2BlFkvbKdbLhqm+gbIMy0
VWfQ6OxtEuRpcEhrivzE
=UJS1
-----END PGP SIGNATURE-----

--qMm9M+Fa2AknHoGS--
