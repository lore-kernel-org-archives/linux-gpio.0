Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447313;
	b=wdICOaCfMralcc+yG5WJEeUJ72EZS5y5jjATmtv4dJadcaPuDk4TwuwVGQw7L92CoSuk
	 Yx8TPQUwY3PiBIKcjVV6AQcTnO5Bn9fSyJ8UY4XLC8/OsfOX7qspaFzDbuO/d+uOkPcVI
	 jJGDYa/90Zw8pygq/tUnR7dEsQsXeIFg742/iwDRmwIaBSx5EL7GhSCrFy9B9DaTLztlK
	 Dohe8Tju17WV98wcrcfHSQgzhsmzF+2GWqiKNVO/yx0IVxz2pefYFZoqNCW7xpIZgi45O
	 F8Q+Tnl+tnNPlFLjNUeI5JXRpa/r5DOdnacgPFWeeYqJLt2JoG9+pyDJY+Ufcgevq3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447313;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=PZNA6z7iyVsNy9X+WMfKq9LqI6KGTa/ee8COJMDHAEs=;
	b=wvV495Nfsg2FdZOhyIqpLrHl2j4TjSPqYckfFxmjMvRcB+iEf7bxUrnOGJhbKrC7tZOE
	 zKkYUpOBrIPUPpSAVWsE+294q0/sThGyeyhRBTzCtGCPQbEps+uSU+L6eGq2O/ShsskvY
	 /JtEPZsb9hzBO1LtZDJRauGYV51r0dywqyGSqs1JpIFqemMc6xAp2NQjfN+QXCwc4bdgU
	 XGgimskewTf9xeV1LCdaGOaID9U/koRazgCoXHHLTNpFNGSj1XFpT/OSmcpM1M9G/e7i2
	 8gbGhF1PxSiNEcG+CvrPVizP1PAbCWxZ2S4u7a7oe8alGM+OdzA9hkNqN5k6jSmVB7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=a3pOSrFs;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24426606A32A
	for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 15:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=a3pOSrFs
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCB6F1F000D3;
	Mon, 23 Nov 2026 15:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795447312;
	bh=PZNA6z7iyVsNy9X+WMfKq9LqI6KGTa/ee8COJMDHAEs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=a3pOSrFs7IQejX7ymGuLMl+fnE+6Nf1BWt2p3ogsVmiC0y+re0aizklgvuhKN63mU
	 sy8mj/5wfiPiUGpKJWLxptjYCV/4GZn1WK0D4EgBKcbLoQJfC033d0sTZvhfRDQ3xz
	 kHvFCrzoK8wrXxUjdq0Bb53q3GxuUuQlzdufvs6KgYA6guutk5dW4OlkDSZ9opglpg
	 kN5NfpVuoKvvcbIj5csf+B4ce9B5cFOKvYzaf0v1n6hapRpYRHS5Xl7eGEAYXUqN0S
	 dVYhSadZQSHpU1wSkHAiKyleENZFriGMLaJEsszCvSILoD8URaDBIB7UoOVmfc9cFY
	 d+XoshK/hUqow==
Message-ID: <sashiko-outbox-229537@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/5] pinctrl: meteorlake: add some groups and functions
 for INTC105E
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gary Wang" <is0124@gmail.com>
Cc: linux-gpio@vger.kernel.org
In-Reply-To: <20261123-upboard-pinctrl-add-intc1057-intc105e-support-v1-3-f2322a91686d@gmail.com>
References: <20261123-upboard-pinctrl-add-intc1057-intc105e-support-v1-0-f2322a91686d@gmail.com>
 <20261123-upboard-pinctrl-add-intc1057-intc105e-support-v1-3-f2322a91686d@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 15:21:52 +0000
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
- [High] pinctrl: meteorlake: missing Signed-off-by trailer in commit
  message
--

commit 85b67a583a6f70ae6d40f1f20ce316d4f56e6ef3
Author: Gary Wang <is0124@gmail.com>

> pinctrl: meteorlake: add some groups and functions for INTC105E
>
> Add i2c0,i2c1,pwm0,uart0,spi0 pin groups & functions in mtlp_soc_data for
> device id INTC105E.
> The pinctrl-upboard driver set the correct pin function corresponding to
> these data.

[Severity: High]
The commit message is missing a Signed-off-by: trailer.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123-upboard-pi=
nctrl-add-intc1057-intc105e-support-v1-0-f2322a91686d@gmail.com?part=3D3
