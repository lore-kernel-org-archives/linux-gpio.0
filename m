Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A82A3E8660
	for <linux-gpio@vger.kernel.org>; Wed, 16 Sep 2026 13:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789563830; cv=none; b=VBtzAAkT9vM1kPYZPbcFDS+UURk+kDVG9FS5S+wH23DycvdHxStqNslkm0/HKRGaqqTBXDNBTd0D/OcyZ3djSK5nMOqzRVT/rL5PCmdVRh3slI6W7wnYuNgrED8ZAShljbRTS8rJ9HjUA/GthpoP5vLkfIAcVJUBUvqGMOlHTOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789563830; c=relaxed/simple;
	bh=BZbIjq6ROZeCQvERX+hKLczZEFVF/IFyJaooMFQjbS4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R1AR2tJIoKhbaqzy+JK3qdpr9XYhm2q1jMszFRJ8GUCH9dv3my0LnZuXArpaj41pepC/Xw7l6rtVsRDxs3VS/zRQuayhwFf1N0qUR1uupaJuOgtmyOnVRX/+jsJ3IpTJWsZZEpP6wEpPju8vrId/hi++WD66EmbZiTysmiBPMUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gyyl+QN9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gyyl+QN9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 598BB1F0089A
	for <linux-gpio@vger.kernel.org>; Wed, 16 Sep 2026 13:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789563828;
	bh=6Nc4BFEr66wGb844OtDVd4J6JLebUU3kF1noqOdkEW0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=gyyl+QN9PzJF1my9LQVw8d2WfrvSWPXamHu+ZktlD+Y3R0cQaxwjZ/gXlKRvbXuF/
	 6KVjhhTYSLRLqfiN/eEeTrcklJGel6/jGNcNxYVPmJnjTvd9eGyMxECylpb+FYkYGP
	 HVcQH14+YAeItdWmnPQmVU56cq/M4BuA+UAvNa1roiiExFfImVtCdO5Ro2wSiZbGMR
	 6eVJScIfuBVs6koiHPn+WkpNZXTbTltPaAKsyidg1JxtUcKWDjVLKmbrxdQFaNQ+wA
	 CDj9k3eQgSgmzzmGqpg3YpQMPdJ6m9MAdT11mGACCDaYRmNUqVTTk3QA0fSYDa/zgT
	 rSHtrH6qunAVA==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f15cfdso923713e87.3
        for <linux-gpio@vger.kernel.org>; Wed, 16 Sep 2026 06:03:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByAJ2/JJnxw4EhcFnWs+1TaDMWXmT6Gj8Ae1cwdT3IaGYK70aKIJKkrsNOiKRtYez/Pu37wAsxrlrhB@vger.kernel.org
X-Gm-Message-State: AFuF++nyIyy66Kk4xFuOWt6dtckN65XcfIHDFKdio1XeTpePT+sSArPF
	PIbIwWeBVi/4oPlMjmEKkhS3JXUmmdKFaAQSBmZXmwfqBuCgWvDYFN4awGunzi/dvVIJb3qI8UK
	4O+ULrIJlU1tJUmLU3mc51OA7wa4HnAU=
X-Received: by 2002:a05:6512:3b9e:b0:5b6:4ae:d88 with SMTP id
 2adb3069b0e04-5b8b66216e9mr779741e87.28.1789563827041; Wed, 16 Sep 2026
 06:03:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260812120114.32501-1-ilya.titov@wirenboard.com> <20260903091718.44042-1-ilya.titov@wirenboard.com>
In-Reply-To: <20260903091718.44042-1-ilya.titov@wirenboard.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 16 Sep 2026 15:03:34 +0200
X-Gmail-Original-Message-ID: <CAD++jLnvxYjRfdOrq4qmk1vX22csqMQ23R0_7VQYWZ2PBHx6_g@mail.gmail.com>
X-Gm-Features: AcwNN1XR9Yw-9dJs1sd5aeqfLOxRm-MFuv6MWfY9YiXG6ju_z14jNe5YgEWO-8M
Message-ID: <CAD++jLnvxYjRfdOrq4qmk1vX22csqMQ23R0_7VQYWZ2PBHx6_g@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: sunxi: keep a shadow copy of the data
 register output latches
To: Ilya Titov <ilya.titov@wirenboard.com>
Cc: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, =?UTF-8?Q?Emilio_L=C3=B3pez?= <emilio@elopez.com.ar>, 
	linux-gpio@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 3, 2026 at 11:17=E2=80=AFAM Ilya Titov <ilya.titov@wirenboard.c=
om> wrote:

> On Allwinner SoCs, reading a bank's data register returns the pin level,
> not the output latch, for pins that are muxed as inputs.  Writing a GPIO
> therefore corrupts the output latches of all input-muxed pins in the
> same bank: the read-modify-write in sunxi_pinctrl_gpio_set() reads back
> their pin levels and writes those into their latches.
>
> This breaks emulated open-drain lines (e.g. a bit-banged I2C bus from
> i2c-gpio).  Such a line is released high by muxing it as input and
> letting the pull-up raise it, so any concurrent GPIO write in the same
> bank stores 1 into its latch.  Driving the line low afterwards is a
> non-atomic data-then-mux sequence in sunxi_pinctrl_gpio_direction_output(=
);
> if the poisoning write lands between the two steps, the pin actively
> drives high (push-pull) instead of low.
>
> Observed in practice as sporadic glitches on a T507 board bit-banging
> I2C on port E while other PE GPIOs are toggled.  On a scope the failure
> is unmistakable: on a clock pulse where SCL should fall to GND, the line
> instead steps *above* its idle high level for the whole low phase =E2=80=
=94 the
> pad drives a strong push-pull 3.3 V high, higher than the level the
> pull-up sustains on the loaded bus =E2=80=94 before the next transition r=
ecovers
> it.  The same can hit SDA, corrupting data instead of clocks.
>
> Steps to reproduce on any sunxi board with a bit-banged (i2c-gpio) bus:
>
>   # background: toggle any other GPIO of the same bank, e.g. line 21
>   gpioset -c <chip> --toggle 100us 21=3D0 &
>
>   # foreground: keep the bit-banged bus busy
>   while :; do i2cdetect -y <bus> 0x50 0x57; done
>
>   # watch SCL/SDA with a scope or logic analyzer: sporadic clock-low
>   # phases driven high (above the pull-up level) instead of low
>
> The bank spinlock cannot help: the racing write is a perfectly valid
> whole-register RMW that faithfully writes back what the hardware
> returned.  There are no set/clear registers on this IP to write a single
> bit atomically.
>
> Fix it the same way gpio-mmio handles hardware whose data register read
> does not return the output latch: keep a shadow copy of each bank's
> latches, base the read-modify-write on the shadow, and only write the
> register.  The shadow is seeded from the hardware at probe time so pins
> left in output mode by the bootloader keep their state.  Pins that reach
> output mode through the gpiolib paths write their value (and thereby
> their shadow bit) before the mux switch in
> sunxi_pinctrl_gpio_direction_output(); pins muxed to gpio_out directly
> through a pinmux node bypass that path, so sunxi_pmx_set() refreshes
> their shadow bit from the latch (readable once the pin is in output
> mode) to keep them driving their pre-existing level.
>
> Seeding the shadow reads the PIO registers at probe time, which requires
> the bus clock to be enabled.  The clock was only requested at the very
> end of probe, after devm_pinctrl_register() had already claimed the pin
> hogs described in the device tree - which mux pins, and thus access
> registers, with the clock still gated.  Move the request ahead of both.
> Boards whose bootloader leaves the PIO clock running are unaffected,
> which is why the pre-existing hog problem has gone unnoticed since
> commit 950707c0eb5c ("pinctrl: sunxi: add clock support").
>
> Fixes: df7b34f4c3d2 ("pinctrl: sunxi: Fix gpio_set behaviour")
> Cc: stable@vger.kernel.org
> Signed-off-by: Ilya Titov <ilya.titov@wirenboard.com>

Patch applied for fixes.

Yours,
Linus Walleij
