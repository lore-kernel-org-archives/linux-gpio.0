Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793867923;
	b=dnB5MobdYAKLu1B1/9UCR3TCThiffwAnTzW0boq8Hf70dgN4toCBXDgwkzANazIideJT
	 OU7YRR4lSk+JH70xVTSJP0kb2xlpucjPDpQkWyf9dbEMJO72yFR4UaAgWLCgqzOcURGxZ
	 TTXG693pS+hs+9EtfwNKPEfS2BrlPuetkQT22kvr9oiFJltB1AA73G5wZxZs33gqLpOdC
	 dSlMrWBOGuOV22K5VriX/YpXaCfZd//ouzOA4Nn7Ek0b2w5ga01C8NInCZhOO4vKbeVlU
	 3Y4QRinVznNEua5yg1W/3nyYCt2YHZtk/+wyJDQP8IPSqyW8ajl8zsazuXDaMkTjuDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793867923;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=iJahO+xZVHheC1NnIEG30RQqKhXZnJo/i1UxkUWEdt4=;
	b=pnIECP/cFkNyU5jGAYBaiTV6MVG8UV+j2VnnBJsVBvJ/UfmGaM1C/nOpXGtkmNFEtKL4
	 BRjMpAM8kfdJEZjVUF0kJc8jv31BzTnfRRU9S+gZZi2PeVzmMFBOTKVcy+K2BK38MBoJF
	 PqX2o/6f/I1y6LnyaMrqXw/SkMWT3RZovn9nZFs55kk7kC7ZtmoQbZLdfg4vpv8iGhGNv
	 RDMZJFluWL+2y9oWu+zXau70KYkGR94WRoDPAO0H/IsJ9cY9hCFjRWCBcOtkao6cLMV7r
	 pPWxDsOMgDOyEXgKjIssC/BBFyq8KdVcXuOxT0/dyLOLSm+co+iEu+ro+x56T4h1cfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eqp9bF2g;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9E6C606A31B
	for <linux-gpio@vger.kernel.org>; Thu,  5 Nov 2026 08:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eqp9bF2g
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82F041F0093A
	for <linux-gpio@vger.kernel.org>; Thu,  5 Nov 2026 08:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793867922;
	bh=iJahO+xZVHheC1NnIEG30RQqKhXZnJo/i1UxkUWEdt4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=eqp9bF2gEZvT4V+1iXtq6HnpZVqfQIrkSQsBSzX1HSMbQNosKbyWRSgdoMt4NumAT
	 8ZIzKAGwnhfA60e+r/5H+7cuw8JI1X6fVlptWOsfSdbqIlxhz5J8BjKIpb9p+e2Bx7
	 L9wNUUlbbEXYWXjM0DEn4sC2Cjy5d3ychd2PIkGjrRxCqBmuEPfc8BrKl1NRuBz8dV
	 rXQalZyP3rgNfRzMcG7yU+sr8df3g3clRqX0VqKRAw69IzyrGIHIP+2Sym4FV7Mg34
	 xJIxewfoBbq36XtTg9p1ONpwN1OCmbokntJNAw07dv/lP80hYYUXij119ALaJrMHAI
	 BnoHVQT7tYrlw==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-3ab3dd966e1so14908941fa.2
        for <linux-gpio@vger.kernel.org>; Thu, 05 Nov 2026 00:38:42 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxRzrQHoSX676PDJLmQxVPTUX3Fknn9qL9ftxOE6jwVljt8Biu6dsR/05vURsy2bVEs1fBic52OV+lo@vger.kernel.org
X-Gm-Message-State: APuU4Z/D/ZA17YeXpnZ16bgV2Zv7z0JLh/2XDp7ucKew5cSo18UXo2gL
	ZvjiWx/nb1gV4a2Cs1WnilwPqyZX2nVGgdcVikvi5DI0blyyKL0uHjZwPULHnioshT7vJkXOo1n
	tRnKW5+XZ8/Xj21GXub4XoFmQZOTwj5Q=
X-Received: by 2002:ac2:4c54:0:b0:5bf:c8fb:c913 with SMTP id
 2adb3069b0e04-5bfd954beecmr5349056e87.2.1793867921310; Thu, 05 Nov 2026
 00:38:41 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103-gpio-regmap-irqchip-leak-v1-1-d038a20840f7@ambarella.com>
In-Reply-To: <20261103-gpio-regmap-irqchip-leak-v1-1-d038a20840f7@ambarella.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 5 Nov 2026 09:38:29 +0100
X-Gmail-Original-Message-ID: <CAD++jLkanBnuZkU1kmNimJiuc9mv9DnU4fq9VPo9v6ZqsjnL9w@mail.gmail.com>
X-Gm-Features: AclHuK9YFqSLF6qyLoXta9q2yrq3m-gPcEp2_bXVQx6p8svqaDDh9ELAiCk6HbI
Message-ID: <CAD++jLkanBnuZkU1kmNimJiuc9mv9DnU4fq9VPo9v6ZqsjnL9w@mail.gmail.com>
Subject: Re: [PATCH] gpio: regmap: free the irqchip if adding the irq domain fails
To: longzhao@ambarella.com
Cc: Bartosz Golaszewski <brgl@kernel.org>, Michael Walle <mwalle@kernel.org>, linux-gpio@vger.kernel.org, 
	Long Zhao <zl020895@163.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 3, 2026 at 5:47=E2=80=AFAM Long Zhao via B4 Relay
<devnull+longzhao.ambarella.com@kernel.org> wrote:

> From: Long Zhao <longzhao@ambarella.com>
>
> gpio_regmap_register() creates a regmap irqchip and then calls
> gpiochip_irqchip_add_domain(). If that call fails, the error path
> only removes the gpiochip, so the irqchip and its domain leak.
>
> Free the irqchip there when this function allocated it. An external
> irq domain is not affected: irq_chip_data stays NULL and the caller
> owns that domain.
>
> Fixes: 553b75d4bfe9 ("gpio: regmap: Allow to allocate regmap-irq device")
> Cc: Michael Walle <mwalle@kernel.org>
> Signed-off-by: Long Zhao <longzhao@ambarella.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
