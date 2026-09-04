Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C21FC4195D2;
	Fri,  4 Sep 2026 06:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788504261; cv=none; b=eYrvWxirKWMvcgKv0muM2pLQ3/ooYULdO0S7++Cc6/C1opJsemRfLOp7MzYUSZ7K1kN2C1jju8dYaVINHZXFGG+hFeGBzPC3WBZzw701ljmrfjlIXKvTi5ysK+zDnWS01VEqbedAt2ty/AJXfJKJchZcQY2d5Kc/ZpMlvHanIGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788504261; c=relaxed/simple;
	bh=FjvaKYb1QnuY7ihNibdHpcnPHO/khxaMekqPzpu/5Z4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:From:To:
	 References:In-Reply-To; b=M9dMnWO+k2hA+J3Qk0RCnw3F9SRnrc+hcctHI0NGOPVftf1mtH1GI+4PIZHeJGDaQvpJB+2bD5etUIHCfePQ8DO6G8Sb2djBw/TbjKVnw5bFbKkjeXR9ToiNGESxLloaiYjX7hLRfUoJitzjKB96eQM3MbXylJILe+fg+o/SjdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D1q3PoEP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D1q3PoEP"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id D92561F00A3E;
	Fri,  4 Sep 2026 06:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788504260;
	bh=FjvaKYb1QnuY7ihNibdHpcnPHO/khxaMekqPzpu/5Z4=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To;
	b=D1q3PoEPnIlkqHO5GOgkrLNPagJtL0j+Ttea4S6ev9fyLY9u5lcSa3EzgLncx4QUV
	 czRUoHDzdD1lmkm3/J9ccpytAIl3cgnEBPaMv5poahYAQ1mQnEqzDVrBgaPaZRVyiE
	 7G9t17QpZDBmH7Wkcbi8WbrBItESrJNGEJMkX4/PrUXmsXshOjuMRMYTbqkfMYDnZ7
	 TcXrHrCU9cueCN38EKdDEThKSQJ7dFGOYrKt3nHHxSoFLi6ZrLwDg6Xta0Zgoo5Z6n
	 WVItvywoVBE4NuaTLaAifq9vGzi8v1xxlmYc0EKOffL2jKJakwCMFhDsveB9UlM9mn
	 q94NRu39QfbvQ==
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=c5f9d989349b39aa9155d6611598ddcf6959118f1716d6b107a91e88843e;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Fri, 04 Sep 2026 08:44:15 +0200
Message-Id: <DL6BUGHEIP3C.1FBQYVS83GQ4W@kernel.org>
Subject: Re: [PATCH v6 2/3] gpio: regmap: Add optional runtime PM support
Cc: <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, "Jonathan Cameron"
 <jic23@kernel.org>, "Andy Shevchenko" <andriy.shevchenko@intel.com>,
 "Janani Sunil" <jananisunil.dev@gmail.com>
From: "Michael Walle" <mwalle@kernel.org>
To: "Janani Sunil" <janani.sunil@analog.com>, "Linus Walleij"
 <linusw@kernel.org>, "Bartosz Golaszewski" <brgl@kernel.org>
X-Mailer: aerc 0.20.0
References: <20260903-ad7768-gpio-v6-0-4254ef6c9b38@analog.com>
 <20260903-ad7768-gpio-v6-2-4254ef6c9b38@analog.com>
In-Reply-To: <20260903-ad7768-gpio-v6-2-4254ef6c9b38@analog.com>

--c5f9d989349b39aa9155d6611598ddcf6959118f1716d6b107a91e88843e
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Thu Sep 3, 2026 at 2:01 PM CEST, Janani Sunil wrote:
> Some gpio-regmap consumers share their regmap with a parent device that
> may be runtime suspended. GPIO register accesses must resume that device
> first.
>
> Add an optional pm_dev field and acquire it before register translation
> or access. Release it using runtime autosuspend after each operation.
> Keep the device active across the complete direction-output sequence and
> propagate failure when setting the initial output value.
>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> Signed-off-by: Janani Sunil <janani.sunil@analog.com>

Reviewed-by: Michael Walle <mwalle@kernel.org>

--c5f9d989349b39aa9155d6611598ddcf6959118f1716d6b107a91e88843e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCappowBIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/j6QgGA8HQsKUjdvFVgWd2Da9IvkenWjkIam4Bc
HvHBCnZ/3I1YiExKxOxja2voN6hZREdDAX94mqyXwKQV/STC4E6T5miN9sx/YGC7
/+GcrS+oPu2N2429WQNlxiwKcCK4tFVH5X0=
=WGzB
-----END PGP SIGNATURE-----

--c5f9d989349b39aa9155d6611598ddcf6959118f1716d6b107a91e88843e--
