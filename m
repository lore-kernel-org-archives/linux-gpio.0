Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795705699;
	b=y5rYad9uxGu2jL0j5DfLRmK/+6BGr3c3VQ4e2eog29pzyqsnqBJcBQ2M9wjnhm+d5j1p
	 DzeeDYe9DBCzd7SWcp0lZNWIrgxaap9ClaDJQQfpidANy7wOwkBMQM9DNdehDjLQSE6en
	 J+A8b9stCgxDRegakM7jFZBu1/n2ihhs9lWKMMdC0rkJGtV1O4wW2xkapNR5OlaeL4crT
	 dyWa0NzUDPjDwo7HH0ELKS2mOoHpMMw89NkXe4JlKhfGvFPpZHRbFybFh/3Qr8qlXQOex
	 mAMjJAOPewYp1ijTiNnQjwxS9ggFAPoiFcom4CF2bHmRxRfRke5OrfLgrDWi4oiPa+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795705699;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=+8mHhuyRGBienp5Z4jF5cURV7IVfUw0cOGcAu0AzJuw=;
	b=fTkcJtoixJFDI7rTLwyJzNlikP/o6LyfEV/R4VFaeHASlGRLk663pKD3WbJKaFVIO7VP
	 u1t3vOfCV42WQxW7Mt1UQIdNzUYFB9onnOiaLwQ3CYBJZwvH8za3rsNzN441nzngU+qGM
	 Ck1Vmf88E0CqYPrufx2NcSaFoK9plqKnVZImQZRCeGqrSYsr2ZuQYjKbid908++t/zf5V
	 K0oeBb09aIIE0JQBUkD5mXnHxRE5MiMr8SN0iTGMiSaATDpV5S4kxUJ0IOGQSs7SDYMDA
	 0yM9EaC4nY8Q0HYN+lW8jbyiZKvG5eBtDqOkiyZKMHB2bUJYM6pGGm+oeGJQ0WRcquQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iG2FJGI4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B571A606A329;
	Thu, 26 Nov 2026 15:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iG2FJGI4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB1871F000D8;
	Thu, 26 Nov 2026 15:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795705699;
	bh=+8mHhuyRGBienp5Z4jF5cURV7IVfUw0cOGcAu0AzJuw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iG2FJGI4fYfCoJIL6Xs1q1wbMpl9HN1qqDU4CdkQ2uVrTwxCbelY46rs3Sg/W7h8Y
	 nu1a+W1wkLeiGudZr1oaiXt0bST518RKtphG0FOgD3iGc5bGZ1A7YlDZDMdz0D5/jK
	 j1slTRZIvxMR+2MkysS9g1HQjROiNx0b05UEXQ/B+sBl11Q8NZa7RpMNdSUZb13xq8
	 JiWXIqHOcdNt7v7/Y45OSslo8Gd/NQuukuYAFY22Vqu1WdnMHXcAFkofAfNBoYyDVE
	 8H6mTlAssVHjaAV40rjaszsX2g4WKnI+pJsRwbQZqLJ39HmPI4wvDPJa4AhbysQFyS
	 eATclc8tf7zTw==
Date: Thu, 26 Nov 2026 16:08:15 +0100
From: Alejandro Colomar <alx+linux-hardening@kernel.org>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: sashiko-reviews@lists.linux.dev, Alejandro Colomar <alx@kernel.org>, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH v8 2/4] string: Add strprefix()
Message-ID: <awhLO8IijdM_tef3@devuan>
References: <cover.1795695151.git.alx@kernel.org>
 <a688f0a1c20afadeed42ec4645b44de75874c223.1795695151.git.alx@kernel.org>
 <sashiko-outbox-235501@kernel.org>
 <awgmuC_BnyaEpTXD@devuan>
 <paz72vxna4f5kwp2a7waztsnywzwgbwqtpjxjgy6sm7j256bbs@lsr2jbx5paji>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jsyxl2au357i7gym"
Content-Disposition: inline
In-Reply-To: <paz72vxna4f5kwp2a7waztsnywzwgbwqtpjxjgy6sm7j256bbs@lsr2jbx5paji>


--jsyxl2au357i7gym
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx+linux-hardening@kernel.org>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: sashiko-reviews@lists.linux.dev, Alejandro Colomar <alx@kernel.org>, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH v8 2/4] string: Add strprefix()
Message-ID: <awhLO8IijdM_tef3@devuan>
References: <cover.1795695151.git.alx@kernel.org>
 <a688f0a1c20afadeed42ec4645b44de75874c223.1795695151.git.alx@kernel.org>
 <sashiko-outbox-235501@kernel.org>
 <awgmuC_BnyaEpTXD@devuan>
 <paz72vxna4f5kwp2a7waztsnywzwgbwqtpjxjgy6sm7j256bbs@lsr2jbx5paji>
MIME-Version: 1.0
In-Reply-To: <paz72vxna4f5kwp2a7waztsnywzwgbwqtpjxjgy6sm7j256bbs@lsr2jbx5paji>

Hi Bart,

> Date: 2026-11-26 16:06:56+0100
> From: Bartosz Golaszewski <brgl@kernel.org>
>
> On Thu, Nov 26, 2026 at 01:32:17PM +0100, Alejandro Colomar wrote:
> > > Date: 2026-11-26 12:27:03+0000
> > > From: sashiko-bot@kernel.org
> > >
> > > Thank you for your contribution! Sashiko AI review found 1 potential
> > > issue to consider:
> > > - [Low] string: kernel-doc parse failure on strprefix() due to
> > >   __nonnull_args()
> > > --
> > >=20
> > > commit fa176bccb75ab1dcd9cc8e153bcc5112c790bc7c
> > > Author: Alejandro Colomar <alx@kernel.org>
> > >=20
> > > string: Add strprefix()
> > >=20
> > > This commit adds the strprefix() helper to return a pointer after a m=
atched
> > > prefix or NULL on mismatch, along with KUnit tests.
> > >=20
> > > > diff --git a/include/linux/string.h b/include/linux/string.h
> > > > index 9b3e578d9aca1..a6a1953c52e35 100644
> > > > --- a/include/linux/string.h
> > > > +++ b/include/linux/string.h
> > > > @@ -557,16 +557,34 @@ void memcpy_and_pad(void *dest, size_t dest_l=
en, const void *src, size_t count,
> > > >  	       sizeof(*(obj)) - offsetof(typeof(*(obj)), member));	\
> > > >  })
> > > > =20
> > > > +/**
> > > > + * strprefix - string prefix
> > > > + * @s: The string to be tested
> > > > + * @prefix: The string to see if @s starts with
> > > > + *
> > > > + * This function determines whether the string pointed to by @s
> > > > + * starts with the sequence of characters
> > > > + * (excluding the terminating null character)
> > > > + * in the string pointed to by @prefix.
> > > > + *
> > > > + * Returns:
> > > > + * *  @s + strlen(@prefix) if @s starts with @prefix
> > > > + * *  NULL if @s does not start with @prefix
> > > > + */
> > > > +__nonnull_args(1, 2)
> > > > +static inline char *strprefix(const char *s, const char *prefix)
> > > > +{
> > > > +	size_t len =3D strlen(prefix);
> > > > +	return strncmp(s, prefix, len) =3D=3D 0 ? (char *) s + len : NULL;
> > > > +}
> > >=20
> > > [Severity: Low]
> > > Does __nonnull_args(1, 2) break scripts/kernel-doc parsing for strpre=
fix()?
> > >=20
> > > CTransforms.function_xforms in tools/lib/python/kdoc/xforms_lists.py =
does not
> > > strip __nonnull_args(), so kernel-doc mistakes __nonnull_args for the=
 function
> > > identifier when processing include/linux/string.h (included by
> > > Documentation/core-api/kernel-api.rst), emitting prototype mismatch w=
arnings
> > > and omitting strprefix() from the generated documentation.
> >=20
> > As said in v7, I don't know what to do with this.  Any comments?
> >
>=20
> I don't have an answer but my clanker pointed me to commit b6b0adb6c845
> ("docs: xforms_lists: support __nonnull_args()") as the right fix. It's
> in linux-next so you can add it to b4 deps and sashiko will pick it up
> and should stop complaining.

What if I don't use b4(1)?  :)
I guess I can just safely ignore it, right?


Cheers,
Alex

>=20
> Bart

--=20
<https://www.alejandro-colomar.es>

--jsyxl2au357i7gym
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmsIS18ACgkQ64mZXMKQ
wqnRJxAAvdeECMbp2/k4PK3DL14ICbg0Og0fHEvvzglAUWB9PFH2eSuSm3Ln5brp
yTZCE3whFZ/o/Rx8ehg++6tX408xQMbZowqp0eNnZy2ledN5mECUw5At2EN5v3gZ
RpycJSpn0KtwEnRV9vdnf8Q2mRY2gx85igzODaZOCmx0k1pUT8rI6H9p9n7O/xjV
zEtU9AW6lDhNqoMVLGYpy1hKNpjG/UXVV7APDCtDRFftNN2DlUnQUesmOFmEmjQg
3rqpULRFCOtRcYEcLucQvOBu+NsVA9jL2WyasW88ahdZDILJjYjWKtuwEtsEU0OL
SEmMerLtztgNhlUM2Pn2AqDixyT3q2cKeX0zzBxzf9ya6hyxJKQNpRhk6oRhEYZK
Ic6fEVB3IX8dChYVqQHFX+/5l9nkt0i28q4yx4ezKV9RuevqCmNTJY3vgWiTFDjM
bh+0bAsSQ5VkIqd3YZ3cOOmeESup+tf2DedpIvdENkrzItGsg/bAfsvPSWe4evZ+
nmOjs3g21JF7HX6wouj6RkxYWVh9WvJb8oHJ8lCiWrb3ZB3WssQUjR3qUY5REgYu
YN3WsF/KELSndyfwit5Xr1hThCzCd3H+unERpyQTNDJcZiaCL/2j0Zv2ilxvDSCc
h7q6X1+m7trpLf5UgRlZSlPaTXoSwSW+RGUE/rWFM/OY+xi5xa0=
=jpT8
-----END PGP SIGNATURE-----

--jsyxl2au357i7gym--
