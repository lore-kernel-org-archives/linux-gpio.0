Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D59EF198A17
	for <linux-gpio@vger.kernel.org>; Tue,  5 May 2026 09:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777974122; cv=none; b=Kz/tb0Q/AWXWd4gcXWZ2yOgbTPvu7fY3G6Huy6B79oU7MK2Uah55u4zfRUFlLXnkuLRLhrUcS31jJvFZlHtmWaWuy5Dt8buETw7YVbWzTV5OPu92mB+dsRtAcJ9Y8wnuo6Q4R0jX/VZFzQQCQwaDdOSrOL0eWeN4aEQC1mGOB54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777974122; c=relaxed/simple;
	bh=htbgPZC9ymCWJNSb4moZS6fBxn+yEaeysJRk974cLlM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dd/YyVBtvbDPVp+C1/I1SqOL8yvKV6rhQf7VYAxwczHSbQvcBSfG3ULvXVYXfK21oiv5Fp38lvk2HeY3JS9zjDRGnofnogG2oFFFqnmZqGWD09ovJ5h+BQjyYd1HVIBiCHprDcVaVEhwVwFaRH4sfVFiBlftgn4H8X8P4V4bQq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gp69CTzv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gp69CTzv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC10DC2BCFA
	for <linux-gpio@vger.kernel.org>; Tue,  5 May 2026 09:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777974122;
	bh=htbgPZC9ymCWJNSb4moZS6fBxn+yEaeysJRk974cLlM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=gp69CTzvSGVDULwoIjTSu8T1pJxIDEq3cmp5TJc7j7WCBxEnpAs5cmy4RCy6FFwxs
	 tAf3ExXWBFItL7T46NpNWYPH9mP4G3X2hCMQ1rzrKsiizadMUyBwsN3sq083Rev3qH
	 SFRpsGqpaD0OJ2EBkwizkl6pzoK05EQDnyxuaPeeSgodcpP4i0J96IHB9xEqGOyGpS
	 X++Fl40KHyljD3fZhj8cPftLIPADnch5j9tZ1GCEAUFzp/tVFR7nbBXSRX5gd5Yhlo
	 Ylp0fFefS9NZgp+A+yVoip70L4eMOiuT+GOJdYOv5DweFH4TVQ1Jfn/IrJdJbxMCq0
	 PmQoQRWzReXAw==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5a3d42263e4so5816176e87.2
        for <linux-gpio@vger.kernel.org>; Tue, 05 May 2026 02:42:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9SDFqSPL0jZr89cPBc+ZPTkIxt0Aym6QSIKeZhABJfMxWPtHPzpMQywsy1WryW/Li7YXZKpxLsNtq/@vger.kernel.org
X-Gm-Message-State: AOJu0YzTFe/proIDCSrMePsmUOCMelqoTWjUELPrLnOWmgNrNDTmSmuF
	13u8MqW1UwoAraCPNf8EU4ukQqQ9CwBPHf5WwRdon6PnjwEQO2xyN1DVgWgIc7OAOh4Exj/ERlp
	bvo/iX8RvSWTp2cU0MMg4xhxUUmUx9xA=
X-Received: by 2002:a05:6512:33c3:b0:5a4:7ed:3e41 with SMTP id
 2adb3069b0e04-5a8631c3615mr4751078e87.32.1777974121308; Tue, 05 May 2026
 02:42:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260428155651.3252500-1-arnd@kernel.org>
In-Reply-To: <20260428155651.3252500-1-arnd@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 5 May 2026 11:41:50 +0200
X-Gmail-Original-Message-ID: <CAD++jLmJsVfsRw6Agz7gMQRKNbYCWdNMZOuQTNSnikNu=fjDPw@mail.gmail.com>
X-Gm-Features: AVHnY4IxmeRQjrEdh0ii-61C44IEEfNFOCwvkjBQyfILS_vPvLv7Rafs66Fz9ws
Message-ID: <CAD++jLmJsVfsRw6Agz7gMQRKNbYCWdNMZOuQTNSnikNu=fjDPw@mail.gmail.com>
Subject: Re: [PATCH] mips: select legacy gpiolib interfaces where used
To: Arnd Bergmann <arnd@kernel.org>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Bartosz Golaszewski <brgl@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Thomas Gleixner <tglx@kernel.org>, linux-mips@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 28, 2026 at 5:56=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wro=
te:

> From: Arnd Bergmann <arnd@arndb.de>
>
> A few old machines have not been converted away from the old-style
> gpiolib interfaces. Make these select the new CONFIG_GPIOLIB_LEGACY
> symbol so the code still works where it is needed but can be left
> out otherwise.
>
> This is the list of all gpio_request() calls in mips:
>
>   arch/mips/alchemy/devboards/db1000.c:           gpio_request(19, "sd0_c=
d");
>   arch/mips/alchemy/devboards/db1000.c:           gpio_request(20, "sd1_c=
d");
>   arch/mips/alchemy/devboards/db1200.c:   gpio_request(215, "otg-vbus");
>   arch/mips/bcm47xx/workarounds.c:        err =3D gpio_request_one(usb_po=
wer, GPIOF_OUT_INIT_HIGH, "usb_power");
>   arch/mips/bcm63xx/boards/board_bcm963xx.c:              gpio_request_on=
e(board.ephy_reset_gpio,
>   arch/mips/txx9/rbtx4927/setup.c:        gpio_request(15, "sio-dtr");
>
> Most of these should be easy enough to change to modern gpio descriptors
> or remove if they are no longer in use.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
