Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794427867;
	b=389rgIgqJSzW4JEn/JMchwJAyO8XLaS6JAGuvXRvv3mMAgbo1A/FuecnQrgm2QqW2Bja
	 RglYZp/ZjwYBMxsj9XXCTuc0S70k4+H40xgw3o46VNrDiyKwV5gIIv84pzS5BD7Ue4J/P
	 5ztEpRA+YwCoFHKVRPfsywqwsnJkJAdw1OfN0FkcXlhEytUT42xRuhNncId8+YAKklv9V
	 MMasM8y7LsZtmKREkr/uoRrO+HWWeqBpVnbZRhl4OEB63fX2GPE6g1l7mFy1BVz8nUgrQ
	 39oAlCUC7u4UzuZgWJn+Hp38YdTDUDvZn/r3DptrFzDyF+eQF3XE/AtDW53x8RkoYXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794427867;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=X81LcNAIPTtKU6s2mvV1PqVFFGEy0poL70QDv4+eNAw=;
	b=U+6UvWyW5DeWik5xRfi96Qvir7Xv1ZIPZ8vERW88c7JcWMQgtcXHRWOm9ot7J4xIAzMo
	 ysRBd9S+MrDyzvb+0FPlF8wz6wCrEzi98+JOR5OimbxhdXUYSchKZJ42yEPlV2qdaD2ZM
	 fuFPmcEu/bqg6IWLQvkxXZHEdpGKwD+pdoazMqvn0x41QrhEjlIgihncG2AWDeRirfpGm
	 LF6I1EcA6srzohUWhxpm2ZYysNjWUvm6jXlS3w6uqShzDeMcSp2GDHM2XL6Vsy5ntOcVA
	 dKRVzuUE3JNsD2YTbFX/fhbqOqDut7V2PIbiC44ubq7w4kg9/cZqZbRjvKC7+NKGSrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="nm4Qmja/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2DD3606A324;
	Wed, 11 Nov 2026 20:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nm4Qmja/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF7041F00A05;
	Wed, 11 Nov 2026 20:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794427867;
	bh=X81LcNAIPTtKU6s2mvV1PqVFFGEy0poL70QDv4+eNAw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nm4Qmja/yiTX94tQkLKdt/WDzTcu/nw2VK6PccTabdh526kj5dnVuLScfXjEpFeIZ
	 FEB9gDYDb6tnburB1neQSvBKN+o6Q2k3af9bFTTkdd4gBh8WRoaJlWZ8GqvaYBLCyY
	 0LkrLopNh0vzs0sY0sEoO+k7M6iGEDu0DMgAO6lz72Z8lxEIoTjufX6vqKMsNy1z6Y
	 EeUWL4E9uL6jV5BSSDxmRLdQYCkiWgp/AK+6DCw0UEvgLpWl8CrjyoUzVfX14HpvEd
	 GOEPbfZpzb+YYt/iCNE8Q6TcnKdU62K/XGD+0mZNdRH0nC7wRK4Je1FrCRZZ07DUXi
	 9rcpWXpQh9jew==
Message-ID: <sashiko-outbox-209615@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 4/6] stddef: Add const_cast()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alejandro Colomar" <alx@kernel.org>
Cc: devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <ce623fe0432ba7fe74e12171e52d2dd1f1ad2c39.1794425425.git.alx@kernel.org>
References: <cover.1794425425.git.alx@kernel.org>
 <ce623fe0432ba7fe74e12171e52d2dd1f1ad2c39.1794425425.git.alx@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 20:11:06 +0000
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
- [High] stddef: broken _Generic type associations in const_cast()
- [High] stddef: missing Signed-off-by trailer for Co-developed-by
  author
--

commit 773dbe524c50943cb4a47fa3a2b5e7f50b113c9d
Author: Alejandro Colomar <alx@kernel.org>

> stddef: Add const_cast()
>
> This macro serves to cast const away without risking unwanted
> conversions due to mistakes in the cast.
>
> It's similar to C++'s const_cast(), but it is more restrictive: it can
> only cast away 'const', and not arbitrary qualifiers.
>
> David made it a bit more robust.
>
> Link: https://lore.kernel.org/linux-hardening/20261111102535.434c2eee@pum=
pkin/
> Co-developed-by: David Laight <david.laight.linux@gmail.com>
> Signed-off-by: Alejandro Colomar <alx@kernel.org>

[Severity: High]
Co-developed-by: David Laight <david.laight.linux@gmail.com> is missing a
matching Signed-off-by trailer, which is required by the Developer's
Certificate of Origin rules (or Suggested-by can be used if he only
suggested an improvement on the list).

> diff --git a/include/linux/stddef.h b/include/linux/stddef.h
> index e1851c50c89b5..5201d71db3876 100644
> --- a/include/linux/stddef.h
> +++ b/include/linux/stddef.h
> @@ -194,4 +194,16 @@ enum {
>  #define TRAILING_OVERLAP(TYPE, NAME, FAM, MEMBERS)				\
>  	__TRAILING_OVERLAP(TYPE, NAME, FAM, /* no attrs */, MEMBERS)
> =20
> +/**
> + * const_cast() - At most, drop const in the left-most derivation of a p=
ointer
> + *
> + * @T: Type for the cast.
> + * @p: Pointer to be casted.
> + *
> + * If @p is of type const @T, then it is casted to @T.
> + * If @p is of type @T, then it is returned without any casts.
> + * This avoids mistakes that change anything other than 'const' in a cas=
t.
> + */
> +#define const_cast(T, p)  _Generic(p, const T: (T) (p), T: (p))

[Severity: High]
Does const_cast(T, p) fail to compile when T is already a pointer to a
const-qualified type?  When T is const char *, textually prepending const
produces const const char *, which collapses to const char * and gives
_Generic two associations with the same type; this breaks the build in
drivers/base/property.c (fwnode_name_eq()) once strprefix() uses
const_cast() on a const char * argument.

When T is a pointer typedef or typeof(ptr), const T qualifies the pointer
itself (char * const) rather than the pointee, and since _Generic strips
top-level qualifiers from p, the const T association never matches a
pointer to const.  For a multi-level pointer such as char **, const T
expands to const char ** instead of char * const *, rejecting valid
char * const * inputs while permitting unsafe const char ** to char **
casts.  Also, omitting the (T) cast in the T: (p) branch leaves a
non-const array argument with its array type and sizeof instead of
returning a pointer of type T.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1794425425.gi=
t.alx@kernel.org?part=3D4
