Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795036533;
	b=pWSXHQegopqiQFnAXRn6lwUwKA++AL3W+FTHVn+rguqqlozazMJtYMAYFQPmm7aft1+z
	 1+ANc+XoJfXTTCc6OQhBKtz++fUOuQqzCoqMPa9b25yx3dd7JiHbcxD7u6o4IHY0Nc1K1
	 UxYlKKGmVnSDFrmp1PFfhGrBnebpT/TP4WyABt0cAyB1WyDj7rhkiOqzsbYHTCjjXLEpl
	 UyUYVxti+O/KnqGXKuJMPx8meX8eAIpSdkTv2NZGV3Eob13JibDs+NDvipudiAGfc2JSr
	 NVBL4TibdCC9vIC2gAg3Afabi07nmzPFYZDBG96db/5GJTsUXRt/waArrLL5IaCvi6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795036533;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=jXpHBT1/WDmLp0zpzRIxDl44SN5leSzeHP8wCtpU/Po=;
	b=5i/+ZITCsICKq7KtHw1ATvrnGvvIs+27kIhimGNRfM5tqaCYSw2xZXaojSBxmhnFS1bI
	 JOnm6/Oe2+0KPuWD0OCxFSnBmk2l78/nFISttJNe05TRcfJ62dUqxeoDO206eQcGpsinf
	 VgJ8GBNxides4v9AJHtz17eqkSarL9+kKCOpvd2o6QoQ9oPwN+YXVPWuA+7VmzirUlE1l
	 m1FXfFSz/2rQtw/Yp6G2x+h8t9JWzAqXfcM6/QSfojLp5HGoNatrpOzxfVUPZMJve3hg+
	 QsfvjX1aQdC8mhsu1idRLZ9YPNQbKeHW2mkfGfH4GKQiCFWAaQYfXoCCh1pInyyHFFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kjSyc0l2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2D9B606A332
	for <linux-gpio@vger.kernel.org>; Wed, 18 Nov 2026 21:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kjSyc0l2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 769B01F000D0
	for <linux-gpio@vger.kernel.org>; Wed, 18 Nov 2026 21:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795036533;
	bh=jXpHBT1/WDmLp0zpzRIxDl44SN5leSzeHP8wCtpU/Po=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=kjSyc0l2jgfTa1Gr7mPOfzuP6tLnKgnN3OKAYB/HxNNqyFZcDFB46+L21kpljI9ky
	 tJ9h+IalPk9axrIlGCBbpRHL6+29YZuB0IVHAKxz0bo4UY+/W/P9jT12kdqWlun20T
	 2HxNcbk4DkYpClX+2W+G1UfwlY6KHQC5fEW0hNuGW6HVROF5lZNd2YIi+YBww4Uot9
	 Moc3q1Tx7Y0K5G0dZt7BtpTCDpZnSHAZI9DehbqOkkDjGZ7F5pRKWwoKvj6xqWciWf
	 NaL5g8qzFQNgtN34F5iEG1VxHl+YOFKpbN90QuJjw7Ir/pF7E7bE9cpA46y6plbFkh
	 HI60rU5SAnfxw==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5c126fa1e3aso1011832e87.2
        for <linux-gpio@vger.kernel.org>; Wed, 18 Nov 2026 13:15:33 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFrpzZlYut0WXx7G7b6GTIslLBJku5waBKU4jlgAVh9im9UQ1jDEFfPFYis49X6rMRNZFOUot93b77s@vger.kernel.org
X-Gm-Message-State: APuU4Z/2m5Clj0PBM6dZ+Wvt5g45WxWyuFsgaQS7cgfoPGEbTyoPr7tQ
	kxjgzyJz8c/AluNIyhWKSo42i3Y/o31Wzo5FJkfo90z7exjmi0lCfgmwnDc5HqKeMZrCqjv711B
	58ODn00hTI+FTQTWSutbAMjqHa6prBf0=
X-Received: by 2002:a05:6512:1102:b0:5bf:f7e7:85eb with SMTP id
 2adb3069b0e04-5c1aa0736aamr1346704e87.21.1795036532194; Wed, 18 Nov 2026
 13:15:32 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110094339.749110-1-zhengping.zhang@airoha.com> <695991a0-ae67-4ce0-9b92-f191ae97a468@iopsys.eu>
In-Reply-To: <695991a0-ae67-4ce0-9b92-f191ae97a468@iopsys.eu>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 18 Nov 2026 22:15:15 +0100
X-Gmail-Original-Message-ID: <CAD++jL=_q3SWsh6AW6PLOC=h-z-h-N8AcC8SRCPVKsbzEPktfg@mail.gmail.com>
X-Gm-Features: Aa3M54omwiJF0rg8LzwHPSiyolxNp74aN1hJ5GJPEJYrBTD3qh4Hbo9mWipBH1I
Message-ID: <CAD++jL=_q3SWsh6AW6PLOC=h-z-h-N8AcC8SRCPVKsbzEPktfg@mail.gmail.com>
Subject: Re: [PATCH 00/12] pinctrl: airoha: configure GPIO muxes explicitly
 and fix pad mappings
To: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Cc: Zhengping Zhang <zhengping.zhang@airoha.com>, lorenzo@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, brgl@kernel.org, naseefkm@gmail.com, 
	benjamin.larsson@genexis.eu, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, lei.dong@airoha.com, ansuelsmth@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 15, 2026 at 3:10=E2=80=AFPM Mikhail Kshevetskiy
<mikhail.kshevetskiy@iopsys.eu> wrote:

> Hello Zhengping Zhang,
>
> Please fix your patches. Looks like you insert patches to the e-mail body=
,
> thus your patches were converted to "mail encoding"
> * tabs was replaced by spaces
> * unchanged empty lines "<space>\n" were converted to just "\n"
> * long lines were split with "=3D\n"
> * "=3D" were replaced with "=3D3D"
>
> and so on. So please use "git send-email" for patch sending.

I agree, I can't work with this, maybe review a little.

If possible use the b4 tool to manage your patch set(s).

Yours,
Linus Walleij
