Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE73935C183
	for <linux-gpio@vger.kernel.org>; Mon, 23 Feb 2026 10:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771842352; cv=none; b=G93s7hYUsqbPJb4WD4KYMuuNk7BbBuC5CoBKaa4lZvs6ELHS1wKjVPnfG3Tp13/Q5QbCrPpwOnIlqq6e0fC+0iDZmr4vjhhPD6qruqbB8WUETKGO92Z/m3T/xyqD1BYkCwAkDi7BPk4ga485rzpUb+enu0igGVEgCyDsuSECggk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771842352; c=relaxed/simple;
	bh=WvKjjDt11mfP3TCN9/c30KzME2fLxT6QYWf6QQlcsEU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mM8ASqeGVEZczdw39XNhtzYIxfuLj73NersoGfNKEOaqDaBzluUA9wZ65UOts2OJ8Frvvf26BwljKqp+18r2lJ4pvmoHSsxHRJFWjBrrZzPsmIXbFn/JBzWSd2lfckSOYWLGNSJdDJfOva50PVu5lWfvUixafpSTCNsWFDCBy+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RZrdzrMB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RZrdzrMB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DE03C2BCB4
	for <linux-gpio@vger.kernel.org>; Mon, 23 Feb 2026 10:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771842352;
	bh=WvKjjDt11mfP3TCN9/c30KzME2fLxT6QYWf6QQlcsEU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=RZrdzrMBOhr3R2Yy5aY1ky/SrDtic0JBnj/ltzb0nFARyo2i2/1ded2OfKcmPVLw5
	 0SHMc7soMJIGsY2m/2G4IBR2ceRyj6GM2w+erYDqgRHpGq7LL5LlHP919SaBtHe7cW
	 8L89SDOfiliVmHT9tzvkKHm6HgIQfs+jO03uLBV0tOVsOfJlbp5ZI2TWhvVyUqbkzG
	 cboTT6ESE/9YqHUgARbjBBBiC197Le+ZeYGttrEDJ0UKnP3AN1XRWQeSGbm7uSX3UN
	 9Ik0vMReS5Bf9iGzaPtv0W6eMpbUmVV9jvdEjCzkR4C4/nZxlz21uCXclVqWS9hUpn
	 7AfYtr0Cuhdig==
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-64c31ca77b4so3581353d50.2
        for <linux-gpio@vger.kernel.org>; Mon, 23 Feb 2026 02:25:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVt5cxyJfqDUPxRkno7Tm1GZr2fGXEwKQF6XJYGOpso2z4HvYsh93CeVtgt5LjZOwm/rZ+C0QQwJT8T@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7XbpUA5W4OdO8yQX8Of3M3sp1xvMMSuO9OG+eJypSTD5hBiQo
	Q2zM5kjiQjuaw1ZSivYf82HyaXD4/aMFkMQ9QGTp6ecPjlCS/bztHZXaQaZPbXL8kIKvmeMr07x
	SRHJVGYqstxOupGBCBQsk7XCzoeB0tv0=
X-Received: by 2002:a53:5a10:0:b0:646:7c25:5f86 with SMTP id
 956f58d0204a3-64c789d438bmr5835753d50.27.1771842351841; Mon, 23 Feb 2026
 02:25:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260211033249.2770281-1-james.hilliard1@gmail.com> <c78bd0c3-6889-46f8-8b5a-e3490ce7b9c5@arm.com>
In-Reply-To: <c78bd0c3-6889-46f8-8b5a-e3490ce7b9c5@arm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 23 Feb 2026 11:25:41 +0100
X-Gmail-Original-Message-ID: <CAD++jLmPN2ET6osyKw10aCNNLkjOm-fY9nAa4j-1DnSJiLw1FQ@mail.gmail.com>
X-Gm-Features: AaiRm53AE_h4ho1A7D5Kwiz-Y8WMceSw39JTy0fcYJsANc6fRKkBxrYq1NwI-94
Message-ID: <CAD++jLmPN2ET6osyKw10aCNNLkjOm-fY9nAa4j-1DnSJiLw1FQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] pinctrl: sunxi: add GPIO get_direction callback
To: Andre Przywara <andre.przywara@arm.com>
Cc: James Hilliard <james.hilliard1@gmail.com>, linux-sunxi@lists.linux.dev, 
	linux-gpio@vger.kernel.org, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 11, 2026 at 10:08=E2=80=AFAM Andre Przywara <andre.przywara@arm=
.com> wrote:

> thanks for taking care and sending a patch! I am still scratching my
> head what this warning is about exactly and why we only see this now? I
> never saw this, so what caused that? libgpiod accesses from userland?

I don't understand that either.

> Regardless, can we hold back this patch, please? As part of the A733
> pinctrl support (and as LinusW asked kindly about that) I was reworking
> our driver to use the generic gpio interface, and I have a feeling this
> would solve this problem automatically?
> The actual pinctrl conversion is done, I just need to plug in the IRQ
> support. I ideally would have something in the next days to post, would
> that be worth waiting for?

We are early in the v7.1 development cycle, so we certainly have
time for this to materialize and figure out how to consolidate all
of the new development.

Yours,
Linus Walleij
