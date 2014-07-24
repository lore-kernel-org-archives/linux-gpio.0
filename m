From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 0/2] pinctrl: sunxi: misc improvements for gpio
Date: Thu, 24 Jul 2014 14:57:50 +0200
Message-ID: <20140724125750.GY20328@lukather>
References: <1405358677-23657-1-git-send-email-wens@csie.org>
 <CACRpkdZhZkB6=_ehVXxWAnvkVYy_KOU84fcGRSRTc9-2X2paqQ@mail.gmail.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1olvqv+k0f6DP9aD"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBXUGYSPAKGQEKHIWHCA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdZhZkB6=_ehVXxWAnvkVYy_KOU84fcGRSRTc9-2X2paqQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: linux-gpio@vger.kernel.org


--1olvqv+k0f6DP9aD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 22, 2014 at 06:33:10PM +0200, Linus Walleij wrote:
> > AFAIK pinctrl pin numbers are device specific, so I'm wondering if we
> > should also number them in terms of offsets, rather than absolute pin
> > numbers. It's more of an asthetic change though. Any thoughts?
>=20
> Usually I say these pin numbers should try to match what is
> in the data sheet so it is easy to understand and debug. Sometimes
> pins are numbered with letters and stuff so they rather have names
> than numbers, then some artificial numbering is applied, whatever
> is helpful.
>=20
> I'm not directly familiar with the sunxi numbering system though...

I'd prefer if we had an absolute number that more or less matches the
one in the datasheet.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--1olvqv+k0f6DP9aD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJT0QLOAAoJEBx+YmzsjxAgmbUQALojCNA5aPjdnTT6wiRt180S
dUOIeXrI1dNI93G6QteHB0el/6qq4wH3XFZuGdVhDZPhk8KictBo/4yRZxhNiwSm
jrWtiW7zuCPDV8sBNxvmNlDGPg2T0Z0NsE1AwU/BmQcwqCYkhR3b2cilo9hmI3+2
VvmvVpwoFog1W8BMGqx0Y3yTfIFlwa/syNnBwFmf5IliOztp6GCEdNIaknFaY2RE
SpP2YMATfodHnMj3znmok2kvUiQ/BHIATxdj9yQkisjr2OTiMy1IP02miFvotMZZ
dykVMT9ENI4NSv169NvGgxmhxYaxg3aj6SJgHn+/gVwh9oGiBKJM3hnS79I8c1hu
aHnntgxRykNhWYE6umwsnWIIISY5TD/pr8HaLerwQjoirpm491KyPQmZ0ZZYs7BH
NcPUFXg8cnK3zV3qFR8CgSOlrOsyV1gN034Ty6p19JowaSuDs+g7wTWncE6FoQSw
NI1dUVOlgn7547/hStilHbsbM3Aok2vG1Eo/TFyyCDKVdCyq4aBCMpo2NKkhBNOq
LbZj+lmDjVOLa9oi1G9iNxh0jO/xSSQc0Cy6OsT0bazggvXjh0l3pVxRMymLt5yj
sDJ8gOaswshn5VMMalAUfkfuxfTAHenCDRG/rOpHyxjDYZgUJwvW05ktnYUpf0Sa
iwgUtja7mBjyJudVzPAr
=rzrA
-----END PGP SIGNATURE-----

--1olvqv+k0f6DP9aD--
