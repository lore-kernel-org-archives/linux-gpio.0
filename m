Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794427914;
	b=Sb0Y0Td80O9eXislzywE+AreLlOl6fiC4znBjICeyGbBDExnqDDIk6pitV252HLfSAxc
	 IultWkWTZOogmkH+S0YrpEe1NXOIBDIw/Kq7AGFzrgnsnZNeVnD1WCn59IJiqLhZkQCor
	 WvUXCIBtOwoiOPf8Bgktc/fs8BLGKszEgMRDtcSEuRnTCJqBeBk+FDWW+8Mh7TKgGhkPx
	 /QEBRw99OXARyrD8oKgmO2fPSP+wAJiSRenCQPodXPqkpgg/Tp7UOs3CUpeyd3JkgM/6Z
	 zhqAK0P9JdaMxSEiMFh4TPR+702Ipy7DT9aeKOSzXZUU3u1oyrFt8GpRebUXmI596rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794427914;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=pCIPG+hLb95IPdARZHKUfUdDWJLab9IYu0l7GGdebxc=;
	b=uSN8Fbttrl9ucRLGLY2FlWdXqqUlph8KTi+nx+hnJRajrkrMSMXgctQ4/Lwk5gA8OTJ9
	 xSyAwqv2lfmrk7VhFenBl0HchV7ONxc1VR8DcEzdDvOPAtdqXfItjpRJ+fdfgCZvIfCHl
	 gliIQypaQTpeFP8RBGmTP/AkPUPY8fGLwYUbqifHKEb3Tuj19/wdZyobFZNAUHw+TCnjO
	 FhxAn3cPi+fIXzdJx5mjelTM9KTnuv+iksgc2ZHMa3jtt+U+/N+ZiotN0tdbevnHwAvkW
	 e2tMymkue/Dm99Cl8yFipU3Y7r2N93gFmiB9yFxdgJULnZ8q/ZsvIekqVmmW3G5AOJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=o061JjTp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 087E4606A31C;
	Wed, 11 Nov 2026 20:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=o061JjTp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84F661F00A05;
	Wed, 11 Nov 2026 20:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794427913;
	bh=pCIPG+hLb95IPdARZHKUfUdDWJLab9IYu0l7GGdebxc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=o061JjTpCo42vF9QHpiqvDEfryZlxdvrulxSWZd4v36n5KkBaTwuCCQ5zyXKYizt9
	 CpqOtIOYoQu8xr1cXM6sKMQuJp94OUMpXQmR6oMDuyERY73bJxCkr6VL7iLA9YNIxc
	 HK/BP1Qoegi8tNXE/pydEsBCY7SDWaAkjIOvnqQO8zBiXGZ9XYuoXfgI+dLzwJ1KcE
	 nFOvzJluxiT5CfKXyRnjmAQopUUeyp/RMDkOS8cIg+kHhdye67TAz+tJVniJJ2fnoT
	 2saIwNGx0EgNu/wURpITLyKfjb+uFFKWtkprJgXjEfg6ksQAav4Shpt4h1uNQvwMXr
	 hJKY7Jc42309g==
Message-ID: <sashiko-outbox-209618@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 6/6] string: Make strprefix() const-qualifier-generic
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alejandro Colomar" <alx@kernel.org>
Cc: devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <69d1792e5edf91eed8cf99745cc840ad954cc3ea.1794425425.git.alx@kernel.org>
References: <cover.1794425425.git.alx@kernel.org>
 <69d1792e5edf91eed8cf99745cc840ad954cc3ea.1794425425.git.alx@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 20:11:53 +0000
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
- [High] string: strprefix() fails to compile on const pointers due to
  const_cast()
--

commit 2c70ad25b2785e588ea2435fcf768764945ab8aa
Author: Alejandro Colomar <alx@kernel.org>

string: Make strprefix() const-qualifier-generic

This commit changes strprefix() to return const char * and wraps it in a
macro using const_cast() and CQChar_of() so the return type preserves the
const qualification of the input pointer.

> diff --git a/include/linux/string.h b/include/linux/string.h
> index 25e6e42b5d1e5..e4506a7cff703 100644
> --- a/include/linux/string.h
> +++ b/include/linux/string.h
> @@ -577,11 +577,12 @@ void memcpy_and_pad(void *dest, size_t dest_len, co=
nst void *src, size_t count,
>   * *  @s+strlen(@prefix) if @s starts with @prefix
>   * *  NULL if @s does not start with @prefix
>   */
> -static inline char *strprefix(const char *s, const char *prefix)
> +static inline const char *strprefix(const char *s, const char *prefix)
>  {
>  	size_t len =3D strlen(prefix);
> -	return strncmp(s, prefix, len) =3D=3D 0 ? (char *) s + len : NULL;
> +	return strncmp(s, prefix, len) =3D=3D 0 ? s + len : NULL;
>  }
> +#define strprefix(s, pfx)  const_cast(CQChar_of(s) *, strprefix(s, pfx))

[Severity: High]
Does strprefix() fail to compile when passed a pointer to a
const-qualified type, such as node_name in fwnode_name_eq()?

When s is const-qualified, CQChar_of(s) * resolves to const char *.
Passing that as T to const_cast():

include/linux/stddef.h:
#define const_cast(T, p)  _Generic(p, const T: (T) (p), T: (p))

causes both const T and T in the _Generic selection to expand to
const char *, which fails the build due to duplicate compatible types.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1794425425.gi=
t.alx@kernel.org?part=3D6
