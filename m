Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793868879;
	b=Zb5+bxDL6t+VvG9JoGpKyJ11Vf6AwEHEa3OzYsmNkD+offR9dxkdnHjWKGD1FpM7zRnz
	 BlCklxsd2hlPv+RVK+96J7/S0G5jEjDEnnH3qO8xmcwAiHw+afuSC9A9SNUwsRWhBveJX
	 rQqQD2muTIFDU8b++/fnKb2vqrn6Cmr71mLQ6Z43kMzWxOsIj23z6cAHSgKzo0kbu28u2
	 UGbmgAoirTvbnZdru22iDyJy16IL2ABOZMUORnDpaztd2jQKW6ro1FEXeN6JVPwSHu1RC
	 6ULuBasMtLTaHpJ6JJ05TPlKMXvVQzlWXMlnaQpBIsrD7dgNF8rGKpAqE2Ejdol4Hlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793868879;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=DVVe3FzAnvs93NbepeyFk6hW49mA+Pu2o1a39rMbIEc=;
	b=hFgDAO5UWaBrmp/qA6oGMVZmh1kRx6OKi3thjygvPdy1EOBghZUxfc4C/WSfYr+0BGox
	 qvv39Q2cixwdxb8Ij861G3vSk6/ipwwhXWRFNPtI3E/Fc0a0ht7M5lYXKboKkcSyR64mk
	 Q0+kqyMfC3KRlLnQ8R8U9rv4JgMC1Y5iUU2Gxb8ni50TmRxr7/dkS9vCI8u4bVCcjmoIl
	 NXVYKNVS3M3hzNtwn2OjCOvJn2sPliiKJn2IqkZaoPO6jU+h4e40lfI/QTy6PAQ8F3y4z
	 bgq9xikQytW6guvtVvo7C1czp5EUklDWjVB5J29Og9CG3c3SowvHrf/t9E38uSEP9cQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TASrUzj4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9EBB606A326
	for <linux-gpio@vger.kernel.org>; Thu,  5 Nov 2026 08:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TASrUzj4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A11C1F00A17
	for <linux-gpio@vger.kernel.org>; Thu,  5 Nov 2026 08:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793868878;
	bh=DVVe3FzAnvs93NbepeyFk6hW49mA+Pu2o1a39rMbIEc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=TASrUzj4saXMLMH3nA6tcJnUOlbZZJFqYGciiTf9bpRy/Z8YwmoSGwyJsWiJ/Uu1H
	 0bJeg2GvyXujibHLzoc/2aWl+Rws4Z+DVHdb4gnhF7BtcTjpHkw1iKFBFEto78YouH
	 fVNnKUmRct2mnG6iaW4cDnjzPdn3KLSt2uzmYVTgHxOLl9IhcgAMqZlc+X7TJwnNVG
	 rwSvzBYhQbnmUQPeoGXg+O365RVuBuY1x+pi0+cwahgptK6ArEawRk0EeLh7PTaNSy
	 abCUyhko73xR2xy3Ppokh2XvSCDfvsPsOS8i8A63dalLdvILxmfEQYga+YIswAGBII
	 poKP/X22aaiFg==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5bccb867d6fso1286794e87.0
        for <linux-gpio@vger.kernel.org>; Thu, 05 Nov 2026 00:54:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBw9xlwQX1kZehEJRuwIknwndaIeq03xYzwKFGKnUCX3eEpEzxs3wMABqOIYclDARlTwrnMb+/4DQBqd@vger.kernel.org
X-Gm-Message-State: APuU4Z/AQ8P4WccSdl3ynL7u7jAYWWnXKDkR+vXUt9aVrt3mbnPN8LNl
	cYimOQFZI4/MV84+YxUuAGpnMrWyakisELn7Rj/UCzeTeNc68oQNaNxfiFzvvStQxwAGhR5Ic9G
	wHLiQFkq1PcPal/FgC9S9acpYQOzQPc8=
X-Received: by 2002:a05:6512:3089:b0:5b8:bc5e:b58b with SMTP id
 2adb3069b0e04-5bfd95a4b02mr5739173e87.67.1793868877100; Thu, 05 Nov 2026
 00:54:37 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261031081804.218566-1-pocj8ur4in@gmail.com>
In-Reply-To: <20261031081804.218566-1-pocj8ur4in@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 5 Nov 2026 09:54:24 +0100
X-Gmail-Original-Message-ID: <CAD++jL=s=8myyXaA_bzpgdCXSTFuV6N9E7jSTugEpHLz6sCiow@mail.gmail.com>
X-Gm-Features: AclHuK9jzhrMR_GIOjckLsaRqpnIyiPrY4hPuPPG5HhQ-Fm9HL5f6KY7FDGM-wg
Message-ID: <CAD++jL=s=8myyXaA_bzpgdCXSTFuV6N9E7jSTugEpHLz6sCiow@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: realtek: Write the encoded slew rate value
To: "Baek Kyu, Kim" <pocj8ur4in@gmail.com>
Cc: Yu-Chun Lin <eleanor.lin@realtek.com>, James Tai <james.tai@realtek.com>, 
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.com>, 
	linux-arm-kernel@lists.infradead.org, linux-realtek-soc@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 31, 2026 at 9:18=E2=80=AFAM Baek Kyu, Kim <pocj8ur4in@gmail.com=
> wrote:

> rtd_pconf_parse_conf() maps slew-rate arguments 1, 10, 20 and 30 to the
> two-bit field values 0, 1, 2 and 3. However, it shifts the original
> argument into the register value instead of using the computed encoding.
> After masking, these arguments write 1, 2, 0 and 2 respectively. In
> particular, the distinct 10 and 30 settings write the same field value.
>
> Use set_val when constructing the register value so that both individual
> pin and group configuration apply the existing conversion. Leave argument
> validation, field offsets, masks and regmap error handling unchanged.
>
> Fixes: dcc9334435b0 ("pinctrl: realtek: add support for slew rate, input =
voltage and high VIL")
> Signed-off-by: Baek Kyu, Kim <pocj8ur4in@gmail.com>

Good find, patch applied!

Yours,
Linus Walleij
