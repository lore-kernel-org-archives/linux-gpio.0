Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3440036A354
	for <linux-gpio@vger.kernel.org>; Wed,  1 Jul 2026 07:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782892211; cv=none; b=rrPgs0R6YBYXRw/GK6Ro22bGfTdG/XQpMPQoy1ieHaPtX+t4UWSwULbaL0Pz3Lu5CgUOY2sPPz3Tq3FeceRe87KIQlOZgCGMHSQeMSTrAOzltSJW5Zgp3oTdE6iPE35SFdieUqlP6qGicydSByfM7HZCQK1XTk9MvWpWG6xCtX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782892211; c=relaxed/simple;
	bh=dx1O75jqKMARjEbw4xneNk7aG4r2yfuJioWVDgA4Lp0=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PLfg5qDWuzs3DBG8DLVVxJdQvCmoMmJm+pOKrWscPw6udRpOdi2BrdGUI+tQ8kIW1mWDbdpFNAl7n4BE9JudUidAJZwL5eR0qKy5noHAiYG2BmlxudC7gGephegeaWccfgDD44EwBQpKTV7etsnSsuLamft2+StaSWXUPZrItwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j2DcNdYd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j2DcNdYd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A5B71F01558
	for <linux-gpio@vger.kernel.org>; Wed,  1 Jul 2026 07:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782892210;
	bh=dx1O75jqKMARjEbw4xneNk7aG4r2yfuJioWVDgA4Lp0=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=j2DcNdYdADDJu+D3REmFeOGs5cw/wVRDCtpWACgDuKjqrOOLm2M4y5DN23480AZ1+
	 vdbHErYbb2InVSGUdjvxGuamb9E+yPRsBVjhCVCiXyKaOxignCJrhJJ+sCulqREuj2
	 JZxBrhhL8M2bGYMeKhgzQoRiW4OCC68fnAE12cgLy2w3/40ruKeTVw7/mHAPBTxFXf
	 MW3RIJTIy2p3JhCAAmsgmH3SkxgQcdyu4tbovvpGx2pi551ZcwYmfASnsbjb8Sy5Am
	 u1HrtfRlZkc2/+8NNkXk6EuHohgDRlqIW5fn+gweETKl82yJ2QHYPWNfZQsisst93n
	 oOXXzvbJsIhvQ==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-39b14a7e53aso3399311fa.2
        for <linux-gpio@vger.kernel.org>; Wed, 01 Jul 2026 00:50:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RogPppgLU49z13LsszOePf0rOa+4tdqQreRyZT4EffiKdBUl9pL4AmoS7uNpoE3u81Q2BlKe67iVPsi@vger.kernel.org
X-Gm-Message-State: AOJu0YytHPvXRZcfkoVzRpT/6NcPHWrJ+fpZfHvhRf40HSuIzliYMwtE
	eQXMzi2f1IJqwletdRYkCV+PsyPJiovH5YN85hK/H3MtHMYUpXW0Si/Bcj7nwwljPGYnZVnsq8A
	VjkhU4K0z+yRMhMnlVPok5/PZDWo3x90wCOXydv9mLQ==
X-Received: by 2002:a05:651c:1593:b0:39a:f75e:a147 with SMTP id
 38308e7fff4ca-39b340d882dmr882981fa.34.1782892208779; Wed, 01 Jul 2026
 00:50:08 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 1 Jul 2026 00:50:07 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 1 Jul 2026 00:50:07 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260630125403.546375-6-khristineandreea.barbulescu@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260630125403.546375-1-khristineandreea.barbulescu@oss.nxp.com> <20260630125403.546375-6-khristineandreea.barbulescu@oss.nxp.com>
Date: Wed, 1 Jul 2026 00:50:07 -0700
X-Gmail-Original-Message-ID: <CAMRc=McZEw4P3LS9HzaS5W1qonGWkdvCYaEvFiY8m6sm98aWjA@mail.gmail.com>
X-Gm-Features: AVVi8Ce65ZHRsdwHuQE2lkQelFQAZtLRoTaOMFpaCpGigaio81APEbQW62eUHbc
Message-ID: <CAMRc=McZEw4P3LS9HzaS5W1qonGWkdvCYaEvFiY8m6sm98aWjA@mail.gmail.com>
Subject: Re: [PATCH v12 5/6] pinctrl: s32cc: implement GPIO functionality
To: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
Cc: Alberto Ruiz <aruizrui@redhat.com>, Christophe Lizzi <clizzi@redhat.com>, devicetree@vger.kernel.org, 
	Enric Balletbo <eballetb@redhat.com>, Eric Chanudet <echanude@redhat.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, NXP S32 Linux Team <s32@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>, Larisa Grigore <larisa.grigore@nxp.com>, 
	Lee Jones <lee@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 30 Jun 2026 14:54:02 +0200, Khristine Andreea Barbulescu
<khristineandreea.barbulescu@oss.nxp.com> said:
> From: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
>
> The updated SIUL2 block groups pinctrl, GPIO data access
> and interrupt control within the same hardware unit.
> The SIUL2 driver is therefore structured as a monolithic
> pinctrl/GPIO driver.
>
> GPIO data access and direction handling are implemented using the
> gpio-regmap library backed by a virtual regmap. The virtual regmap
> translates the gpio-regmap register model to the underlying SIUL2
> registers: MSCR for direction, PGPDI for input values and PGPDO for
> output values.
>
> The existing pinctrl GPIO callbacks are used for the request/free path:
> they switch the pad to GPIO mode on request and restore the previous
> MSCR configuration when the GPIO is released.
>
> This change came as a result of upstream review in the
> following series:
> https://lore.kernel.org/linux-gpio/20260120115923.3463866-4-khristineandreea.barbulescu@oss.nxp.com/T/#m543c9edbdde74bdc68b6a2364e8b975356c33043
> https://lore.kernel.org/all/20260504131148.3622697-7-khristineandreea.barbulescu@oss.nxp.com/
>
> Support both SIUL2 DT layouts:
> - legacy pinctrl-only binding
> - extended pinctrl/GPIO/irqchip binding
>
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
> Signed-off-by: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
