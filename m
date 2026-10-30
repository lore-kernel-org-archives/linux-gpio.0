Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793351274;
	b=5DB3v6SWaPI2yD1GEFZZAypsOa19oDdFJ3Rxm+UgjFKw2QU+G/wTldFuYD6vvat4+dFP
	 d3mm5BoEJrBT+tNJGzmTcNqpZSOiQ0ERC3VITP+nyyQlscPdNPZGeImjjQzfQ9YIthspZ
	 ZJBuvt5lrGpzkLw+4/RY1ArBmwyPlvXqP3zh8iFMhsWyuL46p6elBtxaSmBZlqp/3T+Ly
	 1Vv7v74IkwOkOe/WyeaarKv+wbYw/rLSpxCkWB4X019jx1sCmm9BfH+dOBMZv45zP4dLP
	 VwtPbFV297lq75mOc4a4YkKEidL7enkVhuGbSNBmGZDULv8/M5euD2jcPEf2/z8lsvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793351274;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=cc9lLnR6arG3aWt1JxBGsLGvPNjJbInIb1wGZQJd1AM=;
	b=wcqzyumDOHmsODmXaOLXiSFu+XO6JCWBzeG+VmlOsF1XwYqsglgVw3IcCMBFz7j5wRfI
	 FDkUEvnZu8pPLf0U0XIUcNQnZEEzBckpKYWrdbzd/iumIuToWsunsbyvbsdJM4RkdzBPp
	 jnm88leQ0SWzysVx9m1tjsjOn/8AxGZozWuoDgeib/5TN4nAyq/7mI+9qY3snOoFls6UO
	 xLDZWmh3STKw5hPzj+bljycD017pM20Iz2Af5AASjxnfUEtSo77dJR4xcAjM+7XsPKLPp
	 1vAX1jd+hMFWWgUllIulowjN8VgnERSY7bVUYdYYiPB0fk3JeBlRK76nc5NPwP5ebrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="WsCode/g";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59374606A31A
	for <linux-gpio@vger.kernel.org>; Fri, 30 Oct 2026 09:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WsCode/g
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74A2C1F000C1;
	Fri, 30 Oct 2026 09:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793351274;
	bh=cc9lLnR6arG3aWt1JxBGsLGvPNjJbInIb1wGZQJd1AM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WsCode/gkl6DZDXzY2z58L989RRQoWCi5/sbbBJVgKVeFP5WD9woY/EKnk260yN8r
	 /htEkmu5e03u3YjbsXPmxeU3p4ieNaSxg2ClTdLEpT70uzZ/kjZvWsClCpRWEVBPeQ
	 LWQ3pNDsRXAjkEJFV2hhWQbt/2kkPe/3ZqttUe3J9V4rfjvrK8b+fBtLV5ICzbiatQ
	 kdKLnv4KXgpfOrPLWiUg3WqJWK59FpNaD4faUwmoGVYXas6yaSOdyqWyWJTPqXBMtJ
	 dCcsT/+6eja4z/JoSMXly4RXhtk2t0UZ4KRFWjTf/K1WT6ysVJiv9SWulCILNYMZAI
	 5flK42YAodtIA==
Date: Fri, 30 Oct 2026 10:07:48 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linusw@kernel.org>
Subject: Re: [PATCH] gpio: shared-proxy: don't refuse the first direction
 setting
Message-ID: <5fhprmrrbfvu4gzsvru7h2z5b3tac37raf5vg3q3zqr56pv5ib@bc36imj2qjpz>
References: <CGME20261028222815eucas1p12f4ceb1dca96576cb395430cc2544420@eucas1p1.samsung.com>
 <20261028222803.2682808-1-m.szyprowski@samsung.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261028222803.2682808-1-m.szyprowski@samsung.com>

On Wed, Oct 28, 2026 at 11:28:02PM +0100, Marek Szyprowski wrote:
> When more than one consumer has requested a shared GPIO, the proxy
> refuses to change the direction, based on the current hardware direction
> of the line. However the hardware direction is not necessarily set by
> any of the consumers - it may be just the power-on or bootloader default.
> 
> This makes the result racy when the consumers probe asynchronously. On
> RubikPi3 two fixed regulators (vreg_es8316_1v8 and vreg_es8316_3v3) share
> TLMM GPIO 117. When both proxies get requested before either of them
> configures the line, usecnt is already 2, the line still reads as input,
> so gpiod_configure_flags() of both regulators fails with -EPERM:
> 
>   reg-fixed-voltage regulator-es8316-1v8: setup of GPIO (default) failed: -1
>   reg-fixed-voltage regulator-es8316-3v3: setup of GPIO (default) failed: -1
> 
> and the audio codec and the sound card stay deferred forever. When the
> regulators probe one after the other, the first one configures the line
> while usecnt is still 1 and the second one succeeds.
> 
> Track whether the direction has been set by any of the users of the
> shared GPIO and allow the first user to configure it, regardless of how
> many consumers have already requested the line. Reset this state once
> the last user releases the GPIO.
> 
> Fixes: e992d54c6f97 ("gpio: shared-proxy: implement the shared GPIO proxy driver")
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---

Hi! Does the larger series[1] by Shawn fix this problem as well by any chance?

Bartosz

[1] https://lore.kernel.org/all/20261028123448.510401-1-shengchao.guo@oss.qualcomm.com/
