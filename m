Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0ED6382368
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 08:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773651476; cv=none; b=XZJzfjlDZwGUCImxWs8sFoHmXED1Qp0lIAGS1X4F8uLvvBIoGklSzVAfP7jXSy49c/tyeKy/xstAWYLlkI9Dra9LSgEJQ/TRVdiodFub0qbQxttPZQ1/BY/QtUaSGL8uUtuPllr437j+Bc+ZjzwTWx3SeYtqhRAkOzlWgOWhUzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773651476; c=relaxed/simple;
	bh=25fOIUrIoXmeuY0trituB/t7MXs2xjvvs4qtHYmm8Q8=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eoFISDIZfPc1ThvCi9Q84sBuacxSibZei2XK41WLVbsXsH+I4qUGXIxFfE54ljHPoNgeJEk4w4SpMnGR1w9zaEWePCvzruWhVUGWfnnqkil4R0Urqk/TW4Smwl1PteVs2sabTBkbiHM0eH8ST/SfjfUItkZYyKn4IFvt5EeoBxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CZRZ5aK9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CZRZ5aK9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DC3FC2BCB1
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 08:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773651476;
	bh=25fOIUrIoXmeuY0trituB/t7MXs2xjvvs4qtHYmm8Q8=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=CZRZ5aK9O8Euws0I71JOtlw9V5QdUQ/KSKx2woDuPfSUn0hrYRZCgs2KifbOAHUKD
	 ZOB4MStNStwseL0wzJMm6JeC1i2/09lyvqpgOM4vlUhZL8VMym4FlDLzcxr6EkHbmk
	 mNZw20j768Yb+NaNkpfaZWHLp4UjAL5aaesSCiOkO7jJZwfi/Oq82mJ/ww2Ze+pBqX
	 NApiKf+JjPCSDxxLtASL2zua6AAc9mMBcHcHzGjy6l6KE5jyD23/igVz5AmvGtTaMd
	 T3ceFnlvdxi4dvIjnLiSUMg2TDcepGoDC/hIvMnt0JmHlQkHBtHMpBQ6TTSQSTzgVL
	 5k55L/OBzBtwA==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-59e4a04f059so4450617e87.2
        for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 01:57:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVwu+irlnU6PQ4WanNe6M9lAIt5UWKvSa/kspYMHmpdYbclFRGjPHKznq9ZTck1wL65rrjlQcqfNs4E@vger.kernel.org
X-Gm-Message-State: AOJu0YykAgxWLhluRtzEY7qYHUqgZc43UR2+yVGmSl7uZIJQg51DPX49
	W2AL0pIA4SYD6lSG/FCqgsKli5PSASOWqnOkEz2Fc0jVRnzauMPGCovgE8iCU4qfmveyy+CCoaA
	iIfFf/xQUmBBQBFxARSIKL4aSGBNfmYia6WoAmPwKSQ==
X-Received: by 2002:a05:6512:3b8d:b0:5a1:ea0:afa8 with SMTP id
 2adb3069b0e04-5a162b193a7mr4253516e87.40.1773651474988; Mon, 16 Mar 2026
 01:57:54 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 16 Mar 2026 04:57:53 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 16 Mar 2026 04:57:53 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260315014205.471d6834@ryzen.lan>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260313000652.11470-1-andre.przywara@arm.com>
 <a4cfb10e4701da0649ef648136496a962be5870d.camel@icenowy.me> <20260315014205.471d6834@ryzen.lan>
Date: Mon, 16 Mar 2026 04:57:53 -0400
X-Gmail-Original-Message-ID: <CAMRc=MeorQJvA8TBosjnDU+x-FD6GhkbXwXOjCD0nmCs16ERfQ@mail.gmail.com>
X-Gm-Features: AaiRm51skQCXiAFRV40QqU-S5mBuX2dP16oar2NgBwKuTW_Y3PVl-jEHJ0Tjq4I
Message-ID: <CAMRc=MeorQJvA8TBosjnDU+x-FD6GhkbXwXOjCD0nmCs16ERfQ@mail.gmail.com>
Subject: Re: [RFC PATCH] pinctrl: sunxi: convert to GPIO_GENERIC
To: Andre Przywara <andre.przywara@arm.com>
Cc: Linus Walleij <linusw@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Icenowy Zheng <uwu@icenowy.me>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 15 Mar 2026 01:42:05 +0100, Andre Przywara
<andre.przywara@arm.com> said:
> On Sat, 14 Mar 2026 13:14:25 +0800
> Icenowy Zheng <uwu@icenowy.me> wrote:
>
>> =E5=9C=A8 2026-03-13=E4=BA=94=E7=9A=84 01:06 +0100=EF=BC=8CAndre Przywar=
a=E5=86=99=E9=81=93=EF=BC=9A
>> > Allwinner SoCs combine pinmuxing and GPIO control in one device/MMIO
>> > register frame. So far we were instantiating one GPIO chip per
>> > pinctrl
>> > device, which covers multiple banks of up to 32 GPIO pins per bank.
>> > The
>> > GPIO numbers were set to match the absolute pin numbers, even across
>> > the
>> > typically two instances of the pinctrl device.
>> >
>> > Convert the GPIO part of the sunxi pinctrl over to use the
>> > gpio_generic
>> > framework. This alone allows to remove some sunxi specific code,
>> > which
>> > is replaced with the existing generic code. This will become even
>> > more
>> > useful with the upcoming A733 support, which adds set and clear
>> > registers for the output.
>> > As a side effect this also changes the GPIO device and number
>> > allocation: Each bank is now represented by its own gpio_chip, with
>> > only
>> > as many pins as there are actually implemented. The numbering is left
>> > up
>>
>> Ah, is this a userspace API break?
>
> Was that ever a guaranteed user space API? Or just something
> that everyone relied on because it was always the same (until it
> wasn't)? Similar to /dev/mmcblk0 being the SD card?
> And ignoring the ill-fated old-style sysfs interface for now, how does
> this work with libgpiod? Would it still use the absolute pin numbers?
>
> I mean looking at that warning about the forced GPIO numbering we
> get, using base =3D -1 seems to be the recommended way?
>

My view is this: for libgpiod, there are no absolute GPIO numbers and the
ordering of GPIO chip character devices is not guaranteed.

For sysfs: userspace may rightfully expect the global numbering to stay the
same. I don't like it but this is the kernel policy.

Here however, there's another thing: the fact that a single GPIO chips is n=
ow
split into several. I don't mind it but if someone complains, it would have
to be reverted.

Bartosz
