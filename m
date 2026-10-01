Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F3DB3AFCF7
	for <linux-gpio@vger.kernel.org>; Thu,  1 Oct 2026 08:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790843796; cv=none; b=qq6kffmfre2EYaxmWNtoH5Qjf0ZeAjOWyK6hyWePOHfD6mZJj1DhX4LFk8ARdlmGu99yLGDa63ac2LGl2ZhA9Vw2SLWtGzn1+qPpIe3TJo8oCvzF//C3dpkWjxSK9IOaqIFnH4oag7ZcfN6Xuy3qecI6xTt5atQclP3AnrwAa0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790843796; c=relaxed/simple;
	bh=xIb+an1vjbuhlFxsNo5cH4KHq1BGxzWRB6J9q5forqk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fhdP7y3iPdx0svUw5yucuWB8TgKQnpYBOYlR6cbob+GMGP6e2WgL7pRoDMZPMeRGtBI7b61w0lrF1DFtMX19XEGJl6SJ5F3dN1hfQ4d966HLLmjmP8EYSeQKLIxMBNaJwHdnt7Yjt4sAm8vWkCJfYP1iUVio4410e8fmTkJEsLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=akN2LcrN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="akN2LcrN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8F9C1F0089A
	for <linux-gpio@vger.kernel.org>; Thu,  1 Oct 2026 08:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790843794;
	bh=xIb+an1vjbuhlFxsNo5cH4KHq1BGxzWRB6J9q5forqk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=akN2LcrNRBtvTWpXT593bSULf+KnDmMgFzPG39kC2olsa/L90PKc+2cXqTrtKes00
	 pTch5a2QOKX3UFjFDt9e1ZT1zbcUckAeUiS1Rh81/jNyUqlLKGsvDB4IYY8toU62U7
	 8PS0Uq0mp6dwkLED38EV6LdLY2ksH/kUaak+23ajaETcIYZhYkUexlFnRDUFre8hDo
	 YFJR0gZhan2jutIUmJep9x+rjQsHww0YrU135iI2L2qxNZj/i+Sr2KFLq1QZ0PNfbA
	 HH/PgWbigBKmnB9ZTJ6OD4gD/ikk66eqxC8rMK4MVXGdeUomb3IS2dRTx1XaJqn16D
	 1pZZZcYlxmmpw==
Received: by mail-oa2-f35.google.com with SMTP id 586e51a60fabf-491c13d63d9so4457521fac.0
        for <linux-gpio@vger.kernel.org>; Thu, 01 Oct 2026 01:36:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxRrEjxaFHqgeMXgdX8AtIgthGCCCMKrnlG1ooYulIjzMuxTXtecpyz+VlJ+t3NKCEJhYngAKnwcI6M@vger.kernel.org
X-Gm-Message-State: AFq9FYIc7VacSC8L6S8p60yK3779AcoxI0CllDKcv7jg1JkasN9r2E8A
	eajsKLSQ5zDbYAcZqcFFk7QySWsSHebejfGGdcUhpZAwwRdhTac0ndTj/e33b8NE/9TS2ubEn7r
	kO+hvhU9p6JA/FE8pM3qJrxAY1B4sN4g=
X-Received: by 2002:a05:6871:cfca:20b0:49d:c40c:4994 with SMTP id
 586e51a60fabf-49df467f903mr1116516fac.9.1790843794327; Thu, 01 Oct 2026
 01:36:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260910100357.130134-1-changhuang.liang@starfivetech.com>
 <CAD++jLmts76o8wyR=eY=vdNsh8+916YqK9qwM3b=R624AYM1XA@mail.gmail.com> <20260930-frantic-enviable-55c1a78fe7d4@spud>
In-Reply-To: <20260930-frantic-enviable-55c1a78fe7d4@spud>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 1 Oct 2026 10:36:15 +0200
X-Gmail-Original-Message-ID: <CAD++jL==9BjfyHuJMT3sg9rkLDEHKaryHLtxxVwySmLUNjaW3g@mail.gmail.com>
X-Gm-Features: AclHuK9u4NJU-Y9jPHB9lynNieX4ueu3y9pQqGkmbWAAjJAu4pGPhtuSSWpMAZk
Message-ID: <CAD++jL==9BjfyHuJMT3sg9rkLDEHKaryHLtxxVwySmLUNjaW3g@mail.gmail.com>
Subject: Re: [PATCH v8 00/22] Add basic pinctrl drivers for JHB100 SoC
To: Conor Dooley <conor@kernel.org>
Cc: Changhuang Liang <changhuang.liang@starfivetech.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Emil Renner Berthing <kernel@esmil.dk>, Paul Walmsley <pjw@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, 
	Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 1, 2026 at 12:34=E2=80=AFAM Conor Dooley <conor@kernel.org> wro=
te:

> btw, are you going to be at LPC or OSS Linus? I'll have to make sure to
> say hi if so.

Sadly no, not much conferencing for me for the moment.

Yours,
Linus Walleij
