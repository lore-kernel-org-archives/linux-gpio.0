Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795025785;
	b=TnTp3YIMB6l02MK0tK7IT0/pXJ/bvTntM/tgftaeMAvWAr3BZeHcRAKzwXf+OGZisqMB
	 +bnqZ+HvSZFMMP9cR4JG3XuX7UVibtdBC9j+jatVa4pe+Rmd8Ms+SFL2r8ynNjD+B9JyJ
	 6HKZH+rK2KB8cVD6Wfe7Plt8R4I32ZQ8sU11Qn+k1+4reK6cDfumg4sTSS0SBjxzHKa1R
	 cVCog3xpxSKH9+ONN8wep3jprl6OzxeuCrJXxJ+A3zmutHEGVStwBRxtAMl0+ckSM5a1F
	 ouwOGxEBGsc9eJsQ5lcDU0/cIMCF8/LA00v61YRf8XSvl/YLCzU+g5vKZ/96Y4X7iaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795025785;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=r2HKNGzBGFFLB7QXLG+/OIKe34xl3sEbWCjmo9naTVw=;
	b=KAPujJCKXPKV+c4lZjNd28wb1jG/tTFnoFOxRvXvA3AnFBESG6mk/k7dClNP9ZPCgfBI
	 nx/vLbnoYyxOibfLc2lQsrboI68zb0fOPeqEXhEO48Alz96vJOFxn7L085odN6P5k9avq
	 1qYr11sU2qfhT7C2xHFMq6zCJ2Y6OkZjSh2Rt76nya+CZMFNxd+aLkhDhRdjG7xtnlv9p
	 WtRHBpwR8H2i34ZdIy+JFFD02x7+zZxcabx2OiWwUEsm2sBSPsczK9McuvQItmPOIvGNe
	 j3AVEjXaPE2+Ob6kR1MtofcRJaNqdW65gr4py2ziU5TdUviu5SMj6WBrHQQDIOi/+wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mTblGmb+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A711E606A320;
	Wed, 18 Nov 2026 18:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mTblGmb+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AD971F000CA;
	Wed, 18 Nov 2026 18:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795025785;
	bh=r2HKNGzBGFFLB7QXLG+/OIKe34xl3sEbWCjmo9naTVw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mTblGmb+fYTrsL7tRop8916Fv0mAUgWe8OBhjSYMCDi7byKzGjiKmEvbfl7SXmJE5
	 2jBM06yZCJ1Cvc6l+k4nCNgdTlWlPk/xw0cZxNmqHDT+Frpk9yVYBIsL+tgLZFkM1O
	 hesGpRCfKijHAdGXNKofYOOWDB6fs3PfufhZ/1mWUgAgRpIKEo0E9w+T1nW/9fcOkn
	 TcV1Mqntorf7EnfAbECDIvNagkM8cg+d9SAy/8pomMt0Gmou4YYdHyJ+wCyl5UxybY
	 ZXTWGGNv0LAsfyvIEWYxPeNOagEM3utltSdFoHa9QN2wDXxq+foZ8zXrwroSdC2gvv
	 w2bFnA5pt2q8g==
Date: Wed, 18 Nov 2026 18:16:19 +0000
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
Subject: Re: [PATCH v3 5/9] dt-bindings: mfd: syscon: add airoha,an7589-iomux
Message-ID: <20261118-referee-pavestone-aff74f682ac0@spud>
References: <20261116174854.342912-1-john@phrozen.org>
 <20261116174854.342912-6-john@phrozen.org>
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
	protocol="application/pgp-signature"; boundary="lCDyaRCixzLSR6ce"
Content-Disposition: inline
In-Reply-To: <20261116174854.342912-6-john@phrozen.org>

--lCDyaRCixzLSR6ce
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--lCDyaRCixzLSR6ce
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCav3rcwAKCRB4tDGHoIJi
0uILAP9Jmc8hP8rsJzS7SaMgn5XrRGp+P0oOcHC60Ja4tsqStwEA1ibV8ymvGbep
Hd6X5xJIDfJZPBUs/48MBWivEUqgXg4=
=Pxz8
-----END PGP SIGNATURE-----

--lCDyaRCixzLSR6ce--
