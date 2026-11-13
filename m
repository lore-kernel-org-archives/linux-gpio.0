Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794581036;
	b=gwSgIASFEACZnXeXI0LVjawZqHWUOy8gt6N259TeKDwaeAN9l2h4ygQOHhkzjXDJYTwz
	 PUAat/6tCsuSEAklWgfhXdvS4mZaVgqkb5zN9P0XWlhmSHa7NZamdfSCi2MMwV6gAT0Cv
	 gcJ/MbrfR5YK8FKYEl3YhAG6EujRj24wMVvr3MlucM9wG4dK6UxSS+Jmcbzr9+PH2tTzs
	 Dt34kI2zxTslvBF4SLc2OIBx47eqvjCruPaVtyWIoZYQJRKSXha1i2UChzB33eWWf+NPC
	 lJKgH9O083xZ5sL8TJS2deSwK1PmhKjXl4p6XhBG3ajDLlb4dZ+6kvo8s5WMIl77kng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794581036;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=P2XHr4Ge/UVcnDHImN3vw2OpxpRNWsCoWBP3+JfhYAI=;
	b=K5PUJsMX/Rq46uGtQw960q2ovtGxZESTYZ53gSmiZNGab5TfR4V+WC8XLpAwb2OAU2W0
	 AJp/3v1NwKN16oPqbRaEiB/FUJRxLDOswiFZRQqePs4Bzi4mSfMpOxhSIApx2L1PjSVJ1
	 dqDKBj+YhcoKZLlgOcJ9w9J8PQQ34wTkmypTM68KC1kgQGoljfi53RW75iLgiDiDeDJ21
	 tFq31ICT0SF2HADwe1/K9v6V0P9XPEMkB0Wg8iflqtfgXGYdctb5ayXFsSbpjjoFAJQwN
	 WiR2mMb11FKeMXReVMOWskxGt78R0/aaTg/b2AA4By5vz5x9BV74gDaqrHPVIv8ut7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="fk+z7/kn";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 36E83606A323;
	Fri, 13 Nov 2026 14:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fk+z7/kn
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 319451F000C4;
	Fri, 13 Nov 2026 14:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794581036;
	bh=P2XHr4Ge/UVcnDHImN3vw2OpxpRNWsCoWBP3+JfhYAI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fk+z7/knqvuqqmUYnHT/liunu6/PWqRJoqCBh8aR7mDySRGlu91+nFTsYnfHrwuWg
	 TJHD5aAuVUu/EyVoGj7FfHG7mheAooQ/aPrreJsG107nP+4g90byUWI5tj5BBQkEx9
	 VVzqvCC+LWlSty6ApMFsjWwMAm6WMkKW+HGXfydHVqlWYBw2z2p89frLEwxdA+3JU+
	 3o0t82EveAS2EoEOkwuaCd4wGOZXXlLzeR5/2p8Z33vQZRnB+A+pKLJw4Wlx6aAn80
	 /4FpJ/xpTb34cRlEovK1LkKq00pygWV8l5wsxasb6ULvY09ugCqymdRK3p2H+SMuun
	 1xdKnb7oj6dRQ==
Date: Fri, 13 Nov 2026 15:43:52 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: Gopi Chandra Sekhar Reddy Kanala <gopi.kanala@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: qcom: sm8650-lpass-lpi: Force runtime suspend
 on system sleep
Message-ID: <pbgvr7fx4r6jmfuzprbna2p3fwllt3vopuwemyq4eygonuowk7@euyr4jbgh6ds>
References: <20261112-lpass-lpi-system-sleep-v1-1-438cb997e0e9@oss.qualcomm.com>
 <b64cfe8e-7274-4a8f-8add-ee1b60522c42@oss.qualcomm.com>
 <7d55b69e-f1cb-4271-a2ab-2cfd2e1947bb@oss.qualcomm.com>
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
In-Reply-To: <7d55b69e-f1cb-4271-a2ab-2cfd2e1947bb@oss.qualcomm.com>

On Thu, Nov 12, 2026 at 09:59:57PM +0530, Gopi Chandra Sekhar Reddy Kanala wrote:
> Yes. All the LPASS LPI drivers share lpi_pinctrl_probe(),
> which manages the clocks through pm_clk with runtime PM, and every SoC
> driver has the same runtime-only dev_pm_ops, so they should all have
> the same problem.
> 

While they're the same, they don't reimplement the same callbacks, they all
use the standard PM helpers so it's not like we're wasting that much
memory.

That being said, I won't reject a patch that moves them all together.

> For v2, I was thinking of two patches:
> 
> 1. Move the dev_pm_ops into pinctrl-lpass-lpi.c, export it, and use it
>    from all the SoC drivers (no functional change).
> 2. Add the system sleep callbacks to the shared dev_pm_ops.
> 
> Would that be okay, or is it preferable to add the system sleep callbacks to
> each SoC driver instead?
> 

I'm fine either way, but it might indeed be more elegant to centralize it.

> I can only test on Glymur CRD (sm8650 driver), so the other SoC drivers
> would be compile-tested only.
> 
> Gopi

Please don't top-post on the mailing list.

Thanks,
Bartosz
