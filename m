From: Markus Pargmann <mpa@pengutronix.de>
Subject: Re: [PATCH v2] gpio: Allow hogged gpios to be requested
Date: Thu, 13 Aug 2015 15:07:20 +0200
Message-ID: <20150813130720.GV19600@pengutronix.de>
References: <1438680424-698-1-git-send-email-mpa@pengutronix.de>
 <CACRpkdZAjWf3Echvz6Z2hTOF8Bqs=OqLKUTYc04r9vzFo727jg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="WxvyIW12Aj7m0eTB"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:32775 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751517AbbHMNHZ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 13 Aug 2015 09:07:25 -0400
Content-Disposition: inline
In-Reply-To: <CACRpkdZAjWf3Echvz6Z2hTOF8Bqs=OqLKUTYc04r9vzFo727jg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Johan Hovold <johan@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Sascha Hauer <kernel@pengutronix.de>


--WxvyIW12Aj7m0eTB
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Aug 10, 2015 at 11:26:49AM +0200, Linus Walleij wrote:
> On Tue, Aug 4, 2015 at 11:27 AM, Markus Pargmann <mpa@pengutronix.de> wro=
te:
>=20
> > It can be useful to claim hogged gpios later, for example from
> > userspace. This allows to set defaults for GPIOs using the hogging
> > mechanism and override the setup later from userspace or a kernel drive=
r.
> >
> > This patch adds a check for hogged gpios to allow requesting them. If
> > the gpio is not hogged but marked as requested, it still fails with
> > -EBUSY.
> >
> > Signed-off-by: Markus Pargmann <mpa@pengutronix.de>
>=20
> To me it feels like a new DT property "gpio-inital-value" or so
> need to be defined in addition to the hogging bindings, and that
> one just sets the GPIO up without setting the FLAG_IS_HOGGED.
>=20
> The mechanism needs to be available to non-DT as well
> of course, but it could be a first usecase.
>=20
> So instead of:
>=20
> line_b {
>            gpio-initval;
>            gpios =3D <6 0>;
>            output-low;
> };
>=20
> Note: no line-name. And it shouldn't be allowed: we don't
> know who will use this in the end.

Sounds good to me. If everyone is okay with this I could go ahead and
implement something like this.

Best Regards,

Markus

--=20
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--WxvyIW12Aj7m0eTB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVzJaHAAoJEEpcgKtcEGQQ8ucP/jdfrb1EhCEpimZYcvIErVoW
FGZOD3Kue4DtP0UfvCxgBsnQocCbywO2awpCvHgBi4ECYbGiI3DSgW5xFaluhqpM
L9i53v+bY4U2EdbEQSWYAo/Wq33hiVSoAL1D7LmGJQla/FGK/FwQrms5fJYJQt03
5qo9U7IPmzDDzcQ4YASb1yVNIhlzCrVihNNhOXt/KOTGWnl8pF0hx+nicHCqhIyb
hH6BEMipSOcbWSwyYIrr6UyNB36iXKmXBu/TTCIL98CRSOLDLsEdlKpfjxdXfUpN
pcXHeH93liYh0ZQugwj3D+srMwzMBLM0TWscTa6DpuTG0UDWgIjDxWidoYw2whfM
uWBaEVV5hRqlt16grO4NOtLwHdxh/Z7LQXY22N0j3SZ2OwuZLvHXHrFIo1ugX/I6
9tPiNScBfqU+ubSVGRBgWFIkEYOZYwhz4axfAfY3KptfNSZx4EOrpSic+CVDojA6
BL9uwYXRbdrLozDSShXURz4ap1Eu3UXBbxnG+p6uDdEv1VmT89QnMH0T32o4mrOK
jGvdmeGbfiXclL3Cts/bkBhS3mUyko7qlzeivUR8X0zbp0W+N+oPBoiA2Quxq5NI
V/YQqTm1mNp2A3ssp1qowk9vQKqUfmv6IYxuhaED22BTm0PX2XVFHprmPVrzzvSO
gxiOipq+W6M97LSR1GH2
=9NvX
-----END PGP SIGNATURE-----

--WxvyIW12Aj7m0eTB--
