Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F290234D93B
	for <linux-gpio@vger.kernel.org>; Thu, 26 Mar 2026 08:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774514412; cv=none; b=oiwLaUC5wyr+TFrHWyMsNaVYJVaN6ZGUj9FzkKj7RZFb7ioQyPUCVcJcBLy5BPEkwOB+a3ww5L7ef5aemXkhYmg7VIDDy4Fk3MNO9MxtjIqiQgYOYpp6dMS232ZHFqtBfuvUdsMDKNuvofk1Kobhknh5EqLctyoB0GkTFPdzjB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774514412; c=relaxed/simple;
	bh=QfOa7OzRwwd4XlZR0+3Hhy9wDi0PAtKq+HHQAKzIr2Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cyZDXk3PZrc9LUMMXdgGQtVq5uCTKYAqooVlDU1wrSk2N11srSCnr3SP2YtSYvwqbKoSSw4c57vg6mq7BvzQ7oBy9a+IDyUHF07UfDmX8hg36Y4sDbskwk5oIcsMl/0M+Q3DWTwMlfEh3yHU/jmwBH+PbUz7RMbBeW8ZBTswTUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ftVRdaDO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ftVRdaDO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B82F1C4AF09
	for <linux-gpio@vger.kernel.org>; Thu, 26 Mar 2026 08:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774514411;
	bh=QfOa7OzRwwd4XlZR0+3Hhy9wDi0PAtKq+HHQAKzIr2Q=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ftVRdaDOnFGANoIrp9OBhja30/JqJdcf3WqhVM2IUvVXw1JgNZtfzpu2r9NuVwChu
	 joOjJsjzXJUWLt+dRFKmTpkTngVjS8DFiBoJ1ku8K6YdkYhh15H9U+Yj2GDrKUaEPa
	 Sw9pzt32LwMPHlNSpKHdfyI5x+h/+fpuWZY3hm3mQQQsUMdJKtH/Wy3RPLx5CSksGw
	 zJVQOUPBX2D/joxJX1uJJ01gj+2Q/gRrNklw3vit3m6/D4jR/LSLPCV+ciIuMS1O0K
	 0Tqg46eygQg5MxDMp9zjKRDyxww15tORBncfdovtYuhN55HeyXHK/qz7TQnyMLjRty
	 I2Wy4KJzpWdCg==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5a1307438ddso827954e87.1
        for <linux-gpio@vger.kernel.org>; Thu, 26 Mar 2026 01:40:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUf5x/uTS3Q+kE38OUh1xMcBsS1QYTQvioaprmEB71QUL1zRQt5IZyadHyzZQ9XstNyI9Pajz8AAd8G@vger.kernel.org
X-Gm-Message-State: AOJu0Yza8xFNZkouGkXMvfpW1aYVAtY04p4rMSDZmN/Tj9Fx7aJ4R1KA
	30fhhrug0pE//v4kCsBXB+ikk57QW0DjHHdRHfX2zWIHTSs/C5iF6wfnsGWjkWF8bZjnMnjD6Xy
	h2atW7CVla817DCnQTk/748rcPgvsQmPDp2XUXN9DZA==
X-Received: by 2002:a05:6512:a8f:b0:5a1:3da4:e92f with SMTP id
 2adb3069b0e04-5a29b9ab6d8mr2497661e87.43.1774514410393; Thu, 26 Mar 2026
 01:40:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260325100144.1696731-1-arnd@kernel.org> <CAMRc=Mdwu85gghDjQEu4eP2HZxHjBFpph07q9SOfAifSDMtpVw@mail.gmail.com>
 <1789ce66-5a18-4b54-bbad-3b2049f2c26d@app.fastmail.com>
In-Reply-To: <1789ce66-5a18-4b54-bbad-3b2049f2c26d@app.fastmail.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Thu, 26 Mar 2026 09:39:57 +0100
X-Gmail-Original-Message-ID: <CAMRc=MfwR9POm3OvuJTRcg8sO1y=LRdBMrbVLQ=eZD177r49qw@mail.gmail.com>
X-Gm-Features: AQROBzDadLtwyr2raaFqkwGzyCOh9M5RUz_Gm02mFq1aGi1CGm9iwle9RVHpGLA
Message-ID: <CAMRc=MfwR9POm3OvuJTRcg8sO1y=LRdBMrbVLQ=eZD177r49qw@mail.gmail.com>
Subject: Re: [PATCH] gpio: fix up CONFIG_OF dependencies
To: Arnd Bergmann <arnd@arndb.de>
Cc: Arnd Bergmann <arnd@kernel.org>, Yixun Lan <dlan@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Linus Walleij <linusw@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 25, 2026 at 11:41=E2=80=AFAM Arnd Bergmann <arnd@arndb.de> wrot=
e:
>
> On Wed, Mar 25, 2026, at 11:32, Bartosz Golaszewski wrote:
> > On Wed, 25 Mar 2026 11:01:14 +0100, Arnd Bergmann <arnd@kernel.org> sai=
d:
> >>
> >> WARNING: unmet direct dependencies detected for GPIO_SYSCON
> >>   Depends on [n]: GPIOLIB [=3Dy] && HAS_IOMEM [=3Dy] && MFD_SYSCON [=
=3Dy] && OF [=3Dn]
> >>   Selected by [y]:
> >>   - GPIO_SAMA5D2_PIOBU [=3Dy] && GPIOLIB [=3Dy] && HAS_IOMEM [=3Dy] &&=
 MFD_SYSCON [=3Dy] && (ARCH_AT91 || COMPILE_TEST [=3Dy])
> >>
> >
> > Thanks and sorry for the breakage. However, I'm wondering if it wouldn'=
t make
> > sense to do the following:
> >
> >
> > -#if defined(CONFIG_OF_GPIO)
> >       /*
> >        * If CONFIG_OF_GPIO is enabled, then all GPIO controllers descri=
bed in
> >        * the device tree automatically may have an OF translation
> ...
> > Symbols from linux/of.h are stubbed out and these drivers can build jus=
t fine
> > with !CONFIG_OF. This would naturally increase the build coverage.
>
> I don't think we need to worry about the build coverage here, CONFIG_OF
> is still included in x86 allmodconfig and half the randconfig builds,
> so the drivers get enough exposure either way.
>
> On the other hand, dropping the build time check may help avoid
> future Kconfig dependency issues, so that still sounds like a
> reasonable suggestion. At least CONFIG_GPIO_SAMA5D2_PIOBU
> is going to need the 'depends on OF' regardless though to work
> around the other build error I cited above.
>
>      Arnd

Fair enough, I'll queue this patch.

Bart
