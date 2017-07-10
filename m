From: Michal Simek <monstr@monstr.eu>
Subject: Re: Getting gpios from user space based on gpio-line-names
Date: Mon, 10 Jul 2017 08:45:39 +0200
Message-ID: <5a9b3163-f3fc-4d73-c2fe-1c13ad244e73@monstr.eu>
References: <6fc9ba3b-982c-d17d-3d5f-16b486f3ca5a@monstr.eu>
 <CACRpkdYSPGb5NKpj9ruOy+SGxRvcsuvCoj-7VWaMyZBnU_hLoA@mail.gmail.com>
Reply-To: monstr@monstr.eu
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="3nIi9AmF3eILWHAJPt2n7Mrf1FtGf02WG"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wr0-f193.google.com ([209.85.128.193]:34085 "EHLO
        mail-wr0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752295AbdGJGpm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 10 Jul 2017 02:45:42 -0400
Received: by mail-wr0-f193.google.com with SMTP id k67so22683405wrc.1
        for <linux-gpio@vger.kernel.org>; Sun, 09 Jul 2017 23:45:41 -0700 (PDT)
In-Reply-To: <CACRpkdYSPGb5NKpj9ruOy+SGxRvcsuvCoj-7VWaMyZBnU_hLoA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--3nIi9AmF3eILWHAJPt2n7Mrf1FtGf02WG
Content-Type: multipart/mixed; boundary="WVuSiIFXUVf0K7iRmiBrOHtaN7uU5frw1";
 protected-headers="v1"
From: Michal Simek <monstr@monstr.eu>
Reply-To: monstr@monstr.eu
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Message-ID: <5a9b3163-f3fc-4d73-c2fe-1c13ad244e73@monstr.eu>
Subject: Re: Getting gpios from user space based on gpio-line-names
References: <6fc9ba3b-982c-d17d-3d5f-16b486f3ca5a@monstr.eu>
 <CACRpkdYSPGb5NKpj9ruOy+SGxRvcsuvCoj-7VWaMyZBnU_hLoA@mail.gmail.com>
In-Reply-To: <CACRpkdYSPGb5NKpj9ruOy+SGxRvcsuvCoj-7VWaMyZBnU_hLoA@mail.gmail.com>

--WVuSiIFXUVf0K7iRmiBrOHtaN7uU5frw1
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

+Mani

On 9.7.2017 09:59, Linus Walleij wrote:
> On Mon, Jul 3, 2017 at 3:01 PM, Michal Simek <monstr@monstr.eu> wrote:
>=20
>> I am trying to find some docs about how to ask for gpio line
>> based on gpio-line-names in DT. I see line names available via debugfs=

>> which is not suitable for production.
>=20
> Bartosz library is the thing to use. There are simple examples in
> tools/gpio as well.

Will look.

>=20
>> And also I didn't find a way how to ask for gpio Linux number from use=
r
>> space to start to work with them.
>> This is for gpio mraa integration which depends on Linux gpio line num=
bers.
>=20
> Hopefully it should not need specific numbers but instead go by name.
> It'd be interesting to see how mraa properly uses this new ABI.

I was in touch with Mani and he is saying to send it within 2 days.

Thanks,
Michal

--=20
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP SoCs



--WVuSiIFXUVf0K7iRmiBrOHtaN7uU5frw1--

--3nIi9AmF3eILWHAJPt2n7Mrf1FtGf02WG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlljIpMACgkQykllyylKDCFV7ACeNR8HWQl4NlHPqy/glPIWDttE
XtAAnjJTYVsmbpSsMFNl+Dn8LxZUMKp1
=7S5N
-----END PGP SIGNATURE-----

--3nIi9AmF3eILWHAJPt2n7Mrf1FtGf02WG--
