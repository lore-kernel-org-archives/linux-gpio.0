Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794179050;
	b=dO/Efka0DQ+zAnObmdTs7HOP4ixri1hqUyju+DHyJmguZYBigPFV5BmyHtIkC0HEkFrz
	 t1jluEIBXpQvNRtu4+fasUxWTLK+OAYc9QhYhm4UcTWwiLRYeQUcgYxqGbj5l7zhBWSHU
	 Mf0nbG6W7myeHYBqnHG2WMRPuFkabSjgafvm9/Eyjql+ZBSX/45vI3gyqF0o3Agn9leOL
	 1/mRvTJvMiCixJDbgW3V2+39dgbjct7AOIdKNezNDE12JRWyEZ9aX/UimuEDEu4ZXXjU5
	 h9GMz5gFaSX8yiI0LkKSlbrkR8gDCBXwoZFR3z1X5U3KheEAG7i3D31VBdrnOu52s5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794179050;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=04i2y+Hlayp8hpeqmazpKwi1ZQACCzBFXhIL3nY9kPg=;
	b=Ka5TCjg7moisDssSjvdWcriI/kE3XmrPkR4G1yaUkeWnrZtF+vG9DJF7QjwPzFr44UMp
	 0RzXAAzk6X/YoM9eu/P/07tQL2eHVGvY0BkUYoJ4c3j2PqRXHHJPcy1SfHg3YBIis4GjW
	 V3LSMSee+HKsHkohzdX+fd2APYbsCuXZxMqz6BiytwvaOPtHus4AZMRXpsDOuoHhmT1GB
	 swv9ZVk3HxTbJlqzGHpyMGLxB+cbzd+ie6Xjx9I0QGjnswFniuDUnGYmxP++gok0JkYSo
	 zy5XQD9Iprt+88wAzlxbVxpHLNOa/8IPDDJP16gWDUlTbbZ8fOtEJL+RRSwm/Q+VHSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UM1cHKao;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6956F606A31C;
	Sun,  8 Nov 2026 23:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UM1cHKao
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E97D1F0089F;
	Sun,  8 Nov 2026 23:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794179050;
	bh=04i2y+Hlayp8hpeqmazpKwi1ZQACCzBFXhIL3nY9kPg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UM1cHKao2EnXBmQykgq7vLSZ+rrtAynPBj9xff58LzOY0sYS63gmGL+hOACXeBvlN
	 CQ3Q8iNLfI5RpIjzk8yzydkMXNKaN086ZcP83Z1zAiBRP96QaYMLeuAKnCXRCZzeca
	 OLb4vtLHu/wnNO58OGWpKmnl82BhL7GO8ddNjGdiVuR7yZIzO98NEPiN/ZjdisCvZ/
	 ZJ81TAUpDEu4BWPmygDcFfjY2XQmFrzgTwy/Qj/Z9QfegkjXlroGot2LRsA/hnFLvy
	 3k/E9hw8+OmEA+TOqWzIwJT+piAGFGrwlUQ40bxcOmXh9BImkA+zBVe5ttlfcsgWKB
	 cQMVVDQKqYnmQ==
Date: Sun, 8 Nov 2026 23:04:05 +0000
From: Conor Dooley <conor@kernel.org>
To: gaohan@iscas.ac.cn
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	Han Gao <rabenda.cn@gmail.com>
Subject: Re: [PATCH 2/3] dt-bindings: pinctrl: add Zhihe A210 pin controller
Message-ID: <20261108-capsule-outage-267163c7af01@spud>
References: <20261107-a210-pinctrl-v1-0-6ddedfb0b76b@iscas.ac.cn>
 <20261107-a210-pinctrl-v1-2-6ddedfb0b76b@iscas.ac.cn>
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
	protocol="application/pgp-signature"; boundary="6L09Sw7CFa3CKD6P"
Content-Disposition: inline
In-Reply-To: <20261107-a210-pinctrl-v1-2-6ddedfb0b76b@iscas.ac.cn>

--6L09Sw7CFa3CKD6P
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--6L09Sw7CFa3CKD6P
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCavD/5QAKCRB4tDGHoIJi
0oktAQDBkltGuiOoEHMrDHQ/J+wfS9CETHQGzXed0ZDznlq/NAD9E1srcOJTBcy9
ZXYrxvZCKD5NZUyjqyGuffuzkZ8bvAU=
=lF79
-----END PGP SIGNATURE-----

--6L09Sw7CFa3CKD6P--
