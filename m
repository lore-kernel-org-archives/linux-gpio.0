Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793973456;
	b=weBqtOmCQmjUjjZ7AsU4HGs9Fdc4TsyR1KeQwa4KDSlDQlELP1V7RIReuPM6dxcEj5X/
	 iYME8RozmAwpH/Mbkj+Nm73DoXpYTU/+ylaYfwThijyUoZJr0RwIrZuDfaonEyArhWddA
	 217HiqdwwZBksJajGtNk5jzl1VdzgYSD0dJCM+mCvTnPECl6HSpfSeGVFndzLafOWltjj
	 AirDdZkEByFmgk37FnP8GMzj2/kAwfjBL59d2zEueO5vMG4EJPtN8k1BUDCly921r8Dy/
	 Nf72FceN3MmQv5egrWZQIV+YL9sSf7Z7fsCfHFzwjuhcq545wcDFnj/Zk01hMthBUBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793973456;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=9T0LnSZE4jxy3AEN0at5sIrzQL9ensO5OloqKrKiPVg=;
	b=XDW+uqn+OBrrhwPhxhayHPiHihoGfaY8Ecmte8c0a4Cuu3TZd8J5RotHvTOhsmE5eXOW
	 OOoCnW5BYaoXLad82xhBmWIiNdQMbMOiS/eiOsNI3esnW7oMD4E5Xc9SQ0mKKN6u6Dvkf
	 zPMapFRhbr6l9u4NaFD1GI8RJ4iyizhaSjuW6nHPSKA05C0lUqaE9rwfOyozFn86lXOxu
	 TguuB/YYKlRVnMyOgdwUoZBGQxMAqRrUKlNHV5FRkO7mrxumyzHR6mCb+HVpBw2PKz2Nc
	 77mumnD39yPG83GkliZb0aOTMsAqisXyP2/NPIVAERpCBVk8b5JLmyyBpQYOQ5CNKSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AoKnGPiI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98883606A330
	for <linux-gpio@vger.kernel.org>; Fri,  6 Nov 2026 13:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AoKnGPiI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F25E1F008A3
	for <linux-gpio@vger.kernel.org>; Fri,  6 Nov 2026 13:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793973456;
	bh=9T0LnSZE4jxy3AEN0at5sIrzQL9ensO5OloqKrKiPVg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=AoKnGPiIB1DhXODHdrMyCab3ygRcVgxXI18/4nyHkKxaw588zN1Cm1XO10C1yYwAC
	 1fKWs7QF8cQ4TRCzzSw87/JfgPGB19Asf7nRM7j7wPZoSY1AtTd9/d1ZUm8/RhLZXh
	 NqDvuPkOtczKPYnu9fFHv07iXD6Kx2G6v+HmjSGEMLxyss6sSZ92ES7LVjrl8fgEV2
	 K+dBV6XNlzMVBCUR8M8tIr3SqY5POQoDcmvizZAQzFLg+mqd/MzqHpSxP1ytDBg1EX
	 Kl3nb+GneSOPlHk2na3kQzJN/eIQ0TwvxbsU9C/zp+KY6d8/gikvFzGw09vBoPd2N8
	 snhmnzE5m6QJA==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5be3ed646a5so827618e87.1
        for <linux-gpio@vger.kernel.org>; Fri, 06 Nov 2026 05:57:36 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxByH2lqgoBy3+a427yNggdbv3djyKVj7UKYTrDL1g5+1UPem5gtqYDICnWvrjdnR0rvKqnan+Ilti3@vger.kernel.org
X-Gm-Message-State: APuU4Z8wrB82zF8Vlw8XvaBYiL12J5Emjo4w/jXcjtHQB0CH3tenZogl
	met19hqiXTrtaj1dFsKFyEcUnNQAjtHnCjMC4dZy9ae1bdtyB/74BrR8iDtAyIbpLLOuzbxrQnp
	UISDYhur7eSu0hpBqjdipwfHS6EP5r+U=
X-Received: by 2002:a05:6512:318b:b0:5bf:c4d2:b074 with SMTP id
 2adb3069b0e04-5c003c242c5mr772472e87.55.1793973454973; Fri, 06 Nov 2026
 05:57:34 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105-b4-gpiolib-free-v3-0-bb47ad58642d@gmail.com> <20261105-b4-gpiolib-free-v3-8-bb47ad58642d@gmail.com>
In-Reply-To: <20261105-b4-gpiolib-free-v3-8-bb47ad58642d@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 6 Nov 2026 14:57:22 +0100
X-Gmail-Original-Message-ID: <CAD++jLkWRm9arpKN_bekojaL55Wru4UFcYHOA7QFMttMF0PW9w@mail.gmail.com>
X-Gm-Features: AclHuK9sUwMCj74Af0Cp_IBH_N9Fa3VNGsyY-OWAhb2ysOXQB2G4ELB8paQQFTk
Message-ID: <CAD++jLkWRm9arpKN_bekojaL55Wru4UFcYHOA7QFMttMF0PW9w@mail.gmail.com>
Subject: Re: [PATCH v3 8/8] gpiolib: use %*pb format specifier when printing
 array masks
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Andy Shevchenko <andy@kernel.org>, 
	Janusz Krzysztofik <jmkrzyszt@gmail.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 at 7:30=E2=80=AFAM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:

> In gpiod_get_array(), the dev_dbg() statement prints get_mask, set_mask,
> and invert_mask using %lx after dereferencing them as raw unsigned long
> pointers. This truncates masks wider than BITS_PER_LONG to their first
> word and relies on the raw unsigned long pointer representation of
> bitmaps.
>
> Switch to the %*pb format specifier, passing the mask size and pointer
> for each mask.
>
> Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
