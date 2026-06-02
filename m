Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60CCA36AB7C
	for <linux-gpio@vger.kernel.org>; Tue,  2 Jun 2026 07:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780386708; cv=none; b=MHVVDjItw8abKuHqua2rbq1aqhmeigLT/i4Pr4puX4/9pTRHGC4cZzXwZi7322gJxLMfEqUeZUKOm7oPU+Wh2EJ++zb2CozMJ0MHH2o5TAjLJzxCrRoDP0QCSocH9TGZ9V1/kLDlUgh2+aI/dwQhwZCe5TaDAihoklYZwIPz0fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780386708; c=relaxed/simple;
	bh=wuVNg3gQE+mK+ag09+Bvsel0k7h5bILVwIIbusGLCDE=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NPJTAvelpwOM9G3mIKaXbmsRmnT8AAe3D2Fjhg6J66gXNR6nP0OPi3S8+KA7LOhgzQu5VrJpRdzoHPR+19e7kd2Qv/uazBSq7igQV7SiMI55wsBE6GWAuJx32AkxPdedBMdDyAgYXGstP+48K2aNN3Q5AotU90PkUAX8p5ZOOCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cLN2WanV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cLN2WanV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 213071F008A0
	for <linux-gpio@vger.kernel.org>; Tue,  2 Jun 2026 07:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780386706;
	bh=XM1cyr1vrg2HBK1U1khpsYAE4BrS8XU8+D6WO/ogaEg=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=cLN2WanV4w7DSAaxyuIl+hxPLF55Z2df+kpIab1MB4r0y4z1+joeDWUVxfWUBq+Tn
	 FzYDr3Hu2+fS35+3aRDQktCuLqn3LFWeGwDaPM0qNWSgzHwr4VfpVCMl9xo+2mBXcX
	 PY/Z+o2OgSyjCnOyomXhrIHRMFGoBWKhP8ANCG5pCDKnaXtCVAPG1LX23HkTpMHXok
	 7Kl8qZow8+Rpja02/6Wi6Wto8VJn/IV+J4i+gSmgGTIoAxzh/RiRir3+5JZ/EDcrU3
	 bSnL5BCYwazUz3liDr0Z/QFXmfMvoCt1EJcWa4cc5TIFwY1g1TApzT8CnuCYItrQTX
	 pq4O31uFw2pPA==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-396669329fbso24501581fa.0
        for <linux-gpio@vger.kernel.org>; Tue, 02 Jun 2026 00:51:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8IyOiToqCIzN4zQFm5T75wMnCwu0YPvnkFQi08clqpzgiO8o9UvzF0Jgerh+e6XaVSiwPsXxvua5++@vger.kernel.org
X-Gm-Message-State: AOJu0Yxp02OurFkcLiWTMGB6AhdtL5+02z7F/YtKd4dWfrnYaQ1gIFBA
	/u3fxFliaBXmVFQ3gYASMlz3+lxgRtYZwfMjALExCyl3SzyqmD84gVEN0I/FoReSrbbajbRIh/H
	kslUq5K8tUWobmnjXRHHbLTWOL2N/Yc1qxhpHzlC9ew==
X-Received: by 2002:a05:651c:248:b0:396:7f13:99f3 with SMTP id
 38308e7fff4ca-3969ba86c5fmr8390851fa.12.1780386704787; Tue, 02 Jun 2026
 00:51:44 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 2 Jun 2026 07:51:42 +0000
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 2 Jun 2026 07:51:42 +0000
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260602050131.856789-6-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260602050131.856789-1-rosenp@gmail.com> <20260602050131.856789-6-rosenp@gmail.com>
Date: Tue, 2 Jun 2026 07:51:42 +0000
X-Gmail-Original-Message-ID: <CAMRc=Me0rqs8nxrp95X-2Bjw059ahRxwKrg-NtmEt025w2m9bw@mail.gmail.com>
X-Gm-Features: AVHnY4LkpB6dJhgbPXQCl-FD0u4U2hnvkB7wtmJ832CgKjY2LSe3im_-EB8j-9k
Message-ID: <CAMRc=Me0rqs8nxrp95X-2Bjw059ahRxwKrg-NtmEt025w2m9bw@mail.gmail.com>
Subject: Re: [PATCH 5/7] gpio: ppc44x: Convert GPIO to generic MMIO
To: Rosen Penev <rosenp@gmail.com>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, chleroy@kernel.org, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	"open list:LINUX FOR POWERPC (32-BIT AND 64-BIT)" <linuxppc-dev@lists.ozlabs.org>, open list <linux-kernel@vger.kernel.org>, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 2 Jun 2026 07:01:29 +0200, Rosen Penev <rosenp@gmail.com> said:
> Use gpio_generic_chip_init() to set up the PPC44x GPIO chip
> instead of open-coding the basic get, set, locking and state handling.
>
> Keep the PPC44x-specific direction callbacks because they still need to
> program ODR and the OSR/TSR registers around the generic data and
> direction registers.
>
> Assisted-by: Codex:GPT-5.5
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---

...

> @@ -124,10 +102,11 @@ static int
>  ppc4xx_gpio_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
>  {
>  	struct ppc4xx_gpio_chip *chip = gpiochip_get_data(gc);
> +	struct gpio_generic_chip *gen_gc = &chip->chip;
>  	struct ppc4xx_gpio __iomem *regs = chip->regs;
>  	unsigned long flags;
>
> -	spin_lock_irqsave(&chip->lock, flags);
> +	gpio_generic_chip_lock_irqsave(gen_gc, flags);

If you're already doing it, can you use lock guards too?

Bart
