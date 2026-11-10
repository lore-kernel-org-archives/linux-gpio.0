Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794325477;
	b=Ohmz7v1Mb2mXulPGp50QI9GrqZzDvuQiZ9D+Xy3sRtMzXx47iFnFF6FgUmAluBA9fyIS
	 xlWzpm0p/JNgebyjrOQG8QoUYakLfEAQ34/LmePkmcjjUe5P7/Y+lfMWtHmg3IiFHDS+T
	 KwmgTWv0ibkKiP6mAsBLPHBkelCrpUYaBGDAcKJeksBClMVDnA5eaDfbGsbVbmy4Kkwp3
	 V4oSGInLF6no2WRHTvQPxvKRvb2MoUUmsQiqsf6w378yVBhY9oC04WZHSMSKw1TwX8+tx
	 Qebt0fCWt2y0O4Shf7nkfmQbqC51L8sbl1uVI/6EpCnnGp9iNsS3yjEGQ7c3HPuYhvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794325477;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=374PxO+3w1e3d3nPSFUNzy14TN0zxVAnl5Wj19VchHk=;
	b=4h1kCpmP+ccYjRLGUzSVTKqtbPWfIlxXknZ2+B8e9Tg7r63oKkAXFONHZV4p44B5mhjb
	 +yZs6U7pVZhhNft0P/B3QmjO5ho/1HzWAoz+r8rrina6atbfhLm5JTnugVue8t/GxnDk0
	 WdnQMhU2aZ1NSZJmg4k4pXQf2HzACfYfVHZWuTrOXTFzRR/smVDCOQ3lZZ+aNoHe2eWIT
	 0Tfahi0CVbpgo5ReYLirHZHGQ/nknSY7MWr23mC6WSn3bFzFQSne2ZIuiSIf5/cdim5uq
	 UmUzZEoHEeutVoEVlbmj7oWaevJKFwm7bBwOGuGuYt/nfznnoqxkhF4adOYF9Qgut0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XFdk0YJ8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69104606A332;
	Tue, 10 Nov 2026 15:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XFdk0YJ8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEF231F008A3;
	Tue, 10 Nov 2026 15:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794325477;
	bh=374PxO+3w1e3d3nPSFUNzy14TN0zxVAnl5Wj19VchHk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XFdk0YJ8D6xr9EJt3KdmH8mXjDyC0ssy4EFI0Vm61BIDKqYu70YEo1/Xk3eFv1gs3
	 nBB9aBp2AAAvZU5mm2dhDoqNMj6IOeWwR/HlYCeHSMucGsIcDLvTD9WbQqm8hIsu6b
	 wcz04w2kpj08OBv921AH7vOgfyvvAKXaUMf9icP+ZLr6JgcTiOa9yXq8rx8VE5C7uZ
	 AsE1yInEWo7vqIBR8g1/KFLo8cp3aOugi6u8pAGo+J9oget28xY3uKEviS0zLWCJvB
	 ipG+IQvdjXESa8XcrLwEVkGxWSNzTxkZrzM84Ic/YFq82rqRDAGWQAZ5/twC7YHm67
	 azSoWL73Lgr4g==
Message-ID: <sashiko-outbox-207284@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 5/5] string: Make strprefix() const-qualifier-generic
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alejandro Colomar" <alx@kernel.org>
Cc: devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <35bf6672f84f07de3f40e8db9e7fcfd643894fec.1794323750.git.alx@kernel.org>
References: <cover.1794323750.git.alx@kernel.org>
 <35bf6672f84f07de3f40e8db9e7fcfd643894fec.1794323750.git.alx@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 15:44:36 +0000
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential
issues to consider:
- [High] string: strprefix() breaks Clang builds via void * subscript in
  QVoid_of()
- [Medium] string: strprefix() always returns char * due to non-const
  (strprefix)()
- [Low] string: strprefix() macro parameter pfx mismatches @prefix
  kernel-doc
--

commit f882ec908122ee0c3f780648b859ed41700664d0
Author: Alejandro Colomar <alx@kernel.org>

string: Make strprefix() const-qualifier-generic

This commit wraps strprefix() in a const_cast(CQChar_of(s) *, ...) macro so
that its return type preserves the const qualifier of its first argument.

> diff --git a/include/linux/string.h b/include/linux/string.h
> index cb096e9eb9835..3e8a0537b86bb 100644
> --- a/include/linux/string.h
> +++ b/include/linux/string.h
> @@ -577,7 +577,9 @@ void memcpy_and_pad(void *dest, size_t dest_len, cons=
t void *src, size_t count,
>   * *  @s+strlen(@prefix) if @s starts with @prefix
>   * *  NULL if @s does not start with @prefix
>   */
> -static inline char *strprefix(const char *s, const char *prefix)
> +#define strprefix(s, pfx)  const_cast(CQChar_of(s) *, strprefix(s, pfx))

[Severity: High]
Does expanding CQChar_of(s) here break Clang builds (make LLVM=3D1)?

CQChar_of(s) expands to QChar_of(const, s), which expands QVoid_of(s):

include/linux/string.h:
#define QVoid_of(p)       typeof((__QVoidptr_of(p)){0}[0])
#define __QVoidptr_of(p)  typeof(1?(p):(void*){0})

Because __QVoidptr_of(p) is void * or const void *, applying the [0] array
subscript operator to it fails to compile under Clang ("error: subscript of=
 a
pointer to void") in every translation unit that calls strprefix(), such as
drivers/base/property.c, and triggers -Wpointer-arith under W=3D3 in GCC.

[Severity: Low]
Does naming the macro parameter pfx instead of prefix cause scripts/kernel-=
doc
warnings?  The kernel-doc comment immediately above documents @prefix, and
scripts/kernel-doc binds that comment to the macro definition that follows =
it.

> +
> +static inline char *(strprefix)(const char *s, const char *prefix)
>  {
>  	size_t len =3D strlen(prefix);
>  	return strncmp(s, prefix, len) =3D=3D 0 ? (char *) s + len : NULL;

[Severity: Medium]
Does strprefix(s, pfx) still unconditionally return char * even when s is
const char *?

include/linux/stddef.h:
#define const_cast(T, p)  _Generic(p, const T: (T) (p), default: (p))

In const_cast(CQChar_of(s) *, strprefix(s, pfx)), the first _Generic
association is const CQChar_of(s) *, which is const char *.  Because the
underlying (strprefix)() function returns char *, the controlling expression
never matches const char * and always selects the default branch, returning
an unqualified char * and stripping const from read-only strings.  Should
(strprefix)() return const char * and avoid casting s to char *?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1794323750.gi=
t.alx@kernel.org?part=3D5
