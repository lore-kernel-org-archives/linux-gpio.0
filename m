From: Michal Simek <monstr@monstr.eu>
Subject: Getting gpios from user space based on gpio-line-names
Date: Mon, 3 Jul 2017 15:01:26 +0200
Message-ID: <6fc9ba3b-982c-d17d-3d5f-16b486f3ca5a@monstr.eu>
Reply-To: monstr@monstr.eu
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="j0RadQb4uhLSmSimMSJkSXU383qFTtl0R"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f43.google.com ([74.125.82.43]:37284 "EHLO
        mail-wm0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752113AbdGCNB3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 3 Jul 2017 09:01:29 -0400
Received: by mail-wm0-f43.google.com with SMTP id i127so107891375wma.0
        for <linux-gpio@vger.kernel.org>; Mon, 03 Jul 2017 06:01:28 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--j0RadQb4uhLSmSimMSJkSXU383qFTtl0R
Content-Type: multipart/mixed; boundary="cK8SHEqEEJM88SJ1OQlV5fR3sekB3iTv6";
 protected-headers="v1"
From: Michal Simek <monstr@monstr.eu>
Reply-To: monstr@monstr.eu
To: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Message-ID: <6fc9ba3b-982c-d17d-3d5f-16b486f3ca5a@monstr.eu>
Subject: Getting gpios from user space based on gpio-line-names

--cK8SHEqEEJM88SJ1OQlV5fR3sekB3iTv6
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi,

I am trying to find some docs about how to ask for gpio line
based on gpio-line-names in DT. I see line names available via debugfs
which is not suitable for production.
And also I didn't find a way how to ask for gpio Linux number from user
space to start to work with them.
This is for gpio mraa integration which depends on Linux gpio line number=
s.

Thanks,
Michal

--=20
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP SoCs



--cK8SHEqEEJM88SJ1OQlV5fR3sekB3iTv6--

--j0RadQb4uhLSmSimMSJkSXU383qFTtl0R
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAllaQCYACgkQykllyylKDCEczQCfZc5Gfzn7KwVDMDPcBuNyVL77
EPYAnRITsVK0BT4xz/GEnjgjIW5SNf4Y
=qqUr
-----END PGP SIGNATURE-----

--j0RadQb4uhLSmSimMSJkSXU383qFTtl0R--
