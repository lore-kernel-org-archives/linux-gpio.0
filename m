Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDD2B3B19C4
	for <linux-gpio@vger.kernel.org>; Mon,  8 Jun 2026 22:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780958038; cv=none; b=Kkl4XcbPe5ZEkr6l2Eg1YlD4LwrNn+6Z5ZZs55+ZeBnquhxDGZfoHEFrdEx0KF9ipFLUnqdELO+guO7x3ft7nrnXYFYQttejp7buZjxcDIlv8nxJSsfuIP1bJy6WEtE5QQY8vTI3iwlJBV7JexWxgIlRgLCq+phsJpE8T0Or5lQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780958038; c=relaxed/simple;
	bh=/4PY/H59YoQ50ZoEtalWmFIRhOc6tOgOmFK2WHTrmE0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kwbwuEreikXwx/XZSH/M9gCNeoRg0HRJUy/P5NO3ZJ6MiU1JT3c+zgh5LxowBUitgDhOwczGh6VHlItkk0J6TunMo/aYS/f+9dAU17tzNmEkzS8au2hokSa9rtxSqjxDN4dgBRwIZvlMAthDNrlUFZmqMqNjmpXt8UOWlM4lTas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=afTSL/Vp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="afTSL/Vp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F5081F00A0A
	for <linux-gpio@vger.kernel.org>; Mon,  8 Jun 2026 22:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780958036;
	bh=+sd0YG4NJYnrqOJ3l4vioxCsQYopEHLM78GABTPI8G8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=afTSL/VpAcfmg9KaNA3tK3UABJm13fvJBePwt4nmkI0QyMy30zXxTA0x7jJmUH3f8
	 +pQe29lMWvHYzNQngRJwSzI0fh+E+cPFMzssEbunZzfrI96M5HP2lIBUWrhj/Sqtnb
	 aOD8qxeMwg4fY8QMVxHhEo/AkE+fVf2zRmIoULsGYwWBLg00waXPYtS9AurVlohqHd
	 5GxYeQZ/FD3w5vrTcypUYywqEYu2dsrYb3GaWqWK/InabY7BrbccMQtwC7skt+VQMF
	 LKGp40LcihtkIcGSfKTb0ekiecObpuGrMogBrBR5xwDsTprsMNVmWL//dHFrwoz7Wo
	 7/GyPXXe6pBEQ==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5aa68d65d24so5231186e87.1
        for <linux-gpio@vger.kernel.org>; Mon, 08 Jun 2026 15:33:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ81ip+0KoNqKrCsxt4qg6RvbSaOz+OHKfqHvuXdvoOiR8jrd3ljkm36yD74YCRuAg1TktQNTwG4tKa8@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0eB2NJj4k/uCMFpmPFTz3D4m+f041SeUy4bFzaN5U+MQo4n1E
	L9DkUfMgNcqaVZNVugkJRRMc1cMDQiVMLOGXZzXMN41U/YMbjopCrxmU4GDs8cpRiq1ZourhToG
	nRh62eNurhL7IkXAmjUJjVtR2KGSlre4=
X-Received: by 2002:ac2:4e01:0:b0:5aa:6115:e4b6 with SMTP id
 2adb3069b0e04-5aa87bb76e1mr4983094e87.21.1780958035220; Mon, 08 Jun 2026
 15:33:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260504131148.3622697-1-khristineandreea.barbulescu@oss.nxp.com>
 <20260504131148.3622697-7-khristineandreea.barbulescu@oss.nxp.com>
 <CAD++jLnk4q7L_cFzz+1gKkAqwhv=TW1_XSepuii7b_PHF7EPqQ@mail.gmail.com>
 <704e9e7b-0f45-4ed3-a686-9e20056eab2a@oss.nxp.com> <CAD++jLk-7UqjCsM4jCdRmBMMaNNXe8Gi_E00fJ_MRMsEGQcMZQ@mail.gmail.com>
 <48494e7b-4cba-4372-9090-f40240d820c4@oss.nxp.com>
In-Reply-To: <48494e7b-4cba-4372-9090-f40240d820c4@oss.nxp.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 9 Jun 2026 00:33:43 +0200
X-Gmail-Original-Message-ID: <CAD++jLme25qcWpzVa44VwTmnAf+Rt7suF8DgUs5tGyM_UyNbyw@mail.gmail.com>
X-Gm-Features: AVVi8CcCR-63_uafKf1goL660j2RzMYR76efORAe2ZPvWCw_f0wQxO2Fdy03EZE
Message-ID: <CAD++jLme25qcWpzVa44VwTmnAf+Rt7suF8DgUs5tGyM_UyNbyw@mail.gmail.com>
Subject: Re: [PATCH v9 6/7] pinctrl: s32cc: implement GPIO functionality
To: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>, Larisa Grigore <larisa.grigore@nxp.com>, 
	Lee Jones <lee@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Alberto Ruiz <aruizrui@redhat.com>, 
	Christophe Lizzi <clizzi@redhat.com>, devicetree@vger.kernel.org, 
	Enric Balletbo <eballetb@redhat.com>, Eric Chanudet <echanude@redhat.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, NXP S32 Linux Team <s32@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Vincent Guittot <vincent.guittot@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Khristine,

On Tue, Jun 2, 2026 at 10:05=E2=80=AFAM Khristine Andreea Barbulescu
<khristineandreea.barbulescu@oss.nxp.com> wrote:

> The new version (v10) has been updated to use gpio-regmap, with a virtual
> regmap bridge dispatching GPIO accesses to the underlying SIUL2 register
> blocks.
>
> I am not fully convinced this is the cleanest model, though.
> SIUL2 does not expose GPIO as one regular register space: direction is in
> MSCR, input values are read from PGPDI, and output values are written thr=
ough
> PGPDO. These are backed by separate regmaps in the driver, while gpio-reg=
map
> expects a single regmap.

OK I did miss that detail earlier, I definitely thought it was using a sing=
le
regmap.

> So the current path becomes:
>   gpio-regmap -> virtual regmap -> MSCR/PGPDI/PGPDO regmap
>
> The version was updated this way so we can review the approach on top of =
the
> current code. If this is still the preferred direction, it can be polishe=
d
> further. Otherwise, I think direct gpio_chip callbacks using the existing=
 regmap
> helpers might be a simpler fit for this hardware.
>
> What do you think would be the preferred direction for the next revision?

I'm pretty much happy with either version.

I see your point as to why you don't want to use gpio-regmap.

I also think the virtual regmap thing looks pretty OK, it's complex
but the driver is complex anyway.

What could make the gpio-regmap approach is that it will probably
get extended with get/set_multiple() at some point and then you
will get that improvement for free.

But I think you are the best person to choose what to use here,
if you don't think the virtual regmap looks good, then trust your
intuition and go back to the old design.

Yours,
Linus Walleij
