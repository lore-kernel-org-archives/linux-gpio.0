Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794576017;
	b=hG0CYt9Tk9PJiM/dc2q3toR2IB5CQ3kIcJE1cTA5uwinEREk1ubFVFYIL8ZjIty8Uht4
	 HNB5hHwOvaur+eSYy2zOco0m37JSTFDyQkLyHnbnytOT3MVrSUFAVfXLAqdHA9PCjTwwj
	 27+NHzPI+lvDsPwWcloeSO2UavxSq+GNgQARyLzHwhxzLGeeoUvlrZCpmR2hGPPLc6cil
	 puMCHfWmUuZ/7mvD5vv6sOCNkgV6KHYGqudakCh8rpEtKaNcPkl+Dcs/K4KIqIvQ5J8uX
	 +hTsXES/11zIm16JJp0rqe6uJ8L4HVW06oksbLEgPGwIi8bJ2Zd1n1xhALjEBr3bp4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794576017;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=udqE3V5r0alc1cG201p9qQ+yU6Qa2qwmhjgy1A2cAfk=;
	b=acF1KEucPFCHVPvbisZRWAh5xLGr7lfV+Jde0JV3hnLOrwurAlEFO5Y26kq0bFAm92bx
	 jl4TzsqKUgNOLUBZR2SDxsOCdHz73UdF3SUrzR9E7cJxMQ4ZZCm8cqDaFkFk+DXyr+OU8
	 cY3aAXnPk5XG1aNdxd637aeupevTJsaWu6gYLal/xfZrAPOxuLxs+7QNs060RzvjjT7g8
	 mb+7zfwqpwOFxetWgG7AuJHq6JIK/3I+MDqKPzj+r43pbKtfy2wmWq5O8TvmPAqWFxEBA
	 4jPJPuLHOL3kh8mibPfmZDL6bHhbr99ei8jJ4VNSsh3ZvzWwT/cONc6zqfZ639b5L7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZUPF5+vD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CADB606A33B;
	Fri, 13 Nov 2026 13:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZUPF5+vD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72A4C1F000C5;
	Fri, 13 Nov 2026 13:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794576016;
	bh=udqE3V5r0alc1cG201p9qQ+yU6Qa2qwmhjgy1A2cAfk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZUPF5+vDeAeQkLeKvRNx09e0kGn8CluUepAk7V0UIa/K8IK+cFhuQQrHdQUN2GV73
	 MLdSEiFjKwKY62O2YwZd7tsQ/cKTJ1W7UXYAwQctQnf3jDAM6LvugqdjsQPIGz14gP
	 TCH3g9vqfOvY717io9dDwMZ/jSo2x6w+bQFBuO2zbEQ5jeSPC83c368L+K+yG9PmAG
	 s5g5G55A7Ke3aGKn05Nr8X1ANWu0o2KpzqaH6GtahEnI4+4odyAKgN5U+MHyEjKrFA
	 qmzN1S9Iy0qW70cyzeu5OgbeNJAIZMb9z7Mfr3FEFwKGRrJiJGdA+ZEacs8Hc2BadZ
	 aYxTol9wAh3Ow==
Message-ID: <sashiko-outbox-212840@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 7/7] string: Implement strstarts() with strprefix()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alejandro Colomar" <alx@kernel.org>
Cc: devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <382a44f7c68672ecead2436d9f569ee23f383830.1794574496.git.alx@kernel.org>
References: <cover.1794574496.git.alx@kernel.org>
 <382a44f7c68672ecead2436d9f569ee23f383830.1794574496.git.alx@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 13:20:16 +0000
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
- [Low] string: strstarts() via strprefix() prevents optimizing out
  pointer offset
--

commit 8cdc2e9c96584305ea94313f2618d17d8e28f303
Author: Alejandro Colomar <alx@kernel.org>

string: Implement strstarts() with strprefix()

This commit changes strstarts() to call strprefix() instead of calling
strncmp() and strlen() directly.

> diff --git a/include/linux/string.h b/include/linux/string.h
> index 8c6a79d320474..8ca0deda61606 100644
> --- a/include/linux/string.h
> +++ b/include/linux/string.h
> @@ -595,7 +595,7 @@ static inline const char *strprefix(const char *s, co=
nst char *prefix)
>   */
>  static inline bool strstarts(const char *str, const char *prefix)
>  {
> -	return strncmp(str, prefix, strlen(prefix)) =3D=3D 0;
> +	return strprefix(str, prefix);
>  }

[Severity: Low]
Can the compiler actually optimize away the s + len pointer arithmetic in
strprefix() here?

strprefix() returns strncmp(s, prefix, len) =3D=3D 0 ? s + len : NULL, and
converting that result to bool requires proving that s + len is non-NULL
whenever strncmp() returns 0.  Because the kernel builds with
-fno-delete-null-pointer-checks and -fno-strict-overflow, the compiler
cannot assume that a runtime pointer is non-NULL or that s + len does not
wrap to NULL, so callers of strstarts() end up keeping str and len live
across strncmp() and emitting the extra addition and NULL check.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1794574496.gi=
t.alx@kernel.org?part=3D7
