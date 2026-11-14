Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794670400;
	b=CXY2Kg57YJS1kNq4/u4YIKYTgHpiO1oPPRRz0gXLJcNTKT249pacP5BpgOmnDdBF08I/
	 xLVfq0Axi9RE9FJ7xwarNVwywWQ1EynZKGzdzwsnXT7pnKzM7kCsWCoVXDPLrKPYndJeK
	 n/Z4CyGxbO17rEbO21KKMnC0kykAf6n6sYOHRVWnXLkrBa0xQ5s5Bx1MNbeFXZIMvjAND
	 fXx0Vr8ZkXoJc+moYbae2sDiYsCf1/5HOS93oebakqkl727FmXwGMjc9EDvgMQWkSu8Xk
	 DvXBk55O95Sjfls6gFXlag5Fzl0VdMQEB11IckVvl1crNo7LJXHg1rvcMbnNXEqIdGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794670400;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=7r5UHs21AFunoYClT4OvTCKJSsYVS/CyA5k/ERCHGIE=;
	b=dZZI/zimFNEkpggJ77YdKOSprY+Y+kPzuMT/O0Rkuw1absTm9E0hF7w6gS4QarauvsIx
	 jYd10l2moTNPE+C6BtnhMoUY4rtImfEsKPlm61GXGmYuQmQ4kbWcmNAy3MdCTLayw2rbz
	 e3vsOwtA6Btxe5JZKZSNQ50tb81UAKJD+sST5INsKRg6q75R4KMPd9T9IxFhYl99Yp1Db
	 +d6vo60Pt+Iw7nLjVkY+Z/L4urXQqpdR2GyDA2iU73/fGjKXXH5/PoIFx7QaWyypizDwe
	 HpPBWO5xRDHJT+Kz0Tj/PoZXwp4EQOKyRcCQgmpA8AaJtI9usQySRB+lhWDjPSrUDsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TSKelPqL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 413DA606A323;
	Sat, 14 Nov 2026 15:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TSKelPqL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D6981F000C4;
	Sat, 14 Nov 2026 15:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794670399;
	bh=7r5UHs21AFunoYClT4OvTCKJSsYVS/CyA5k/ERCHGIE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TSKelPqLA1H+uGiMQu2HTCr8+Fg5PFONt4iTRA7x2EK/1iZcUusJQ+xp+Tq2rkZvg
	 FhJy/rQIZaX/cYD+6KB+ShQG0dSeTdT6AiLIjbHesyRDLTE+v47yW319HQnzbc5R+W
	 KAT5wD02eVtAvnLrdf6V3cec4rwaHhJfi5qRGBXuXyb0jkhnclZQrwDcLw3YEOalDd
	 0cKwPxIqP467+/xTZxqbaEIRld4x/1VazOanS+ZOqdwczAN3UZpoK4X8GVJzMiVQBM
	 Qu2eYdv6RfGCjlITww+ZIpaI/Mq7L7ukWHK+Kqh3IGl3tl26s8PXLZ5WebzrHjDLMp
	 xi/ICh1u+MubA==
Message-ID: <sashiko-outbox-214720@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 09/19] string: Make strstarts() a legacy alias for
 strprefix()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alejandro Colomar" <alx@kernel.org>
Cc: devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <212e7fc2cb99b631c493f59b8b38e1fd3db81231.1794667407.git.alx@kernel.org>
References: <cover.1794667407.git.alx@kernel.org>
 <212e7fc2cb99b631c493f59b8b38e1fd3db81231.1794667407.git.alx@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 14 Nov 2026 15:33:19 +0000
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
- [High] string: strstarts() macro expansion shadowed by local strprefix
  variable
--

commit e4b277f22320c7ff4dbc9e8cc88221ad43eb8ba6
Author: Alejandro Colomar <alx@kernel.org>

string: Make strstarts() a legacy alias for strprefix()

This commit replaces the inline strstarts() function with a macro alias for
strprefix().

> diff --git a/include/linux/string.h b/include/linux/string.h
> index 013c6169def05..0a466360dbb39 100644
> --- a/include/linux/string.h
> +++ b/include/linux/string.h
> @@ -609,6 +609,7 @@ static inline const char *strprefix(const char *s, co=
nst char *prefix)
>  	return strncmp(s, prefix, len) =3D=3D 0 ? s + len : NULL;
>  }
>  #define strprefix(s, pfx)  const_cast(CQChar_of(s) *, strprefix(s, pfx))
> +#define strstarts(s, pfx)  strprefix(s, pfx)  // legacy alias

[Severity: High]
Does expanding strstarts() to strprefix() break the build when a caller has
a local variable named strprefix?

drivers/platform/x86/hp/hp-bioscfg/spmobj-attributes.c:hp_populate_security=
_buffer() {
	u16 *auth =3D authbuf;
	char *strprefix =3D NULL;
	int ret =3D 0;

	if (strstarts(authentication, BEAM_PREFIX)) {
    ...
}

Because the strprefix() macro expands to a call to the inline function
strprefix() in the caller's scope, the local pointer variable strprefix
shadows the function identifier and breaks compilation when
CONFIG_HP_BIOSCFG is enabled.  A later patch in this series, commit
"platform/x86: hp-bioscfg: Rename local variable", renames that variable to
prefix and should be ordered before this commit to keep the series
bisectable.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1794667407.gi=
t.alx@kernel.org?part=3D9
