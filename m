Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793871410;
	b=IqgqNbaQJk8qAD26UsVOCYdUI+l5kX9+hNCrTJAl6e/5JpREpR3GABHct0X/WtXvtad+
	 eOB59H5gGZWdfbbhuR9IopoMcEj6KpC7PmcVtNL9z3wLBiSK3/Q1tqlgnCCYDyGU2RcUq
	 0geHHN3hmMEbW23BBiczugKlPJtiiQRNh4Ntug4gX/t6w6ICgAJe7Z+J/KyciFZhhPLaD
	 3cw4hmvvOVrp8ekPRRxYQmWcT9cjV8EvZZODhjo72cw2OD+SogVxj43qpGkZM14kFuhDR
	 fI2I73S5vGiwmbkd3643KkmcosXteqTcR6aZggl754phGx6Qmy0h+1YhV2H+ToZCPpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793871410;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Xttwb3ALnGWe1CpyQhX8yLnDD5ytpmDjGeCZQnnf2bs=;
	b=f2P/VzEBGfuh98zsCl7ty60zPOx20VS40r+jthIO5xBT3G5iUFmzsVEKE0csW5T0Ul3f
	 Msvpm4isGRDWs2ZsETE1CLTPFAzbXq8jce1CpgGEkHDe/OAbLruyJp7CNEc1UgqWphLwW
	 NZOsae0s7YwXtNeWzoIVJae2YDD+dj1O+MMvNpd4t0G//lQLh6t8Ae4tU9a1LUp5aB4n5
	 pmKI6G4PS6UfIkFylImaqSYcgMPUyEx7GUfehcIFjoSp32doSEPONvsnva0l9zaJOyLs8
	 aeueHGPKvm8/145sSHoe7Xxm97lvcHELuTLqbI7G7nRGVCvC1R4kIsEVdtXCM73Kxkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QzaPaUYG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A640C606A31B
	for <linux-gpio@vger.kernel.org>; Thu,  5 Nov 2026 09:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QzaPaUYG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80E401F0093A
	for <linux-gpio@vger.kernel.org>; Thu,  5 Nov 2026 09:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793871410;
	bh=Xttwb3ALnGWe1CpyQhX8yLnDD5ytpmDjGeCZQnnf2bs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=QzaPaUYGOBR3miwPVDWhr7OJicYxq20cxOgZyT++3qWCbEM7FZ8rhypz6I3IeYdhq
	 eDuYGm7pDZ84OJxav2DOY3acgUM+a/AQrvXLypZannpFbD8gwZ0Ncv5Jd76gkBxEd1
	 IJzJvZJonAWqwf7y2TAFJsAZs93CI50xZ07RfetsXojc5/yft5sm9oT90v457/4wgY
	 PNlFdBz4qbSSQYhdiqPbinHDlyu7moaDhx7JEa4MziUoBb+XeFOj6netvQtjygHbon
	 7UnO7T8+RgPUcfGL/AvyJ2zb/eSbgV+0vFpgz5g4zKMIC2jFlUPUV8uPBNio0cclbo
	 QgVDz+epi2jrg==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5bccb867d6fso1319166e87.0
        for <linux-gpio@vger.kernel.org>; Thu, 05 Nov 2026 01:36:50 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBy5QhFPUkDAtiz7QffNftt8OZis2gJr9bN80RQhd39uXNZKHj6cbncw6n8Eu1w559AGRLzXV9iLU0jK@vger.kernel.org
X-Gm-Message-State: APuU4Z9WzyVQtqJZdP5trpUW0yCOqqDceCIx1wUpVtZmBfBlBB42BEAO
	g8c/yJlCyQYLprS5v6CbOylQ5zGR3XiMdQzwnvjoalxteLFk9pGKSt3NykDSSooQjtYel9OqScT
	ZW0nxJMW7xsceE/f5JLNK3gPapqHRSw4=
X-Received: by 2002:a05:6512:33d3:b0:5bc:c9e3:d5bc with SMTP id
 2adb3069b0e04-5bfd9584f1amr6097727e87.29.1793871409322; Thu, 05 Nov 2026
 01:36:49 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104113905.96582-1-khristineandreea.barbulescu@oss.nxp.com>
In-Reply-To: <20261104113905.96582-1-khristineandreea.barbulescu@oss.nxp.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 5 Nov 2026 10:36:35 +0100
X-Gmail-Original-Message-ID: <CAD++jLmQb_tk_1gXOVavVCnUcWGihBkCm5Bmww6Y+Yrp9Ka1-g@mail.gmail.com>
X-Gm-Features: AclHuK8pW7D9RB9awGqdcgXKLChyrlrBOvB5_MS58ipV8Yromw29U_dlx6MJAjw
Message-ID: <CAD++jLmQb_tk_1gXOVavVCnUcWGihBkCm5Bmww6Y+Yrp9Ka1-g@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: nxp: s32g2: Enable by default on ARCH_S32
To: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Frank Li <Frank.Li@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Chester Lin <chester62515@gmail.com>, 
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Matthias Brugger <mbrugger@suse.com>, NXP S32 Linux Team <s32@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 4, 2026 at 12:39=E2=80=AFPM Khristine Andreea Barbulescu
<khristineandreea.barbulescu@oss.nxp.com> wrote:

> The SIUL2 pin controller provides the pin muxing used by peripherals on
> the supported S32G boards: the S32G2-based S32G274A-EVB and
> S32G274A-RDB2, and the S32G3-based S32G399A-RDB3. Without the driver
> some peripherals never finish probing and a defconfig kernel cannot
> boot to rootfs on these boards.
>
> As the driver is required by every supported S32G board rather than
> being optional, make PINCTRL_S32G2 default to ARCH_S32 and keep the
> user prompt only under COMPILE_TEST.
>
> v2 -> v1:
> - list the S32G boards that need the pinctrl driver
> in the commit message
> - drop the v1 arm64 defconfig change
> - default to ARCH_S32 in Kconfig instead

No Signed-off-by.

A reason this happens is that we have instructed coding agents in the new
AGENTS.md to not add Signed-off-by so that the patch author always
will edit the commit message and add their sign-off manually.

Yours,
Linus Walleij
