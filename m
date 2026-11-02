Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793617551;
	b=Ey9oIOB6TOMkyKZvOX64ZDMiIcnwpMPZGQ5F3wWO4BaHm4GQU0FFDl9zVHUZScK5a5bW
	 SKVAhSW+b/6uWE75Wb24oeEfl0AIEYbOzFbdNLOdUZJqaiIG1F63DNjxG6v3kKcoYO6pd
	 oz++Trp5ryXGwHSwTLEXKwu1zyd3dUFLGQeyLmZYJ7fKjcRP/K6J607BgJeKgUJsPzT6W
	 Cgyj3jNmVovd94SNNNDkcXdeDznusXvMMEF3Pf9HiEx8Z+MHph9dUR54SUZuewwX6Kio8
	 f9/Y6uZrqTVBGVZ8KcWpmIjMA7ZNL8ynFKLLgkX4Fz2C2p40DArJ4Dlg4UYbQibmNhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793617551;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=uoI5OQkevqDHuqhBB6Hv5D9gBFmBn4hBJoPApEO2DYk=;
	b=bH4GBM+kvmFGxt3pRGxhQHA6CzXkPDzu3UrgobUWQArsD7ypJThjmqcrXy88RJeZTSf3
	 w2NOIkHCT1Jaxxf18QRqIe9l+Swq8WS0begDYtOBLj7QFjxrGC9CUL8ANbzwXNKjGzRUB
	 uMaFGkYB2PFSfJ+3XTQlc7sxYloM3An6meBYzzJCpxqYQLc8GImo+OhQQpA0pGG8Adalj
	 Mci1CQEpNW9og+H5S4NoKRs7WlLTT5gO4lPGKel2bhocxuWG7UY/UaP5VEH7bE79ODMaa
	 fiU3z55g4JrAz37pnr6YJaqnLMQoqv7HXQ+EP0oqivV/mpDFZf2UV6tpS4HrUq8OQDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="N8zSC/tE";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3250E606A326;
	Mon,  2 Nov 2026 11:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=N8zSC/tE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C8E51F00A18;
	Mon,  2 Nov 2026 11:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793617551;
	bh=uoI5OQkevqDHuqhBB6Hv5D9gBFmBn4hBJoPApEO2DYk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=N8zSC/tEJ/LwvfSkEnktgwvfOS6uq1mYxPYqo3OfTFit0rNthFvz2lbST5fLJM623
	 /6dsFq1DoFmMnrcYbyUFyNxycmjYflmJChbZh0M2+mJPAdeeok/ppGVbm8BLR2v+Qk
	 opVeMmBhOkYW7+L0mUAAxilBemczZIwSHZZq822FfELbNR95/OF9N2On2WmclaL53Q
	 LLC0kKIYwpXKy5TldBKbTwEs4X6VH5GmgeJDh2JvhMUlllGodwSL5ZQiedOpuSr8dB
	 UGNgs+axYKwOwBAMk/0fgLQDZrBi159E3Va8CIRXhCYDaGLtARO8ZdkK2gBr8itqCV
	 7vO8NdxSJjvVA==
Date: Mon, 2 Nov 2026 12:05:47 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stefan Agner <stefan@agner.ch>, Dong Aisheng <aisheng.dong@nxp.com>, 
	Jacky Bai <ping.bai@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 01/11] dt-bindings: gpio: vf610: fix clock requirements
 per SoC
Message-ID: <20261102-curious-economic-grouse-ccfd6b@quoll>
References: <20261029-gpio-vf610-fixes-v1-0-45b484b4c434@nxp.com>
 <20261029-gpio-vf610-fixes-v1-1-45b484b4c434@nxp.com>
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
In-Reply-To: <20261029-gpio-vf610-fixes-v1-1-45b484b4c434@nxp.com>

On Thu, Oct 29, 2026 at 09:42:25PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> The i.MX7ULP GPIO controller needs both the GPIO and PORT clocks,
> while the i.MX8ULP and its derivatives (i.MX93/94/95/952) only have
> a single "gpio" clock. The vf610 controller has no gateable clocks,

VF610

> so keep clocks optional there.

You mention VF610, but I do not see corresponding change in the binding.

Best regards,
Krzysztof

