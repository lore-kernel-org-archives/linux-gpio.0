Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793799232;
	b=Vnwor5nm0BZ9bCDLE1rur/TG5iLj+61z+YC8XnF8saicy6QssYcRiSJwOC0xIHoa5gWi
	 jksFr5j8gGnyTTJQ547cybKxe4rgsjLROsLucouERqEi2l5CLyBWnIMH51d9eK9Tt10Dw
	 JmvzWdhVMSBltj0BaUOJgM9gFfPneLUaboyH7VlxPwoOMmTiF6TN6DJiKTi+LWUvnqWxH
	 WlB7G70vUNopUG20uMkwGZcY+eH37F62Ni8DWXXrdBWLQggS6SA5zJYu/a8DXJ06w4w5X
	 1/0LEO81LkRToNpv2y0m9ASREMLjphBlCGUfFppjNdsoHGvS0DK5ilmVKKU+Xh/Z32g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793799232;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=PVt8UCw+TfAqWXt7c7OPgRoChv9ewjCNpbQoQTiOBig=;
	b=CxnmaqLoijK8oqTSaoAcKIsLE+gTVTULbMKv5ZpqAztjx+khlPSu8NSgMe4XszFzqzN/
	 B0K6M1c7U8zzrocDVwfXKVIyK439ymtV5dTedlLftVgtf49bIjte/Lm4cBYU5aljOt9aW
	 k9jkfUf93RHA2jM8csJsi4FV9V2wqfG8RaLvSAxiWty/t1Lz/if1AoPbp306OiiTZHRuz
	 OGZlMnawuNQabxWjEhpal68bVgJE3Mxf1ZupGWwAKPthniXY+TDeMUMwj7D4vsaB8Z9vl
	 09mvPd4r4zVa/Jb0sPDn1SgA9xZUNq3mZH90LA8zqNAJcPH547z/iEoz4AmvKYqhPaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QGTSKrQJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72771606A326
	for <linux-gpio@vger.kernel.org>; Wed,  4 Nov 2026 13:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QGTSKrQJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 046E41F0093A
	for <linux-gpio@vger.kernel.org>; Wed,  4 Nov 2026 13:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793799232;
	bh=PVt8UCw+TfAqWXt7c7OPgRoChv9ewjCNpbQoQTiOBig=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=QGTSKrQJZwvpkv6xFfz0xFpKlNVtP4IK1BfiXeQlkBVQ6YpCZb+4w+AIpjnfEf1tH
	 VW7jpzxPeJR+cz/0mhnC08zU0vb+858lpSZcXddoeFFmXxUh6w5fcTMeC+OFrg3rwa
	 rLWF8zSLHdoHy1ZMl8Mhm1Z+bUHsQ+qku+EP7tcsa8ZsfX2fGyHma3QOt9YCNDlRUY
	 D0KmuY1V1sL/d81SulJ0our/LUyNUT1SMhVbuWXBTQ6tR1hZsJyBEYV+w7pzgn6v8K
	 bdTsAvciKTRf+2QE1Bxgt9XIYIoiEkgeVE0j96kbjgpfpiZ3FDhAxYXKxxtyTMqPDS
	 EdDuOZd9oFwJw==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3a49a022221so5597121fa.3
        for <linux-gpio@vger.kernel.org>; Wed, 04 Nov 2026 05:33:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBx8SzjBiMZCkCqwgiQft9A4QC17xjJBANdlJYt5sStoUkwOI07ENIE2OIpVqHQEsok+4vSdu3QX0c/0@vger.kernel.org
X-Gm-Message-State: APuU4Z9MrNIT09HFpf+f+2Un5DPw8yStTBy3Kg1GyGS7BgVtjl78oX18
	NI4Xpe2P36AaUGmTPPCo7tQVKm4uflVURHfUWJyay1o08hu7JH5QMka3ipcWsjWYk4VmiThi1JD
	f03leSS1Mjo7QUCHEuuzJCbYR8YvWC5Q=
X-Received: by 2002:ac2:4c52:0:b0:5bc:e472:12fb with SMTP id
 2adb3069b0e04-5bfd957d05dmr5285778e87.63.1793799230807; Wed, 04 Nov 2026
 05:33:50 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261025184335.447963-1-mashikiselby@gmail.com>
In-Reply-To: <20261025184335.447963-1-mashikiselby@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 4 Nov 2026 14:33:38 +0100
X-Gmail-Original-Message-ID: <CAD++jLmTOFRxSrnq3eXYR0QhDRGeRuPYNh141pByURXYv2CdHg@mail.gmail.com>
X-Gm-Features: AclHuK_037ZYLwttHJYLlMk8ibW1pzsmDenfg-_6QVl2MfQ5g6KsS7LCgDFaJ_M
Message-ID: <CAD++jLmTOFRxSrnq3eXYR0QhDRGeRuPYNh141pByURXYv2CdHg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: nuvoton: fix fwnode_handle leaks in
 npcm7xx_gpio_of() and npcm8xx_gpio_fw()
To: Selby Mashiki <mashikiselby@gmail.com>
Cc: Tomer Maimon <tmaimon77@gmail.com>, Avi Fishman <avifishman70@gmail.com>, 
	Tali Perry <tali.perry1@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
	Benjamin Fair <benjaminfair@google.com>, openbmc@lists.ozlabs.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 25, 2026 at 7:43=E2=80=AFPM Selby Mashiki <mashikiselby@gmail.c=
om> wrote:

> Both npcm7xx_gpio_of() and npcm8xx_gpio_fw() iterate over GPIO bank
> child nodes using for_each_gpiochip_node(dev, child), which holds a
> reference on child during each iteration. Returning early on any of the
> error paths inside the loop leaks the child fwnode_handle reference.
>
> Additionally, both functions call fwnode_property_get_reference_args()
> to parse the "gpio-ranges" property into args, which acquires a
> reference on args.fwnode that is never released.
>
> Use the __free(fwnode_handle) cleanup attribute for child so early
> returns automatically drop the reference, and call
> fwnode_handle_put(args.fwnode) after fwnode_property_get_reference_args()
> succeeds.
>
> Fixes: 3b588e43ee5c ("pinctrl: nuvoton: add NPCM7xx pinctrl and GPIO driv=
er")
> Fixes: acf4884a5717 ("pinctrl: nuvoton: add NPCM8XX pinctrl and GPIO driv=
er")
> Signed-off-by: Selby Mashiki <mashikiselby@gmail.com>

Patch applied as nonurgent fix.

Yours,
Linus Walleij
