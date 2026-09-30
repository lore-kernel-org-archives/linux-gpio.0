Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D90F3C13E6;
	Wed, 30 Sep 2026 10:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790762630; cv=none; b=eiAH4vRO+HzpZFOGc11qneyeg2t7DmyrKDuGrzcEOqqXbDMNcskI8SR7vnime0xVUP3cKX3munzQmOpC6ytm+Pn/lzr3HgHAWZeDQ2yQzBUozLq4HDp1LGIIdP4rSd8tb+V0fyc9CB/+h0M9TwF/CAo1Le/E2sAnmFcVv13XAOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790762630; c=relaxed/simple;
	bh=2IZub5rWrQgbvTsxzc33LagoFCpIhC+j8FKe4M1IxoU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BbAxIqNKj2daWGPcEc+/zA8f9OFNljK3urkQpcDLy5+wG1A0NgX6I4KdL0Cc/C+cSmRUhjAXB9fbZkSjUDpn0spA/sB9Xd/+8lAfe4RyiJD+ygE5WHY55I2K+Kxigqlm+H9k+x7kSWNoAKxBrlAUdLYGB0zKiR71vceS+i1sKjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cEaDkVo6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cEaDkVo6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3DA71F000FF;
	Wed, 30 Sep 2026 10:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790762629;
	bh=td3g3mrxc06WlDh86pjy3W/s60pLo2ohFiXwCP79lTw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cEaDkVo65JymLBwnlB0ZoVvzsO7MKlS1CZaoSq/TzEZOC+3fDqT036Al+gNL7Zydd
	 VqUBoL6VKQXuiVE/QLOlLgJU38rHrUMg2Apm7AzAP1mNVunNLwXHi8ASw0QRuALsAQ
	 TCT5MXq/W52qtT8re2QrgnXtMotv7CSJvCK88Qja2MtL7xou/8pwSC1CDnSrW7TqBl
	 /S673P6bopkqpgR4GxIP0fnNiEoiLnLj7Gc3kvO4MV5tldPK5gO46bC+mVltLV6WnB
	 NMDt6EG+cAF2cWRoVgnWGsPznWahFc9ExEoqkEuX3+pNcO6irdjP9bRcXKKlk2J8sR
	 LRAMghu99XhOQ==
Date: Wed, 30 Sep 2026 12:03:45 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yureka Lilian <yureka@cyberchaos.dev>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
	Neal Gompa <neal@gompa.dev>, Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mark Kettenis <kettenis@openbsd.org>, asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] pinctrl: apple: Add t8140-pinctrl support
Message-ID: <20260930-fascinating-armored-sunfish-ddcb59@quoll>
References: <20260926-apple-pinctrl-t8140-v2-0-620bd11cd2a1@cyberchaos.dev>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260926-apple-pinctrl-t8140-v2-0-620bd11cd2a1@cyberchaos.dev>

On Sat, Sep 26, 2026 at 04:51:44PM +0200, Yureka Lilian wrote:
> This patch series has fixes for probing the pinctrl_ap GPIO controller
> on the MacBook Neo. The previous code would crash in the regmap_init on
> this device, since reading the REG_GPIOx for certain pins causes an
> SError.
> To mitigate this, we adapt the gpio-reserved-ranges property to describe
> pins which are unusable and whose REG_GPIOx should not be accessed.
> 
> Also add the new t8140 base compatible to the dt-bindings, signifying
> the different behavior of the t8140 pinctrl_ap device, and make the
> driver accept it since it now respects the gpio-reserved-ranges property.
> 
> Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
> ---
> Changes in v2:
> - EDITME: describe what is new in this series revision.
> - EDITME: use bulletpoints and terse descriptions.

EDITME is here on purpose.

Best regards,
Krzysztof

