Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0006368D77;
	Tue, 12 May 2026 07:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778569224; cv=none; b=NKHYbN0ModIRXi3beCQ4f1seKrhBdhTqjx3Jyqb0QQ1pwgGfM7jTUuO7d144BTgs0UQa39WqITynRWMFB5T9uVnVwoDNfO7fLWp5ALpzMmLSH8gqErctZaYIupSUOLrWBUzo2FpDe77wNMC/1LpsDimXa6EH5xPUAsytL9UgEyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778569224; c=relaxed/simple;
	bh=CceK4sPOFnQm5t6VoQoiOkyoeVP61Erpl8muySKbS7A=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:From:To:
	 References:In-Reply-To; b=BYQdgR4VHQ72eU0emdHb0jRsgs8CfI044VNf6FuS0ts3dq0nA+mPRKSbnWqUrg8nwtC2DHjmvjIe2qlyTcvenDk7/Y54NzpO+cG2BNXOQirz1KgiHcSivmGUKTzwPCZzeayamIHgdPFBzXdRm0dn3YIZIvDpXk26cAQw113jUqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XUI6GcTS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XUI6GcTS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BCE3C2BCB0;
	Tue, 12 May 2026 07:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778569222;
	bh=CceK4sPOFnQm5t6VoQoiOkyoeVP61Erpl8muySKbS7A=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To:From;
	b=XUI6GcTSkfxEK7lZy6lCV2dkWmbkeTc9AWvzO5e+VhzlSlFlZW318HPsscjy4HzAm
	 10waotlsjTbJV3f0CFWLRCzRiyJ1Kiq7npw6g4+hW5fZ9XpT+4cEXFhSY5l9Lzs04A
	 ECEAr1+bc2JO7v4lpIhZySFJphxiiCQSEStTM3aebVFWuj3s0K1mW0GYADKjlGCVEU
	 xLJ5GTuJRwveg/qGnWjqHZ9ox9WrxZkz0sYOf2+ZrWLTad7M1BV/ss5wZJTbCWJxiU
	 AOIBRYBiDNQYjv2IrDUwpDug9xR4KdCvhQA5QxM64gbClN9Oc06GNd99ldkK3/m4Oe
	 LjPlpliy27InA==
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=bb7f9ee63b170cb3f817f0b120b5814d73d2d9b290b0c5bd9364a39518c7;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Tue, 12 May 2026 09:00:18 +0200
Message-Id: <DIGI632TIZUG.2PJQLJWL90TYD@kernel.org>
Subject: Re: [PATCH v3 2/2] gpio: regmap: Don't set a fixed direction line
Cc: <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Sashiko"
 <sashiko-bot@kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Linus Walleij" <linusw@kernel.org>, "Alex Elder" <elder@riscstar.com>,
 "Bartosz Golaszewski" <brgl@kernel.org>
X-Mailer: aerc 0.20.0
References: <20260511-regmap-gpio-sparse-fixed-dir-v3-0-1429ec453be7@kernel.org> <20260511-regmap-gpio-sparse-fixed-dir-v3-2-1429ec453be7@kernel.org>
In-Reply-To: <20260511-regmap-gpio-sparse-fixed-dir-v3-2-1429ec453be7@kernel.org>

--bb7f9ee63b170cb3f817f0b120b5814d73d2d9b290b0c5bd9364a39518c7
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Mon May 11, 2026 at 9:43 PM CEST, Linus Walleij wrote:
> If a GPIO line has a fixed direction, report an error
> is a consumer anyway tries to set the direction to
> something other than what it is hardcoded to.
>
> This didn't happen much before because what we supported was
> all lines input or output and then the implementer would
> probably not specify the direction registers, but with
> sparse fixed direction we can have a mixture so let's take
> this into account.
>
> As a consequence, since gpio_regmap_set_direction() can
> now fail, alter the semantics in
> gpio_regmap_direction_output() such that we first check
> if we can set the direction to output before we set the
> value and the direction.
>
> Suggested-by: Sashiko <sashiko-bot@kernel.org>
> Link: https://sashiko.dev/#/patchset/20260507-regmap-gpio-sparse-fixed-di=
r-v1-1-a2e5855e2701%40kernel.org
> Signed-off-by: Linus Walleij <linusw@kernel.org>

Reviewed-by: Michael Walle <mwalle@kernel.org>

-michael

--bb7f9ee63b170cb3f817f0b120b5814d73d2d9b290b0c5bd9364a39518c7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCagLQAhIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/iZ0gF/dJBdyx3J01p2i9y/flG7BkRIdcIVrmAz
lX88cxcBIfgXKQLMic4EZtoy7kDeKwpDAYDD+bsttLQTq3+PbDMGNIc5ArC318i1
VNUQ3+j4CdGZud9B8XlyGAcTqPFmswZTgmU=
=MpBi
-----END PGP SIGNATURE-----

--bb7f9ee63b170cb3f817f0b120b5814d73d2d9b290b0c5bd9364a39518c7--
