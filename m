Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795696024;
	b=O8pN2lNTP1R63TMC61e/plsFflLbJDS5+locXn2bbn1WEIgmbuNzjyyAM2SsvzRqJoFl
	 lXKohjM1LCDIhUxHmGeMY48RbGeIPfJxxAK3Hg++Qe5eG3Lq5dehk3H0oq7D76wf4lQTv
	 SxympJ9Mbr8xO7iybMPXdTPl7M689xqOAGcrbb4aU3A5PXxK2xc/Zq4b61Ac3KGpq5m8+
	 VTSlHdWKOVhmoTcdytGAPPVPZRXyuHyXRX6aado6BXWoYAwLpksLtbquC+RNNz7b7lXjX
	 G6qMWqec1t7ZPAZikOmCtr6Cp9BSCMv6fojVlgJk0/TB3VAKgCMh4IuQerFLz93n3Hw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795696024;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=buL1FiulKeK1iwhQPIEYkRhya5tcSTIzBwY4LNs6UxY=;
	b=VrVmvQzVabpMFYlkWt7WikqW+trBxW6S7yD5XFDwZouG9nj569qK71BgFr6TY6M0oSXu
	 hEy/hZw5Z5lHBFAMS+TH7a4WlK1++1p+q8cEjI55uIhB4sTszLHhdSgFN24ioMBVFyV5d
	 25qAPWcUnjvBCSTQ0XcxY/aS3twNHlqLnKCKpaYdf1ilDAQBm9CaAB2AlY0amCDvDfd+a
	 BSkk7tE0i8H6y7g+wBdMQyEKZxtz+MX2ukcnywirq04r7GDmBQmumyDadlExe0FhcGm8J
	 4GA9igpt5LGEoN2ywQDbN0eS6tn9eJJ7RaE5WHZbYj2pmj3wCl+FnZI54m6goPHdljA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LpB4evE8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8269E606A326;
	Thu, 26 Nov 2026 12:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LpB4evE8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17F701F000C6;
	Thu, 26 Nov 2026 12:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795696024;
	bh=buL1FiulKeK1iwhQPIEYkRhya5tcSTIzBwY4LNs6UxY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LpB4evE8aDeAE7OKTSNXGdJWHWSovVSKX+b0BLQfZjUofIqbw48o34TxUOzkZfRJ9
	 DtwtTrZCGeaHMRwi3NMAlAPyujXO1YzyWbyQp88SgI8ltu/eN9meQgQ/rL958JnfaW
	 kQjGn7dsXrFwGqoWyP4RFsfTalN5J0CsYlBGKJZBQnB6kVNDFXcq86KCWb3F6kqeh7
	 jWNQB3yRZXPd8DUiViUIgzdT4iVc4skkD8IMURld7zFxjRVTbDB8zBU0xOAUb5NFem
	 gkT9vzgv0+JB8rZox+hoGClb4NVnGCrw8U/KCWAWDpE7zMWzpEqVWPlMb7om+20VKk
	 mj6xNpD8GhzzQ==
Message-ID: <sashiko-outbox-235501@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 2/4] string: Add strprefix()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alejandro Colomar" <alx@kernel.org>
Cc: devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <a688f0a1c20afadeed42ec4645b44de75874c223.1795695151.git.alx@kernel.org>
References: <cover.1795695151.git.alx@kernel.org>
 <a688f0a1c20afadeed42ec4645b44de75874c223.1795695151.git.alx@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 12:27:03 +0000
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] string: kernel-doc parse failure on strprefix() due to
  __nonnull_args()
--

commit fa176bccb75ab1dcd9cc8e153bcc5112c790bc7c
Author: Alejandro Colomar <alx@kernel.org>

string: Add strprefix()

This commit adds the strprefix() helper to return a pointer after a matched
prefix or NULL on mismatch, along with KUnit tests.

> diff --git a/include/linux/string.h b/include/linux/string.h
> index 9b3e578d9aca1..a6a1953c52e35 100644
> --- a/include/linux/string.h
> +++ b/include/linux/string.h
> @@ -557,16 +557,34 @@ void memcpy_and_pad(void *dest, size_t dest_len, co=
nst void *src, size_t count,
>  	       sizeof(*(obj)) - offsetof(typeof(*(obj)), member));	\
>  })
> =20
> +/**
> + * strprefix - string prefix
> + * @s: The string to be tested
> + * @prefix: The string to see if @s starts with
> + *
> + * This function determines whether the string pointed to by @s
> + * starts with the sequence of characters
> + * (excluding the terminating null character)
> + * in the string pointed to by @prefix.
> + *
> + * Returns:
> + * *  @s + strlen(@prefix) if @s starts with @prefix
> + * *  NULL if @s does not start with @prefix
> + */
> +__nonnull_args(1, 2)
> +static inline char *strprefix(const char *s, const char *prefix)
> +{
> +	size_t len =3D strlen(prefix);
> +	return strncmp(s, prefix, len) =3D=3D 0 ? (char *) s + len : NULL;
> +}

[Severity: Low]
Does __nonnull_args(1, 2) break scripts/kernel-doc parsing for strprefix()?

CTransforms.function_xforms in tools/lib/python/kdoc/xforms_lists.py does n=
ot
strip __nonnull_args(), so kernel-doc mistakes __nonnull_args for the funct=
ion
identifier when processing include/linux/string.h (included by
Documentation/core-api/kernel-api.rst), emitting prototype mismatch warnings
and omitting strprefix() from the generated documentation.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1795695151.gi=
t.alx@kernel.org?part=3D2
