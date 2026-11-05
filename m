Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=18.194.254.142
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793846397;
	b=SYcO0kmzKbh6iU+f7nDikIf2pU6YyG9TJPU967NDsSas7Hz8vrYy45PNPH9bX0GLxeFr
	 bWIheOu4YUwcNOri9Ec+l3vYewGA1fYpv8Hv8SqN85hWAjo5kK3ki+ipndIdQRjVxeEIX
	 bMKiI9cJSWiK0A9DCXri0qrHgDMTrJpEaj6Vp5dS3r7l3TR4tTBieB4HJCL0/zKsSrT1D
	 xQRJsfACndKmVgIglH/eCG7zoXa+uYpHLznagjszxjSaGZuz8R0JEIrg/HjeZxpvsdXvv
	 uV4NEyXTIkYnSq1Xr+/LLrZD9ZAS4YlyPjfHgDhnV7W+ICALJQTCEtm96dhxFvEMucw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793846397;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:
	 X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=8nHg2KK9YdUFsDyCN5OyhUk3RMp8EQBW/fDZ8x8OirA=;
	b=kXkVeDZSHk4q+PqulguGrGjzw0TkGyVhQ/vSV2hcc/vRhORGZgZXztGvy4QcuscN8ndW
	 fWyZw4hjRXi7duQ5ilfxg+YzSjxkLkKI2ttT6S6OUx+RRCrPG9b8e1GzIAkbWutav+Ohd
	 7bVnzuEUaXmTr+4NecrG4wLfXiFaV9YtBxAUuSetXkqpftpEaxnjZ6Kf7wq8ERufiRbiO
	 ytZGU5KpQoBcA7ZVhnDuNLkHnZJcKAzTAslPL4zT2Frl1Wii6e4AaRmRLbbEH7Z59GtZx
	 EpkvlCsgF91YYxLQ+X4lsqT6fH4VpJPglsRyDTOSH96BWxPLAKkjFVsSlot+99lvqjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=Nqz4+xih;
	arc=none smtp.remote-ip=18.194.254.142
Received: from smtpbgeu2.qq.com (smtpbgeu2.qq.com [18.194.254.142])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4688C606A332
	for <linux-gpio@vger.kernel.org>; Thu,  5 Nov 2026 02:39:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4688C606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=Nqz4+xih
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1793846386;
	bh=8nHg2KK9YdUFsDyCN5OyhUk3RMp8EQBW/fDZ8x8OirA=;
	h=MIME-Version:From:Date:Message-ID:Subject:To;
	b=Nqz4+xihSRA/SOazc9ytMPaaon6hM2Zpa/k876GDLA/rAvSdmROK7bgusiNH5yJRm
	 MxDa4YviOx4vP5CKZmEuJc3kfvwqLKu/L2OohyPYk21mJnJpm1Y7KU5OpOGkVf3+ti
	 zev+B3KBBNrXf3bQvlO8tLbPTEvcdSoXebx80EGI=
X-QQ-mid: esmtpsz17t1793846385t1b22be7b
X-QQ-Originating-IP: QL9fQGkjnXqfdebtZCaB76lvmgiYRS/cWs3r7HDrpVs=
Received: from mail-pj1-f51.google.com ( [209.85.216.51])
	by bizesmtp.qq.com (ESMTP) with SMTP id 0
	for <linux-gpio@vger.kernel.org>; Thu, 05 Nov 2026 10:39:43 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 15043794913546078428
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3b0a519049aso697641a91.1
        for <linux-gpio@vger.kernel.org>; Wed, 04 Nov 2026 18:39:44 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBx+8YDDQLbeqO+6dc7p4DBzozjPyd1Ntkj2wCojYX/qs0pzuPyhMar+yg0S5xzIyQ7sARDNCX74N9bl@vger.kernel.org
X-Gm-Message-State: APuU4Z9655Nmci1yOV3JXDY2ThI2nN5wW7XlbYG0O4UfB0P0jQvIQKUe
	9RiZgmPz8AsP0iohsf9mCewT5rzq2MsFCeQWMy6SmQmSEOwLUNrz7xHy2OnCYh+/W0JE/nLKUWJ
	JSZwj286rqtt0OM8n7JGIzRGk+4Ge2hw=
X-Received: by 2002:a17:90b:562d:b0:3ad:a462:f07f with SMTP id
 98e67ed59e1d1-3ae8982c1ffmr16206466a91.45.1793846382617; Wed, 04 Nov 2026
 18:39:42 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102135330.2493332-1-robh@kernel.org>
In-Reply-To: <20261102135330.2493332-1-robh@kernel.org>
From: Chunyan Zhang <chunyan.zhang@linux.spacemit.com>
Date: Thu, 5 Nov 2026 10:39:06 +0800
X-Gmail-Original-Message-ID: <872B2B4EAE847E62+CAAfSe-uD=s0RpuqQ_h+_fErcEC+G=N_LA6e=p_sXJ=iG7jMc3Q@mail.gmail.com>
X-Gm-Features: AclHuK-lEE7dv-iC1Lsio6aPGOufL5hgelB1hFojisk2-zoMsjC0hhsp9HraOXA
Message-ID: <CAAfSe-uD=s0RpuqQ_h+_fErcEC+G=N_LA6e=p_sXJ=iG7jMc3Q@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: Use hex unit address patterns
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vadim Fedorenko <vadim.fedorenko@linux.dev>, 
	Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>, Jiri Pirko <jiri@resnulli.us>, 
	Ivan Vecera <ivecera@redhat.com>, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Olivier Moysan <olivier.moysan@foss.st.com>, 
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>, Lee Jones <lee@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>, 
	Ulf Hansson <ulfh@kernel.org>, Hans Ulli Kroll <ulli.kroll@googlemail.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Shawn Guo <shawnguo@kernel.org>, 
	Chanh Nguyen <chanh@os.amperecomputing.com>, Alistair Francis <alistair@alistair23.me>, 
	Julius Werner <jwerner@chromium.org>, Paul Cercueil <paul@crapouillou.net>, 
	Dmitry Osipenko <digetx@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Ray Jui <ray.jui@broadcom.com>, 
	Scott Branden <scott.branden@broadcom.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	chrome-platform@lists.linux.dev, linux-gpio@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-hwmon@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-sound@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-tegra@vger.kernel.org, mfd@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-mmc@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: NpQfkv3EFNIVX92d/wMmgAtOEPqX9KWfSpdQq654D9/X+I8oS3sZ1cQ5
	E9dMZUBBbf28lnI7Gmgl287ajGp8UXAsuPspp3Yz1ZDlbEfWCdtUIYiWG5h8qfiZQjv551s
	jJIXtkIAhvrxpMEpLF0VnC5v/9Fes6azhJpCufvPuZDJRwDqTscG9pGHZ8GdZP3UIb8spvi
	Jopz19Xr+5InQL2OfykApAjUtU5YcILYHjuy4kz9QC4vnlXsiu/EPs8wjr4Rs7iVivRexM3
	8AWlNLj/izC0FrEEsU/3u4yo5EaGvnX5eCQOXDK8v9PTGqauvv66Q9CNoREqepmXNTrCk9v
	y9pckvBdENURdCV+U8L1eSp+ncvpWHm8OICBhwniVYGjNceF362mBsuZorK0z6aRg4I/5vH
	jNenayPTQ4kGHOx3Rp3YcMdV6maG2GPGI2Evw7UzX5ity3sv+AjzqcMOeEYySZuIIdF/Ln4
	sHfA7U6jlxRjJPimGAb9ilQ9Lah9SfEKgABVa0xRjtKk3FgiiwdKTLLmCA6DNdL7seddIu/
	11wROkHRg7NYK/RZdeRx/suVGwZVrYYWd39rwUZxte/1mtzwjUKt5B5CR8WbENJWIkkRlRP
	Y4XU2w2pMZ2wSSB9QzNypWDVR8rDZUtC+RT6tHRsQn+Lm125DfyILKfkHdRk+8m43jCPlj6
	HafkaT6ygRk6hQsDcsM8qBkGpuwEJNR9wmnVIQTUpUTyOq0sk1qLM2TaL4g+Hn5n+W6ykpp
	PDrpuoV4NtXchzbWPDE0gwo4EpUs3UKcYInUPg+yHDfgFENc8pBReYp1PcjWThH/ZX8NURJ
	sbAU46wRFzErswkChMXKEF2X2sLs1xPLZOgU7/FdgbOpdRIdy7ePMwCAXnuA8fAHHRu8Srf
	aKk71h4cIo0L/RsZ5hZgWIPuOuoC3Bl3igd/iooU64av6RU3eZCM70gh8+fcsExJwoDZwA3
	CIzVLCMVpDmAKVoY0005xLK1ySanaWN/b0oEBTEAd8eC5K4qW7XxjBU4GvZsFKWaDFQIzLZ
	BUpSKmodbH21iIXbpablywuYL9te8kmOvxqZFUGTsB7Z6pyKQA
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0

On Mon, 2 Nov 2026 at 21:53, Rob Herring (Arm) <robh@kernel.org> wrote:
>
> Unit-addresses by default (and most commonly) are hexadecimal. There's a
> number of cases using decimal patterns. Fix all of them, limiting the
> pattern to match the 'reg' limits if there are any.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---

[snip]

> diff --git a/Documentation/devicetree/bindings/thermal/sprd-thermal.yaml b/Documentation/devicetree/bindings/thermal/sprd-thermal.yaml
> index afa551f6185f..222d70baef1e 100644
> --- a/Documentation/devicetree/bindings/thermal/sprd-thermal.yaml
> +++ b/Documentation/devicetree/bindings/thermal/sprd-thermal.yaml
> @@ -47,7 +47,7 @@ properties:
>      const: 0
>
>  patternProperties:
> -  "^([a-z]*-)?sensor(-section)?@[0-9]+$":
> +  "^([a-z]*-)?sensor(-section)?@[0-9a-f]+$":

Reviewed-by: Chunyan Zhang <zhang.lyra@gmail.com>

Thanks,
Chunyan
