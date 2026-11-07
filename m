Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.117.254.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794060469;
	b=mdtbavK6hNNdRTiNEKMNx+eWsP3LdRKM4gF2Fl6BYUYc2YZrmr2myiavo15iwYJIgbg0
	 n+DLm/CTAJYD4HDuoCKotUgt/xmyPxl/MdCHkExQKnL2TLimShgPONO5iBr55+y6xBsUt
	 Q1heLD7sYRiCwAPqkvdtjsr8zuoUl5r6c9NNyg8UsoH7FuVT0gv5wIXVRKNP5b7bAKWR6
	 8MawjLndLS4f57+Wq9fMIs4gixgbrUxFh9bJYhTyZ8SaUhzZ31CzJjqX0xfMvwfa/EaXD
	 LRnX9cRPOiNnr/HPxMnA14ACDYyLAHFJrwBkD8q3195NrllmenXIu4Dq8ok9hdbuMag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794060469;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-UD-Smtp-Session:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=nKkg05I99+uQhW9KEZpbGaMFfkVpBZ+oFRIsqMlTLGk=;
	b=2zWebPiiIRFy+PChHE/Dkkx6REj0fFq2+R2UKd7OIhVQo5x/lrvnfgRoar102vpZBJz8
	 lck5s7bxfU8nV0DroTpEOZZ9VhVzAJiXRiPV+mrjtoKtH1deyQ5MyuCnkniQ4qFy9kctW
	 ssqIq4MwHCsU/1cODnUp+H7bTwMQegRCd2iAYMwaJWyX08ZbV2H4IXi8H1V9sDFV7YHM6
	 +VPsCIls14v+i9x63cmJjTOb3eMz6p3OWJ4kODqHMDjY362fT2IOuYb5rxZz3Efkg6V3R
	 HElczeg+opF2s+E+z78GMzUneHZGnQ2yb2x81mjkrblyxGrSI4gz12j2qVwC1yJNsbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sang-engineering.com;
	spf=pass smtp.mailfrom=sang-engineering.com;
	dkim=pass header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=az57Bq87;
	arc=none smtp.remote-ip=194.117.254.33
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 417B3606A32E
	for <linux-gpio@vger.kernel.org>; Sat,  7 Nov 2026 14:07:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 417B3606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=az57Bq87
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=nKkg
	05I99+uQhW9KEZpbGaMFfkVpBZ+oFRIsqMlTLGk=; b=az57Bq87c2CQgHhK/9n5
	8/YVmXgISKAdBBrBNKjBpPQGOPT6Dq8P7LYTUZ9IMpuqEStP4aR0ELTWFlvS2ovl
	9F2mtwlyWKl8t38l8cuz/lz6p+sL4MQAlnSX2A8B8oizEgeDtxerWNXWrW77QH2f
	5odvcHiCLmLHsrpFlqBj4X2Npf8pvw1wyB5AdzkqRipb6LonO2OM6LjETNeu1Me+
	J8ZBZlPZAmXo8QQHpKs8wFWEIPfY3fl8XUbheRPbGo+8cgoYeYtINzJIG0xYLf5M
	XzHmaMa3Z2FsRFWxyefVWO6kfIr7k9M93QYmS1tDHcKaUFLkcMdp30XkDCX7Phm5
	Xg==
Received: (qmail 2526305 invoked from network); 7 Nov 2026 15:07:44 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 7 Nov 2026 15:07:44 +0100
X-UD-Smtp-Session: l3s3148p1@4+FpQLBfktwFFu4j
Date: Sat, 7 Nov 2026 16:07:39 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Yureka Lilian <yureka@cyberchaos.dev>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>, Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hector Martin <marcan@marcan.st>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Sasha Finkelstein <k@chaosmail.tech>,
	Linus Walleij <linusw@kernel.org>,
	Mark Kettenis <kettenis@openbsd.org>,
	Andi Shyti <andi.shyti@kernel.org>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-pwm@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v3 7/9] dt-bindings: i2c: apple,i2c: Add t8142 compatible
Message-ID: <au8wq8Bqr4tZ8bj8@shikoro>
References: <20261106-apple-m5-initial-devicetrees-v3-0-cee55de54b2f@cyberchaos.dev>
 <20261106-apple-m5-initial-devicetrees-v3-7-cee55de54b2f@cyberchaos.dev>
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
In-Reply-To: <20261106-apple-m5-initial-devicetrees-v3-7-cee55de54b2f@cyberchaos.dev>

On Fri, Nov 06, 2026 at 10:24:56PM +0100, Yureka Lilian wrote:
> The i2c block on the Apple Silicon T8142 (M5) SoC is compatible with
> t8103. Add "apple,t8142-i2c" as SoC specific compatible under
> "apple,t8103-i2c".
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>

Same comment/question, as for T8140. Better via apple tree, or?

Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

