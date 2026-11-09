Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794210021;
	b=BAdK/QXfSae7vknx04yLGCP/aWmssUtz8axOFb8MErAZ/d5xXMzb0+AYLIqDqQ0rjv5h
	 g/fpLJSXgJVyn9l+xGeVp2RkU/7a9soICdjWmaoLGfvOrZ/AZKRi2hq65rXbhyxUeNhuU
	 HEc1DCilvpBsBPjFjwWTvWXspY2TpFtyToVIT/raVzyarb2KW0J+6VXivySttZv085iNg
	 YSsuQzdNBb/aFhBt65Q+gEGVfG+WLVG8GfJHU9LwCuxSZLAs/2gQo1EgictFrSY4aCaSJ
	 8GEE+uuJo7B8+U5DpO1UTwaqiSy3b5lQ0kiZvSZonz8SXQzeK9R7k4VFNuhuStZt9hQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794210021;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=qbtFVfAV0d//avrt7X6KHwZhQyPReObvw80fRr8okBY=;
	b=emxe3okId1Y2c4uzNkOfoA1r/7Bgr2twlXc/2HvR1CcdTr0u/LNI66rA3sRusK4VbIw9
	 VbL78L8BdsSDDk6Xlhgnk0zyeRLau8GwZTR63VORUKiPCMY90JTXUhmlHaWF+SDwGqDI9
	 M2q0GMqP8XIzKb3KwirjQesBmvumeQQqEYTxMIuQVuge8SUsmBdrg8jHh8FI8ajfgIXNH
	 +bEKlGc7JYnjbVxWEWwTfdzBjzOzeDxd/RkqnIQGeH0L6cahvxSyIKprCwG8Vzuhbt4uW
	 lD7wYSd9gACYi99f7jMsWhAYMufD33dzgsTsR00F+aDPXbhNjzW3Oc9ljgN8ipzG+tQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Fw1HJ3eB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.180
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E6A9606A335
	for <linux-gpio@vger.kernel.org>; Mon,  9 Nov 2026 07:40:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E6A9606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Fw1HJ3eB
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cc4aa0246b7so143378a12.3
        for <linux-gpio@vger.kernel.org>; Sun, 08 Nov 2026 23:40:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794210020; cv=none;
        d=google.com; s=arc-20260327;
        b=OLQbnPa8fCcTvePrktgm6nSapl+Ux+6+YswvtWnlk79G+l+1s/brpbDmA1ae719mWw
         ULUy38oe5xN+TD1qrdzVxLwAz2a+gOQFlLxdVmNVmOVw0s6G7WzPvtINvWJIOAOCaXHR
         wXSPFBOXSCsF4p6Yk/R7qwoynSMFUT0YAsCQgQQG1tYtqSHeYXSMtEcjVuIcRGAjVhPe
         EIQy4JHXNJW3kpFPU/C34bRpdAyleyXpAymiOQ89VqC0oJ81w+J8dIa04rP9UyIRrVYu
         2BR6kOpgSV4g+BjEMSyz/vG3bFK8aQpqzYwV94RjsBJ2GlPCrvRdxI/jsS2kfy1l90w3
         p7RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qbtFVfAV0d//avrt7X6KHwZhQyPReObvw80fRr8okBY=;
        fh=Kpsm/P+kS51xUQFQMP9JTSmmy+tg1k8lIp5EjJfUTx4=;
        b=r3Qc4Xc8GeyDMQo0chQ41bN1RUBcO/Lgu5aF3A1hfSZRo0dbVNVPR4oVQCHv+HF1K/
         JyKkPuF9+FkDkGCKysGHfafJfo6EMihyWr2HwcAObBbICL8g2p9XuP085XT0DFUJs9Yf
         2MOtpuNDlU9tZFWteNPRp8D+hzQI2D/pvyEnynxaM03wSLJFqJ/ddeNnJnl2qeZqYEfx
         SVqwx/RmVczuypDpmDk25v4aMjWeBrVTC42URejH7UULtBiN14Anm5c/C5yToK4TGpcC
         4NXwA92rLN7M9ivQ/TVHhTd7eXKig23f6k3Gd0TJpvJ8aEMvn4lEpeQEgYqFrJLhwC3v
         Uxrw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794210020; x=1794814820; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qbtFVfAV0d//avrt7X6KHwZhQyPReObvw80fRr8okBY=;
        b=Fw1HJ3eBrEG+YcG2OfXIKNyXLbtxL6pFyShNR64xnTBicLVJTLcqI70PP7XlmXPNx6
         VWmQ662eksYGc8vJo+lcMpjTIaYcJB9aokKPIxavS8OWhjpOs8W89bix1ozwYvKeb3b4
         M7C1Y4n+R7cdsAeFDh3I3fT0WNvzf0CnRZWDlQZYC+5M2rSyX8wMQx9uS+vQs8QSo0d/
         2FLip2Uo0zLuYIubK7TNTBZ4sl8ZrZ+JeHk7SDm/ZlHHFtWu1M3YyNEi+YttPBGWC2RM
         X/hXAhXzRlZNf20NwByFmIPl+GnzmQCqAB4nehLzmm3jWxLA5k3xC+msTg/JbR6XvUqv
         ep4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794210020; x=1794814820;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qbtFVfAV0d//avrt7X6KHwZhQyPReObvw80fRr8okBY=;
        b=cD1yYGG8asNXii2yZSfztxC7mVGV3PuP6fMyfHiWtzwJlXV1sH5ogo9w5O4VAwrYAI
         lvcYTub5v+Q0NwCIi6TKjxcrZcGTgo7AyuxNXu9+7KKCjeP0G5LBdqKM5/sef/YRAH7n
         waadrn7pQFFpi78dg6sQDIgAiJpCYkzk2vS/Cy5mWiWU7c+LJN6h/Ao1kr3CQtH05jeg
         akh/KyMn1neB3tALVIjovw9K1OHAP4GmXT3KaLQ1g9oEIqTCKTjah2umgYLDUqkStM6c
         ou+AT5ZAURJ1Mw/qA1ODb287/qIeV6//ItielpiG7MgXGObhgrnvG8mkGzWds4YPGQOE
         Dh6A==
X-Forwarded-Encrypted: i=1; AL+hErEJBqCgTdrDr7RmGw0qwlprgUhZGCJPVymQWw0pQHcYUNw9AmWxnukUejugAqyu3K6/N0rDEIaYWCgI@vger.kernel.org
X-Gm-Message-State: APuU4Z92rizDNBmDa/0QvrrlzjfWyvI+AQc0TB7mGDEvQ/V5Bs0YgMyu
	p3MwAgs4kKrBUd7E6gpDoEwQUQw9esijMgVqlmXPj4zM4LcoiJLoPSNufoGwNjexx6joB/dFbHf
	SiMF76+zGxN/2nKjSIQLWnGbajb+hKP4=
X-Gm-Gg: AYBFou3xBxpXKsDJA5tD9LF+SuSTKT44oW+MnMUHmjJAFMOhPIZ2Tjk2qAWoQQ0mQ5+
	vbMLImcH8i7gKUvlqDZu83zPqBlTQt215Wz6ykOZQ5O8jTK19SsABhUKce+D1VOOFUo2V9HyOQ0
	AoNcmOUFxg3MIjSRelhWjYVCzfNA/1ekmTmx0ieQ/wGL+Qw0IEk3ZmC99GNXUVQjd2/aTrv3VU2
	B2rdL7Pm1319AmVpJ3qwIn/gbZ3aRMDn3DGDvRJ9G6Gg/KscN4GfDa9weWgSOc80hRx3Dn9gytz
	Q26/62/dVdn1152ZXtXgHgI6mL5oOB4vzHK17IlfPgJ96MORP2LGiWKyQn0qpzxmYJrSN1UKmOO
	5W/WAEECcCE0w+Ut5Tw4Fbc6H5PFVILGtP/I=
X-Received: by 2002:a17:90b:384c:b0:3ad:a270:a623 with SMTP id
 98e67ed59e1d1-3b12d107e44mr3364118a91.4.1794210019701; Sun, 08 Nov 2026
 23:40:19 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102135330.2493332-1-robh@kernel.org> <CAAfSe-uD=s0RpuqQ_h+_fErcEC+G=N_LA6e=p_sXJ=iG7jMc3Q@mail.gmail.com>
In-Reply-To: <CAAfSe-uD=s0RpuqQ_h+_fErcEC+G=N_LA6e=p_sXJ=iG7jMc3Q@mail.gmail.com>
From: Chunyan Zhang <zhang.lyra@gmail.com>
Date: Mon, 9 Nov 2026 15:39:42 +0800
X-Gm-Features: AclHuK_dnPMk52UN3-2_wspDGRy5a6s-cwmnh8paY6ZY-G54Qz5KZ0bygsAWCVc
Message-ID: <CAAfSe-shr1+0YpxEvf+4k+DyGe3==PUiD72CwjE+RC4gX-ShiQ@mail.gmail.com>
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
Content-Transfer-Encoding: quoted-printable

On Thu, 5 Nov 2026 at 10:39, Chunyan Zhang
<chunyan.zhang@linux.spacemit.com> wrote:
>
> On Mon, 2 Nov 2026 at 21:53, Rob Herring (Arm) <robh@kernel.org> wrote:
> >
> > Unit-addresses by default (and most commonly) are hexadecimal. There's =
a
> > number of cases using decimal patterns. Fix all of them, limiting the
> > pattern to match the 'reg' limits if there are any.
> >
> > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > ---
>
> [snip]
>
> > diff --git a/Documentation/devicetree/bindings/thermal/sprd-thermal.yam=
l b/Documentation/devicetree/bindings/thermal/sprd-thermal.yaml
> > index afa551f6185f..222d70baef1e 100644
> > --- a/Documentation/devicetree/bindings/thermal/sprd-thermal.yaml
> > +++ b/Documentation/devicetree/bindings/thermal/sprd-thermal.yaml
> > @@ -47,7 +47,7 @@ properties:
> >      const: 0
> >
> >  patternProperties:
> > -  "^([a-z]*-)?sensor(-section)?@[0-9]+$":
> > +  "^([a-z]*-)?sensor(-section)?@[0-9a-f]+$":
>
> Reviewed-by: Chunyan Zhang <zhang.lyra@gmail.com>

Following up on Andy's note about this:

Please disregard my Reviewed-by. Even though I did look at some of
the other hunks, given that I'm not familiar with the other hardware,
I don't feel comfortable giving a whole-patch Reviewed-by out of
caution. And since I'm no longer the SPRD maintainer, an Acked-by
wouldn't be appropriate either. So withdrawing is the best option =E2=80=94
sorry for the inconvenience.

Thanks,
Chunyan
