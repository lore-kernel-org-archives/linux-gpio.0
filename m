Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 425AF3B14A8;
	Wed, 30 Sep 2026 10:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790762754; cv=none; b=KKU5JKYaTCJSSVCRepWMSB9LIXz8qNztRynri0zlhGx/F2nxRbmeaay06tB2HLFhvdc6mcG2pZsSjKQSnfBzyl4PVLbqtSJTzyRKsLajy4m4GXGf+p4DheAVpeUVxVL20GhVSiXKtpzAmFIwRxc3TaWSWfUOrv+HryYWl5B5yCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790762754; c=relaxed/simple;
	bh=dRWq2jhj3fTwKQpiIWjJjY4RKZzPSum1JDagtM6SU50=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GqvLZr8t6RL2ol6wHsnwlwpSK1Um0R70jMvIijtP4ffIcw4qTFQoYobZjBLm4vMIBpsOVqMc6L37HQELvmCbZo0sL7lByTkrxLZECI1DWWDSYSYK2DY0J/VIAaBKm0xo8Vcte+9gd2crwd2N33vIqeU0VcKctHyWW7OhoClakB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O5z20A5w; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O5z20A5w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D3F91F00899;
	Wed, 30 Sep 2026 10:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790762752;
	bh=Wr3MnKORYjw0k60zOQ7zLIpbcvMSgn1uQ9GeSEwtzWw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=O5z20A5wSlEu+8/1fQdXDXKdPHRJKjo9ebIR6wIsBiREict0d69W/zZ6/ecIgH022
	 ZoqdIuSFfVDb3Bf/0HXE0ZZreAo0lQ5YNtGn2iaBCmStKz5pkUM9OfhTWgZHuChfBQ
	 RSdQdq475q3KSVFrk2ebrHOYXgjgmMUSp5A5jCgrBTexrZ4XRVKeaxFMgTS+1HwHHH
	 1BxNQl6uRqOucuF4Uo/Sjm8WDQCjIB2nJibjZsxeHHJMXm/SMB9EHYD5yxY3f2hzZ8
	 /H1MsL0Fn0yRIzGq+5oriX5NGkXSfM21FPj5W0DIgEp+zsgvJNXZr7h2C4b4svu1og
	 5G8Tneolekd4g==
Date: Wed, 30 Sep 2026 12:05:49 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yureka Lilian <yureka@cyberchaos.dev>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
	Neal Gompa <neal@gompa.dev>, Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mark Kettenis <kettenis@openbsd.org>, asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: apple,pinctrl: Add t8140
 compatible
Message-ID: <20260930-warping-vivacious-dragonfly-fddfbc@quoll>
References: <20260926-apple-pinctrl-t8140-v2-0-620bd11cd2a1@cyberchaos.dev>
 <20260926-apple-pinctrl-t8140-v2-1-620bd11cd2a1@cyberchaos.dev>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260926-apple-pinctrl-t8140-v2-1-620bd11cd2a1@cyberchaos.dev>

On Sat, Sep 26, 2026 at 04:51:45PM +0200, Yureka Lilian wrote:
> The pinctrl_ap GPIO controller on the MacBook Neo crashes upon reading
> REG_GPIOx for certain pins. These pins, which are also listed in Apple's
> device tree, are described by the gpio-reserved-ranges property.
> 
> Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
> ---
>  Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml | 12 ++++++++++++
>  1 file changed, 12 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

