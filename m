Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793136706;
	b=ZOIZghb9eBj1MoOy72YBxFPU3TJu5VPwzvZShknJy/MBSoCjR7I0w1v6RyQTw+lIPaCr
	 fzCybEn/LDLjaLdIqF4f7QqBwAlbD/q9ijPZZbsrW66boRpJqWd80iQCcLBx1eUFdpYds
	 tmf2mUYx4Xb6sWApAL2gZn0QgApLT+CXVSlXa1CDKdghYF9LKfqg2Pgpw3e+i8vDhfz5q
	 QhcA+2gM9DvoCa+cxHFnsZJyTJSl1XGp7OfS2j4N3fippzfDDLoxTJ+cHQhMXsoIUhJ1Y
	 vCeH5x/P70NtxAdpdgD/xfEpqjaWR5KzH+d0z2Gbbp4ATe5eNsgWaODs4nrTtOBgwjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793136706;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=EcvgTWW8MsRG0BTKc5s9czcoej/1XE+Z4BhVoKAgo5Q=;
	b=nNv+qJNbAxApUzj1eKwVgLtyqjIHrkVWEXM5mOjBkMc3La6hCW16FtsWjQ3P9/4/CY6t
	 i0S6V/JWcjiWxYaW2mvvm2whpHEQcZUvfIhrR0sQBKxbKbjh/cuQmVL6HuZp4zCJ3USBo
	 4SZi1683hbUaEgbLNq7gSFdK1KajHb6K4z1VpQT22nYlISXcxczlotVH64DaId7dLHPUj
	 k1BDqsFeeSUd6FGu6AkGQy4UlSNxUmv/SBM6CVw7zSh8ospvVBe03BC9mIdxIFA8O/lwp
	 ECOVfQVCCPaJmo1YXi9tK/c6+6EKGYF8R6gEqrIEWIFVhu84oIl193zqEgSynXq0i1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EZJ17UrE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBA5E606A31F;
	Tue, 27 Oct 2026 21:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EZJ17UrE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72DCE1F01825;
	Tue, 27 Oct 2026 21:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793136705;
	bh=EcvgTWW8MsRG0BTKc5s9czcoej/1XE+Z4BhVoKAgo5Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EZJ17UrE4oUShSJsg80PvOj9MmEUBK4H6ODDb/FNJlRxoJRFtNXLQgU0oAcn6p2i6
	 0srTzQCSXnSBzEQtvCIfWIYU5QTmsHTDtnpZc20s2OidI/B8Uy2iylpQ2GBmb0SP7B
	 Jg6J83lCD0AV0etNRkVtcU+C+k2lL3shvYsvFJ0gL7SRUZP3cseEUVk/YFcWG/39Lj
	 e4pVkITpSwPSwXhIpII3V623nWDfBtt2RsFda7Lo4Nr8no/53oNxNK4JZ9N66jXnWg
	 2l9talGxept+BkdSy40ZWJuoXleI/J4hOJNdUAssDJrZ3A/eCt5vD9hgjgvw9O+cjo
	 bfjB7r3dg3Akw==
Date: Tue, 27 Oct 2026 16:31:42 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Navid Ghahremani <ghahramani.navid@gmail.com>
Cc: stefandoesinger@gmail.com, Bartosz Golaszewski <brgl@kernel.org>,
	arnd@arndb.de, linux-kernel@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>, krzk@kernel.org,
	Linus Walleij <linusw@kernel.org>, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 07/24] dt-bindings: gpio: Add ZTE ZX279128S GPIO
 controller
Message-ID: <179313670254.1191089.9686644505713095094.robh@kernel.org>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com>
 <20261014072109.1759502-8-ghahramani.navid@gmail.com>
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
In-Reply-To: <20261014072109.1759502-8-ghahramani.navid@gmail.com>


On Wed, 14 Oct 2026 08:20:47 +0100, Navid Ghahremani wrote:
> Describe the register-clock consumer and GPIO banks.
> 
> Signed-off-by: Navid Ghahremani <ghahramani.navid@gmail.com>
> ---
>  .../bindings/gpio/zte,zx279128s-gpio.yaml     | 53 +++++++++++++++++++
>  1 file changed, 53 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/zte,zx279128s-gpio.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

