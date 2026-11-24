Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795540940;
	b=YQ6/cXQdb7JwngReApqP7fi3FvSA7RGL6lskYP1zEGO8kpvpwPs91J0QOCWp6pW1hDmU
	 MuRtYAsIoowlA4Y65sqtAreWqSRlIuq0wXZ/V8ThZd6V8VN2aOKVb6YKu8SBUPD9sETEO
	 kAXAMQKXR+qoWQ+SedpMo0VFjBolGGlgNZdc8uw7qZTd5vXxoSliIpYdnjsCqOd8Z3Zat
	 lPl2fxuJV+NpTNtPHwXsE2aJhcMfUwP8/ujbv24dujHHrdFxmfl79J4CPDhS7oGJjZmFb
	 Gr6c4lIt+PxNnv82Ls3KtNA2iQ+1sLzzzO+ZBsl1ddM0eRlgF70rQQmNJST4peo/OYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795540940;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=5qT02Vd75BhfhSvRr99IZVf+ichnuVFriBUMt1Ydbms=;
	b=s7lbPeUb9T8P+TvyMjbQj0hpTDWbKMOZWqdiZLRN/x3g08iMgmipM0icBBEpOI5aV8TG
	 d0VWucoYqoXvUsJTlKxUL9yAYF3fKU5t599eqg2fienRNTBQp+QXNbhITigdv5baEjp4u
	 9GI0f89Cd9QXG5nX6JSYl0mdDvoxXRwHzj6SXvDSQEqg0nZm4J9gj6SqcLlrwxp+Vgdtv
	 ec5PltAzQpVLd4jP72XwYgJdmDZknxOjoxNxD6+zWTG8lz7/h2e/zm0ZcF8+ibr/jFl+N
	 yqQ3qfhAVySgJ7KuWIhfY/XPs8Fgfj5aBxOZTMJbQp+ztnV09JVQ7I1vf2cN1kyeWUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ibwf8t59;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19BBD606A31E
	for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2026 17:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ibwf8t59
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47FA91F000D0;
	Tue, 24 Nov 2026 17:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795540939;
	bh=5qT02Vd75BhfhSvRr99IZVf+ichnuVFriBUMt1Ydbms=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ibwf8t59vu9DP+omZhuVXpyZtQm6kv+YhxLK6OL7CapwRKIEbJ7kCLN8GmGQqG4JA
	 eQamkhpiP349wh6tJgYZQFmhET3S/PrxtuIRiVSYMs5Tg6ygxRqQW4+DWyHHBhmsJa
	 IBchgWtYTZgoLymysv7FN4vKM3T1Ivg8mDdSKqfrpA35pvByFzWvf6xjkcf92+0E8x
	 3ScSeUKZ2vZPLfZf4rUHeLBbk0hDFCJUyQFVQRSWOftJ9MiLZN1GBKG7GJyCev0cFx
	 ZADaVlzNfKMX+Tt5JcRi6i7KYUP2DFTw6plSyLFUycwVOsSuxm/KcON7n0BZBHSZEW
	 34g+0ugaTeJ2Q==
Message-ID: <sashiko-outbox-231697@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/5] pinctrl: upboard: fix I2C pinmux-select set CPLD
 GPIO OUT not function mode
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gary Wang" <is0124@gmail.com>
Cc: linux-gpio@vger.kernel.org
In-Reply-To: <20261125-upboard-pinctrl-add-intc1057-intc105e-support-v2-4-c8079f8f569f@gmail.com>
References: <20261125-upboard-pinctrl-add-intc1057-intc105e-support-v2-0-c8079f8f569f@gmail.com>
 <20261125-upboard-pinctrl-add-intc1057-intc105e-support-v2-4-c8079f8f569f@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 17:22:18 +0000
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
- [Low] pinctrl: upboard: changelog omits UPBOARD_PIN_MODE_FUNCTION =3D 1
  fix
--

commit 03c95ea6b689b4fbe7c976e4dbf6f9cf5c5f2274
Author: Gary Wang <is0124@gmail.com>

> pinctrl: upboard: fix I2C pinmux-select set CPLD GPIO OUT not function mo=
de
>
> The CPLD I2C pin mode setting through pinmux-select is not correct.
> Should be set UPBOARD_PIN_MODE_FUNCTION on AANT0F04 devices.
>
> CC: stable@vger.kernel.org
> Fixes: dca2f73cf19f ("pinctrl: Add pin controller driver for AAEON UP boa=
rds")
>
> Signed-off-by: Gary Wang <is0124@gmail.com>

[Severity: Low]
This isn't a bug in the code, but the commit message does not explain why
UPBOARD_PIN_MODE_FUNCTION is changed from 0 to 1.

UPBOARD_PINGROUP() stores 0 in .mode as a sentinel when a per-pin .modes
array is used, and sets .modes to NULL when a single mode constant is used.
Because upboard_pinctrl_set_mux() selects the mode with

  mode =3D upgroups[group_selector].mode ?: upgroups[group_selector].modes[=
i];

having UPBOARD_PIN_MODE_FUNCTION equal to 0 caused a NULL pointer
dereference of .modes[i] for any pin group using UPBOARD_PIN_MODE_FUNCTION.
Could the changelog mention this as well?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125-upboard-pi=
nctrl-add-intc1057-intc105e-support-v2-0-c8079f8f569f@gmail.com?part=3D4
