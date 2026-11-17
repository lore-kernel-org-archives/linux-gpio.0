Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794904361;
	b=OQmot4w/EwAiB4K73NLPEk1mgbE7dmGCoGccEYLFHl1DMedQIDcc5qQblfYY68rOXImq
	 6DPzUcHnealkEQ2e53tFkp1TVQ/rUcx5TyqQRL7kuYTLGqJ+NKEZ3MHuEH0iE4By+AgCo
	 kEfVrZLxV/1EaFqKsUq+6dUYGYdTXZLv8PORjo4Rokgn0wDtLv7FnO4x9MNHMq/mRcRdA
	 08SvAmSP8PlefifeLBEXuZBHhg1zos81J2waPMhUSfa9rSlivwZXTCY7ZOyJzlQqY35w/
	 Mkrkw7M8Dn2nPj6cYxwLBAIPQr9RHbZl19O+/GFXrh/mkbZ7x1gKpXIPAC2KO2FOVrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794904361;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=sUnKsuDGKFImQsuMY/DHbO5AZYpcq2an3IW8zzTpUo8=;
	b=5G6GZk2IRqPvGjGPmRtzGYHhs75fsEgldavJ1gkADvfDPWRj6o5BvHCJNLPcpV4Cj7Q/
	 ut3dodsXOLL+qeYk8AeAXiXLhITlprKR4lFjrqj2zlex6To3cxPcSzGV1JHZ2pXD5oHd/
	 5qG/eRvdxMFq/WUJvZ+btjMtD1yx3FRUrKrGnDlCYhyoDJLBGKEZQmp6lqmfSVgK9m8ly
	 ghE6SHkv9M7B7W3zyM4umHUMG7tdVgAAzxodoR5ugZ1yE9Dzsk/lhORPSE9rGap4oc82A
	 aiLJK7QCYiTvIM96lUKMm6viIaEJSRGnSxFMwty+hIQbhlAIalnLG0AXC6l29aR/IMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eNai+9v8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 1A5CA606A333;
	Tue, 17 Nov 2026 08:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eNai+9v8
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 006551F000C4;
	Tue, 17 Nov 2026 08:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794904360;
	bh=sUnKsuDGKFImQsuMY/DHbO5AZYpcq2an3IW8zzTpUo8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eNai+9v8+RaoNiuRSFvmegAXjAMPmru/wvqVSCDMJbYCKrktLLRcl0rI8BU4X/LHR
	 GhRqi2Rk3U/JVMaUPv+w+DsF5nuIajLtggeUFQK0eXyQ19ikXbAW5OOMoSDYpEilu8
	 f48TdLGe1c+SYYciXV/KwKweBQW0FglSXswuV5UfaY99CBJFT64TF5KnxOUL/cT1MJ
	 2spAL5weAcQ/z63d/fcamlFPtFYTecsTHNjeGw1LoP+wLgqrm9+RYrjtJlZny6B9ts
	 ZClRUPQybqkE+YTT1k7SWJmiBRZjLR3dlxTaM/er66wvit52x/5kDoM+hhorKZhGry
	 pfOut5SZb+2qA==
Date: Tue, 17 Nov 2026 09:32:37 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Eddie James <eajames@linux.ibm.com>, 
	Ninad Palsule <ninad@linux.ibm.com>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Ryan Chen <ryan_chen@aspeedtech.com>, 
	Billy Tsai <billy_tsai@aspeedtech.com>, Linus Walleij <linusw@kernel.org>, linux-fsi@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH] fsi: aspeed: drop GPIOD_FLAGS_BIT_NONEXCLUSIVE
Message-ID: <bdsajtpcyfh6slwpwvi34uabych3gzlvibw7yvpieg2345xcxs@2qr6ect74cfc>
References: <20261103-fsi-aspeed-gpio-nonexclusive-v1-1-1fb040c59386@oss.qualcomm.com>
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
In-Reply-To: <20261103-fsi-aspeed-gpio-nonexclusive-v1-1-1fb040c59386@oss.qualcomm.com>

On Tue, Nov 03, 2026 at 02:20:42PM +0100, Bartosz Golaszewski wrote:
> There are no users that share fsi-routing-gpios in any of the upstream
> DT sources. Even if there were, the right thing to do would be enable
> HAVE_SHARED_GPIOS for the aspeed platform as this is the preferred way
> of sharing GPIO pins. Don't request the GPIO as non-exclusive as this
> flag is now deprecated and will be removed.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

Hi!

Gentle ping for this.

Thanks,
Bartosz
