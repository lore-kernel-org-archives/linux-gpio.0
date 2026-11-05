Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793870060;
	b=DuG289oEVQEaZRP0BEL//stnLZroo5ikvW7ooLgpGp4oXZa1CqrG79700fD3aJYTbaTv
	 MPqE7oA8ItYqS3Aqc+GqHzClIg7taL3P14KVOSsSxl9XO0ksLY1ztH/OCq2Y8tFbi0NGD
	 5vFDXiemmPV4b3DZqiAor3Ewe5LHuL9rWdyVmWSM1hG9AfspNwt6V6sbdmdWceXkOuf+1
	 mrFNXzLB9s6FWgmBDqyCzCWcaqELwb3jgIjbpeP66TZnGOsRDWE8uJp84Zb4K5Aw4icBb
	 zMIwJPWJUdi8noXbyH1dzJgrlesj66SNG4qg4+wPChHJy2WfgIOgMCpzt1r7mqTZQKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793870060;
	h=Received:DKIM-Signature:Received:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=1ZiKnEgfHfPpMJ1mCuEff7XYe7UmVMKemG/M0rSuRDc=;
	b=NwnDQyi1zz4/B88TXwMHKo9K5vUNUnzdwntpexZtJS/n+suMOITFTynud6P7Qu+kgQ/B
	 F/ltmGFNupU9GsJ2hs7mbBLX4ivc8eMxx1fCyRQMFJnUA2/dkt/jKLZKcCqH3xaoEWiTB
	 hJLqBfeTs3wURQbmNMa6hDiV6G6qHci5WWuQR+/GF+iQ+eqX9CpSO15sWTac6tmd2SEpl
	 vdI085qcE+nLqcS6mj3l7SJ8wBZHSZlsPYIYQHnlJVMqTRDx8sr2X8pPheTpZx0C6bZPU
	 JLDwJINB1aB0Z+3oY6Vq8Kgq7UvbiibG9pWyaji39rKVI3+ISTuF+2S/maI3r/tEbiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k6ashVfP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6687A606A326
	for <linux-gpio@vger.kernel.org>; Thu,  5 Nov 2026 09:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k6ashVfP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 092051F0093A
	for <linux-gpio@vger.kernel.org>; Thu,  5 Nov 2026 09:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793870060;
	bh=1ZiKnEgfHfPpMJ1mCuEff7XYe7UmVMKemG/M0rSuRDc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=k6ashVfPPFI0i6JKfuV1tiBVeT337nYK/eyq7g90RY3/xKQXb5aEwiZaQ4HbXDMQ2
	 0nXRBPt3exslF9DSfIVlkcu/4JXwMOLoVmsd3/vpvrDXE6X0gCf/xklWdyo9Mx69S9
	 jpbQomZGjYd5q1nKQLAKPjknNS91L46P6758v3jdxlsEl8KCPiVgyPJZdrUurgAwbB
	 cJNYjDrVDfOqVuH1oGrWCgXGgRgxsZlt0DgXjVydy3wkknAGnUqe2NE1SwFhwgx7nF
	 8+zgWy7+lF1BWSsvfIAOeMnd5N4I316En+etl3dvjER42S72I9WDluay4wNNaeJnP5
	 a3OpRkRum0FJQ==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3ab30b3212aso12224151fa.0
        for <linux-gpio@vger.kernel.org>; Thu, 05 Nov 2026 01:14:19 -0800 (PST)
X-Gm-Message-State: APuU4Z/Jbf8wpGiDbWW0yf6Lm+0zTrAIah9gVwhYwTB/DoU2wIREOSAu
	YIxTeuKLbgzYH+Ut9NCetPgX9W7qiqHV2zh/TdE5Csk2dqXxWaZ4n3U0z7//kzKpTogqrVglsyJ
	ZwYNfK4H/uJ7cKymFeLF8DV8agiZZBgs=
X-Received: by 2002:a05:6512:3f04:b0:5bc:dd8e:df73 with SMTP id
 2adb3069b0e04-5bfd9580e90mr6517186e87.62.1793870058769; Thu, 05 Nov 2026
 01:14:18 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102212500.195783-1-auhmirza02@gmail.com>
In-Reply-To: <20261102212500.195783-1-auhmirza02@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 5 Nov 2026 10:14:07 +0100
X-Gmail-Original-Message-ID: <CAD++jLne9FgabDUWoirYejnnNfm4GD5zh-E-b_vUGoiwH=CgpQ@mail.gmail.com>
X-Gm-Features: AclHuK8F0VIEDKLYMK9m3DAXX4pxugopcZU_-apdZs3yndIet0l3l8rwt1ou_-c
Message-ID: <CAD++jLne9FgabDUWoirYejnnNfm4GD5zh-E-b_vUGoiwH=CgpQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: keembay: make keembay_gpio_irqchip const
To: Areeb Ul Haq Mirza <auhmirza02@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Andy Shevchenko <andy@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 3, 2026 at 8:50=E2=80=AFPM Areeb Ul Haq Mirza <auhmirza02@gmail=
.com> wrote:

> gpiolib warns about mutable irq_chips at probe time:
> "not an immutable chip, please consider fixing it!"
>
> Make keembay_gpio_irqchip const, flag it as IRQCHIP_IMMUTABLE, add the
> GPIOCHIP_IRQ_RESOURCE_HELPERS and register it with
> gpio_irq_chip_set_chip().
>
> The chip only implements .irq_enable() and .irq_disable(), so call
> gpiochip_enable_irq() and gpiochip_disable_irq() from those callbacks,
> following commit 35d008679a5a ("pinctrl: plgpio: Convert to immutable
> irq_chip") [1] and commit 2993d2dd8ff4 ("gpio: timberdale: Make irq_chip
> immutable") [2]. gpiochip_enable_irq() is called once a free interrupt
> source and slot have been found, so a line is only marked enabled when
> it is actually routed. gpiochip_disable_irq() is called after the line
> has been cleared from the interrupt configuration register.
>
> Link: https://lore.kernel.org/r/20230414-immutable-irqchips-2-v1-3-6b59a5=
186b00@linaro.org [1]
> Link: https://lore.kernel.org/r/20250509-gpio-v1-8-639377c98288@nxp.com [=
2]
> Signed-off-by: Areeb Ul Haq Mirza <auhmirza02@gmail.com>

Driver is marked as orphan so I just applied the patch.

Cc to Andy if he wants to pick up maintenance for this one, but I doubt
it (not x86, right?)

Yours,
Linus Walleij
