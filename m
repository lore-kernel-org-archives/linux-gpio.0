Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794325515;
	b=Ag3n192U64SaT7eBP3D1mwbuzUmkrnt5AFmr8bPSZ0PBA0EwyKSDYMdGqkMbfi10Cmd/
	 d6VQFU92M0SzSg89bvKT3jvszbwqw8rrTxsqIP7P9CGkq4D2KnTKosa4tKsProfF+Jv6A
	 Bnp4hxfKns8nyaHMaygO29VFsEb2h8cbyawHPphNqhQMW4mkByjwzfLaP++dl/5E7CjRT
	 ci1U0i43IpWyOkKILLwC1/Im/8YuOqL47K6BeS7FQjOuZ94Eg42JkgNmqVU/yQRHK+cGH
	 UiseWemiL5RppIrChmzegMccBRKLAGoCiPPGe8SgOGhFkcFybyupX12vZVG1pq0L02w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794325515;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=AeKhbRI6prKP8epvHJ19D94oCdcgo2EeMB5hyb4N2xo=;
	b=vukjLT5fR7ns8TQV++UjBLshe7CUcq4B8jzfpnwal8OeJIqgvnCMhUONp6kyE4fPoERP
	 6NPtdFaEmDz3u4GdSzBLQUQmVxcNqznaY+rbNWQWQsMDNAno9yzNRjtbMuPmIVOI/l7De
	 aYMunRLEvMzfVRrzvnJKpiFmmtICEzm40tXKyj8TyOgMkf4ruIFMxDkR491cP+U8XTN3G
	 8/HYXulfyJR9tOfTx6xWOkOsWdLxfOCMiAFubDqzmyMxgS1FkeRLLg0totTuOLav0ur5D
	 cLsNzM9jXzXZjvZetur4eSCHnjQHBl8AKRqsqZ/7S8DT7/srJY0PaQ9964FYH2cSuoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oK9onhr1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02455606C41E;
	Tue, 10 Nov 2026 15:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oK9onhr1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43B481F0089F;
	Tue, 10 Nov 2026 15:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794325514;
	bh=AeKhbRI6prKP8epvHJ19D94oCdcgo2EeMB5hyb4N2xo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oK9onhr1TljpIE63+PxSMqSZq1Ylfmg1qhC5UaR1FHv1ONAjho0TzRAu9G4GEpvWH
	 HKyws9K/MJMnAVA3vyovvsy/BRvkoV58mbLrb8vxuF5T6JR0R9wrp87OkroRp8mxi+
	 rB8uGWTetoipeKR3JT4EIrvhRNtJpF8hSEi5myYwqm/4pHB9WfRVrGppu8DtVbDa5x
	 tYnjYS65L+VDtgvwvUHRwoOI8YVkDbMhxtXmlcmNHzRxb+mQ+skU9s4DDL3KX1FUxW
	 UwLzMQqd0nmY59eGAXAr++0YPNsvTcwK8Rf+DsUw/Q3jqR5uryRuh+092G3cJovibS
	 bBu723lg7kdtA==
Message-ID: <sashiko-outbox-207285@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 4/5] string: Add [C]QChar_of() and QVoid_of()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alejandro Colomar" <alx@kernel.org>
Cc: devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <415453a31ebf1aed3b41da1a28913f5cbe58f175.1794323750.git.alx@kernel.org>
References: <cover.1794323750.git.alx@kernel.org>
 <415453a31ebf1aed3b41da1a28913f5cbe58f175.1794323750.git.alx@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 15:45:13 +0000
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [High] string: void pointer subscript in QVoid_of() breaks Clang
  builds
- [Medium] string: QChar_of() fails to compile when pointee has
  qualifiers other than Q
--

commit cea37634307d89ede7b6ca6128f006d50a90391c
Author: Alejandro Colomar <alx@kernel.org>

string: Add [C]QChar_of() and QVoid_of()

This commit introduces the QVoid_of(), QChar_of(), and CQChar_of() helper
macros in include/linux/string.h to support qualifier-generic string macros.

> diff --git a/include/linux/string.h b/include/linux/string.h
> index 3a70ba9ed3021..cb096e9eb9835 100644
> --- a/include/linux/string.h
> +++ b/include/linux/string.h
> @@ -14,6 +14,36 @@
>  #include <linux/stdarg.h>
>  #include <uapi/linux/string.h>
> =20
> +/**
> + * QVoid_of - qualified void of
> + *
> + * @p: Pointer to test for qualifiers
> + *
> + * This macro produces the type name 'void',
> + * qualified with any qualifiers present in the element of @p.
> + */
> +#define QVoid_of(p)       typeof((__QVoidptr_of(p)){0}[0])
> +#define __QVoidptr_of(p)  typeof(1?(p):(void*){0})

[Severity: High]
Does applying the array subscript [0] to a void pointer in QVoid_of()
break Clang builds?

__QVoidptr_of(p) produces a pointer to (qualified) void.  Because array
subscripting requires a pointer to a complete object type, Clang rejects
(__QVoidptr_of(p)){0}[0] even inside typeof() with an incomplete type
error, and GCC emits a -Wpointer-arith warning when pointer arithmetic
warnings are enabled.  Using unary * instead of [0], such as
typeof(*(__QVoidptr_of(p)){0}), avoids both issues.

> +
> +/**
> + * QChar_of - qualified char of
> + *
> + * @Q: Qualifier to test.
> + * @p: Pointer to test for the @Q qualifier
> + *
> + * This macro produces the type name 'char',
> + * @Q-qualified iff the input pointer points to a @Q-qualified element.
> + */
> +#define QChar_of(Q, p)  typeof                                        \
> +(                                                                     \
> +	_Generic((QVoid_of(p) *){0},                                  \
> +		Q void *:  (Q char){0},                               \
> +		void *:    (  char){0}                                \
> +	)                                                             \
> +)

[Severity: Medium]
Can QChar_of() fail to compile when the pointed-to type of p carries a
qualifier other than Q?

QVoid_of(p) preserves all qualifiers on the target of p, but the _Generic
selection only matches exact Q void * and unqualified void *.  Passing a
volatile char * or const volatile char * to CQChar_of(p) produces a
volatile void * or const volatile void * controlling expression, which
matches neither association and fails at compile time.  Matching against
Q QVoid_of(p) *: (Q char){0} and default: (char){0} would test specifically
for Q regardless of other qualifiers.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1794323750.gi=
t.alx@kernel.org?part=3D4
