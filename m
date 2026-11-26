Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795705826;
	b=YhCv+Nxz+opUYcZv/wt281505iD1KNAol89h52J86hPOUlSt9DvZbb+EgVyM6bORXFuo
	 PaYAz//uWqkwGSth6kwRuZrCvlhLnROS4mSOlrrsNKwuKp8il18Ys3KnxHy1R4S23bCZo
	 0IDxbVc+D3MIdKz1qTRBrrm2/I8ZGRgDnji8GfERo0iiPD0gXqcI1tblKHySSdRndJ/5m
	 F/45PLiz1xRtYA5bCNEhJek6ZFnKPqK8CuDQA/D056yEdYu+UqOpRz/xh+652oOGgAOx6
	 YDaDayVZw4ukPdznivbpZdQrZ9cBC7deAZBRvcaGhXk9g1HVVyqZJGbgP/a6p10sCnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795705826;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=4jX7lyABU19H1ye2s3FyLVw75qwTk5OBYBp1kYKOYlY=;
	b=LP1jCWyrrT5A20iY+LFvr/mwixj1eIsH3zQQ/0Vzl4bX+kA+MH5v68MyceZwoSIvSr9H
	 yYHXaeJQ6sdbYniCT/9fp0VtXOklJmEVrhGotoP1Xr8b/mqVOGG9m1O+vYkAS2lJGyi4a
	 ZjA+hKkVJZptM2itXZfJpUpq3KoCaq8yNHeJtfssMagUeZz2N4OF6j87G4xHmu5iufio9
	 y3DTO2mI3wmLvKA08Z+0yzo+r66UFApMka8jYiX5taM3kNFa1GiyV6YQIv0KsDUsQyA/c
	 ln96dWCQUOaj5eoeKuTwgtiRsuyOdHTaIoZab0+h4E+GwtfXKoPGultBly3iEPWw+bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m0ny9pwP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id C5E1F606A33B;
	Thu, 26 Nov 2026 15:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m0ny9pwP
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 3A15F1F000E6;
	Thu, 26 Nov 2026 15:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795705826;
	bh=4jX7lyABU19H1ye2s3FyLVw75qwTk5OBYBp1kYKOYlY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=m0ny9pwP+pMA18HNVg6XAuqeFAQLdCvnfqGOLP5mUGckLhfo4FeEHAArsRQ4W6do3
	 Y2oWA+N3tFGEKDdTCa2pa51E6g72o+A6s7Qzv5haOyB3TvEenA7bRAXukXD9Lhjgvd
	 bi1xjbpxhKaGV6XDwttwaTyTKmdNFMpUIux3LJ4xMgs7uKgvUlHJxVr7SOcPRDR5wJ
	 qd6sKXjU8faoaDulGlEZDlfMWhdcFc8vGYR1P4ipNUdWjJbc3wGKcT9AwqeN274CZU
	 CVH1L3ee6ptJ5ja3t0Is3VV6eJXHnTfrHKK1fP4SNKgZFKBnee6RxgwZutF0TPMWCg
	 3Tyui/clr+lJg==
Date: Thu, 26 Nov 2026 16:10:22 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Stanislav Aleksandrov <lightofmysoul@gmail.com>, 
	Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v4 0/2] Add pinctrl driver for Qualcomm Halliday
 (SXR2250P)
Message-ID: <wezjaspgdq2rm4frq5r4wynlsvhwmogxftzb2nyzmvsc5aavwu@hdvb6a2i6cpp>
References: <20261124-halliday-tlmm-v4-0-3e3a1d0fb4eb@gmail.com>
 <84fbc195-8e93-4d25-ab0e-14c3510edf40@oss.qualcomm.com>
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
In-Reply-To: <84fbc195-8e93-4d25-ab0e-14c3510edf40@oss.qualcomm.com>

On Thu, Nov 26, 2026 at 03:32:08PM +0100, Konrad Dybcio wrote:
> 
> 
> On 24-Nov-26 16:29, Stanislav Aleksandrov wrote:
> > This series adds the devicetree bindings and pinctrl/GPIO driver for the
> > Top-Level Mode Multiplexer (TLMM) on the Qualcomm Halliday (SXR2250P /
> > Snapdragon XR2+ Gen 2) SoC.
> > 
> > This is part of the initial bring-up effort for Qualcomm Halliday
> > and Samsung Galaxy XR.
> > 
> > This work was made together with Claude, ChatGPT and Gemini.
> > Reviewed and tested on my Galaxy XR.
> > 
> > Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
> > ---
> 
> Feedback from an LLM with doc access:
> 
> gp_pdm_mira: GPIOs 35-37 at mux 2
> gp_pdm_mirb: GPIOs 88-90 at mux 2
> gp_mn: GPIO63 at mux 4
>

Eek, -ETOOEARLY. I have more patches on top of this already so Stanislav: can
you please send a follow-up with fixes?

Bart
