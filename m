From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 2/2] pinctrl: sunxi: number gpio ranges
 starting from 0
Date: Thu, 24 Jul 2014 18:01:41 +0200
Message-ID: <20140724160141.GZ20328@lukather>
References: <1405358677-23657-1-git-send-email-wens@csie.org>
 <1405358677-23657-3-git-send-email-wens@csie.org>
 <CAGb2v64mZjmB+ftQ7yM5LzhUyPVGtCXq6DOUQ-pumLb73_DYLQ@mail.gmail.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="XLRYXLjFvhZHhWey"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBPG5YSPAKGQEYXEAEUA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAGb2v64mZjmB+ftQ7yM5LzhUyPVGtCXq6DOUQ-pumLb73_DYLQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: linux-gpio@vger.kernel.org


--XLRYXLjFvhZHhWey
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 24, 2014 at 09:19:18PM +0800, Chen-Yu Tsai wrote:
> > This patch also changes the GPIO bindings for R_PIO:
> >
> >     gpios =3D <&r_pio B N flag>;
> >
> > Where B originally was the pinbank label (L or M) counted from A,
> > with this patch it becomes (L or M) counted from its pinbank base (L).
> >
> > Thus
> >
> >     gpios =3D <&r_pio 10 11 0>; /* PL11 */
> >
> > becomes
> >
> >     gpios =3D <&r_pio 0 11 0>; /* PL11 */
> >
> > IMO this is correct, as the binding shows the bank offset and pin offset
> > within the bank for the GPIO controller. But I'm worried it might be a
> > bit confusing.
>=20
> I see you Acked this patch, but also in your reply to my cover letter,
> you mentioned that you want absolute pin numbers matching the datasheets.
> What about the GPIO DT bindings, as I explained above?
>=20
> Just double checking. Thanks.

I'd like it to have the absolute numbers in sysfs, but the relative
one in the DT. But I guess it's already what's happening, right?

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--XLRYXLjFvhZHhWey
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJT0S3lAAoJEBx+YmzsjxAgt68QAI5b4a9f3nkT+G2RN7fbTwH0
H5ZJUnapwmvCCWhZijrIVo1fxnVcv+DETWWXqTlfEAzzhMUnsdD6BTMURfhwYyTm
h7CSCEBAL1Y4VyqklJu2ICDTBGYnkkg0VUNN0lO9JuSwlgZM0kEwm/DRJVxO5AfW
mJ12WEWJbDYKipq38SZBrxzQoSBDv09spDzM7DObTvA+OAf3m2x6+KoPP1DTplHE
zf0tcBVIORgDKkFKtGCSY8LmD3PK6smL47QUV34LO6L0DrI0iBJtXv6C42IAwjmx
M5SZLn6wkFTtXzt8mIqwwWvSlLGv47JGMF1TfKyPv7kTM/ohDb71jAt+E2tjEOoN
1+zSIZABo0FqiFtQx/EQGQIHTRGTb2QyxT4juBD47F1cSLhf7reK0RR+qnqvve/F
zBdf/IDdPfuTcuZtb9dv9AaHPbwHnIeigjikVi+FhZJsYzRb483uYZ76a2bsY2Vi
55pxQOmaAiVV7l2TMP72+uQQfhvTP/8ByqeLhl2vuzDFlA62GvvJnBOKI/ek6boX
HHKYT7dbtA0RRsFt8bghYgyoTlIAyR3/gzhNVM0Rnda/WkS9FcI7grcA5A+4UW66
PWMZOyKA6bt71hmh/Ax70eFGApLxCGMecsW3145i3AKsoAepJj2EjoJQpYJDMwF+
kt6ngBraNz+D1diDe1oQ
=a75j
-----END PGP SIGNATURE-----

--XLRYXLjFvhZHhWey--
