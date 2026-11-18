Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795025767;
	b=nc64SlkbX3BcWaSiVkY7Z5ZRNVRV8M3FwEi9rsdUO1qhvfYXcBTmKd5M+eXGl6DksbOu
	 Hvhi35IBn/tw7Czup3F6aBI6ut6dWgVMwZotC09cYpSszNyHogfOKuwvDy6I7o96jWiMA
	 e37FLp/knHSxXlNWwbeCLjdptFKHFhVsobmXMxU24S11AqlBRY74uAN0az2PSNcs2RIvB
	 Ndox2RPtsSxGEmOULoh+BMM+MTzraPyvb3824sT/FZVrihf/EaZkZbhO4px8PF2p/bVWv
	 76J6O2n1VplFxnFV+Y23J5pFSfbPx22U0AX9aH0tCN5l6Sv2RcPcoBcDlRe0jT9m7dg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795025767;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=AgvyBS167J9o9WMsntkjSQWj0co7IV9m4kMQjrmygoc=;
	b=jl9103jnNwZPpqswnvCRmgxNxNZGh8TwZnaro5JYKiRcPxxpIUxVKZu5D+4z+KtGI6j2
	 6c9K6OtYlBshEpNAagbFP5dQD3CcLq90AeImwwmTdLi+jbGVwWjJ41yUstE2nILaAUxtZ
	 MyYJipWBcUJWV3cci+vOF5CcNsTY1YqjikG2fRPpdKSElUiA2xJMimQky8beHL3DmO4S9
	 9PIosgfmz+KKePacida8HYuYyLzJUzAdWGRWpOCBl4ALbnMljqdxRlfOPBI/JY498Mpic
	 sieXHFgYyHNZyOzLCICeTxsz2sBtWw6qmxkKAn0Ey91EkRZywq0kOS/ltIV47OxGK9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F59HeLYI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B87E2606A337;
	Wed, 18 Nov 2026 18:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F59HeLYI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B7D71F000C4;
	Wed, 18 Nov 2026 18:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795025767;
	bh=AgvyBS167J9o9WMsntkjSQWj0co7IV9m4kMQjrmygoc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=F59HeLYIOMBBqRGRNp11oQeN4a8t+lEOI6pdExKhBa7fyN8QScDx18oAY/9AH32QY
	 U1TjpKzXDhTQmEai9zsigG2yocTzhhuRqhFZFbf/hRo6uMbmv71PRfnNzf+37N9a9w
	 8LBr4V0QUThF6Yt3o/Nvd0alDq0PDaBAOGxVQYAzjXH9PhTHnJCgFC2c7/PvbW4qk2
	 5n34YafiqOpI0dGykE3v3fUi0aXxFBBRlOPMN+QkYhDOlInMG3ARldYhU5XzebCQqL
	 x3zuJN/p6DB8FIigaCTSres2DDwnuUpeYFyzCjvmdXhsy35cCHGHeNAuBR9pSr43I5
	 qeybfxFyCdepw==
Date: Wed, 18 Nov 2026 18:16:01 +0000
From: Conor Dooley <conor@kernel.org>
To: John Crispin <john@phrozen.org>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Ahmed Naseef <naseefkm@gmail.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	Christian Marangi <ansuelsmth@gmail.com>,
	devicetree@vger.kernel.org, lei.dong@airoha.com,
	Linqi.zhang@airoha.com, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	mfd@lists.linux.dev,
	Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
	Rajeev.kumar@airoha.com, upstream@airoha.com, Weifeng.xu@airoha.com,
	zhengping.zhang@airoha.com
Subject: Re: [PATCH v3 7/9] dt-bindings: mfd: airoha: add AN7589 GPIO system
 controller
Message-ID: <20261118-shivering-urgency-89e5f5fcffd1@spud>
References: <20261116174854.342912-1-john@phrozen.org>
 <20261116174854.342912-8-john@phrozen.org>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="F8a/VxOGV5xQY5G+"
Content-Disposition: inline
In-Reply-To: <20261116174854.342912-8-john@phrozen.org>

--F8a/VxOGV5xQY5G+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--F8a/VxOGV5xQY5G+
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCav3rYQAKCRB4tDGHoIJi
0uNJAPwJrnE8yRWxo2INvgOoRvj+xPEYFt39rdXS3Vnp+W7xYgEA5zgtlPrc+VEr
HaNNsN7ajr7Ua95/5diMW6s1RWEqWQw=
=G4rh
-----END PGP SIGNATURE-----

--F8a/VxOGV5xQY5G+--
