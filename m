Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794220496;
	b=AMVXyVhQakpvNKf583p535RI8nRCOLS+tKLziu3Gvhhg0y+4DgptspvES7W9d9V3Arja
	 Qmkhp1OvZdxJbRWGIhIJVHLEjKNvbCnx6H8AgideCtJzFq1D3xpgN+CBxW+bq3cUDwh/G
	 FAwIvrssrYYfDVlR31+pDALswymjpy8pkVi3sG2kdwQ8b2yDvqNOidHmUGVg82PHUs1P7
	 /VFr9uv+F2vU3jPzKQacZyxgqJmMGx7S4rgqQWfp0CBQeO4iSl+UtAUm1bH0RyeO4c6s5
	 Mw7Z9f9B5fP2yR22WUAz32W8TZ1hnUCFxabBmJkggZSEaXIAnkyQV4WZOtqEfc9mBRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794220496;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=O69NEb5LyLmwF4cjzs6CoJyOy8VHTlaCNEnCXNcIakI=;
	b=FEDpNIq/EImwEdAxs/7UgESir7iSe1zX+eJe2suImcCXgY6SPVE2nzCI55pSpQhxmENT
	 irgF/MEANdVb7eR9HPS8G+SGeR4jHK1XLwFmPEdG6+a2POt9gBX3RVRYWPg9tjGbHuOr3
	 P61ZAVEjuVGFYrkBdWGcAOksknX3ngleaFGSbrpJkQSaj56d4gq0xVKN6J9Zh/ATe9JkT
	 mMa49n6XwOFpXXDdFHXd1anUxBiGb/egvX+9HwpAAvN9nUlhMtXInTYOgoccv2ZxCOdxY
	 k0QK2eETd7cTuCTeKi0tJuC/Awjh4Xa5+TYWVJzd84SpaVUUKfCw+SiqvIfW0adfOxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="P5l/XwGj";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D83D3606D80A
	for <linux-gpio@vger.kernel.org>; Mon,  9 Nov 2026 10:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P5l/XwGj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66EB31F008A2;
	Mon,  9 Nov 2026 10:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794220495;
	bh=O69NEb5LyLmwF4cjzs6CoJyOy8VHTlaCNEnCXNcIakI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=P5l/XwGjjeJwMUKbOO7DFkYarVggarySgKD0W6iQrbfejLGiqAgRFf+Ud3EU4BP0f
	 rtyySCWl7f+MAGvIQzOMYl2jne4EIkCRQFLD3RacG75S4fM5i27J8ku+G1Yl5fdsp7
	 Bo34tBKDJBqiiG/8tnFe6KTda0aH8YOQ05n2GSM5xDreAyAfb/9bNYbC7O9OgkE+ih
	 xjlkj1ihkzPttdArwtcfSM3k20KpIrGU7llEE9nlQPCaODy7sEJWSs3kbCTr41Te24
	 Sh2eZMW4MhjgZnPapyGyYsJ42uLjQIeRPp09luD2LWhLSSwMOGMJ4Of9Wi93jiaU5h
	 9klKiaSOT1JBQ==
Message-ID: <sashiko-outbox-204827@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/5] gpio: shared: use atomic set_bit() for
 descriptor flags
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
In-Reply-To: <20261109-gpio-desc-flags-atomic-v2-2-c4c54b476628@oss.qualcomm.com>
References: <20261109-gpio-desc-flags-atomic-v2-0-c4c54b476628@oss.qualcomm.com>
 <20261109-gpio-desc-flags-atomic-v2-2-c4c54b476628@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 10:34:55 +0000
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
- [Low] gpio: shared: inaccurate second Fixes trailer in
  gpiochip_setup_shared()
--

commit e33d8a46a34364d4913f4b0279d4b95dddc4953e
Author: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

> gpio: shared: use atomic set_bit() for descriptor flags
>
> Use the atomic set_bit() instead of __set_bit() on desc->flags so that
> every modification of the field uses atomic bitops. No functional change
> as these run before any line of the chip can be requested.
>
> Cc: stable@vger.kernel.org
> Fixes: eb374f764a70 ("gpio: provide gpiod_is_shared()")
> Fixes: 310a4a9cbb17 ("gpio: shared: shorten the critical section in gpioc=
hip_setup_shared()")
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

[Severity: Low]
310a4a9cbb17 ("gpio: shared: shorten the critical section in
gpiochip_setup_shared()") only re-indented the __set_bit(GPIOD_FLAG_SHARED,
&desc->flags) call when wrapping the block in scoped_guard().  The
non-atomic __set_bit(GPIOD_FLAG_SHARED, ...) call was originally introduced
in a060b8c511ab ("gpiolib: implement low-level, shared GPIO support").

Should the second Fixes: tag instead be:

  Fixes: a060b8c511ab ("gpiolib: implement low-level, shared GPIO support")

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109-gpio-desc-=
flags-atomic-v2-0-c4c54b476628@oss.qualcomm.com?part=3D2
