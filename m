Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794576383;
	b=J8uxC8Z48ZqDVcCKVIuKtB5SnHZwc93pGmcT70T49FZdZEjYLDVRyTa9Zml89zpN/nbK
	 f9qPMvHCqj5TEEVaZdwHSa9/j1bXkBeSj0J3b/xKTUMNOdyQXZXRvZhT9wIM22NEVTTAy
	 eROkViDOKWAGCH27CT6HDep1IF+jp+r+HCbvLRZ/Rc0mxoxHjBUcC+FAKdfYjoks1wAFr
	 dT/Kv0gjUie/1/FB7Dlti+S3oVf6VsEY3Ll5xMLsHrLXQvoCSiT2oLGceKhFbULuzZNzc
	 6cjVRbZotwN5sg5bqSKXram+/IPP+j/LU92Q9OKcmuLAr4OYnx1grhGiVzz0Te0Ygqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794576383;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=5xeesjWW0xx1pfgpddwdJLj2UCXbZEi1XEEa2PcM+AQ=;
	b=xV9fRFEdxHxbRBF/kVF1e9GiczLPEOpQ2ygglxqbrAgreuy2oeIElwu1bixr+RolEdVf
	 lw5DQV08XDQ4RCm6XRZGp5JacY6eRLoz4gEZjByYfw8sZEDFfGipX7PB5FFWe7GttYFGP
	 kiO6CEr3aXQWzdW1JfTicgnLYDND1Kv40F8Rdc0sZK9Oo4AjAjCMm5CV/ar0T7BDTNSuX
	 lbAq8U60E3E2kHUaQ7Edlb0neSo2ViaFZyesnzkiVvO/rDioWgyS1l5CaRu9mY/1qkP2v
	 C2xo6le9yIioVyritnzEMIo0nCFNGkb5X/DW5sH8kCDTzSrfwrjswdwzAHgrBUJDvKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FzZj1DYh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E31C1606BC1E;
	Fri, 13 Nov 2026 13:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FzZj1DYh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33DAF1F000C4;
	Fri, 13 Nov 2026 13:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794576382;
	bh=5xeesjWW0xx1pfgpddwdJLj2UCXbZEi1XEEa2PcM+AQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FzZj1DYh71V6ezJfhwIpA3JH1GoqKL1jgyEz58/ttx5kJvxL7d4PrY7F6IIPy09e9
	 Ml7ncnakOW9BpWZFRZHGpDnkmw0hI1iIqul4c0wS1B0Cz+b0tNtheJ/4CArP1358Be
	 6zRuPDgF9HAGtYWYaRkVIlcjXTObbU2jPu59Hrjj6RukExZ76kBKHvQPxS9qYwe5Qv
	 kmqN1B+3uafi8URrex8UMlHnpoLHNtGmyAMQA2CuH9gs7XsPTfuq6WahWLXWo+oqiv
	 1c7yzAquUZs737LZ4o23gasm+sZbVolRFrNLBjGay0Z/PlJaT1IZIsEgWqIeB9JoFV
	 /C9VFF00HYiLQ==
Message-ID: <sashiko-outbox-212859@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/7] string: Warn if the prefix is the empty string
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alejandro Colomar" <alx@kernel.org>
Cc: devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <df3a35c469c60c2c9658d66b30e67468ba053863.1794574496.git.alx@kernel.org>
References: <cover.1794574496.git.alx@kernel.org>
 <df3a35c469c60c2c9658d66b30e67468ba053863.1794574496.git.alx@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 13:26:21 +0000
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
- [Low] string: moving str_has_prefix() to lib/string.c bypasses
  FORTIFY_SOURCE
- [Low] string: commit message cites non-existent lib/string.h and omits
  function name
--

commit 018109c1aa9a2d5e3def240ae4b9134b27f492d5
Author: Alejandro Colomar <alx@kernel.org>

> string: Warn if the prefix is the empty string
>
> This corner case is mishandled by this function.
> Warn if it happens.  Also, document that if such corner case
> is needed, strprefix() is preferable.
>
> We need to move str_has_prefix() to "lib/string.h" to be able to use
> WARN_ON_ONCE().
>
> Reported-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Link: https://lore.kernel.org/linux-hardening/20261104-fwnode-for-each-pr=
op-v1-1-6e28fe1c72c4@oss.qualcomm.com/
> Suggested-by: Steven Rostedt <rostedt@goodmis.org>
> Cc: Andy Shevchenko <andriy.shevchenko@intel.com>
> Signed-off-by: Alejandro Colomar <alx@kernel.org>

[Severity: Low]
This isn't a bug, but the commit message says str_has_prefix() is moved to
"lib/string.h", which does not exist; the patch moves it to lib/string.c.
Also, neither the subject line nor the opening sentence names
str_has_prefix().

[ ... ]

> diff --git a/lib/string.c b/lib/string.c
> index a3778d5aab4af..61a1e79c1b875 100644
> --- a/lib/string.c
> +++ b/lib/string.c
> @@ -774,6 +774,30 @@ char *strnstr(const char *s1, const char *s2, size_t=
 len)
>  EXPORT_SYMBOL(strnstr);
>  #endif
> =20
> +/**
> + * str_has_prefix - Test if a string has a given prefix
> + * @str: The string to test
> + * @prefix: The string to see if @str starts with
> + *
> + * This is similar to strprefix(), but returns an offset instead of
> + * a pointer.
> + *
> + * Unlike for strprefix(), if the prefix is an empty string, the
> + * behavior is undefined.  If you need to support arbitrary prefixes,
> + * use strprefix().
> + *
> + * Returns:
> + * * strlen(@prefix) if @str starts with @prefix
> + * * 0 if @str does not start with @prefix
> + */
> +size_t str_has_prefix(const char *str, const char *prefix)
> +{
> +	size_t len =3D strlen(prefix);
> +	WARN_ON_ONCE(len =3D=3D 0);
> +	return strncmp(str, prefix, len) =3D=3D 0 ? len : 0;
> +}
> +EXPORT_SYMBOL(str_has_prefix);

[Severity: Low]
Does moving str_has_prefix() out-of-line into lib/string.c bypass
CONFIG_FORTIFY_SOURCE and prevent compile-time constant folding of
strlen(prefix)?

lib/string.c is built with __NO_FORTIFY and its top-of-file comment notes
that it is reserved for routines that have architecture-specific
alternatives in <asm/string.h> or get overloaded by FORTIFY_SOURCE, while
other helpers belong in lib/string_helpers.c.

When str_has_prefix() was a static __always_inline helper in
include/linux/string.h (introduced in 72921427d46b ("string.h: Add
str_has_prefix() helper function")), strlen(prefix) folded string-literal
prefixes into constants at compile time and ran fortified bounds checks on
non-constant arrays.  Moving it to lib/string.c forces an out-of-line call
and an unfortified runtime strlen() scan on every invocation, and shares a
single WARN_ON_ONCE() state across all callers in the kernel.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1794574496.gi=
t.alx@kernel.org?part=3D2
