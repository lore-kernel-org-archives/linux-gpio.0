Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794565455;
	b=Lu5p+861DnE3Auo/HobFF+ag+2jxe1x0npaMGGpXPAnRk30Wg+dthAIqhjVJoyCYZ6rh
	 KTh6DXuTygDGAF8TtbNfchYLMIO2LIPhRFZZcRV/iiXW/fRQLVE3QbIXvzauEm3f/hoKX
	 gKJrBZihXIO9fNAztYae8GJVxZRBwf5Pln7YZFJcms7a53SZNCTOaIee0jha6fWCJgzM8
	 QBeVIpGBMg10watxQ/9ZnpNw95elqbZnVtag+jJlPvgFqR7yuXSc+yK4TiD03S8ID6GoS
	 pyoI5NrSTNqFqI1fY7EgmUS9gNI7HBcKTtGm9LCyovQ7gURzESHrMVRkdQJFGXGY1gw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794565455;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=QkN+1eF8Y/XADWpxlJCNMdoZN2CgphaWq6d8zvGa81w=;
	b=D7cfI7neT8As7qUicJJdvbrPAxyZeUS8TpyOuL4ZKljrfuFaioHiwL2ATI7F31IT6GKg
	 jqosUunILTL7v2E+QuoVoF/sHB/YKEW1/sT048T4fd7wBMK9biXItYYQ4FFZlPbKX92kr
	 08nq+a4mg0gGCiK34idQVsyxfZXpffpTnbxpU7cisRnfgDx1FV+U+QiNQf6p4VZqW09gb
	 Cw+C1jmJnpBGVgghbBKpWjg+/eLNsaqNXTeEshGFTxvm2Nbb/JRCuKT86sVphLBTJHNFl
	 uoNbQvNnhn2LRrHVBSnv3mzcpTAjWVYyZph34tp+o2lCDPJAFZoxaFe/cQORkm7Cd/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fU65PqRC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B478606A895
	for <linux-gpio@vger.kernel.org>; Fri, 13 Nov 2026 10:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fU65PqRC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38C721F000CE
	for <linux-gpio@vger.kernel.org>; Fri, 13 Nov 2026 10:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794565455;
	bh=QkN+1eF8Y/XADWpxlJCNMdoZN2CgphaWq6d8zvGa81w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=fU65PqRCkaugbF1FhT1enqvBJti9Kt3Y+4LMwZgGLCEYZAuDULEUbE8gn0RXxhC0r
	 H64aa3TvA2ZB4I3bgbaUTP/qr8/yKFtcOwcVsnYdso6Lca0Th33ouu4o1Hslh2EZoa
	 NfFY5a+UK89LnL17kju9CyePqTqRv7gT17OiHOGXsJsZ2f+BlDzpn4yyj6V0oPIswq
	 Wl38NWgsfBbRxjVEdbXxtDN2t4wactkK/HhHtuDmJnK6wWDq4kSOPjvhE5lYjpd1GU
	 wQQgy7egFx3GnGlX/XRw2LlyEwxJJ2gCWQv5Z/QPvDLeC3ufq4Fcj/BK2MRMKqXgs+
	 WxLGwzk+mPClw==
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-4a76f0cce5fso720971fac.2
        for <linux-gpio@vger.kernel.org>; Fri, 13 Nov 2026 02:24:15 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErE93MgBjoJPn5UTFByyDq6hkBR+sh6D020C+Sl+r1u+rl0X3srxkvEibBcIrE37tVAwfq2nBQOE3zwH@vger.kernel.org
X-Gm-Message-State: APuU4Z/xEJLvxzFHG8LmRPLmAjxfcup+M3dmZ830+XsJkdsI511E+uh5
	W+5WIlvnpc1976omEX8SlG8z0ljiMK1CTCa4JbMp6+69Cs6uAYJZ/nxRdQ1vEe+Egyj1C1k5UG1
	erK/rzKJCis4qRMwyBNNzqyOdF3hBs50=
X-Received: by 2002:a05:6871:7426:b0:48f:e3f5:c419 with SMTP id
 586e51a60fabf-4afdf7ccd7fmr2000857fac.58.1794565454219; Fri, 13 Nov 2026
 02:24:14 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106-debug-info-v1-1-067c5c554f91@amlogic.com>
In-Reply-To: <20261106-debug-info-v1-1-067c5c554f91@amlogic.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 13 Nov 2026 11:23:54 +0100
X-Gmail-Original-Message-ID: <CAD++jLnKJGDM5woHn5UXGmToS0g6N55=T=+8Zy+F6X92N0zW2w@mail.gmail.com>
X-Gm-Features: AclHuK9SuxGHNdL_y83hLe0FJC4k4ytk2FDVH3qE4U10O6Iw68MpttghD3THgNo
Message-ID: <CAD++jLnKJGDM5woHn5UXGmToS0g6N55=T=+8Zy+F6X92N0zW2w@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: amlogic: a4: Allow functions without groups
To: xianwei.zhao@amlogic.com
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-amlogic@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 at 8:09=E2=80=AFAM Xianwei Zhao via B4 Relay
<devnull+xianwei.zhao.amlogic.com@kernel.org> wrote:

> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
>
> Allow function nodes without child groups during device tree
> parsing instead of returning an error.
>
> Only count and parse nodes with the "func-" prefix as pinctrl
> functions, ignoring other non-GPIO child nodes.
>
> Also handle zero-sized allocations when no groups are defined
> by checking for ZERO_SIZE_PTR in addition to NULL.
>
> This allows the driver to support function nodes without
> groups and avoid treating unrelated device tree nodes as
> pinctrl functions.
>
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
> Add debugging information for error dts and Error pinctrl config not affe=
ct normal pin work.

The way I read Sashikos bug report the behaviour it is complaining
about is exactly what you want?

Patch applied.

If there is something to Sashikos report, follow up with more
patches.

Yours,
Linus Walleij
