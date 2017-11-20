From: Alban <albeu@free.fr>
Subject: Re: [PATCH] gpio: ath79: add missing MODULE_DESCRIPTION/LICENSE
Date: Mon, 20 Nov 2017 22:55:44 +0100
Message-ID: <20171120225544.044ddde2@tock>
References: <20171120205426.83707-1-jc@linux.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/vUcVENQK3/DjLezm0dPtEGt"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171120205426.83707-1-jc@linux.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jesse Chan <jc@linux.com>
Cc: Aban Bedel <albeu@free.fr>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

--Sig_/vUcVENQK3/DjLezm0dPtEGt
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 20 Nov 2017 12:54:26 -0800
Jesse Chan <jc@linux.com> wrote:

> This change resolves a new compile-time warning
> when built as a loadable module:
>=20
> WARNING: modpost: missing MODULE_LICENSE() in drivers/gpio/gpio-ath79.o
> see include/linux/module.h for more information
>=20
> This adds the license as "GPL v2", which matches the header of the file.
>=20
> MODULE_DESCRIPTION is also added.
>=20
> Signed-off-by: Jesse Chan <jc@linux.com>

Acked-by: Alban Bedel <albeu@free.fr>

Alban

--Sig_/vUcVENQK3/DjLezm0dPtEGt
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJaE09hAAoJEHSUmkuduC28L5IQAM7SsplFMS2Kn5ztMC6sVDUF
tiLAJ8U4TVwD3XbwrbSZmSZ2MFsrWxZwBOoXwPETiDHcWYzZo4KA7bmSp7tWiVh/
rjbCVkCyQf112ZDAYnpRrXKaUS4daZWww5nqG+f3UBCXe0zqggvunK/xYNjTeE2K
vkMTqmGjH4TsMP1QVXRsreossAgSepHcs8GNGYJLxCdOMhk6GModlXG3+ddeDIto
pxIXcnnLvgxe359YnHt2zc02h4Hbbos7Yh/C6LyCOd+8/Sna9euxNY18wxMagoGl
J3C639GtGoa4/n/eTErmlRIKEQFe/KB142WW/+EH5JbhXMXT3hD8vqjI3+96U/kD
3E9kBJeNefdDv0wOKFzkc1KXnooeSxJhaJECsbuS0liPdsR0UHfOO01CTr30lCa2
nMnF8TAb57zf7zXxTV0Pywqvj/KU5iKOTZGilj0fZl8V83XZCtzxVsiSetLp3iNQ
kp4uXpt9+UC69adcr6jZsq4Eh/KyQ1cQC0wU/YON3MGMJTfDOvLLNRHbUWHpvkfC
Z5kr6QVSiLMBNnQPq5J58C/1xFiV1n4/1kL8+ef2AzFMjMPZpauLqluTd7k68G7G
VMrz95yWFc1HIqnRGTzduNj/+pbXBKVMHyThTekkTeWHhhOivcr530n76ZQjIZbB
590Wsmz3UseQZBNr+cnb
=ZKKx
-----END PGP SIGNATURE-----

--Sig_/vUcVENQK3/DjLezm0dPtEGt--
