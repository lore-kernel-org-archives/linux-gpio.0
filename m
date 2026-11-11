Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794428105;
	b=fm3oF4DJxIjOpnTpbnJ99QnuotZWXGbhdWN7yoWMvj55Fek4fDPnH1egoB0It7wZ9fcI
	 k+kzpPi0Wg++p1gZHQyIANy5vi6684QDDJxEO305Jd7vUn/n7ija5vmiIr0f9aKToAib/
	 DIaQXb24YDS89ytLZI2HVjPLD3PbEmIKp+x9eAcXgFzoxR5Ga0brpkmOaOxlPvtiDnEQP
	 si1ZyaihGD1Dvf6qmGepdjHj0eTcjlU8LFWjloFUEIDtppJxdpIJSvvElyWhAM6NMyAoO
	 up59eloTzttozjJm67wy6zHumQ9NxviG3F/UTq1eFKpVasAC1xpz+KB7Xdk+5WJRdNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794428105;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=wjqQbn4a+7dcLaWn2FPIKO3ZJVxZraaaMz1re4KgK1A=;
	b=kCbrw/lRxGsUJOI9f+WNRgZ2GSLaJ/Nenu+RWJnYjZlED1aakdNSezzWRUY/fhhcNq6F
	 n98CZkVvKAqTRSNDkBTwTofLxMCsCK87OptY4rqSW8TGBIcclf32aNj7Ot5Vcpj2qia5k
	 LRGpC5JAC81mGZuOQ+e9VR67dAdGIMo1XlkLJ9Lb1Qh+tzSQPSfXe0OCuheAZCkrqHB0L
	 PEIp2Aw2+alY+mu+tdyREwOZO6QTcrQecxUK5Wu3uwdOM/uTQhpwrSVs/r7ChPckFA0Q8
	 ovgTkk0pMMBoDII9/o6VasPLUa7al4X4sk3WnJzrJVLA384n2k+W9XkMfBstJvQDy3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d6emHhNX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BD9D606A31C;
	Wed, 11 Nov 2026 20:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d6emHhNX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2D291F00A05;
	Wed, 11 Nov 2026 20:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794428105;
	bh=wjqQbn4a+7dcLaWn2FPIKO3ZJVxZraaaMz1re4KgK1A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=d6emHhNXgvYwUNGnqFeGgL8AgXDYL/Y2EDDSIF/ZdjHHD6TBHjdsWiQTLaJ5vsKQH
	 wL9RFXZtDjERN/VWDmJJ/SAZ1CwO3aj7BcJQR+4a8W2YKpIMiHpGRLZkZ9sH3Wpv1u
	 fKp2NtemAoNvjEF0q3Ss4Ziee/scbDOYDHXVnqyefSPlxvMjSE62kDxGSQ3t3JdWzV
	 r66naiu7Bri47E8sJ81TFJwlQcnv2vzXX3S2G31sZpingVc5wbgs940NpOvNTcJJz2
	 /ooou7aDsNj0nabk5/t03MmPsrYL0qZOwMAKoTlgBTC5lBVFsizgo67PA2iWJ4uSw/
	 XV0AHP3hmrVEg==
Message-ID: <sashiko-outbox-209624@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/6] string: Warn if the prefix is the empty string
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alejandro Colomar" <alx@kernel.org>
Cc: devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <cd09427148a0c4718b46029c9e806f9dc1622f9b.1794425425.git.alx@kernel.org>
References: <cover.1794425425.git.alx@kernel.org>
 <cd09427148a0c4718b46029c9e806f9dc1622f9b.1794425425.git.alx@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 20:15:04 +0000
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
- [High] string: missing linux/bug.h include for WARN_ON_ONCE() in
  str_has_prefix()
--

commit 544547ef558a49b7dbb876a077fff7f7bedc8b0c
Author: Alejandro Colomar <alx@kernel.org>

string: Warn if the prefix is the empty string

This commit adds a WARN_ON_ONCE() check to str_has_prefix() and documents
that passing an empty prefix string is unsupported.

Link: https://lore.kernel.org/linux-hardening/20261104-fwnode-for-each-prop=
-v1-1-6e28fe1c72c4@oss.qualcomm.com/

> diff --git a/include/linux/string.h b/include/linux/string.h
> index ec6ca50599fed..8e6b78c6196a7 100644
> --- a/include/linux/string.h
> +++ b/include/linux/string.h
> @@ -561,6 +561,10 @@ static inline char *strprefix(const char *s, const c=
har *prefix)
>   * This is similar to strprefix(), but returns an offset instead of
>   * a pointer.
>   *
> + * Unlike for strprefix(), if the prefix is an empty string, the
> + * behavior is undefined.  If you need to support arbitrary prefixes,
> + * use strprefix().
> + *
>   * Returns:
>   * * strlen(@prefix) if @str starts with @prefix
>   * * 0 if @str does not start with @prefix
> @@ -568,6 +572,7 @@ static inline char *strprefix(const char *s, const ch=
ar *prefix)
>  static __always_inline size_t str_has_prefix(const char *str, const char=
 *prefix)
>  {
>  	size_t len =3D strlen(prefix);
> +	WARN_ON_ONCE(len =3D=3D 0);

[Severity: High]
Does include/linux/string.h need to include linux/bug.h for WARN_ON_ONCE()?

Currently, include/linux/string.h only pulls in linux/bug.h transitively
through linux/fortify-string.h when CONFIG_FORTIFY_SOURCE is enabled and
__NO_FORTIFY is not defined. Because str_has_prefix() is an inline function
rather than a macro, translation units that include linux/string.h without
linux/bug.h (such as arch/x86/lib/string_32.c with __NO_FORTIFY, or
lib/net_utils.c when CONFIG_FORTIFY_SOURCE is disabled) fail to build with
an implicit declaration of WARN_ON_ONCE().

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1794425425.gi=
t.alx@kernel.org?part=3D2
