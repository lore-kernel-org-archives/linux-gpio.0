From: Michal Simek <monstr@monstr.eu>
Subject: Re: Getting gpios from user space based on gpio-line-names
Date: Tue, 4 Jul 2017 12:57:29 +0200
Message-ID: <29fa2aeb-9b5c-746e-66af-e441163c62d9@monstr.eu>
References: <6fc9ba3b-982c-d17d-3d5f-16b486f3ca5a@monstr.eu>
 <CAMRc=MdPNMQu27RWGW6D+um4yD+BBnut3Bfy0hC0CUprm99q=Q@mail.gmail.com>
Reply-To: monstr@monstr.eu
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="PJrxNQvfBrxiEAbPCu9wxDs4WSURjhIAB"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f46.google.com ([74.125.82.46]:37186 "EHLO
        mail-wm0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751910AbdGDK5g (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 4 Jul 2017 06:57:36 -0400
Received: by mail-wm0-f46.google.com with SMTP id i127so134436587wma.0
        for <linux-gpio@vger.kernel.org>; Tue, 04 Jul 2017 03:57:35 -0700 (PDT)
In-Reply-To: <CAMRc=MdPNMQu27RWGW6D+um4yD+BBnut3Bfy0hC0CUprm99q=Q@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--PJrxNQvfBrxiEAbPCu9wxDs4WSURjhIAB
Content-Type: multipart/mixed; boundary="KhwhRfk4VmCBtnVtedx69mhfJhHBhJx0t";
 protected-headers="v1"
From: Michal Simek <monstr@monstr.eu>
Reply-To: monstr@monstr.eu
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>
Message-ID: <29fa2aeb-9b5c-746e-66af-e441163c62d9@monstr.eu>
Subject: Re: Getting gpios from user space based on gpio-line-names
References: <6fc9ba3b-982c-d17d-3d5f-16b486f3ca5a@monstr.eu>
 <CAMRc=MdPNMQu27RWGW6D+um4yD+BBnut3Bfy0hC0CUprm99q=Q@mail.gmail.com>
In-Reply-To: <CAMRc=MdPNMQu27RWGW6D+um4yD+BBnut3Bfy0hC0CUprm99q=Q@mail.gmail.com>

--KhwhRfk4VmCBtnVtedx69mhfJhHBhJx0t
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 3.7.2017 15:06, Bartosz Golaszewski wrote:
> 2017-07-03 15:01 GMT+02:00 Michal Simek <monstr@monstr.eu>:
>> Hi,
>>
>> I am trying to find some docs about how to ask for gpio line
>> based on gpio-line-names in DT. I see line names available via debugfs=

>> which is not suitable for production.
>> And also I didn't find a way how to ask for gpio Linux number from use=
r
>> space to start to work with them.
>> This is for gpio mraa integration which depends on Linux gpio line num=
bers.
>>
>> Thanks,
>> Michal
>>
>> --
>> Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
>> w: www.monstr.eu p: +42-0-721842854
>> Maintainer of Linux kernel - Xilinx Microblaze
>> Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP ARM64 SoCs
>> U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP SoCs
>>
>>
>=20
> Hi Michal,
>=20
> you can try libgpiod[1] and specifically the gpiofind tool included in
> the repository. Buildroot has this package should you need to build a
> rootfs for some specific target.
>=20
> Best regards,
> Bartosz Golaszewski
>=20
> [1] https://github.com/brgl/libgpiod
>=20

Thanks. That's what I was looking for. I knew that there is new
interface but didn't have this link.

Thanks,
Michal


--=20
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP SoCs



--KhwhRfk4VmCBtnVtedx69mhfJhHBhJx0t--

--PJrxNQvfBrxiEAbPCu9wxDs4WSURjhIAB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAllbdJ0ACgkQykllyylKDCEz/ACeNFAym0SnjJE2tp1yDtOJsEfw
iNIAniAQzE0QW6dCcH6QHhOHJWztEgbu
=Vq1d
-----END PGP SIGNATURE-----

--PJrxNQvfBrxiEAbPCu9wxDs4WSURjhIAB--
