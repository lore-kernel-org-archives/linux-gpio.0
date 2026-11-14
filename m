Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794670191;
	b=A0wOYEix8SlIXWpUOq9wwSNSba9haHxrqw5si4bBGDpIUx4bbEIZawF5VMxXiGzaJlt+
	 qou4HW68K93ncXaLEycmM0N5s26dZmeVLx04gjg1U1Zsh2LLA5+CjJ9MU7H1GT2pa0EV0
	 TqvJDMNqIjTeqe2z2c62x7rPJ/9gqKtC4P/oTti+kRZUiX/3AyaIvVrAld33u1tNXdcbi
	 3lcbCYTIkThOSAjKLGZUXuMawR3SoIC9RihvzAZpl40BQ3zbsjxI2X8fY4+DXRD2eQoOQ
	 ygFBPyVxxI+r+QFchxyKzH4pkmg+BPB3wLrOsUQNnW8XfElJxpBAkePX82Lsj7/9Row==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794670191;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=8aD2Ntc1u7Vyz+jk2M+W3ktbixvz2syGRvzQWDZooqo=;
	b=e/buLCya6SL3LpNJQiO7FmVC1NCbfQVtPDWD72dqZ6s+QH5zuWovdj9W/FzSKBOw7q8o
	 0HCe8uJAiK5tScGRR4oT08wxWm8VpWSy9JTOJhmdNm/zUQbJvySDE7PBBrBIsWJuTphii
	 lJ7nCcS+5YQ7Xbr9v+vj7rno0Y3ztWqkQXPar8x9Qlbhr0DnYMGX7h0sk0dAeDcIVlCJK
	 xxznHiSRfTMJOp3bLijzk0aWsfJus+WHidlr85yEXuHT1aw1mm26D/GEHRqkXXyxjHK/X
	 AL/XGY76LmbT8PMWbNqBE9mReiVq4oFQdvCUu5Q198pbi9ICatrY+SpqrSMqdIC2/kA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VEZnMs6B;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E9AC606A32E;
	Sat, 14 Nov 2026 15:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VEZnMs6B
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDAC81F000C4;
	Sat, 14 Nov 2026 15:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794670191;
	bh=8aD2Ntc1u7Vyz+jk2M+W3ktbixvz2syGRvzQWDZooqo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VEZnMs6B8uOlUoqsJ9KY3CQy+Vu/8Aqrc8BwgwoPYeF9qCeMsqTZp0HZvB8H0MCND
	 Ih3qLROtRYaoF8Qs4TO94pHKg7QUruH1cbYLE1BCHlqevkTJGVcsTRZla9PVH2OTF4
	 82bXAZJ2L8NFJuGIuQqgt/ux43L5G+o6Qd1/R9MKdrLuWg7A7cBNBVMHPRF2aEEF/u
	 o5iIiYWJxHRPGxOElKf9qlua+uWuRbtIN2Qb04UOz45+FYJ9eas97Om6ofbzGT+5UV
	 mnTYaZ16izTE89cPd5dPfjLB/dR6FMiZwJwVGK0zmLmOMh2cGPtaIndV0n8WyqVVeB
	 flP6PN8T8KkIg==
Message-ID: <sashiko-outbox-214710@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 12/19] string: Remove strstarts()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alejandro Colomar" <alx@kernel.org>
Cc: devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <cabc673b9ac73c137ad6f7dea52f8566c5821675.1794667407.git.alx@kernel.org>
References: <cover.1794667407.git.alx@kernel.org>
 <cabc673b9ac73c137ad6f7dea52f8566c5821675.1794667407.git.alx@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 14 Nov 2026 15:29:50 +0000
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
- [High] string: removing strstarts() breaks build in
  xe_sysctrl_mailbox_write()
--

commit e1746880c54dd32f27fc7343468741cdc4b05246
Author: Alejandro Colomar <alx@kernel.org>

string: Remove strstarts()

This commit removes the legacy strstarts() macro alias for strprefix() from
include/linux/string.h.

> diff --git a/include/linux/string.h b/include/linux/string.h
> index 0a466360dbb39..6b0de932e23a8 100644
> --- a/include/linux/string.h
> +++ b/include/linux/string.h
> @@ -609,7 +609,6 @@ static inline const char *strprefix(const char *s, co=
nst char *prefix)
>  	return strncmp(s, prefix, len) =3D=3D 0 ? s + len : NULL;
>  }
>  #define strprefix(s, pfx)  const_cast(CQChar_of(s) *, strprefix(s, pfx))
> -#define strstarts(s, pfx)  strprefix(s, pfx)  // legacy alias

[Severity: High]
Does removing strstarts() break the build when CONFIG_DRM_XE is enabled?
drivers/gpu/drm/xe/xe_sysctrl_debugfs.c:xe_sysctrl_mailbox_write() still
calls strstarts(token, "timeout=3D") and strstarts(token, "resplen=3D"), wh=
ich
now fail with an implicit function declaration error.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1794667407.gi=
t.alx@kernel.org?part=3D12
