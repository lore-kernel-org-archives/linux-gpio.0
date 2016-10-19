From: Alban <albeu@free.fr>
Subject: Re: [PATCH 1/2] gpio: ath79: Fix module autoload
Date: Wed, 19 Oct 2016 19:10:22 +0200
Message-ID: <20161019191022.7079044b@tock>
References: <1476823442-31104-1-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/QZKeI09BDgf_//tQ+PY6Ws1"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1476823442-31104-1-git-send-email-javier@osg.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>
Cc: Aban Bedel <albeu@free.fr>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
List-Id: linux-gpio@vger.kernel.org

--Sig_/QZKeI09BDgf_//tQ+PY6Ws1
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 18 Oct 2016 17:44:01 -0300
Javier Martinez Canillas <javier@osg.samsung.com> wrote:

> If the driver is built as a module, autoload won't work because the module
> alias information is not filled. So user-space can't match the registered
> device with the corresponding module.
>=20
> Export the module alias information using the MODULE_DEVICE_TABLE() macro.
>=20
> Before this patch:
>=20
> $ modinfo drivers/gpio/gpio-ath79.ko | grep alias
> $
>=20
> After this patch:
>=20
> $ modinfo drivers/gpio/gpio-ath79.ko | grep alias
> alias:          of:N*T*Cqca,ar9340-gpioC*
> alias:          of:N*T*Cqca,ar9340-gpio
> alias:          of:N*T*Cqca,ar7100-gpioC*
> alias:          of:N*T*Cqca,ar7100-gpio
>=20
> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>

Acked-by: Aban Bedel <albeu@free.fr>

Alban

--Sig_/QZKeI09BDgf_//tQ+PY6Ws1
Content-Type: application/pgp-signature; name=signature.asc
Content-Disposition: attachment; filename=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJYB6j+AAoJEHSUmkuduC28lI0QAJmH0xRn8n9eGS5+LNjtpdLo
bZ5R/CuJdSg4YFsa6ycubUMYjjp8Zht/4yvmKAviPdwHFBTiOaqoxDE0zT2TsY8H
iqy6lVixOmVOBSbWU3VwsyLm0RvRB98xjkIrgd0Tiq1UaRBdTXI2uXgo+tE5/nN+
w+bc9AWcU7rmE3QFXSGWxefEGSYmV6VrztuLk6rZCj17VwbL80JMgZim4aLo9xqC
urGtU159/4e6l855wpnJLpVDtj+F+AbgN0c98Kdqb3MYMheTczlG3EpIuhjUAZGB
2NXdPjapacHw4WcrIsKZ97iSwK8NiDDmEQmFV3NWZZS8dEAwRwnX544iWFt6nPcm
lNbJ3+3dPiXPf5bU3ryzq6WMTjEzcGWiar0qIgOES5q27/HdDnAgpDKPCtJpejlf
dZN2rUpOarmISPduR3oueeBCWPVJ9EZys+WGfQU1aQs5+A2t6VmOojOb/81rRO6x
RMolR+FaqcoE5nAghh8zyVYNfyKJ4g31ZhnluUTmOHSCfaM8OhKt17zRL9ty+xqJ
dSbd2EonaeUM9PAhyflaQQhLr3vHza+7DEZo3y5rH/ziS8mLim4QhQuvOACPkgdl
mimBhbkq0irzsAHN09MzLZ2m3wXd4N0dUfjCo+Va5wa/6ZqrW1anCex7oQI6adVd
KG7DGbxmZU6PsKGDPxXG
=sBRQ
-----END PGP SIGNATURE-----

--Sig_/QZKeI09BDgf_//tQ+PY6Ws1--
