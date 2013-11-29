From: Simon Guinot <simon.guinot@sequanux.org>
Subject: Re: [PATCH] gpio: add GPIO support for SMSC SCH311x
Date: Fri, 29 Nov 2013 21:37:47 +0100
Message-ID: <20131129203747.GL16823@kw.sim.vm.gnt>
References: <1385597895-26418-1-git-send-email-br1@einfach.org>
 <CACRpkdaXO+tYRq=uyQiAopRDPwKv1_F4yZwCWr4-JL1xnio4Wg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="uWbmMdDzzl2TXAgx"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from vm1.sequanux.org ([188.165.36.56]:33523 "EHLO vm1.sequanux.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754616Ab3K2UiE (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Fri, 29 Nov 2013 15:38:04 -0500
Content-Disposition: inline
In-Reply-To: <CACRpkdaXO+tYRq=uyQiAopRDPwKv1_F4yZwCWr4-JL1xnio4Wg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Bruno Randolf <br1@einfach.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, Mathias Nyman <mathias.nyman@linux.intel.com>, David Cohen <david.a.cohen@intel.com>, Wim Van Sebroeck <wim@iguana.be>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>


--uWbmMdDzzl2TXAgx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 29, 2013 at 03:40:01PM +0100, Linus Walleij wrote:
> Maybe this leads to another interesting discussion on why
> ACPI is not used for configuring the board...

Hi Linus,

I am currently working on the next Seagate NAS boards (x86-based) and
again a Super-I/O will be used to provide some GPIO lines :) The device
should be an IT8732, which may be supported by the driver gpio-it8761e.

Based on our previous experience, I am currently pushing the board
manufacturer (which also provides the BIOS) to get an get entry for
the Super-I/O device in the ACPI tables.

Let me say it is not a easy task and I am still not sure to succeed...
Clearly the guys don't understand why they have to do that because the
other OS are used to identify the device via the I/O registers.

Regards,

Simon

--uWbmMdDzzl2TXAgx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlKY+xsACgkQgtp0PDeOcDpqIQCfQAm8IgC4+9369UIJ0J/ImYvs
pjQAmQEYONWTWUK4mbBt82yjQ2IHJ6bX
=5K+r
-----END PGP SIGNATURE-----

--uWbmMdDzzl2TXAgx--
