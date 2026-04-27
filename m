Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A6393B4EB4
	for <linux-gpio@vger.kernel.org>; Mon, 27 Apr 2026 11:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777287674; cv=none; b=Bqua7VtalQh8ZucnX+YVBidmntA4tgZQEXJtyO/yCdZFBaoxuanI58P9wGAOO9wtdSzY74M6fELpnYKj6gy6H34E1y43INFM0/6u48FLEB6q/mLgZ+8UzP4HCLdN9S6KiWdJTScaMQdgNBf4/n4+zezKGflYoHPDF3aVDF8UMic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777287674; c=relaxed/simple;
	bh=deXaYFm09T8W8zpiUVroL2c82PFP/2T0UpkTLLVytow=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TrbMN/mVvJiQ4tujrVpdi2QE06Md1LGvRQeDh3+yR0QkHiT4LvcQquEfGmyV92S3e+TPQvvtLlqgJ8U+/N8SdyYD0XnRVAoYx2ioTErKE7vIFKSLfTcAui8JM+HMcRXqJmCbM4DAgm+9FEnTcskPjK2p8QhEcjdEQEaR7GDbTvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LiVadnrO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LiVadnrO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 359B2C19425
	for <linux-gpio@vger.kernel.org>; Mon, 27 Apr 2026 11:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777287674;
	bh=deXaYFm09T8W8zpiUVroL2c82PFP/2T0UpkTLLVytow=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=LiVadnrOLnO9RpqCE7CJgRI0STWGv8IiIxd2o6n4iNf3TNYLNMA59pCycDejiJ1Yd
	 89oTFww2JObZvQQAgfyd1VIiLXmqh6GylIRICW4t1fCxMcbgdCs5OefAdgwszrT2va
	 TOwrSnO32vDIMwp7WFvGxLejs4/Rf2PiEcF+06cSv30OTRj2PhOnSWQDYKF8ozaidK
	 hR777XZGOikjafdlzsTiivzPtvotLhzD/1ZOblQGKpFasPM0xoeO3wdM+WgirZKLEb
	 mZbPZWA6IiiXHgqkn9aLQp6U/hsJscaRd1Af4IO8dEjsMNc8mZuQjKjLq57LXlAKAu
	 qLHtSDKVqSylA==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3878de20527so76071041fa.3
        for <linux-gpio@vger.kernel.org>; Mon, 27 Apr 2026 04:01:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9RTdNBlUaNyuIAW3DCSwnWvpWsthiVIuW6Dey4W6ONs+xoP46OGiNW8FACqQ8tWPQwWh73ZT6uxGFi@vger.kernel.org
X-Gm-Message-State: AOJu0YzZW4tBHtzaQTQgUvWVrCiD4Uf2N/g41uGi3JZmFIqLzVLxNK6x
	OGEnj04MKmm5bgi03SLZwFEUEYf/IC47XIpLgo7JJKIMWBQj5zHavYXcNB0mr8bERKKgZJ+Xdze
	TBrvOlEYz/msUFbLB0goYBd6QW2rFvk+kjzKI/SZMWQ==
X-Received: by 2002:a2e:bea1:0:b0:38e:af87:8dee with SMTP id
 38308e7fff4ca-38ec7b4019amr125485421fa.22.1777287672128; Mon, 27 Apr 2026
 04:01:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260427-pxa-gpio-swnodes-v2-0-86fc24b9e714@oss.qualcomm.com> <da7ea88f-845f-49e3-852b-3ca352c1790d@app.fastmail.com>
In-Reply-To: <da7ea88f-845f-49e3-852b-3ca352c1790d@app.fastmail.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Mon, 27 Apr 2026 13:01:00 +0200
X-Gmail-Original-Message-ID: <CAMRc=Mf9M_eoPzsqBdmnXLd8Eqw_cPcnXWN9xjC-+x5ZA5Qb_Q@mail.gmail.com>
X-Gm-Features: AVHnY4JVN5ThS1AXNyXIFweQGeK9zT5ke6ojgo3woFXxSDQljm-duM54ZeA11gQ
Message-ID: <CAMRc=Mf9M_eoPzsqBdmnXLd8Eqw_cPcnXWN9xjC-+x5ZA5Qb_Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] ARM: pxa: attach software nodes to the GPIO controllers
To: Arnd Bergmann <arnd@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Daniel Mack <daniel@zonque.org>, 
	Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Russell King <linux@armlinux.org.uk>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Linus Walleij <linusw@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 27, 2026 at 12:50=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wr=
ote:
>
> On Mon, Apr 27, 2026, at 12:14, Bartosz Golaszewski wrote:
> > Convert GPIO controllers and their consumers on the PXA platform to usi=
ng
> > "attached" software nodes. Since everything happens in a bord-file, it'=
s
> > quite straightforward. We technically now have a way of passing an
> > unregistered software node to platform_device_register_full() but that
> > requires using struct platform_device_info and since the existing
> > platform devices are either referenced from other places or defined in =
a
> > different compilation unit, I wanted to reduce the impact of the change=
s
> > I can't test and went with the older method.
> >
> > Signed-off-by: Bartosz Golaszewski
> > <bartosz.golaszewski@oss.qualcomm.com>
> > ---
>
> Hi Bartosz,
>
> These patches are individually all fine, but I was hoping to
> finally get around to removing the pxa board files completely,
> sorry it's been taking me so long to rebase my series for
> that.
>

If that'll be queued for v7.2, then I'm fine with dropping this
series. Otherwise, I'd like to see it applied as I want to get all the
changes required to remove the software node name matching from
GPIOLIB into v7.2 and then finally remove it in v7.3.

> The only remaining board files I expect to have soon are for
> the omap1 and s3c machines, so if you are going through the
> board files to convert them to over, I would suggest focusing
> on those.
>

S3C does not seem to need any changes, I already sent out a series for omap=
1.

Bart
