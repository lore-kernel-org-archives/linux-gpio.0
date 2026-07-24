Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C661E39A7FD
	for <linux-gpio@vger.kernel.org>; Fri, 24 Jul 2026 07:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784877884; cv=none; b=dqFu0eGpVRPxTjNnctJpZLtUv3/H4260kO+5mBBlE1tHLGqqJDLbS9rx34j2JzGPZQPXUpFgsD1g4uAupqxeDMGfERc7EiRgso+LHD9eOfNU+3xOD5RYdUBs2y8qH/r07665LRttkvmwr4RKiA6fFy1sEnZWkyGpc6JUg4xvi5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784877884; c=relaxed/simple;
	bh=jvCoVMrq482sRltMKIA0wngG+Be2zNs5wkXwHMhSAUg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZoTawnLmaxFjn5nQMAU8jJ9zYQuLuhKzvH2P3j1GJS2VzmTGcVQttOXBZLYgwk3SwmI3CH+QrAh1EAAFxO2C/VYW+DreUxQEUDDz1d47YSr7tOCGUatl1+YBzBrLXB3LwcTsB+mXZ16C9TzyjI8JDSJpL12JqHfWFuYKBOngIYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GHNyHY4h; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GHNyHY4h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E5071F00ACF
	for <linux-gpio@vger.kernel.org>; Fri, 24 Jul 2026 07:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784877883;
	bh=jvCoVMrq482sRltMKIA0wngG+Be2zNs5wkXwHMhSAUg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=GHNyHY4hC7tojuzaxlZtjiFy+W2Qk8/5I2WoTb6mbQZ0xAjikAArouvFN+l07ZCvO
	 brE8FuPIw0Aru8OuXBQhtcU7m0cz7TR4lmGhST2Kj/RY757fAlXkXssOyVT0Q2LZKM
	 otyrVgqN0reooRcHojkIbP07aeS4c73hdiXMqtE2vvC+aeD1cPY9iuRysB3RmDitSB
	 r7yDUqn30oQH5yrPu8nyWihTTbvAkO7GpiNVLakd7G2jxkvtwdfe60LebsJVTIhOjt
	 ngEYp6fjbVTeuXYkUN03sB4L/YPIL704ulORfYx3eJgnygH3bJEvugSb1EwI+FNGCH
	 b4mgnvHXPHTpw==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-39ca0a30148so1051651fa.3
        for <linux-gpio@vger.kernel.org>; Fri, 24 Jul 2026 00:24:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoxiJjk1GFBVz909nQigqaSeQrA6p4oTWBRynP/v0MGPzXn8YNaC3h0nBE1rPjZ2JDwgT/aVK9q4dND@vger.kernel.org
X-Gm-Message-State: AOJu0YyCJppFmGDfz9/znPY41zdGsfoD4KbdlySwJ29UbvqXrCJYIBir
	bmma2JZasfj1r2FaXlXre7t8d8u2lZfzi2b5yiNFddBPWfLJ4gfB+4lRSJwaurGaFncIA6DnSX4
	AmSSAqryPKZlWxHPfXso2IDdkfzniQk8=
X-Received: by 2002:a05:6512:12ca:b0:5ae:aeeb:e902 with SMTP id
 2adb3069b0e04-5b2b2e4a6d1mr1388989e87.13.1784877882305; Fri, 24 Jul 2026
 00:24:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1784013063.git.u.kleine-koenig@baylibre.com> <72f0871dda4d65bb2b6ff8827da6a3b2dfdffab6.1784013063.git.u.kleine-koenig@baylibre.com>
In-Reply-To: <72f0871dda4d65bb2b6ff8827da6a3b2dfdffab6.1784013063.git.u.kleine-koenig@baylibre.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 24 Jul 2026 09:24:28 +0200
X-Gmail-Original-Message-ID: <CAD++jL=Cu=CKVdFTyrf7qfP--U-K==6Q-oMgerMfian_pwks=Q@mail.gmail.com>
X-Gm-Features: AUfX_mwgzz4U49kjYn2t0Q6F2gaYlikzFa7qviMieYEmwgYwO8V-etZipo96ywY
Message-ID: <CAD++jL=Cu=CKVdFTyrf7qfP--U-K==6Q-oMgerMfian_pwks=Q@mail.gmail.com>
Subject: Re: [PATCH v1 07/20] gpio: Add missing OF module annotations
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Ray Jui <rjui@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Imre Kaloz <kaloz@openwrt.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>, 
	Daniel Palmer <daniel@thingy.jp>, Romain Perier <romain.perier@gmail.com>, 
	Robert Jarzmik <robert.jarzmik@free.fr>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 14, 2026 at 9:25=E2=80=AFAM Uwe Kleine-K=C3=B6nig (The Capable =
Hub)
<u.kleine-koenig@baylibre.com> wrote:

> A driver module matching devices using an of device id table is supposed
> to declare that in the module's metadata. Add this information for
> several drivers that failed to declare these.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@b=
aylibre.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
