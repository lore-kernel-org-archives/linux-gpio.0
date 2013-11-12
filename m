From: Ben Gamari <bgamari.foss@gmail.com>
Subject: Re: [PATCH v3] gpio: add export with name from dts
Date: Mon, 11 Nov 2013 21:36:50 -0500
Message-ID: <874n7i4a7x.fsf@gmail.com>
References: <CAAVeFuJCamVumTphu-Wv2DSgepwoPgYXnCGdK=L8oem-3-K+gA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha1; protocol="application/pgp-signature"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qc0-f171.google.com ([209.85.216.171]:60424 "EHLO
	mail-qc0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751385Ab3KLCg4 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 11 Nov 2013 21:36:56 -0500
Received: by mail-qc0-f171.google.com with SMTP id s13so1092163qcv.30
        for <linux-gpio@vger.kernel.org>; Mon, 11 Nov 2013 18:36:55 -0800 (PST)
In-Reply-To: <CAAVeFuJCamVumTphu-Wv2DSgepwoPgYXnCGdK=L8oem-3-K+gA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>

--=-=-=
Content-Type: text/plain

On Thu, Oct 17, 2013 at 6:03 PM, Alexandre Courbot wrote:
> But maybe I'm missing your point - could you describe a concrete
> use-case for this feature that can *not* be achieved using
> gpio_export_with_link()?

For what it's worth, it seems that the gpio-of-helper[1] driver found in
BeagleBoard kernels targets a use-case similar to that intended by this
patch.

Cheers,

- Ben


[1] https://github.com/beagleboard/meta-beagleboard/blob/master/common-bsp/recipes-kernel/linux/linux-mainline-3.8/not-capebus/0182-gpio-Introduce-GPIO-OF-helper.patch

--=-=-=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.14 (GNU/Linux)

iQEcBAEBAgAGBQJSgZRCAAoJEErkyLZmeNiDPIAIALWDNEXfWJv+TCGIy0mZDEi+
/Nd4WtkwnwFI44GMhS2//9ROrsBG1u4mmra2m2cbvVdvtrewl3Ow/ZV/IQ7imv35
2fFU/Fa2+CvBKqDzi12i7b02O+KZtnEQFOEv/6Tw0tRDIuXeUy9POgljcLPgYSyR
JUpe2FU9oyRzWzsZeGhtt+I6h9ROXfTsz/S4cLXJFlw56N6RBDkOJLwjj7Umn3Pl
DlX7kbM7ZgDlSg1LyDV0caznlge97gBzqRyOoPlabbkSUTjW6DxPvOo/DQRYQd7t
Fg/j0VBa9bMypkotzWU31rMbwM6vhvc22s3nIwgRi3yvBsfT2sTog6MgD5jogA4=
=7a4f
-----END PGP SIGNATURE-----
--=-=-=--
