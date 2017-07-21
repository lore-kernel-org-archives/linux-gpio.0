From: Jonathan Bennett <jbennett@cipherdyne.com>
Subject: GPIO Char device and tools/gpio/gpio-utils.c
Date: Fri, 21 Jul 2017 12:26:01 -0500
Message-ID: <546696b7-4be8-ef79-6436-d9eb0a41db52@cipherdyne.com>
References: <aa21e9a8-345d-b9db-e39c-e62d910794cc@cipherdyne.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="A4SuVefdTNDshKMvMXJL7kvJxaHIi52iF"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.cipherdyne.com ([216.58.159.84]:58612 "EHLO
        mail.cipherdyne.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752780AbdGURfg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 21 Jul 2017 13:35:36 -0400
Received: from [10.0.1.241] (199-47-118-71.fidnet.com [199.47.118.71])
        by mail.cipherdyne.com (Postfix) with ESMTPSA id 2B98F80AC33D
        for <linux-gpio@vger.kernel.org>; Fri, 21 Jul 2017 12:26:07 -0500 (CDT)
In-Reply-To: <aa21e9a8-345d-b9db-e39c-e62d910794cc@cipherdyne.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--A4SuVefdTNDshKMvMXJL7kvJxaHIi52iF
Content-Type: multipart/mixed; boundary="TOHwMGTlKgfFDdVo00a6v3bI8XVrfmXgo";
 protected-headers="v1"
From: Jonathan Bennett <jbennett@cipherdyne.com>
To: linux-gpio@vger.kernel.org
Message-ID: <546696b7-4be8-ef79-6436-d9eb0a41db52@cipherdyne.com>
Subject: GPIO Char device and tools/gpio/gpio-utils.c
References: <aa21e9a8-345d-b9db-e39c-e62d910794cc@cipherdyne.com>
In-Reply-To: <aa21e9a8-345d-b9db-e39c-e62d910794cc@cipherdyne.com>

--TOHwMGTlKgfFDdVo00a6v3bI8XVrfmXgo
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

Hey guys, I've hit an odd issue in the gpio-utils.c library, and possibly=
 the new GPIO chardev interface.  This might be a problem with the specif=
ic platform I'm using, or it's always possible I'm just misunderstanding =
how the chardev interface is intended to work.  Sorry for the noise on th=
is list, but I wasn't sure where else to ask.


First off, I'm running Fedora 26 on a Raspberry Pi 2.  Kernel version is =
4.11.10-300.fc26.armv7hl. This is Fedora's nearly vanilla kernel, not the=
 custom Pi kernel.  This kernel is new enough to have the GPIO chardev in=
terface.  I've started by playing with the tools from the kernel tree, gp=
io-hammer and lsgpio.  These seemed to work as expected, until I dug a bi=
t further, and started to find the issue that prompted this email.


The GPIO pin I'm testing default to high.  When running gpio-hammer with =
a count of 1 (-c 1), the GPIO flips off, and then back on.  Looking at th=
e source of gpio-hammer, this seems odd.  I would expect that the GPIO va=
lue should flip from on to off, and remain off, rather than reset back to=
 default.


Looking at the functions in the gpio-utils lib confirms that something is=
 broken.  The gpiotools_set function acts the same way, briefly flipping =
the GPIO pin to off, and then the pin falls back to its default.  It seem=
s that as soon as the /dev/gpiochip0 file descriptor is closed, all the G=
PIO lines are reverting to their defaults.  The code in gpiotools_set see=
ms to strongly indicate this is unintentional.


So to use GPIO pins through the chardev interface, one has to hold on to =
the file descriptor to keep the pins from reverting to their initial stat=
e.  Is this a bug, or intended behavior? =20


Thanks!

Jonathan Bennett





--TOHwMGTlKgfFDdVo00a6v3bI8XVrfmXgo--

--A4SuVefdTNDshKMvMXJL7kvJxaHIi52iF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJZcjkqAAoJEGOEl5zMghbaXQUP/i673aPzXq6FdkNPNGD+j9ZW
gKyWz+1PMjwhqNPOdAz0FfWMwpUyf6cloZ0ssbWrm0So3sQrn9SpVDdOQ7MKAAsc
kQIk4UlFe9pRFkT/KOiz5Mroan3d42MvuDhs8K3lKqNACqvQOw7VXWKYRzPhWV0n
FfCRz5KPp+fPqYm9hVpVeF3uLAsrhj53IyC2bUtMXXPNo/Tg6TELGAVqCGiY4owM
QE0Dau1VUdC5w6jjuVxaWwB3xdkPC1cAjEuEPE+/mLHLgsUxtVGKwoQsDRgyHYhh
4DyYULQCi+FYHJJspAjR4ufy6nHrsplndZTh6vCBld8uE5zawsJKBJcDPBKKuIuv
yJpPSBxSWOqd4gjIU5VRxnrxOkOhhfCC/6hLN8u5XHD0ut2aGxvb2t/MfLjnhY/h
uKcLxDE2fOzK5//8WTfcLz1/CeGYmMm1ZXD//wGp8++IaTXEhMMgmiJ6yPnnm7eU
9wDjmLeex0BHG7ICbWtf5DH3aI89GE6qYVAl5l8luV615RtkSiST8ckGGzCPGmDH
28fa+agOx21WHtCnW5AtadSPvubz5opCpSKs03aXsTNo5OxW3+gBparVxjh414WC
WMPL/L3cwdP/HLCy2iLwM2zFofg9j2qU6QraOUXhYOei2MyC5EbPXsFyVnVJLuiA
MFXp8XZIqbtyOo++r5nv
=CbUG
-----END PGP SIGNATURE-----

--A4SuVefdTNDshKMvMXJL7kvJxaHIi52iF--
