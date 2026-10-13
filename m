Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4CD24FC8E3
	for <linux-gpio@vger.kernel.org>; Tue, 13 Oct 2026 12:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791896292; cv=none; b=YgcYdmRxv26PPE2JnnAnBppcRaku+hsDFndJbPBf0ZiCif8lcMHFimhFiyq6fWijf7VA7t6FGnoBw6lqy1F/p0LzsLBbTDgvx9/FjYkly38k3xe5QqkLCw6VMH8FIJrs7ZpFL7H9x8/Z7JGeLdykCbN8EqDfbME6K+TZXBkzQDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791896292; c=relaxed/simple;
	bh=G9hb6jKl8UlE+usc+L20xv9P4Y+vxG9zesENWv1W3mE=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JP+sPqs3HOYDJFQxREKngdLbo1feuIqq+ETeGXBEC0hJSiaRsxjuTSolxtaP+swKQ3e87BnNn5eu+CwI1soXpxv6/tDbfhFWIuiqAMnx8qK0aypP05KImjNJUscXSr1vVM3N2QLQB7JD1KSm+OebRjgV5hwTXswqiU3LkOEB3Ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YkkmVRNG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YkkmVRNG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65F4B1F00893
	for <linux-gpio@vger.kernel.org>; Tue, 13 Oct 2026 12:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791896291;
	bh=IJOU2P73B89wyUs2vsB9RdkOQRiMfy7aYrzIbJQvdG0=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=YkkmVRNGGXlC8aGnDr4PEDmS+YkO4qfnPMQHyzgWbTJgsuy+Q2LJr31CJaG0y8hc/
	 JO1gAK69uQoWf/qVNPrnrw1yfFSCn1zpU0mB+ExIcDcZHt2x5ym8PfCPSL/izzrHJq
	 RtemW3AVyRvZpkN9i4qKbbdvbwZKMnnSv4RaO770f3Q5zTbDBvAOH1hT8n/uKcJ4MA
	 R0x7KkgweQnhPbt05lJJNOhkcEFHoTRlm5Z2HlG4mxSZ3GW2TIVG+/2cytHQ+uP9fe
	 XsvuJo4Ei1FzVO/hxP53/HdkK+au8vAq4woRaWPxQcGEE7Es+jCvxga4BMwdjOK0eo
	 ji2XlFpf81Iig==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5bcb0f245e0so2175226e87.3
        for <linux-gpio@vger.kernel.org>; Tue, 13 Oct 2026 05:58:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBy9Y0g3hxLzfTsOjqGBqW8pHGTz2PZFsg/OWmMJp/Wpwcsr40ej87GH9uNlVqyJtfJmadze/UPJbI8z@vger.kernel.org
X-Gm-Message-State: AFq9FYIK6XOhHVW5nEMqA/gvWSAS5rthvuCi0VeOUWzNqCXb68w4xhvx
	38S0bCifetW/5rsrdY3TBpl0B6Dpec6OqIIbQbFrS302WJbsHsGWoR+LY9x1+GzwmiDPW/6K2Ps
	BWHe/81RBXYpkM4IDtJ//xDzeEQ0L+Xz1Ni+/SOSbwg==
X-Received: by 2002:a05:6512:138d:b0:5b9:8480:88c7 with SMTP id
 2adb3069b0e04-5bcde6c26famr4166694e87.27.1791896290157; Tue, 13 Oct 2026
 05:58:10 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 13 Oct 2026 08:58:09 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 13 Oct 2026 08:58:08 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20261009-cv75-gpio-v1-0-5836bd438423@ambarella.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009-cv75-gpio-v1-0-5836bd438423@ambarella.com>
Date: Tue, 13 Oct 2026 08:58:08 -0400
X-Gmail-Original-Message-ID: <CAMRc=MezU71ByUoO-GMxSwsFsGZTUmQisYYrYEwtdbwyFiEqsw@mail.gmail.com>
X-Gm-Features: AclHuK9cgQ7ogKo5VXavvrflaGlOdqf2MwKtjZOXUbuoM4CIGR_5JcC_LbQsVv4
Message-ID: <CAMRc=MezU71ByUoO-GMxSwsFsGZTUmQisYYrYEwtdbwyFiEqsw@mail.gmail.com>
Subject: Re: [PATCH 0/7] gpio: add Ambarella CV75 PL061 support
To: longzhao@ambarella.com
Cc: Long Zhao via B4 Relay <devnull+longzhao.ambarella.com@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Michael Walle <mwalle@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org, Long Zhao <zl020895@163.com>, linux-kernel@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>, Chanho Min <chanho.min@lge.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 9 Oct 2026 12:57:53 +0200, Long Zhao via B4 Relay
<devnull+longzhao.ambarella.com@kernel.org> said:
> Split from the combined CV75 bring-up series. These patches convert
> the ARM PL061 data path to regmap, then add the CV75 layout.
>
> Please take this series through the GPIO tree. The quirk, the PL061
> conversion and the Ambarella layout belong together.
>
> The GPIO driver does not depend on ARCH_AMBARELLA. The binding uses
> the ambarella vendor prefix, which is added by the SoC series and is
> not in mainline yet; dt_binding_check needs that prefix.
>
> GPIO data path uses gpio-regmap with two layouts (ARM PrimeCell and
> Ambarella). ARM PL061 sets GPIO_REGMAP_QUIRK_SET_AFTER_DIR. IRQ stays
> a custom PL061 irqchip. The linear domain is created with the PL061
> private data and attached by gpio-regmap. regmap-irq is not used.
>
> Tested on the CV75 EVK. The board boots. gpio-hammer toggles gpiochip0 line 26 ten times, and gpio-event-mon on line 27 records ten alternating rising and falling edges.
>
> Changes since the patches in the combined v9:
> - dt-bindings: explain that CV75 is a modified PL061 (Conor)
> - gpio-regmap: move quirks after fixed_direction_output (Andy)
> - gpio: pl061: use regmap_test_bits(), regmap_clear_bits() and
>   regmap_set_bits() for direction and interrupt enable (Andy).
>   The data register stays regmap_write(): regmap_set_bits() can
>   only set bits to 1, so it cannot drive a pin low.
> - gpio: pl061: add Ambarella register-layout variant: cache DAT
>   (REGCACHE_FLAT_S, not volatile) so gpio_set() does not
>   read-modify-write the pin level (Sashiko). Drop the Reviewed-by
>   from Andy and Linus on this commit; the code changed after
>   those tags.
>
> Link: https://patch.msgid.link/20261001-cv75-v5-v9-0-486cc289a4b8@ambarella.com
>

Is this effectively a v10 of this series or something entirely new?

Bart
