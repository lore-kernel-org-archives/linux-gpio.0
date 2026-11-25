Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795641087;
	b=JXVQyQGTHRFGg059IZ+ucKrZnq3YiGJFSezZhV9PLWnHuU3KzWRmMGB9eQ03gxchA+d+
	 viugiWJglt0NMwIn+vp4ClXnvQifNxQj83VQd5mVfpw66893NTCQtJqhKPXGWV6cTwOuT
	 roAyLZUIa4D8n7tCgABD94ZY0BvDa+FGJgbXppehqu1aBRCGDmXMe8tTq6jMgwag5bf1H
	 s4dLrjEG+wHnOOJo0y8HMQwkX71aH6EjgZRT47ji7jwofZ+G/VzuSIn2+ookUWHN8tOoj
	 vrXnOGOPkTiK8hHBfNSYa7mIMAAl8C1X+rJaoe3JKCz+x1IVa5FOcU08OD0pVj+rDDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795641087;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=rB+N5Sq9zOKruKzHQCCYevF/57RUJ74rFAesj5ohSyI=;
	b=G4e0zsxsIFTTzqxW3HG3+hx4uTvGGRTkVRKvnzWoA7Akciuo+6FLi+zsDfJDBpQaFSVm
	 mQoq3dUNMMG3iTwvW9R58izjvXRMSU+1yKndovdAt+W3jy9nOnFhW0JJJTPSdzMDsBX6f
	 0EpcvIh+wfjOnK3Ixeh75/gM5SWsWxZY9O93O5PKCXUWT/k2n/Q02Z3XDOyXVw3US0iDH
	 jgL8cKqpUt4iLQhM2+B9/cu62KjbNgYxaLXAC95FM0XMQvtlJZ0n8vxmRKi+59G79pL8q
	 70wYqlPcD6kGQrPj3sLpQ8hgkCs51I+gXPrqlSVgyBRaowR1RSwsbxBuz1TYudEE3mA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="RgY/+s2b";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C682606A321;
	Wed, 25 Nov 2026 21:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RgY/+s2b
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A36181F000C6;
	Wed, 25 Nov 2026 21:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795641087;
	bh=rB+N5Sq9zOKruKzHQCCYevF/57RUJ74rFAesj5ohSyI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RgY/+s2b4yWvDxJ3BeAyr9EdrClgP+lmhTSblCT5Rd/s3WlHzCah0MDm/2sXFt2Gl
	 +xK6EwEZi8w5Ux2X/wyR8PkiUVT/Q2k4DkWeFyjsA/FIpaBmgXlQgRPQ/0WoCzsNvj
	 ZAXWE+BChNQLSG/8mZYyeRqHAWuuXc3AewKIiB1Qpg5y2ttQqhP2DkhQ1nAIsPRvBm
	 GWLFD+vwa/7bjNDiDKweHG+xQOYpEWVIFRPq54irnSgUJxMxUw3hGozA30E6OE7v6V
	 U6FUjOCGPsHwkcVkbqUBlqJoK1TdCRRSs4fDpsf3m3idDLtfUR4ypGxwgqUjV/otJW
	 yRHK9F0t0ic9Q==
Message-ID: <sashiko-outbox-234163@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 2/4] string: Add strprefix()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alejandro Colomar" <alx@kernel.org>
Cc: devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <b32d70163fb454fee2667548c63c4d4d3b19d7bb.1795639368.git.alx@kernel.org>
References: <cover.1795639368.git.alx@kernel.org>
 <b32d70163fb454fee2667548c63c4d4d3b19d7bb.1795639368.git.alx@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 21:11:26 +0000
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

commit d8e472e1906ee21263f127c3c8452f752cbf8121
Author: Alejandro Colomar <alx@kernel.org>

string: Add strprefix()

This commit introduces strprefix() to return a pointer after a matched
prefix or NULL on mismatch, and adds KUnit tests for it.

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
Does __nonnull_args(1, 2) cause kernel-doc to fail when parsing
strprefix()?

CTransforms.function_xforms in tools/lib/python/kdoc/xforms_lists.py does
not strip __nonnull_args, so running scripts/kernel-doc on
include/linux/string.h (included by Documentation/core-api/kernel-api.rst)
treats __nonnull_args as the function identifier, emits prototype mismatch
warnings, and omits strprefix() from the generated documentation.  Either
__nonnull_args could be added to CTransforms.function_xforms or
__attribute__((nonnull(1, 2))) could be used as in strends() below.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1795639368.gi=
t.alx@kernel.org?part=3D2
