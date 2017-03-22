From: Felipe Balbi <balbi@kernel.org>
Subject: Re: [PATCH v1] usb: dwc3: pci: Switch to devm_acpi_dev_add_driver_gpios()
Date: Wed, 22 Mar 2017 16:35:41 +0200
Message-ID: <87poh9tm4i.fsf@linux.intel.com>
References: <20170322140807.34332-1-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:36923 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1759133AbdCVOhQ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 22 Mar 2017 10:37:16 -0400
In-Reply-To: <20170322140807.34332-1-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-usb@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Andy Shevchenko <andriy.shevchenko@linux.intel.com> writes:
> Switch to use managed variant of acpi_dev_add_driver_gpios() to simplify
> error path and fix potentially wrong assignment if ->probe() fails.
>
> While here, add a debug message in case assignment fails to allow user
> see the cause of a potential issue.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Felipe Balbi <felipe.balbi@linux.intel.com>

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAljSi70ACgkQzL64meEa
mQaOQxAAxPz2ykTHleJHb/PMtrpIJuLKpgMq2zOVIpgb/x//kWAkoUCyOekZwp4g
GaTsj0jX4l6+Ej8tb1V+Wfw0XJb0Ei6JeSLxRzpei6xCAouQqxzHiyl9qF1AYniJ
vXCfoYjaN1OAa2OSH23IuMuDvEXEtVTDwisZkDCdx87O9MeD0aWDpBS9xucnoZph
auOstB1a1y4PbGCn6RqxDX28JvWYmdn0lEKJXVio62RHlT3ihzpfcD1SiCnO/95S
ifi0Zxe54K+4EeGx3rrXOqHYkSIHRJiLZKcg1Lr+6qGgw0ax1Y9Pb4SZuFHWe5Pd
WLiPjxCX9aAbVf9IoTAMiTlbnjgH/wNl4u7tXWaXmDjPwLum+FVuAXPGu6i1qdEN
m/nL5cyRnol2ptidF5XH5mzSCJegkaIoUbfLKkc8Lo8Nr2YmsaiZk1DB+61qyXBu
+AABACpMuoTSno8ueQKmQuTJahfFWQS6Dv3iYCUuZ3+cVwaelIM1YBbQRKC1Vs49
Cmu42OTuFqM91dMMMl8kLI5n84HIKaiIfMkk8TlOic9QU6UqnkYyMKGhqUBIa4gr
vTkmA5pEyUbfJGbHJxx9MGPRtOU+535Gv/09Q1PGcQ0h6ywyp4MyV2YVbNSW5tEJ
8q25kb5DwBwQKNz191TS1lLDByotL9CsCvvt4rmLqeg1WPu/JaY=
=LEtL
-----END PGP SIGNATURE-----
--=-=-=--
