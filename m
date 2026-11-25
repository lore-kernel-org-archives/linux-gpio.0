Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795605545;
	b=yoQHg9c+2y5ZyWPYC2b8LQLY//Vu7MyvMlMfZ2PpgnHuKcs7BJ7qZQ8c3iJZ1tcCFw0J
	 7zm3KwR+lt4Ul7EffuLxiRGGb528wxfkkRXaOcA/D3BtFem+XtD/fvx19ry4XINvpOQrR
	 u4wAPHdkzYHYTXj6t9BdbLsnRbtKnd4C3+dRpNi6cNrNNdNCL6hIWUdfwyiz+KE9Mz1Cs
	 sPHXFgy/CrfGcukXrjeX5PLtxtU0RpqJZobuYlof1h0KP3Rh0XmDzCXTthp0D8U/LBPLL
	 SlnloO+0mR8DpwzYTEppSxhJ7lkqbu+piO+chrNFLAIRLwoZpbyPdK1UiQ6uKgNzuLQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795605545;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=GxX/KRbPOCkNcpI6+Rv+y3C1vdctOR1gnbhti2p7x78=;
	b=cdC0h8+23ElJ/qUZfh2xEsmxWrQYsHicKBSBkQEv8FxF2uPOZxW7jy77M8g16mwpIfpn
	 EHFRo8W2MzsEL+u9ZqND7gIeoEYTnkulb/usJOiET5hPteiMW6uJzaJNxbFYMND2Z61Ys
	 yurme5fr4LTL5RIkAYcCra2Z2+kQGNdyJL3yaCZvwmrOzfqZ+uY8IjmG8qJ10n1y+oOSk
	 e0OhnDl3md5aUTS97wl4G37moLyLFd1MzN5rmV54/ephwNO0aGsPOospaT8mOfSoEcosS
	 ZJrjUHmgxAW3r7N2OKelg7E8O6hQi/+naNWEaObKLboJcJ8Mkendu1y4PagshEwlpEA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=ND8caDPt;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08A4D606A31E;
	Wed, 25 Nov 2026 11:19:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08A4D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=ND8caDPt
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id D3653200037;
	Wed, 25 Nov 2026 12:19:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795605541;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GxX/KRbPOCkNcpI6+Rv+y3C1vdctOR1gnbhti2p7x78=;
	b=ND8caDPtAtwSt2twEzOI9yd23v7XoHTcw3Lw75soG+EgPPdsxEsyeKFRqw3o2OJj0+TUzj
	J7IXvqEPYXLVGxpJlClodDCtLA2Y9/UttaL24O1/4duPyQ+7hR3bNCNIkjGiDqS45AZXfS
	TUHYz92xXymEQ8g2KPiD/+7n8xWLJOmbbgZl4oFmj9YwMTjhB+n41JgdrrZML7GKeFPByK
	s/K0GIj0CK201ZobwEdkLq81BLSrr4fsV+OoHH1L+i+QLcXFjV6AI2aOnjKz8f0fONFT68
	UEWBflYzR5ksPTXOE7wnfq9Z0Bebnb6vyUTQgS3lmINxpglpduxf/s19eQXfEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795605541;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GxX/KRbPOCkNcpI6+Rv+y3C1vdctOR1gnbhti2p7x78=;
	b=WqiiQewmo0FmvuOi0s68OfMRBs5PYHt+D0x6sC1rdx4AkWRlZtMV64ly3nChAwtay3i/D/
	KZJz1SF/34GeiOLX27KgTSmP/CugUidVkWK/hNpS2ehhf9Dpdn9y7rK5jev4imffiavUeJ
	VzH3GikUFg4kM3UArUrG/h36XsQDQ1ueUSDxIXiY204waLoiJ9e5EXQA6vhujtXvzmKPI7
	Bs2oexxvGf7WgaWws0aHWLw9VJA+eLcjAWBAK525+27boroqvCgErmBZchsgDP7MES3NQe
	GkiH4OGKDI+R0WZsoLnesFC0Izz1MmsRNusgtCaKWk0eAQJEftIWcnt/vfdJIw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pza@pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1795605541; a=rsa-sha256;
	cv=none;
	b=E2vdOFTcAHnNOSiEGiSk+Zlfwi6N+BNzk23sLgZZBZE2o101/3UN2MYavVsFgkGXjKO4z+
	Vaf7P2AvBz33O15djLWn3mVB4diMO0ILb08HR6gxkbYzL4Z8NrgZfTSbUuAz6IOOUe20XI
	dl4PExN2wBA6VO4Nf2F6MFLdODSeJAbqT6IXtbkkU15DA6ckZJzRLWAYFiJwViV6XzSJxC
	hPwf0Blh0g/gS8XQLaUkHj7ReYhNppFrt318xWzAtaqm8xN31Zt2BJiRPopdX6pvFAgzaw
	5/T8K7EUz5bVaTSl9Xlky/A6hkZ5U/NkzTXDYUVLIE2YFLbrzDH5rgJAemGUgg==
Message-ID: <3b8b8d154a841d80de20d31c32b2fb4faba11480.camel@pengutronix.de>
Subject: Re: [PATCH v4 4/6] reset: Add Cortina Systems CS7542 global reset
 controller
From: Philipp Zabel <p.zabel@pengutronix.de>
To: filipp.dunsky@gmail.com, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Stephen Boyd	 <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet	 <jbrunet+clk@baylibre.com>, Linus Walleij
 <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Date: Wed, 25 Nov 2026 12:19:01 +0100
In-Reply-To: <20261125-cs7542-syscon-v4-4-3337bb0d3b48@gmail.com>
References: <20261125-cs7542-syscon-v4-0-3337bb0d3b48@gmail.com>
	 <20261125-cs7542-syscon-v4-4-3337bb0d3b48@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Mi, 2026-11-25 at 13:34 +0300, Fil Dunsky via B4 Relay wrote:
> From: Fil Dunsky <filipp.dunsky@gmail.com>
>=20
> Use the shared syscon regmap to control three PCIe and seven network
> engine reset signals. PCIe consumers supply their own assert and
> recovery timing. Verify level transitions of the network resets before
> the consumer releases DMA buffers. Reject the unassigned group ID to
> preserve exclusive ownership of the underlying lines.
>=20
> The clock provider registers early for timers. Match the platform
> device for the same syscon when reset consumers can probe.
>=20
> Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>
> ---
>  drivers/reset/Kconfig        |  10 ++++
>  drivers/reset/Makefile       |   1 +
>  drivers/reset/reset-cs7542.c | 134 +++++++++++++++++++++++++++++++++++++=
++++++
>  3 files changed, 145 insertions(+)
>=20
[...]
> diff --git a/drivers/reset/reset-cs7542.c b/drivers/reset/reset-cs7542.c
> new file mode 100644
> index 000000000..b86c82554
> --- /dev/null
> +++ b/drivers/reset/reset-cs7542.c
> @@ -0,0 +1,134 @@
[...]
> +static int cs7542_reset_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct cs7542_reset *rst;
> +
> +	/* Clock-only descriptions also use this syscon. */
> +	if (!of_property_present(dev->of_node, "#reset-cells"))
> +		return 0;
> +
> +	rst =3D devm_kzalloc(dev, sizeof(*rst), GFP_KERNEL);

devm_kzalloc_obj()


regards
Philipp
