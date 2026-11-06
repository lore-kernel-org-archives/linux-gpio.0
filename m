Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793945626;
	b=1BZFmPncgUZ0p6llOkOfUm7rgPQrul2IbOtKCSuktU6VajoTU2EO+kKP8lHl0QqAQQxq
	 WI8GtF7rwiMMtwRNS4tI6d1ydiSRU/0MAjC/xgTtGiC53iddMzvMMw1/KRS8P9BuhSevR
	 01xOaslmGtO7J/T0Pf06QHxy/R9AjQaHUUxULUgDK1E4FbQCFVaS46qDprB+Zi3h9Hcye
	 B2fx8R2kbuAYqd3s1i7DPxtbIUczW9jraFl36bxAeFVtT1et2Fs7P1E+vPyc3SeNKU8DZ
	 Y+GRjw7dFjZcx0rCBmCPBCpYTZILUgG5gOi7kF0xyWkmfl5c6LMhOW887kdJsnRYJLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793945626;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=rzvF6MsRtSNRQYkAnE8s0gTVzXdnYrXPinbLwOnBUXA=;
	b=bSEmuTrOkZsHmO7qCn16/ULKgYWYd+PvQt4VpjjvYEAcuBplaMVa/r9drUvMVaY03me4
	 T/Tw2YV7UM2uK58hrzmR+an76hSyZwBe70w99TFAQJ9Mb/2iJ9i1tNMN5qr5a/KkvBedz
	 wEUgP/6I8wmr1UxBzMI8jWOlb6LeWOJNNZYRB2p51FR0xTMyHDjZqHx/U/MS0CuO6g9Pq
	 7p4NxUbYe8SNWJD8jHVE7gClkSt8qs0mOmQJlDkIrQMf8Y0cJiFaQFhGSJa1BVxUYJIwx
	 r0N77At/ZTZwZlE4oM7JDxD5DudF9koDNR4LR7oKgbypffuTZo5u+tPTv0mnDC7gakg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=codeconstruct.com.au;
	spf=pass smtp.mailfrom=codeconstruct.com.au;
	dkim=pass header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=ndZFzLE5;
	arc=none smtp.remote-ip=203.29.241.158
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6105606A326;
	Fri,  6 Nov 2026 06:13:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6105606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=ndZFzLE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1793945623;
	bh=rzvF6MsRtSNRQYkAnE8s0gTVzXdnYrXPinbLwOnBUXA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=ndZFzLE5AsFZxPNSYiwe1F7iskrv784pVUWFqTXYG7o/4s6WIGZF/QcWN8C9inFSo
	 d8MXP2mSJgLPYNoW2AWLn5VRNIrPj1LvIP1mHVKZgWOhOhRI1K25XLF/k41y826lKv
	 7v6ZUAbAXf0oSctj+L3mLhLfjRcu6yV4dTGlwR+GFYPnnTZ0Mpl4+zXQrBBq5Jf9Ps
	 6HKEmS/q5zVbYOPc/TJlicZ8TdETKFUGMYUXrevKj92uB3KYj9iN289JumYhwMUiVc
	 xZc+5Q1POjXSzWFRBjBDRuAzzg7r5Zf16DH2Yx6Mk9Yn6HZE//t+JEvCfKXgJZTiuz
	 1HdzsucRlCc9Q==
Received: from [192.168.68.117] (unknown [180.150.112.139])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 0140E649EE;
	Fri,  6 Nov 2026 14:13:41 +0800 (AWST)
Message-ID: <8afcccd35b8a78730c6a9cc46c30dbeb99694e6e.camel@codeconstruct.com.au>
Subject: Re: [PATCH v4 1/2] pinctrl: aspeed: Use managed pinctrl registration
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>, 
	linusw@kernel.org
Cc: joel@jms.id.au, ryan_chen@aspeedtech.com, billy_tsai@aspeedtech.com, 
	brgl@kernel.org, tan.siewert@9elements.com, linux-aspeed@lists.ozlabs.org, 
	linux-gpio@vger.kernel.org, openbmc@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Fri, 06 Nov 2026 16:43:41 +1030
In-Reply-To: <20261106022907.10735-2-prasanth.padarthi10@gmail.com>
References: <20261105152348.8567-1-prasanth.padarthi10@gmail.com>
	 <20261106022907.10735-1-prasanth.padarthi10@gmail.com>
	 <20261106022907.10735-2-prasanth.padarthi10@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Fri, 2026-11-06 at 07:59 +0530, Prasanth Kumar Padarthi wrote:
> The shared Aspeed probe helper registers its controller with
> pinctrl_register(), but does not unregister it when the device is
> unbound.=C2=A0
>=20

This is a problem in its own right. IMO the rest of the discussion can
be left out, as it depends on the subsequent change, which still needs
consideration.

> Registration can therefore outlive device-managed callback
> data, leaving a registered controller with pointers to freed memory.
> The G6 handover change in this series embeds that data in a
> device-managed allocation.
>=20
> Use devm_pinctrl_register() so controller teardown runs before earlier
> devres allocations are released. This also cleans up the registration
> if later probe processing fails.
>=20
> With this change and the G6 handover patch, one unbind/rebind cycle
> passed under generic KASAN in AST2600 QEMU and on B650D4U hardware.

IMO this sentence is enough to describe the testing, the rest reads
like unnecessary detail that tends to be generated by LLMs.

> Controller debugfs entries disappeared on unbind and returned on
> rebind; a subsequent pins read succeeded without observed KASAN
> reports. The unfixed control case has not been runtime-tested.

What is this last sentence referring to?=20

>=20
> Signed-off-by: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
> ---
> =C2=A0drivers/pinctrl/aspeed/pinctrl-aspeed.c | 3 ++-
> =C2=A01 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed.c b/drivers/pinctrl/as=
peed/pinctrl-aspeed.c
> index 7e0ebf11a..d19b4d23c 100644
> --- a/drivers/pinctrl/aspeed/pinctrl-aspeed.c
> +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
> @@ -461,7 +461,8 @@ int aspeed_pinctrl_probe(struct platform_device *pdev=
,
> =C2=A0
> =C2=A0	pdata->pinmux.maps[ASPEED_IP_SCU] =3D pdata->scu;
> =C2=A0
> -	pctl =3D pinctrl_register(pdesc, &pdev->dev, pdata);
> +	/* Unregister before earlier devres allocations such as pdata are freed=
. */

I'd rather the comment is removed.

Cheers,

Andrew

> +	pctl =3D devm_pinctrl_register(&pdev->dev, pdesc, pdata);
> =C2=A0
> =C2=A0	if (IS_ERR(pctl)) {
> =C2=A0		dev_err(&pdev->dev, "Failed to register pinctrl\n");
