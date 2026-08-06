Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 108ED40A92E
	for <linux-gpio@vger.kernel.org>; Thu,  6 Aug 2026 21:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786053018; cv=none; b=Gd77yQimRnV2mGDvT5zZyAoBNlwJtCDYWUzdkcrIS5dXD9PqzXYRAE91O0Jxy/JC9j1xEwezClc6Veh8UiWh30RuDlwjO1yKeSJvXTdCZD24HsNzQmUULFcygjZkAYM2YcjvhSc5y1S9uTmAnRx16x3A7NAzmPOodHaIx1nb9LY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786053018; c=relaxed/simple;
	bh=xcy7vptF/hy+DPHjB4Gbv52wsdaMVtOZt/3bPVoHJCQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uGmwq59aZiolOyPl5xDj/5voR24Sv33UR5aSymtzTNBsX0kS1WYPQYutdds2KBiqGCWBVRuAUnKrtshySA94nvkWVsM0NCmqVNTSpv/pNt9LVQOxi0oKJf09A/mrefHKDNHa2bjh0mE21mSLorC1TrQvo6jYs7D7KXXogsgVUw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ngV5zpVu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ngV5zpVu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EA611F01560
	for <linux-gpio@vger.kernel.org>; Thu,  6 Aug 2026 21:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786053016;
	bh=xcy7vptF/hy+DPHjB4Gbv52wsdaMVtOZt/3bPVoHJCQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ngV5zpVu+weQOpvh2gMXaltxq8rXyXczgW76DqK2uqSDkzlHCp8bcelPQ7d9NZqWu
	 9qcU6Qmwhv0CHSXt1hjnP7i9hY6paI1gyIO8etzTx27D5tz0rjwJMs7odjmk8Fr/Fu
	 kD8cNNMtuOh7eTnilBSaWt+3HS5KaxzCmqjHLCDnEobNlUay3H5N/UpT8jXqE4EXbu
	 BWkLtbYFL/vasv6axsDMLMoFoOc+KR+15lE4BY4TnTwXM2uhVshbKk8FTOlfGLEKbO
	 gulS2mOt6lSwEKUHsnrowuAx8G14Cr2r/6lHEwtvFRkrshhUrNj/uSVl2Bk70oiAoZ
	 jB2+/rorUgz1Q==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5b0f19bea2fso2805561e87.1
        for <linux-gpio@vger.kernel.org>; Thu, 06 Aug 2026 14:50:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoAN0mxGQBIx3/tM2dwGDbZ4t/6SoBMPQFJ1rfBIzCFp37hy60RCTLV25llsDGzTR2MgNYtubae9M98@vger.kernel.org
X-Gm-Message-State: AOJu0YwzxM/UFOjCZC2nI7h/nlZEhHi+6p6xTC34xdMkJxsFxmE4VpNN
	+8hWEjfvEiZK/dVnYDoer/832/IgdojE+UZpQZP38Pmy9tGDrJWaESvG+c0cVVdq8sjrqC57/wj
	tmsfOecxcvbSv0iUTrjSA5ljJpJm4rTw=
X-Received: by 2002:a05:6512:304f:b0:5b1:5807:50f2 with SMTP id
 2adb3069b0e04-5b303cb381fmr548646e87.43.1786053015336; Thu, 06 Aug 2026
 14:50:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260802-b4b4-irq-trigger-mask-gpio-v1-1-948973636c84@oss.qualcomm.com>
In-Reply-To: <20260802-b4b4-irq-trigger-mask-gpio-v1-1-948973636c84@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 6 Aug 2026 23:50:00 +0200
X-Gmail-Original-Message-ID: <CAD++jLmFruzsuSCgzKCZoy63dgTPi=Hci-xgj76315ht9ttFyQ@mail.gmail.com>
X-Gm-Features: AUfX_mz1H-BHPNicMG_kro-JKcpFPgsijOdPLrxM4JqaXBQO7QyYZT_KtNKmkEg
Message-ID: <CAD++jLmFruzsuSCgzKCZoy63dgTPi=Hci-xgj76315ht9ttFyQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: Use IRQ trigger mask helpers
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Keerthy <j-keerthy@ti.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Grygorii Strashko <grygorii.strashko@ti.com>, 
	Santosh Shilimkar <ssantosh@kernel.org>, Kevin Hilman <khilman@kernel.org>, 
	Robert Jarzmik <robert.jarzmik@free.fr>, Manivannan Sadhasivam <mani@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, imx@lists.linux.dev, 
	linux-omap@vger.kernel.org, linux-unisoc@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 2, 2026 at 4:11=E2=80=AFPM Maulik Shah <maulik.shah@oss.qualcom=
m.com> wrote:

> Use IRQ_TYPE_LEVEL_MASK and IRQ_TYPE_EDGE_BOTH instead of open-coded
> trigger type combinations in irqchip callbacks.
>
> No functional change intended.
>
> Assisted-by: Claude:claude-sonnet-5
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
