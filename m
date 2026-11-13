Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794565074;
	b=poxfxMAUpnkGFTsFOdcOcN33VXfA9UaOGhcZ5Awx+bSBH8eAmoccwLAm4ZxYlT+Sb1B7
	 u3BxOHFN9wzMjWEU9Xe4u088L3XSEdqivBd+ozgajYhs2XQKN8o2o2+2OLhrmjF+lMnZZ
	 aIfvmgjxOZSuwglcXABWl+xvi3YWiPnLvK+7htYKWjBC5/Zp+dEXCo3V5zI8bpIvcOj7M
	 cCfKQyFS5PYjSnl7aqqTRwTmg+94o4HSnTyeo3K1RrpV+P1VNc4BBEYiGf+njt3Em/irf
	 mWu5/701g8dPp26lzGxwHadGXHZMsyg/1jMgfjkPjsLNIkUptGihh3dA2nYg+u5e6xw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794565074;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=GGgxWdsm93oOtNMk87CKDJ/BAFYtLSNmS1bccCNzaVk=;
	b=N+hQkB/0IHfn//RoLGnm3ryHFyWo0qr0QJmF0jaED8mTZO+F4w5B5tAuguDGaIHLwg08
	 5peuHij+/Usz5Qa9V2JvnMqWa9iZPLnYgMimYMIprTeRDIVOXjJS72/fEe8eYRn2oG1zz
	 TV26SIBzXAxSpoPf4+oH+wz3L8jtHIW5C2Rx7sdR6dyoNQH4FRu4Sn8F0TMXoGiDb9bfO
	 rg+h5LLGKtjo9XSf98brUu8dHAXaHz7Vk0+Kb6Knbsbt3g7qkgjEgEMrGg2DYbIE2PEVq
	 R3RKmJKdjxTJvnu5djfUpaBN/rzzvJh/5FDNhuZ2qKeILTJJEqKI/bjws5BHsAH+qtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EyEMYem5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB5D3606B108;
	Fri, 13 Nov 2026 10:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EyEMYem5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D74291F000C7;
	Fri, 13 Nov 2026 10:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794565074;
	bh=GGgxWdsm93oOtNMk87CKDJ/BAFYtLSNmS1bccCNzaVk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EyEMYem5OQwfLEDudOU/czDVpOeZtcMY8XF+TmxL/ln6bhl5jo5U3MKMeYMOp1bZU
	 /CeTF5BnUKsXFfcmaMf0tEoGzkpNFwCs+ZN2IKVikeLpSRdIL8fkp9doIP1uGS0oKM
	 82BLxNcwHYVEmqVEwxDmJX+0LJZ4ecZI/dmlXUekSeTuzdmCEuiJ9ELRU8A32VLKCI
	 yjdc2FbX9ZBJucQE4T05/TORhbYTHpk3i1PndM67+i4VvFGTOpZPBuHjk/+z9uU1Jx
	 V3bqKNq5mlg1hjJ+9UjKr4yHDBQ3OlSUGGShKw6elvWbWrF4POM5VCPHE9nqputC0z
	 UwVogOc20F4uA==
Date: Fri, 13 Nov 2026 11:17:51 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: devicetree@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: gpio: nomadik: Describe DB8500 and GPIO hogs
Message-ID: <20261113-antique-ninja-serpent-ac4f09@quoll>
References: <20261107-ux500-gpio-hogs-v1-1-123fb308fe90@kernel.org>
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
In-Reply-To: <20261107-ux500-gpio-hogs-v1-1-123fb308fe90@kernel.org>

On Sat, Nov 07, 2026 at 09:35:00AM +0100, Linus Walleij wrote:
>    "#interrupt-cells":
> @@ -60,6 +68,11 @@ properties:
>    resets:
>      maxItems: 1
>  
> +patternProperties:
> +  "-hog$":
> +    type: object
> +    $ref: /schemas/gpio/gpio-hog.yaml#

Instead for the name and schema:
https://elixir.bootlin.com/linux/v6.11-rc5/source/Documentation/devicetree/bindings/gpio/gpio-vf610.yaml#L72

Best regards,
Krzysztof

