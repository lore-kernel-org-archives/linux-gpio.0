Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794564532;
	b=kIbHpzGRscfE8/Ts/TorldZApAR0oiiINeZjr90PmDi8lcD5YhqwEBfuCgdqsT0dRvwN
	 EnBiHQFJOXGx7JaA+dZdX8uuFcjgT1ybedvKgCtyyPGz62iGLZXirBNTUN3rK+iVZ95rf
	 cCXCgbr5IdCbzUvDkgqjxi32CUJzTTEirn9FJnRl/AXPyurOxSF7bKLES2ckWkOb5NGUo
	 p8auQ/KR4E0EtxsJBBrTW1e/XUFHEl8emQakeiiAee73J3M79EumKBRns0JFBaPdvP7Z7
	 3C/epsY+pMoQ7Y3h3UQUm4OsgwaA1jbBpV28cdXDmAnM9rYonwiCIo7lqjb1UY6sXdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794564532;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=nZMLjQOnKSLNJDPbXg8WmoUPbegfRsFLvgEFn2RPTRY=;
	b=1kOnzG0bQLCVKr91ayV1n3QUW7u4RagZyeQvkdiw+9NdvE6PsC7G06kCg45ZEIph/UPd
	 90ohnV8Rm9n4mX++qWy4mBkp7lG91JMeD3M325duFR/4sT4uK5Uk3cFPTdFLCKYlcM85o
	 KFeHtYrQhE5TTpxRwTaKYpZY7XZfZWA3C4amcm+emTDLmhkihAlAfVHbyHBvGUFin870L
	 A1aZLrFFJYMSW0bTO/BeSS6/0wh87pyLvXv5GK52t9aC5JjPl/yD05gEOtYqrx5DAEU2v
	 qtVBM92UVJQJKL5ijSmCY4/W0odYQlVNpO4kuShMeZOYBgEWh6cTdELSJZDTGi1eJEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TeFh1mZy;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7920606B10D
	for <linux-gpio@vger.kernel.org>; Fri, 13 Nov 2026 10:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TeFh1mZy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B51871F000C8
	for <linux-gpio@vger.kernel.org>; Fri, 13 Nov 2026 10:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794564532;
	bh=nZMLjQOnKSLNJDPbXg8WmoUPbegfRsFLvgEFn2RPTRY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=TeFh1mZyMj5nQxcRroPfaId9yIqV/bdgtpq5BoynHhde8p4+zmt2HRr/AFL2rZQ6G
	 ysmLuO3JygPwXkLelCDIv4/Hzk6spaIk/P/p5uMgiQP1Mj1TmFoOShSjzn1jx6cycw
	 cp5/gN6HWoHssFORDMtCZiyFR22TbcCPkBCKVU1e9hRklRdhoUDIdNRooLzj4W+Uv3
	 02bc7d9tzzJXSjX5pL3WDCs1NZju6tc58E2BQTFclA147oe85eMU5ipPccxtqP8gjO
	 9sPG+HU3OmxTgFvLxDGcC6ct1021Cz9Lau2gfLBWI/2DxkJAPMRdqZqDGQVeS6AdSi
	 Pd/eOaCVSS1VQ==
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-705cb6ceebaso1208633eaf.3
        for <linux-gpio@vger.kernel.org>; Fri, 13 Nov 2026 02:08:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEfRsh7rUhD+fH9aR0xeFN0gsM2J6e9DLjwl74LTIecvw6yr7DTk63+i8/KgVpqXdARk4LsgLqTJ2nN@vger.kernel.org
X-Gm-Message-State: APuU4Z9uMmum6aHRDoEnbahxcsDpGic9Ud8WNAR8CxZCI5+w4UUWaDus
	qh4TViovljsgVGlnq8+uoWxBwgk7I/LuYjGFs1rhMGWM+/bb4smwRhNQDz0OlbGtstEO4pAkD5N
	f5TkfPLHX3U5RT7xdpq3ixArZlaUC8Vg=
X-Received: by 2002:a05:6820:a29c:10b0:700:52ae:7e4a with SMTP id
 006d021491bc7-71ab50ba8fdmr819670eaf.71.1794564531943; Fri, 13 Nov 2026
 02:08:51 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261030-clegoffic-pinctrl-scmi-gpio-v1-0-52d92843ad97@baylibre.com>
 <20261030-clegoffic-pinctrl-scmi-gpio-v1-2-52d92843ad97@baylibre.com>
In-Reply-To: <20261030-clegoffic-pinctrl-scmi-gpio-v1-2-52d92843ad97@baylibre.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 13 Nov 2026 11:08:37 +0100
X-Gmail-Original-Message-ID: <CAD++jLkwO7ysyF4A8UJR=ipDBKCaDzBGM_nNWDnE9RRCwdLH1A@mail.gmail.com>
X-Gm-Features: AclHuK-wzX5arsrKUblOchzdDuA5RMs0whEnr2fNyQpXUEzcUQOamAacHQe25j0
Message-ID: <CAD++jLkwO7ysyF4A8UJR=ipDBKCaDzBGM_nNWDnE9RRCwdLH1A@mail.gmail.com>
Subject: Re: [PATCH 02/11] pinctrl: scmi: map the schmitt trigger enable to
 its SCMI type
To: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	Peng Fan <peng.fan@nxp.com>, Oleksii Moisieiev <oleksii_moisieiev@epam.com>, 
	Andy Shevchenko <andy@kernel.org>, Dhruva Gole <d-gole@ti.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2026 at 4:58=E2=80=AFPM Cl=C3=A9ment Le Goffic
<clegoffic@baylibre.com> wrote:

> PIN_CONFIG_INPUT_SCHMITT_ENABLE was sent as INPUT_MODE, which drives
> the input buffer, and PIN_CONFIG_INPUT_SCHMITT, a threshold, as
> INPUT_SCHMITT, which only takes 0 or 1. Send the enable as
> INPUT_SCHMITT and refuse the threshold, the protocol has no type for
> it.
>
> Fixes: eb524cb651b7 ("pinctrl: Implementation of the generic scmi-pinctrl=
 driver")
> Signed-off-by: Cl=C3=A9ment Le Goffic <clegoffic@baylibre.com>

Patch applied for fixes.

Yours,
Linus Walleij
