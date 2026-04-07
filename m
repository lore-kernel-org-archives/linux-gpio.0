Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F3CE37EFF8
	for <linux-gpio@vger.kernel.org>; Tue,  7 Apr 2026 06:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775544173; cv=none; b=jWhLMWgx4H2UP9bGvJ6w/Lc1BYiUglEnoGTUBKQACR3OP4pIwzIYCi54IQWI3c9vofuFsFJBjpOTleTVp1L+jEm82PRiLGjKizpt6ts08N1OvUYAqzH1aneJvSKPs7E6qKC6MpfDQDD3MxG/Du3zk4Vrvzp9yuOUz/jOmEEDtpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775544173; c=relaxed/simple;
	bh=qDAfbiHSnbyMDi0ClqOiUyToXUmimQ+jOZYqbUEb90Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mPf/kDKyV5BwqUu8hxLthSGTJo+41krAv1DSy+RzLsDFRVXvggWysoiBqXnRfoYNI9QiOBGEyghCOwtrrpuTziItb+8gKOJ7X6TW/gwtW4GwEHyVD9+WO01C7JeJAliZcKIWYw6Hq5PXbRav+9uCNAedEO7tqWMBViCojn2g5Dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N5Z0GGV7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N5Z0GGV7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F854C2BC9E
	for <linux-gpio@vger.kernel.org>; Tue,  7 Apr 2026 06:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775544173;
	bh=qDAfbiHSnbyMDi0ClqOiUyToXUmimQ+jOZYqbUEb90Q=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=N5Z0GGV7cAApHOSLXuu6iFuu3DGA/kTNUs8eL0zAKYCyKEBcLs2pHv/IkpKf6KpBr
	 SKWngl5zGZkVYpSSn7jC7gdeUlqNaIMm3gBVbUdwAIOCvCD2A/g5RGfDPa12VXG/vX
	 qMplnLINusUn+MRtdkmIllfvsR5Cq/8sStkNDX0TjHNYsBG6AI7+2opcrvBKYeNwlY
	 kRhTMghwIM/wC2tjrE6cjof3iwwWOcUY+dsgE3DAZqotA0a1o6cBqJw2qGWY4ijFCQ
	 VCTNZlDe36kFlkX01SlsoMHw3rZKyEkx2oOwe+tr7ItfcGW/ub47JP56iERx83NQpO
	 Fd8Dh4uFfik7A==
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-79ab3e26cceso40257307b3.3
        for <linux-gpio@vger.kernel.org>; Mon, 06 Apr 2026 23:42:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWkSa01xRZC7lycg1/+UgjtGcTARxQLVr3mY9gZBWoPpRh/j8Wh8qypc6hxVjtki/WslfYeogFnrOO8@vger.kernel.org
X-Gm-Message-State: AOJu0YwyDhNv8GfVweFQgzfdlL7mOnWbF8zorU2bHg0JYpzHrhE1CjH9
	kZb7t4kV4wWoqOzAOpv9vcnUvzyT2M/AEyEIIR8d5tr5p4/sEA/BQXv1vOoWPB/LflLOsbRD1HT
	0Yii9s2fNbF7qneSZQ8jv9EVPl8+VCpQ=
X-Received: by 2002:a05:690c:39b:b0:79c:c51c:7f41 with SMTP id
 00721157ae682-7a4d556e135mr152089327b3.29.1775544172742; Mon, 06 Apr 2026
 23:42:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260327-pinctrl-mux-v5-0-d4aec9d62c62@nxp.com>
In-Reply-To: <20260327-pinctrl-mux-v5-0-d4aec9d62c62@nxp.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 7 Apr 2026 08:42:41 +0200
X-Gmail-Original-Message-ID: <CAD++jLmoHiJWV3J8f3TtpmQWLpUFD24icQEv2cbO3+x7775zxw@mail.gmail.com>
X-Gm-Features: AQROBzBpYwAeEU57mNfPmCh5f-XPkak3_u6jmK4j3TgdDlcVW1C-tWvRlAIpdbI
Message-ID: <CAD++jLmoHiJWV3J8f3TtpmQWLpUFD24icQEv2cbO3+x7775zxw@mail.gmail.com>
Subject: Re: [PATCH v5 0/7] pinctrl: Add generic pinctrl for board-level mux chips
To: Frank Li <Frank.Li@nxp.com>, Peter Rosin <peda@axentia.se>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Haibo Chen <haibo.chen@nxp.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Ahmad Fatoum <a.fatoum@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Frank,

OK let's apply it!

On Fri, Mar 27, 2026 at 10:34=E2=80=AFPM Frank Li <Frank.Li@nxp.com> wrote:

>       mux: add devm_mux_control_get_from_np() to get mux from child node

Didn't get an ACK from the mux maintainer for this but this has been going
on for long now so I applied it.

Peter: protest if you don't like this and I will back it out.

>       dt-bindings: pinctrl: Add generic pinctrl for board-level mux chips
>       pinctrl: extract pinctrl_generic_to_map() from pinctrl_generic_pins=
_function_dt_node_to_map()
>       pinctrl: add optional .release_mux() callback
>       pinctrl: add generic board-level pinctrl driver using mux framework

Those applied.

>       arm64: dts: imx8mp-evk: add board-level mux for CAN2 and MICFIL
>       arm64: dts: imx8mp-evk: add flexcan2 overlay file

Please funnel these through the SoC tree!

Yours,
Linus Walleij
