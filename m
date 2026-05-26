Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FE0E3CD8AC
	for <linux-gpio@vger.kernel.org>; Tue, 26 May 2026 09:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779788062; cv=none; b=pCNZSbF/ptDslmq4iDeKEjup0lE2NiUIDzaHDy+xBVKwERCJyb3C05JCCxSmwskAqv89FkJ4KOuhiJ2WH8Zp9pE6zSDtp4uBFzOU7pX03zD3oaOgovND/XVJPPb1LDD1NTkr2s1fHwCv7/z/A5VNNNOilsnB3aQatMwyI20e3cU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779788062; c=relaxed/simple;
	bh=nX1pFx+FeZOIPK/bjg7nevn3cc2xoOkWy1jCEDOPlPU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HYbnGJX5SjDfgeO37/J1npxGpcmr8tc9N8zEhb1yOb0RlXf3qFg8PzmvClpoKCzICfJGZCcXGBoJkSe/4vJt77aDDU9dHOR6eGW/wLkukx6mOg5e7jyHDYd0nvYm7H3/tOFpjKDbNZJjSQTI0bLX7QeHMg0902OUhtMH1BqCbjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OARhKexM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OARhKexM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57AD71F00ACF
	for <linux-gpio@vger.kernel.org>; Tue, 26 May 2026 09:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779788061;
	bh=nX1pFx+FeZOIPK/bjg7nevn3cc2xoOkWy1jCEDOPlPU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=OARhKexMO/WCnGvxp3eKjONr4YnCE2DJryoun7Pt8CDuSE4bME1pYLihfskin0DwA
	 6BkRAnj1sKA+3Fm4+q2lKRfh26On8vJldTEdh+EAUuzG4IxPTg63lrS/Zh8KFrib31
	 dHGxd/3BjgTTPbmKCNwmB/aAjZ5zjLQPYvNfqfXl2HoAL1zLbSOiwqa6si96foJHuh
	 sZ2zyrZdQxIkUwFZplMwpCSR0WeGznQSS2BXwGcgdalWGc/NGx7fYquYUjlGkoKHEo
	 9EVR55gcecJA/jidHhOiPk9K2a6+oD/awDj7NFIsNTmviU3LgZPbumF8UszclkX1p0
	 bVN6NjfYL2wqw==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5aa2691db86so9844335e87.3
        for <linux-gpio@vger.kernel.org>; Tue, 26 May 2026 02:34:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8u8UNLOgXnlR+PXi8P2fjyE9P4r6tRxePVcozVnpPmDh52OEcrL09QtYgZpqES8FjI3iCXBiLaS902@vger.kernel.org
X-Gm-Message-State: AOJu0YwlrKj3Mv375zOvXsJqbCQ07wh5vKiuEt6IHLcw+YXldwfvxgm2
	9vrf2uW+P6pQi/IhDLuaYXR54qmLN3ZGx6UQz/cxf2DJeDMKZ/+ZAjfKFPCjrOFc0aERbuHhhtd
	I627B1v4sVBKIfDyy34icNXZ2uS4Tlsg=
X-Received: by 2002:a05:6512:3d1c:b0:5a8:881c:74ab with SMTP id
 2adb3069b0e04-5aa32370be1mr5852861e87.13.1779788060036; Tue, 26 May 2026
 02:34:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260517171405.3697469-1-paulk@sys-base.io> <20260525233808.20e75a21@ryzen.lan>
In-Reply-To: <20260525233808.20e75a21@ryzen.lan>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 26 May 2026 11:34:06 +0200
X-Gmail-Original-Message-ID: <CAD++jLmF8j7JthzvdzCtmcjzv7ZEEy23aCH3cLm9WtYJnUJLJQ@mail.gmail.com>
X-Gm-Features: AVHnY4Jd-YQzV669AM8QSfdYLTsbrJsEXog3VJKPpMH3e7dMGHTfGiQX2mIvASI
Message-ID: <CAD++jLmF8j7JthzvdzCtmcjzv7ZEEy23aCH3cLm9WtYJnUJLJQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sunxi: Implement function_is_gpio
To: Andre Przywara <andre.przywara@arm.com>
Cc: Paul Kocialkowski <paulk@sys-base.io>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 25, 2026 at 11:39=E2=80=AFPM Andre Przywara <andre.przywara@arm=
.com> wrote:

> And what about the IRQ function? Isn't that some GPIO as well, or does
> that not count for the purpose of the function_is_gpio() callback?

The purpose of the function is to tell the GPIO subsystem if a pin
is muxed into GPIO mode, and by that we mean a driver using
struct gpio_chip, so we can approve a request of gpiod_get*().

The struct irq_chip is often orthogonal and I think it would usually
"just work", and a struct irq_chip unrelated to a struct gpio_chip
(i.e. there is no way to actually drive or listen to the lines) is
something completely separate from struct gpio_chip.

Yours,
Linus Walleij
