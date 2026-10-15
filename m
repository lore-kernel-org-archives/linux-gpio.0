Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8A0E49CF40;
	Thu, 15 Oct 2026 20:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792094962; cv=none; b=W0TYMDmmZ2TswjGs/7niVdpauEUxHvJuMQe4m4g0iLwk0/TzF2pfUojsWil4HknA1UlrHVB8+RFOF8rfFn4Hm4JWBUsC3+thKemOltTqEKGV0fAY455tguJlEoXy6butEuWTIdEWiZ6bjHuVdTdeR7gOCZ2ZMG8X6UHkDjGMaYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792094962; c=relaxed/simple;
	bh=StZLTfCM06PzpmgG8QjwUHV4VVWF0ZRZDnJmI2mwxPc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dMMtFXjIGnhV4HoetWQEpFO50ZI2tym+UuGLptLqScHW8hv65t1kupxuCmkOs+ZGqvWVvFDG6xlxF/2WbGGKAaUsnd9a0ueXd5k6FmKqmsCU4+eNS2TpqMfbvEGIml8ucIkaCJqft5880S55OB78m2xah4DQb9DCI4BQutjrS2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N30Z8VsC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N30Z8VsC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05CC71F000C5;
	Thu, 15 Oct 2026 20:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792094958;
	bh=p2KcvOIUBC/TdV+Jd24lA75BGETvwbl3FL2EbAgIgK8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=N30Z8VsCTnzf6hxH6BG1u8McAooOMWav/Xpd0C9OPvtD0rMnvNkMNP1E1MZMcsgBF
	 2UqQyRZK2RXYXw7V807NlGyS0P6f9PMismFiBGmjuhnCZz5g+6uYXxYSb9KGyiLTaq
	 0/zh7Md8I7974u3vx/TLGo+jXPU2IZFLxOL9Qa+rKz8z8A8R3F82rBhcwVRK+l14qG
	 XSnqzUt+v0t+acpvhJx9d9WtI6Kd4oF8p3h/qwwX6EeHqGloL3TtCerzyxelvYm0WS
	 WnG+6aEwQQw+21PBdvYl/LEpdCT7PjZFYm8vUzlLP4/9l94SS1w9XVMLOHaK+bTni8
	 yALb+CdLUBYFQ==
Date: Thu, 15 Oct 2026 15:09:16 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Pablo Mazzini <pmazzini@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>, linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>, linux-kernel@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH v4 03/11] dt-bindings: pinctrl: sun4i-a10: add Allwinner
 B288
Message-ID: <179209495610.2841757.13508054994600042568.robh@kernel.org>
References: <20261012100816.331033-1-pmazzini@gmail.com>
 <20261012100816.331033-4-pmazzini@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261012100816.331033-4-pmazzini@gmail.com>


On Mon, 12 Oct 2026 11:08:08 +0100, Pablo Mazzini wrote:
> The B288 driver takes its mux values from the DT, so allwinner,pinmux
> becomes an allowed property here, required for this compatible only.
> 
> Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
> ---
>  .../pinctrl/allwinner,sun4i-a10-pinctrl.yaml  | 22 +++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

