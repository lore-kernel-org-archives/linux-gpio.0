Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793357697;
	b=AqralS3c8q133z+eQRwOtl64Guc50TsXV23pYbex968kkqP/Sc1rXt/E+dYoVPkFrCXI
	 5SRGaXVeoT9lM9L0jjCIRLVrnY4PDJDtEFL/VC8ECvUaKmVrLsy4vCg5ysgw9BbOnbQ7a
	 UST1DudZFQo+4dis01Rz7hOOK9PKVSayFejNgr2fxXF5xAjqAknG6vZIqTj3YFt3zYNAx
	 Tz5B64FHgDocJ+7w20Vc1iXWlPI5Dbt+zVHncqXBCuulteXJ378D5nw+zLwCnyoTd8DAF
	 G8azpXh68tsWKmC+xYg76vjRuPBICcpO3BQnrgOQt5HjMzwMbxFqZSbAFcNlZV6e+6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793357697;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=dnp5KQyeo/V/2JTN5RgyPOpaTVRN7p8jIZMzq4KVrNk=;
	b=gm5fzeCrJR65gS78HtiEOHFsqStZ+PGJgl5N6U2T6iOb2Td9yWo7pFRmP5yE3YSxlMxR
	 6gzxitr//VIEN8q0h83D8MDYSCixNatzf/joV2OvDEnREdYMysMZrHmqMs/vTtmWLqizj
	 7BUO/v5VToRrSnAbtaKv/s/IL44jCEXNg0PnT1uA4n0ROkHiATr9dusfk6KjXTn9iTrx9
	 S7HvhUCe+Yo2h/geT/trXw9k6NprFWq54LvkEgjv8mXBuwqaz/69z5LXGdjAqUaq/joFH
	 +e+nwdwaFlXX9kJDtNbbr2a1bAHIRheVKPnNvEgx2JaqJ9DedJ1qzISjuQWBZqwzC8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=StKtm5xd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E28C606A31E;
	Fri, 30 Oct 2026 10:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=StKtm5xd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 260A91F000C1;
	Fri, 30 Oct 2026 10:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793357696;
	bh=dnp5KQyeo/V/2JTN5RgyPOpaTVRN7p8jIZMzq4KVrNk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=StKtm5xdH5tLY0j9ZjtPrAkx8DYsoTZBigxPX2g/LCxFPW9KqsYZaYd2LtZfgNCAN
	 gKRvzKdTtfbo5rEbusl1g4MxqsdIG0tIMvVk9J46MvEwJPLw0KTLPZn3047T9+UMyZ
	 2H7Cwz0Yu8W6+6e6kJLY6bXaXiDh4hgvPBqFAZNukvX8oIJoDcE1Up7yDPl3t5s+1e
	 iAVEZasvP0zTogX26Q4UZHttvMBikQyUYL37h86NI80JW+lEd/MfRl8F0tAeFwRidt
	 Dq5ScUG3xHtzXxWqyH84kwnCLkobhwn2wxjczPkIFjrZqwg1HUPF3E9qOE1yBJffVX
	 GKJ6jYK+EktLA==
Date: Fri, 30 Oct 2026 11:54:52 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: gpio: fairchild,74hc595: add support
 for nxp,74lv164
Message-ID: <20261030-woodoo-adamant-teal-f02b5c@quoll>
References: <20261023115652.700765-1-ansuelsmth@gmail.com>
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
In-Reply-To: <20261023115652.700765-1-ansuelsmth@gmail.com>

On Fri, Oct 23, 2026 at 01:56:48PM +0200, Christian Marangi wrote:
> Document support for nxp,74lv164 as a variant of the currently supported
> 8-bit shift register with the only difference of not having an Output
> Enable pin and a simulated Chip Select pin.
> 
> These basic 8-bit shift register chips directly change the outputs as bits
> are shifted in. Particularly used to handle multiple LED for basic state
> feedback.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  .../bindings/gpio/fairchild,74hc595.yaml       | 18 +++++++++++++++---
>  1 file changed, 15 insertions(+), 3 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

