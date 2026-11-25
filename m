Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795645551;
	b=rVsThWztF8Eb+K0oaMmHzXHdaFHMUYp5E3AfOBUQh+RGLG+93S6f1Cp+K7TAMM3nPsj6
	 434SREiZZ9TQnqnXURHsJ60kCuPoOH7YdUmD5lxxeRXYL99O1qWJ+kjMdkicoZg0Cbk/g
	 zdqAWAxp6B9z3liBpNeTVF9S/jZOPzNzcEOJC3sBAS9HfkTKKBWuoCdufSwJVjgIQNEyZ
	 K2Xndre3HPdoRxzvza4PHWnOq9BHdG5pft4vXdJYcjruxRSCxJ+A23fLnaXlEUuLZJ9tu
	 od6g7/LyHg1/wDsXBPAJzmYvoXOLBL6eZtArr4N8ASt01Z40N2r+u3dnidjo7WcHBEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795645551;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Ad4P++K9bZno9nuh/iuXN/ynLGwKsplQDt7xu5Ult50=;
	b=QADR46oSEPD04XE1E1QFKPKHnFKkLyTWm0IRN086BZf0yHsLirpKom9d3cdrfu5ih0gc
	 iQsC1yIvvFifSljwcgQ5J982gZVfyStM6GVuZgQ0RyFnVZbD7pyDFUknIM5LfmARXPqLT
	 3ELGcRzZ85EC6pzGEq24MhBgdzkhMtCtVBDbLw2vccvyE7IgWKAnQwPf2flJBu+0Dy8pp
	 nrDjNTimlgpw90khc+ht2nHHnwUe2W5fqF84HCR3a+sfMUjDbeYG4X85kJn5S8PTbVuym
	 UmBbCVnoSzle7R+narKzeCPxhUapXGbei0ZYX3op9faER3ePx31cR/W68RQf8DR/FtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fdKAVexZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DD44606A68F;
	Wed, 25 Nov 2026 22:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fdKAVexZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F1401F000CF;
	Wed, 25 Nov 2026 22:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795645550;
	bh=Ad4P++K9bZno9nuh/iuXN/ynLGwKsplQDt7xu5Ult50=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fdKAVexZQ0L7i4VMtZNnbZj0u9gLORGix1gaqorQIvmRy1rjiX7Z2zqyhst270ycP
	 +kVnz+oR6vsY3X6xmm1aUNOHbNHqaaPLXsMUsyagpUcV9LzYyGEAMLQAfyjwlJyMEM
	 ENDm6Vs8gPe15wRhgZSBWMIcEgespAFjnuf2TrAODE2EwLY3dTRlRp9NvSQpaZyc4S
	 CtsH3x0xJ9+eWIDCsv72z/RtwlA8wlPT9actG3zumikecnZRKKEBP8dHWm55HjGoyq
	 9qU2LU7isgW1TnSQvuKuiuD067cj5kmO3lkv1QO0P7jIo01+wKnYmcpHL+2Qa4uCek
	 CwDdBt6Fexc9w==
Date: Wed, 25 Nov 2026 23:25:47 +0100
From: Alejandro Colomar <alx+linux-hardening@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Alejandro Colomar <alx@kernel.org>, devicetree@vger.kernel.org, 
	linux-gpio@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH v7 2/4] string: Add strprefix()
Message-ID: <awdf5dYKbpkbjSif@devuan>
References: <cover.1795639368.git.alx@kernel.org>
 <b32d70163fb454fee2667548c63c4d4d3b19d7bb.1795639368.git.alx@kernel.org>
 <sashiko-outbox-234163@kernel.org>
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
	protocol="application/pgp-signature"; boundary="6gr5d72eivgopjii"
Content-Disposition: inline
In-Reply-To: <sashiko-outbox-234163@kernel.org>


--6gr5d72eivgopjii
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx+linux-hardening@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Alejandro Colomar <alx@kernel.org>, devicetree@vger.kernel.org, 
	linux-gpio@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH v7 2/4] string: Add strprefix()
Message-ID: <awdf5dYKbpkbjSif@devuan>
References: <cover.1795639368.git.alx@kernel.org>
 <b32d70163fb454fee2667548c63c4d4d3b19d7bb.1795639368.git.alx@kernel.org>
 <sashiko-outbox-234163@kernel.org>
MIME-Version: 1.0
In-Reply-To: <sashiko-outbox-234163@kernel.org>

> Date: 2026-11-25 21:11:26+0000
> From: sashiko-bot@kernel.org
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Low] string: kernel-doc parse failure on strprefix() due to
>   __nonnull_args()
> --
>=20
> commit d8e472e1906ee21263f127c3c8452f752cbf8121
> Author: Alejandro Colomar <alx@kernel.org>
>=20
> string: Add strprefix()
>=20
> This commit introduces strprefix() to return a pointer after a matched
> prefix or NULL on mismatch, and adds KUnit tests for it.
>=20
> > diff --git a/include/linux/string.h b/include/linux/string.h
> > index 9b3e578d9aca1..a6a1953c52e35 100644
> > --- a/include/linux/string.h
> > +++ b/include/linux/string.h
> > @@ -557,16 +557,34 @@ void memcpy_and_pad(void *dest, size_t dest_len, =
const void *src, size_t count,
> >  	       sizeof(*(obj)) - offsetof(typeof(*(obj)), member));	\
> >  })
> > =20
> > +/**
> > + * strprefix - string prefix
> > + * @s: The string to be tested
> > + * @prefix: The string to see if @s starts with
> > + *
> > + * This function determines whether the string pointed to by @s
> > + * starts with the sequence of characters
> > + * (excluding the terminating null character)
> > + * in the string pointed to by @prefix.
> > + *
> > + * Returns:
> > + * *  @s + strlen(@prefix) if @s starts with @prefix
> > + * *  NULL if @s does not start with @prefix
> > + */
> > +__nonnull_args(1, 2)
> > +static inline char *strprefix(const char *s, const char *prefix)
> > +{
> > +	size_t len =3D strlen(prefix);
> > +	return strncmp(s, prefix, len) =3D=3D 0 ? (char *) s + len : NULL;
> > +}
>=20
> [Severity: Low]
> Does __nonnull_args(1, 2) cause kernel-doc to fail when parsing
> strprefix()?
>=20
> CTransforms.function_xforms in tools/lib/python/kdoc/xforms_lists.py does
> not strip __nonnull_args, so running scripts/kernel-doc on
> include/linux/string.h (included by Documentation/core-api/kernel-api.rst)
> treats __nonnull_args as the function identifier, emits prototype mismatch
> warnings, and omits strprefix() from the generated documentation.  Either
> __nonnull_args could be added to CTransforms.function_xforms or
> __attribute__((nonnull(1, 2))) could be used as in strends() below.

What should I do?

--=20
<https://www.alejandro-colomar.es>

--6gr5d72eivgopjii
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmsHYGsACgkQ64mZXMKQ
wqlpKg/9Eg0tDNXXExM29Z6o0EEbgZkPiV8zGzA+W2gFStSX2ytVV5p/W0iWfitx
rYaH++VwGTz1qUip3YjGMhVUtAC6sFpVCoEO/dMUuP45kcAKOdsxQwoFnFI2ABRz
lNdQO1Cq3sgRH6IHf33aOEyo3HXRdhFHccoM68forOp6eH18j8ZU7Wa0eOEiiqXM
e8zsso5oTGGssXsd69kxXCrZ23Nba1UmYmKNg38lbDdwYAVjZQmB9p/2lO/gCKK1
E5gqbonvrJNcW7uIz5t9iIWZkH8+mzbrt6gMW2SXnoC24hh2nFOh6zBK5uZrCwdB
x10XKPa6VwJrG2l7vwHynwFocImWWXsdrTZ+xsFnPOXncoT0WLdA3zjEAApPkiSO
JOU2GLjfttDsJ+7FsIsCEflTq1U6TjCOXk1qeGydizVm6PXl9V0Qq/h2SVklxQb5
j/eOyevhRvR4gZ81bhqk0hsYw1xgNbMoN//5jH58h5nHt9AglfBVNqDV5RReYqwN
kPwS936GvfyHY9PWLZC78gtlLWcesv1y3DYaHMezHAGU4V48mKWtvDCYZx2ZFSr5
qJHHlt+5nsf0wm50OlkLwK+IdG1f2U/XQVfIxg1sdsh/BpqTFBUOjc96ZjvB7fiu
+uAdetRMOsvgJsy1HkMp8v+zSaN4dfQGmFvjnbl5T4z/nozwLdQ=
=lbBO
-----END PGP SIGNATURE-----

--6gr5d72eivgopjii--
