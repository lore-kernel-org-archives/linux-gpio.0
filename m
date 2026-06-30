Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA7003E316E
	for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2026 07:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782806031; cv=none; b=NygsavM+rr0g12Ad6OrnddeBpckCZch8h+h4bWnTotIx9FZ1PDIO4wrn3NmNHZhTKeWtF/UyzM2p3H4Sy6WOE1E+bSR7vbvs7ROPdgUeuMi6JWd5Uy2fXzegeMTU39234cKSjP8i669RsqSW4w7CD4pWE5FgYRU8E4nJwlWLPds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782806031; c=relaxed/simple;
	bh=DKWuHMD8ADL0zKU3qzM6I+0+Ls324mTKAtUCV8uTQCo=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aXNhXFoE+HlscYc04hS83v4duW7qsNpTS7pL+2GEqE28VP1RrslnNnjCmSpYEZiMIOsvO2UAFXtpUQzHFN+xDXAmelsTHRrkNb7GRUkTVNcfJ2b3/khASJz7C9msyscLRxYVUDp2VOsDY6B5ubM0FKzVXoV8YPqIB5jQHkFtzfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SzEeikn2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SzEeikn2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 806651F0155A
	for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2026 07:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782806030;
	bh=QLk1TuOjiNPuCpTV4xCdDTaOjHQTK3QruyZKcZY7x1Q=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=SzEeikn298ntM12mqrr6eeAuWBznUx8HGeKI8OO6J1rAXqZe+DG8eH3kpdxS2Qwc/
	 BEgTe/7fHp8h71X6sCGG3fIihS5C6QKcHYkMaNYrgPUk3rcaSPmJDnw8ZoM5yrlTQE
	 KvW3inqTRly1yX4cupxJ6KIIy4QWzwTYakuwLMqpuMM/p2OaqREIyxEYDMqln50mnE
	 C1NSCn+lHyKd79yClTWWWIpGeXloq0qHFR7J5NJc/x4YvTZ2+1E8CMWE8qqPT9V+G8
	 G9xFlM4DvUB/S9Qvyumv8uzp49Hn1jyEjfrRcGIK8Lu7u5c1SmS6vDV9TdRuWHIBZh
	 32YpQJymIWJ5Q==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-39b237fb695so1761061fa.2
        for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2026 00:53:50 -0700 (PDT)
X-Gm-Message-State: AOJu0YxQ7f+F7iMCIJAxWwCf/5okBHMYKkyip6a0JCY+Hrf0gZYBC8zE
	/zkw+p1wcEr5YL46kIYpuYy2l45M+O2ZFb/j3gUvtQDqNF2iuMUDM3S/TLE4BHBOKG3wHRTob3x
	3m0kpAu0fE5pIdybkvHGKWFIDlajdITZiT5UTYtIF5w==
X-Received: by 2002:a05:651c:2203:b0:39b:d0:e992 with SMTP id
 38308e7fff4ca-39b1da26188mr5158341fa.4.1782806029201; Tue, 30 Jun 2026
 00:53:49 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 30 Jun 2026 00:53:46 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 30 Jun 2026 00:53:46 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260629132633.1300009-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260629132633.1300009-1-arnd@kernel.org>
Date: Tue, 30 Jun 2026 00:53:46 -0700
X-Gmail-Original-Message-ID: <CAMRc=McnpZK+XeMcVfrBeh8SWa44UsVSJD0GJ1pXYhiFqzdpaQ@mail.gmail.com>
X-Gm-Features: AVVi8CcPrvp2PMd39-Ep5NDuNXP5lZT9A5toOBbKSjeAVmB0_7rIggX2JLATmJ0
Message-ID: <CAMRc=McnpZK+XeMcVfrBeh8SWa44UsVSJD0GJ1pXYhiFqzdpaQ@mail.gmail.com>
Subject: Re: [PATCH 00/13] treewide: replace linux/gpio.h
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-gpio@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, 
	Bartosz Golaszewski <brgl@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	Gregory Clement <gregory.clement@bootlin.com>, Frank Li <Frank.Li@nxp.com>, 
	Robert Jarzmik <robert.jarzmik@free.fr>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Greg Ungerer <gerg@linux-m68k.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Hauke Mehrtens <hauke@hauke-m.de>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Linus Walleij <linusw@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Dominik Brodowski <linux@dominikbrodowski.net>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, patches@opensource.cirrus.com, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-sh@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-media@vger.kernel.org, netdev@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, linux-phy@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 29 Jun 2026 15:26:20 +0200, Arnd Bergmann <arnd@kernel.org> said:
> From: Arnd Bergmann <arnd@arndb.de>
>
> The linux/gpio.h header used to be the global definition for the gpio
> interfaces, with 1100 users back in linux-3.17. In linux-7.2, only about
> 130 of those remain, so this series cleans out the rest.
>
> In each subsystem, we can replace the header either with
> linux/gpio/consumer.h for users of the modern gpio descriptor interface,
> or linux/gpio/legacy.h for the few remaining users of the old number
> based interface.
>
> All patches in this series can get applied independently, so my
> preference would be for each subsystem maintainer to apply these
> directly, with the rest going into the gpio tree at some point.
>
> The final patch here obviously needs to wait for all the others
> to get merged first.
>
>       Arnd

Thanks for doing this Arnd!

For the series:

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
