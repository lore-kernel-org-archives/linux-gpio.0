Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793187034;
	b=R2kCZzxDaR1aWFiEcnz3b8Vq9wdWdhmErHGf5sflPvJeyYUC5lYvM8XnDvHXUBqUuIph
	 ADTpO5eT8DQi0MYWVDpdHCTEfg0mqkWy5lQghdp4QRq0ObesXgpEamwIQJXHDVOYnVcJ5
	 hsqy0qv0E7Ub0/+3bkNv1zPq9jS+XPrfPjK5SCzVkj5VoTvkdx/RJjxUSR8+sC2puonl9
	 T6Ifp+LH2CEbpcYivT3AV0NmpZfXuazcM1U4uihj4PCQvQo5+ns4mIm+fv5yvO8SQoDbl
	 vUMKTJ/LS4Qto4qMGOrLjRT+TnM1f1uh6vFCECZBXoiF5XKIhk4cSfGNnkLPwsM61Uw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793187034;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=nK4wxJlF1X3a08zXOdP0lWerEzc2FL4X4MzbdiQi0B0=;
	b=oRERH7BE5B0H2C3UOPDwKu7JtNk6xjN7P2ksCVcbC8jIfQ4s2HhnFW78vindHXCOttIK
	 l6ZwDF0m3+Sa5bHRb+uko3mY3EmoZRRSSX3YfRKwrBk+kfIcfh9O4ZunjMbfoenvEF0cX
	 ATe2MTNQGPSbKKkt1QDwj5VVETDg5JYjBoS7ITDfImU7YHjryLsaaBJjEXuFJxcrjDrzA
	 0A7vwNen0CJJ/rO+jd7Fu/6ix39AJcUyKopZojcmi0ZjPulzob2CPd+vUxsWDgDQAvOhP
	 WFklLmmavVvhtWOJvMAEC8gRBUy9Rd/EZmIbBPpw1CvELlQdQ1UnidFEmFk1ag9wfQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DQAtIssq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B325F606A31C;
	Wed, 28 Oct 2026 11:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DQAtIssq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 814231F01828;
	Wed, 28 Oct 2026 11:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793187033;
	bh=nK4wxJlF1X3a08zXOdP0lWerEzc2FL4X4MzbdiQi0B0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DQAtIssqPLSYUwXo8Ja4LvMO2QBS6lM0CVubOc2fgVe0DYA6540L8UjP+/LUMOYxC
	 d9f0s95LUqMcD8UJrMoh08bgrL3biChIoMrCb/9AvOJOoqgwNMaFXH0K0JWB8J9nN/
	 9DNYr2n1eyq5ID1zEFK2+gh3ryw23/7RNNArffdKb8Og/0+RJXdC3NawUd90Bq/rus
	 GvZKRtclUuDHvSIBNr2T/8yIqhXwccXt8gG8w0i9DmFUOg5QaaJqvxuuCzDPIrU+cp
	 1D6LRjYJwrFrLsFOj7EPCBqTp0BW0vREj9HtWOBZNQ67ccb1hHuKOcVJQLWdLDsMJx
	 iAI9O3rbZIALg==
Date: Wed, 28 Oct 2026 12:30:30 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Diogo Ivo <diogo.ivo.sx@renesas.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Linus Walleij <linusw@kernel.org>, linux-i3c@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 3/7] dt-bindings: i3c: renesas,i3c: Add RZ/G3L support
Message-ID: <20261028-ecstatic-fluffy-lizard-9a5da6@quoll>
References: <20261026-divo-ssgrlpcsrc-2966-i3c-v2-0-2e76b87209bb@renesas.com>
 <20261026-divo-ssgrlpcsrc-2966-i3c-v2-3-2e76b87209bb@renesas.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261026-divo-ssgrlpcsrc-2966-i3c-v2-3-2e76b87209bb@renesas.com>

On Mon, Oct 26, 2026 at 11:35:46AM +0000, Diogo Ivo wrote:
> Add device tree binding support for I3C on the Renesas RZ/G3L
> (R9A08G046) SoC.
> 
> The I3C IP on the RZ/G3L is a subset of the one on the RZ/G3S, as the
> RZ/G3L has no HDR Exit Pattern detection interrupt. The resources are
> consumed by name (the tclk clock, the presetn and tresetn resets and
> seven of the named interrupts), all of which the RZ/G3L provides, so
> software can match and bind a RZ/G3L node through the RZ/G3S
> compatible. Add the RZ/G3L-specific "renesas,r9a08g046-i3c" compatible
> with a fallback to the RZ/G3S "renesas,r9a08g045-i3c" compatible.
> 
> The RZ/G3L is not compatible with the RZ/G3E, which has no input analog
> filters and supports high-speed mode (up to 3.4 Mbps).
> 
> Split the clock and interrupt constraints into separate if/else blocks
> so that RZ/G3L nodes inherit the 2-clock limit from the RZ/G3S fallback
> while being constrained to 16 interrupts alongside the RZ/G3E.
> 
> Signed-off-by: Diogo Ivo <diogo.ivo.sx@renesas.com>
> ---
> Changes in v2:
> - Describe the RZ/G3L by a SoC-specific compatible with a fallback to
>   the renesas,r9a08g045-i3c compatible of the RZ/G3S, instead of a
>   plain compatible, and drop the corresponding driver patch.
> - Split the clock and interrupt constraints into separate if/else
>   blocks to handle the RZ/G3S fallback on RZ/G3L nodes.
> - Explain in the commit message why the RZ/G3L is not made compatible
>   with the RZ/G3E.
> ---
>  .../devicetree/bindings/i3c/renesas,i3c.yaml       | 27 ++++++++++++++--------
>  1 file changed, 18 insertions(+), 9 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

