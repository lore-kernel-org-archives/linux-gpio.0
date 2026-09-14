Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 328C64457CF
	for <linux-gpio@vger.kernel.org>; Mon, 14 Sep 2026 12:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789387954; cv=none; b=CUPhITcmklmdnLLd1l+VADTQ37kxlgVOQJtrL2HZbvF3N9QrWT6smXEhU5u7H0puUhIRa1e8AZFBzBpJTrIgY5LtxZPt5V7Hqx6cBmaGaBgJMUY1zvjpRqusmJIxzThXtHRfl8F5BjphPyhxsirxTmNPOp60CvmKHhxDD6wSRtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789387954; c=relaxed/simple;
	bh=OsSTOY//BG8cCCupHatEDXqNpsM8A13HReU4V1MAq14=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bgn6sqkYwFhlLIWH5z5RyURbN37Nr9Wdsks6zEeIjU4dF0vNuRyLO091/onoj7oUFhlDhFIHddqBa8SFiGzQ6u+pbi1wnZgqAKaOMR63kxwncOxkLiAexVUbyzhMwCcptAoXY2ptH63BVpn+WpINJSr137lw6TbAxzMVt121KX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bw2nOGPj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bw2nOGPj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EF771F008A1
	for <linux-gpio@vger.kernel.org>; Mon, 14 Sep 2026 12:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789387952;
	bh=2OZJc4pE75EzQY4TF0i25vLvB8iiwVxxIUeR10SzMyg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Bw2nOGPjucfG7nhjRzYodb3iK4DV8+USHY06ZbAUWNQk/2XDQFpyxnuKDAXZCfU+i
	 EP5EbUlHuYNOou+YJLAMnFILQzAgHclGwLbJsRck+i3l9djbcp/agUAwq3AxEZNJcN
	 rMpgNvw8dgIXF9lLAJ4vF4E4lEJJ0wm8uw4MiyMzO5zyT5SmomV+DXthqJlXiTHahn
	 D+Fb6IC/sm84hD/GtdVi4vxA3X551CeqTVC9frkqWXdRex9VavFP7bpnqTr2XhbIbz
	 XMlgyk9QHzwHCyAsAWAPlTMCmvbCmeYrUTVsRAXajHarneswJ179cphFT3O4STlU4T
	 92kU020jTGOAQ==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b5e4f1651bso1566825e87.3
        for <linux-gpio@vger.kernel.org>; Mon, 14 Sep 2026 05:12:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzeL13FNzBGf2q03bJBguwPOOPfnuQkL+vnPEXISbofvUFBYtkHYYw2HrmAlMwuoJ+k+/fI9biSiLtj@vger.kernel.org
X-Gm-Message-State: AFuF++m3kxs9ivcmF1N8TqyKQnlFlIsoAmlPJ/sM1LOtF7Ra9cnxaMsU
	VFY8fSjp3KOmemnJahkleWvqAUhb615EzTN7Sxeizc8xTK3gB+6JPLLSS7XT8Jwmt5gZnTJh2xm
	sJmMF23vnsc0B1w5XdTJxAeG8hOoW0oU=
X-Received: by 2002:a05:6512:3b25:b0:5b6:4ae:3ff3 with SMTP id
 2adb3069b0e04-5b8ae68dcf4mr642559e87.27.1789387950724; Mon, 14 Sep 2026
 05:12:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260830084104.14968-2-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260830084104.14968-2-krzysztof.kozlowski@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 14 Sep 2026 14:12:17 +0200
X-Gmail-Original-Message-ID: <CAD++jLneoGy4q-ihKWVhW3iyH2YEATeGf76RB9NiDLk3-OW1iw@mail.gmail.com>
X-Gm-Features: AcwNN1V856sA9k7HWfZhF0PQNVfwgYy4TkqwdpzU71qB7kL_qOjvZ23sMHNDQ8M
Message-ID: <CAD++jLneoGy4q-ihKWVhW3iyH2YEATeGf76RB9NiDLk3-OW1iw@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: pinctrl: fsl: Replace tabs with spaces
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Frank Li <Frank.Li@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP S32 Linux Team <s32@nxp.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Peng Fan <peng.fan@nxp.com>, 
	Giulio Benetti <giulio.benetti@benettiengineering.com>, 
	Jesse Taube <Mr.Bossman075@gmail.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 30, 2026 at 10:41=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:

> YAML files do not use tabs, even within the values in DTS.  No
> functional change, although dt-style-check will warn about it
> ("[tab-in-yaml] tab character not allowed in DTS example").
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Pulled out v1 and applied this v2 instead.

Yours,
Linus Walleij
