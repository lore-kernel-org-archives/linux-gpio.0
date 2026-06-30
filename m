Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7692366566
	for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2026 14:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782828368; cv=none; b=UOt1zy5pbNSwMBgF9aVYZ+/JRMzyDHGZFbkB7Lm9QpVdPa5ZEEQrG2JFc6dL4MAGaa0IhewGfyKTQ/GCoCH2pBoy1ooJnLAajamHWGHOTJLjfsRQOKgChDtvETr/7Lr/rp+h+s9C5Cw3jJfux+yz2C5GiUQONQT4ySao1gMIaxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782828368; c=relaxed/simple;
	bh=KZE8PERg9mDPVZNcBjLhSl+mypn89lWn+zelpMIYuqc=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tVVD7O2hmJjqLeCLao6w23EYsvG6Df1BqneKBN1wNZZ51vD91VctZHc16EqL2hhUnTRh2XXg3GmhkBGlgfeiNeciNfLL2b+TZp876ap6MTmEN6z5C/WSiszM/7PF9bp+9wQW68NnzPn/YQNixEYtegwbnp64lMKEMXLqJ9YaJXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ssx8+8uZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ssx8+8uZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C07F1F00ACF
	for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2026 14:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782828365;
	bh=KZE8PERg9mDPVZNcBjLhSl+mypn89lWn+zelpMIYuqc=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=Ssx8+8uZ0Y4OP+CEnjvqnXDa84ZyQPh7l9SD9BcsSqMV0Zn3PeIuTYVZs+Ncgw41m
	 /QOYTZlR8mmQue/AJ3/+7cs++45c7/f7YmtcL5Ys75rkpHAVJbQwRoL1pXK2RnGo7V
	 /5SFOSuQWXc/4AKwMNr426Owcb3SqgnE1NSxCq6sajfVUtuKjS6Wuo+FodGrBLawBj
	 TI2y6d6sxOxaCWtXpVkVWZq5WcIA7vxiGkMWxM3rqATwliZGTqszxsIu5JEuFaet1r
	 Cp5o4J0dSIMhyxPNv+lS1p7wKOhAfx/i2/fBvu/jmsSSMxLse4KDar47lCau+537vC
	 h7HhJ/TKQG66g==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-39ad1d2555aso38538831fa.3
        for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2026 07:06:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rq117qO3sUYi+jR2tcmpAfRxvh/KK5dAKL5xiY2bOsQltx3fRDqjpdv5ch8nEgIReax2cBtzpZBNsIy@vger.kernel.org
X-Gm-Message-State: AOJu0YzdW3WwUTFYGk+L2SDxvNQVVOAKVKzBhJ+XUOFoFu8bIW5+gf9c
	5P02bluOUypwTEZ4iok6B+7lJZ+K/PqQjBPdfDiOIUVVClrX71RA1XmxidF7mbnXJaPRkcFva/9
	YMMMw+zNrpRHX8kZRcUDR1jNrPSopJIpf/dmGEnVvzw==
X-Received: by 2002:a05:651c:890:b0:396:7fa2:e090 with SMTP id
 38308e7fff4ca-39b1dfa89a6mr9139571fa.29.1782828364161; Tue, 30 Jun 2026
 07:06:04 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 30 Jun 2026 07:06:03 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 30 Jun 2026 07:06:03 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260626060112.2498324-4-sergio.paracuellos@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260626060112.2498324-1-sergio.paracuellos@gmail.com> <20260626060112.2498324-4-sergio.paracuellos@gmail.com>
Date: Tue, 30 Jun 2026 07:06:03 -0700
X-Gmail-Original-Message-ID: <CAMRc=MfiSePgA+Vc2GHz_5QUGZWFhnPrXPZoCV+32b9RJos5xg@mail.gmail.com>
X-Gm-Features: AVVi8CfCtJrxZdB_aayhUMnyKmkOqnmeYDZ9Pam7vPg_2SWx29HyVqbCNBbdF9M
Message-ID: <CAMRc=MfiSePgA+Vc2GHz_5QUGZWFhnPrXPZoCV+32b9RJos5xg@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] gpio: mt7621: be sure IRQ domain is created before
 exposing GPIO chips
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: linusw@kernel.org, brgl@kernel.org, vicencb@gmail.com, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Sashiko <sashiko-bot@kernel.org>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 26 Jun 2026 08:01:11 +0200, Sergio Paracuellos
<sergio.paracuellos@gmail.com> said:
> Function 'mediatek_gpio_bank_probe()' registers three GPIO chips using
> 'devm_gpiochip_add_data()'. At this point, the chips become live and visible
> to consumers. However, the IRQ domain isn't allocated and set up until
> 'mt7621_gpio_irq_setup()' is called after the GPIO chips setup finishes.
> If a consumer requests a GPIO IRQ concurrently 'mt7621_gpio_to_irq()' can
> be called and pass a NULL irq domain pointer irq_create_mapping(), that can
> corrupt the mappings or cause a crash. Fix this possible problem seting up
> irq domain before GPIO chips setup is performed.
>
> Cc: stable@vger.kernel.org
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Fixes: a46f2e5720f5 ("gpio: mt7621: fix interrupt banks mapping on gpio chips")
> Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> ---

Seems like sashiko still complains about this one. I'm not overly worried about
this path but since the commit's purpose was to address this very issue, do you
want to rework it further?

Bart
