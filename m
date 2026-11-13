Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794565223;
	b=bvn1SfuEAD4wObwBNASXAMX7k5M3OuK+CgflJGhr6J+EIhxzniOlXqXGWyjP+smwF5o1
	 TsvDvC9z3mNIJNrTbS/p8M/7EPT74Ts+P6Stitu5m0fpUlJ6K0qNIOJD4fuFXSQZpO5Bk
	 udnVhMk3RRnT3z5HRWHrcHEw84cSe7b+yWGv8IZbdF6GG6PlPUW38n0Cu8YsWsKOV+jXF
	 gzbAED9oCO5HtjTLpzmNAXTqvuLKwnHhzH2rM4qNDW3ITJEYf5dWYkzIqAi+VJjyemekP
	 e/Wg9uEGhZhjs0ayhbcaRjnfWIAEVmo3Znd/FTGLGwMgAGtLUvO0mYUKKWyWtZMaTzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794565223;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=e+QKN54s5dJC9PcohR2oIJVPHcl5qCaMa3M6f93yiFg=;
	b=WgwjYvtvBUEyOdtSakuBJvATfZlRrX5pIvMSmv6fSG6eDPwklLjOdb6f8yC/N2rEXm2D
	 i2PkjXqgwTjymOQruXnkzuLPuDxM2cwj+YHNywKMkan81S28AHddVa6jVTH0gXurx0BCC
	 qFxoFFFBCzzB4T/+s4abtHgjTGwcfQ+ifcEBivS44Oi3oPS+k8pXwNrq68kmkYm/jQBuG
	 OEp7fsfGiHnbhigbluz6Fktg0gR0EoIhsffckSkBMrt4dwvSQ6BUL8o5TSiJSOpfjZdOB
	 ultWJTgENN9T/6ET8mSnExnzLD6+7hWqxZroq4khDtvQJ1dV1zAXjnfGN7CHkAIy2Hg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OCwb0LF0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D479606A890
	for <linux-gpio@vger.kernel.org>; Fri, 13 Nov 2026 10:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OCwb0LF0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC1C11F000D0
	for <linux-gpio@vger.kernel.org>; Fri, 13 Nov 2026 10:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794565222;
	bh=e+QKN54s5dJC9PcohR2oIJVPHcl5qCaMa3M6f93yiFg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=OCwb0LF0A7Ak998VUdtZ2VMQp/bWG5nTo4fWRdQ86sWF1HhYqYuwSOOsxFzslsBeu
	 H3lDd9zvJdCMIkI9dbFBIYg7Z0u8eufwm8IHvs2VCrxER75RflOQAMZ6ykHRnll1R/
	 IxSj1nbNmWy0vG/aiDkcwtRl/yxhggDb6BqYURymPBGESFt6q8AFjUOJWdicW4p+VO
	 1CjfofiGVwhSN+/6xEbcg1bArAivOaDY0/kN4ux5aVd6fs5LdraYO3rEb6mSuFI0UF
	 VqH94MxONlDy2nJ8zyxFcXVrTFSkPp67d+CPSvkFu8mFV5C5aVHuCxvN/HEE9moyWk
	 +Bck65Oa4vbig==
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-6e560e00a86so986022eaf.1
        for <linux-gpio@vger.kernel.org>; Fri, 13 Nov 2026 02:20:22 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHglisTauMUb8a9x8pufKuTVL7RZDU95ZZrnKF7Ya4MWFjH6kc0mE3nqhJ7YJ5JPAMT4u1kBDl51HpV@vger.kernel.org
X-Gm-Message-State: APuU4Z+Sh/1vZJoPn8U+biNAyyQhG8y1iiqkQI82lENBL9qniDcct6T3
	GtkU5UAx5TWYk9Gxs799YE2AgaCefzziW+u2UiN+B4wUAVquX0QrkYOoory5Yj+G0quL8J+h+Ni
	spLonNPLxDPwYvp7rrkMCTWZzOA4Lhqw=
X-Received: by 2002:a05:6820:1505:b0:708:f388:af75 with SMTP id
 006d021491bc7-71ab5076282mr1109599eaf.46.1794565221874; Fri, 13 Nov 2026
 02:20:21 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105141347.488850-1-khristineandreea.barbulescu@oss.nxp.com>
In-Reply-To: <20261105141347.488850-1-khristineandreea.barbulescu@oss.nxp.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 13 Nov 2026 11:20:06 +0100
X-Gmail-Original-Message-ID: <CAD++jL=uDOiz7R5KJAfh66HudBXD_QpmETq=7LTouTcqgTYb4A@mail.gmail.com>
X-Gm-Features: AclHuK8ALm5dcSJS8WSzctJPTDL0CYbD-RRIi6GsaRl2wItphby29XEFcySloIU
Message-ID: <CAD++jL=uDOiz7R5KJAfh66HudBXD_QpmETq=7LTouTcqgTYb4A@mail.gmail.com>
Subject: Re: [PATCH v3] pinctrl: nxp: s32g2: Enable by default on ARCH_S32
To: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Frank Li <Frank.Li@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Chester Lin <chester62515@gmail.com>, 
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Matthias Brugger <mbrugger@suse.com>, NXP S32 Linux Team <s32@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 3:13=E2=80=AFPM Khristine Andreea Barbulescu
<khristineandreea.barbulescu@oss.nxp.com> wrote:

> The SIUL2 pin controller provides the pin muxing used by peripherals on
> the supported S32G boards: the S32G2-based S32G274A-EVB and
> S32G274A-RDB2, and the S32G3-based S32G399A-RDB3. Without the driver
> some peripherals never finish probing and a defconfig kernel cannot
> boot to rootfs on these boards.
>
> As the driver is required by every supported S32G board rather than
> being optional, make PINCTRL_S32G2 default to ARCH_S32 and keep the
> user prompt only under COMPILE_TEST.
>
> Signed-off-by: Khristine Andreea Barbulescu <khristineandreea.barbulescu@=
oss.nxp.com>

Patch applied for v7.5.

I don't understand what Sashiko is rambling about, if there is a problem
the build robots will find it and we can fix it in-tree.

Yours,
Linus Walleij
