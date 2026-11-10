Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794352805;
	b=2zSqhXAz7fKXMDGvux670PszykCDvtF1WYeLqAD1HulAdAhJGDEziEYgKVlqqP2tZ5A+
	 4QNpmyf3HTc3zV7Y2g/69C99WhZ8a7uBHB7vrPi2VyqNHQUN/4TIEo+RHcjjuZxUo1zCs
	 vd3e+LOaFCrflUf/Tu91Ip5WM1gABd0WCuv971Os9GW59c31ye+es/FJXfhFrKoZbveKH
	 mPU8MPs3QMiUFroN8tInYXHeb/69OF01Ui8d5aZnsUgCBi3BtZBvizAVg/x2zMmyIdMT3
	 Xhlz/g9/4jSJpun27qlx3LLqnPz4e6fFvzBWrh5NO6ycRFcWeqg3ZkkBUdTTSVLK+oA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794352805;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=coye4vnDXd9Ljcgz8Sq/fW/P8ZrP7O+axopPfK+DQdY=;
	b=Zg7LGxJaBSLfEVJLGd09ljMvFpQ4SDrV8s6+NU/GZJm0bnEUG2IvWeYxcK6eEQfyhpB0
	 lvwr+4CFWi+MON9AUHkYLKyj6tR5AmcVZ67tteCTFbFnxD2TXpNDZ5xcGzAIr3wFgCpQc
	 5W/JXPGVGEJPj7q5G7xBSKO2nWHdj3QrGf22ZU7ggusWiv++FT02Zi4M+GtFJqPd2juLv
	 jL5PE6DVKYQ/imJO7N5cXtQNfYntRSPN8WV7AhaLRi9EJAxXX4+gxn5JG5anR1gTFezoW
	 x+npzhssp/SH1ZndJmJu3Shb70g8P2OOiWs8CcG0eUQc5Kp5foCqSpsQiurqegwV+WA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gTpz1zNh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5032D606A320
	for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2026 23:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gTpz1zNh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 019D71F0093C;
	Tue, 10 Nov 2026 23:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794352805;
	bh=coye4vnDXd9Ljcgz8Sq/fW/P8ZrP7O+axopPfK+DQdY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gTpz1zNhdSsIyAk/1t663O25JL1HQp3mz2goztlPy61xz0bSk9QLsP1zqsmKeB97W
	 SftwJbjqHvogMi8KFOdGT61luHbuonQ3jW6NWCNffhk+44I0CDfU0pN3g5I5fQZOHJ
	 l5ui1g0oKlqFjYmNN/C4E4iCYKEItmbkzDjYBBRNya8mC6sFsXSyXT99FKemzuZlXw
	 fymgunnV/IsJFpzb+QRid2bb/mQivFJNlMh8WpdrtB0VjmJydGFw7zQOvj1yivlSl+
	 8G8Lm+bzBHtCjJFc/UDI41bMO4Ulca4YnPdtV0fWwUflWnbS0OXbfYBMOgM3RajZ2H
	 HtFDi7tHNArbQ==
Message-ID: <sashiko-outbox-207880@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] gpio: davinci: use controller-specific MMIO for
 BINTEN
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sahaj Chaudhari" <sahaj123.sc@gmail.com>
Cc: linux-gpio@vger.kernel.org
In-Reply-To: <20261109194910.2282454-2-sahaj123.sc@gmail.com>
References: <20261109194910.2282454-1-sahaj123.sc@gmail.com>
 <20261109194910.2282454-2-sahaj123.sc@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 23:20:04 +0000
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found no new issues
in this patch, but noticed 1 related pre-existing issue it does not
introduce:
- [Critical] gpio: davinci: out-of-bounds array access in
  davinci_gpio_probe() [1]
--

commit 28eb7330290061761743897d388da288ba076340
Author: Sahaj Chaudhari <sahaj123.sc@gmail.com>

gpio: davinci: use controller-specific MMIO for BINTEN

This commit makes gpio_base local to davinci_gpio_probe() and derives the
BINTEN register address from the controller's mapped bank rather than a
file-global variable.

> diff --git a/drivers/gpio/gpio-davinci.c b/drivers/gpio/gpio-davinci.c
> index f7c3b644e0e39..caeecfc3df204 100644
> --- a/drivers/gpio/gpio-davinci.c
> +++ b/drivers/gpio/gpio-davinci.c

[ ... ]

> @@ -168,6 +167,7 @@ static int davinci_gpio_probe(struct platform_device =
*pdev)
>  	unsigned int ngpio, nbank, nirq, gpio_unbanked;
>  	struct davinci_gpio_controller *chips;
>  	struct device *dev =3D &pdev->dev;
> +	void __iomem *gpio_base;
> =20
>  	/*
>  	 * The gpio banks conceptually expose a segmented bitmap,

[Severity: Critical]
This problem wasn't introduced by this patch, but can a large ti,ngpio
value overflow offset_array[] and chips->regs[] [1]?

When ti,davinci-gpio-unbanked is set, nirq is taken from gpio_unbanked
rather than DIV_ROUND_UP(ngpio, 16), so the nirq > MAX_INT_PER_BANK check
never bounds ngpio:

drivers/gpio/gpio-davinci.c:davinci_gpio_probe() {
	...
	if (gpio_unbanked)
		nirq =3D gpio_unbanked;
	else
		nirq =3D DIV_ROUND_UP(ngpio, 16);

	if (nirq > MAX_INT_PER_BANK) {
		dev_err(dev, "Too many IRQs!\n");
		return -EINVAL;
	}
	...
	nbank =3D DIV_ROUND_UP(ngpio, 32);
	for (bank =3D 0; bank < nbank; bank++)
		chips->regs[bank] =3D gpio_base + offset_array[bank];
	...
}

If ngpio exceeds 160, nbank exceeds 5 (MAX_REGS_BANKS), and the loop reads
past the end of offset_array[] and writes out-of-bounds into chips->regs[],
corrupting memory in struct davinci_gpio_controller.

[1] https://sashiko.dev/#/bug/linux-59cf1b6f-2241-467c-a82a-93a3d1bf5d16

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109194910.2282=
454-1-sahaj123.sc@gmail.com?part=3D1
