Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794304382;
	b=z7eS8dYVz1mUH+YYflfVghKazg5Uthn9KmVQ4afu8XzmF20jv1XG6aT7divjO87arEZk
	 T5ymYL/JavQBFvbWPA8PntBMwA3ibFmxUPOCkhOzFEx0zQ74WSs/auSSCJEPTM+CQY6PM
	 JOSdNiBlG0aLOPKqT7Wwp0yZWga3cfTrZTw74Mi1syqk7QtOQHBz6JbnoeTjkutSUH8h0
	 8ZRT/VWeBPdSAPlRriTWl5SBAopiAJWYCo9JYb8PVIlB+jjqKU0DIan0nhzb6yYJRLwPU
	 G0V1uJN1AjroynJwUE4f8t0NXKa6OyxmuTyEgPLq4f7w4Ha/oBbQInJY+Pa2gxZ/l0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794304382;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=fT31XLKUQuRmxzdqIKu0tH+kJNHQhLTcjslw879wGR8=;
	b=gEGhP0SWVYrtjn8b3UE8NNME4cu4S4ACHCovbblHOK2t6YbeNyEE2WNmN1nB1x6C1Hkl
	 flbOZbVrxtCyJQUdKOF8LbEUT6lcPJlIzD/BWpRL+n5/eQkJSwbAF+Rz83LuG7eBQbOtC
	 R11art4/ipnfjWnEfAZPTkz1N1ZKH+ZeYHnOC44AkatEkTbY5MW8SevvJSQ6PThQjEkv+
	 6Ls+xTWXy57nGFHUg4vI2o7dY0zOeKpUKho409W7RU75z0n0H7BXGGnBc5RgTz4ol5NfE
	 nL18CTNATj/Bt+YLD1mDNriZUKKlYz2JNv//Q+1QUT/CXZKtGznM9gotGgBfBUUoYog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TQKlb41l;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D215606B159;
	Tue, 10 Nov 2026 09:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TQKlb41l
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 753C81F0089F;
	Tue, 10 Nov 2026 09:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794304381;
	bh=fT31XLKUQuRmxzdqIKu0tH+kJNHQhLTcjslw879wGR8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TQKlb41lI4RDKQ8tDImElNGyAfW0fMdyvLQCvPeNqgQ07ZXRedM6ti2wVjopsmh7F
	 /YZC6s2AL+k0eU8XHT8YZIrJaTA14iTrFkhm2D84xolMnT1s54MkfFjznVjqzHnUta
	 sjJsNO3nJzjicFgYF9GtpjIibVjtyQLm3HPGJFtgXaoMN/0gJj6zy12EKa1fEZ5cWK
	 /PDVwh65kO/V0SzLqupPGitAmatpeNSwpLtgFIloA5QlFJpbTvlOthDVDIn9w1BPOM
	 CZgVYNEncBsgcpa2ziTtwmpD8z0ttwZMx0f0yURuCRtFkeLvdcN816I49HwbVVCcXt
	 9QmwPxxnZBQbg==
Message-ID: <sashiko-outbox-206812@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 01/12] pinctrl: airoha: fix setting of GPIO direction
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zhengping Zhang" <zhengping.zhang@airoha.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261110094339.749110-2-zhengping.zhang@airoha.com>
References: <20261110094339.749110-1-zhengping.zhang@airoha.com>
 <20261110094339.749110-2-zhengping.zhang@airoha.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 09:53:01 +0000
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
- [Low] pinctrl: airoha: missing Fixes: trailer on GPIO direction fix
--

commit 6dcec8340cfdb81d9b7f8c972e7a3451fe15d376
Author: Daniel Schwierzeck <daniel.schwierzeck@gmail.com>

> pinctrl: airoha: fix setting of GPIO direction
>
> The GPIO_CTRL registers have two bits per GPIO where the values 0x2 and
> 0x3 are reserved. It can happen that both bits in GPIO_CTRL of a GPIO
> are set when the pinctrl driver is probed (e.g. modified by bootloader),
> but the current code just clears the LSB. Thus when switching a certain
> GPIO to output, the updated GPIO_CTRL register can contain the reserved
> value 0x2 for that GPIO. This can result in not driving the GPIO pin at
> all.
>
> Always clear both bits per GPIO and just set the LSB when the GPIO is
> configured for output.
>
> Signed-off-by: Daniel Schwierzeck <daniel.schwierzeck@gmail.com>
> Signed-off-by: Zhengping Zhang <zhengping.zhang@airoha.com>

[Severity: Low]
Since this fixes the single-bit GPIO_CTRL mask introduced in
1c8ace2d0725 ("pinctrl: airoha: Add support for EN7581 SoC") and later
moved into airoha_gpio_set_direction() by 62b1dd7eeaca ("pinctrl: airoha:
add set_direction() helper for gpio_chip"), should it include a Fixes:
tag?

  Fixes: 1c8ace2d0725 ("pinctrl: airoha: Add support for EN7581 SoC")

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110094339.7491=
10-1-zhengping.zhang@airoha.com?part=3D1
