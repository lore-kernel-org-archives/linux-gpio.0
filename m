Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F4533FD152
	for <linux-gpio@vger.kernel.org>; Thu, 30 Apr 2026 11:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777547729; cv=none; b=S5fSa+wYjt0OKyljWu70hugtSF/5/68nTA81Tc9W5CXBR1SGg1M1fz8Trv1bP7ynB9XbXecFttVV/6dnZRXnWSLimp8l9i2eYRwR1TGTal2l6Jes9Vpg/adKdz7tkelT2B/wntGhqqsDUQoB4Z1gBOBjyodn2ufH1mipDFwNQ+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777547729; c=relaxed/simple;
	bh=WbVGwnhMK3bVP2dooowUwCI372Q+68vRv53kKfxGrKw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z5+qdGHRF8uXuMNTLLnxpU36JqidDITAc7n8Tq7fHW8vbUIyE1GBpBRWoeGaRdtpKgZ0UAysmgOW+4L2XxhTha7okQA55Qlc1F9Zq5ROIwc/WhDccrp/bOdswcGPk/nYUUpHiADlXZkb7S8SAeV5WJD65OwSnN4Q/QlnKUoU3zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pJDvayFI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pJDvayFI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C114C2BCC7
	for <linux-gpio@vger.kernel.org>; Thu, 30 Apr 2026 11:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777547729;
	bh=WbVGwnhMK3bVP2dooowUwCI372Q+68vRv53kKfxGrKw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=pJDvayFIFBrQ48FV6k0MBJTE7omjJhnCiCKI627UOkdRQaAlxmgxjw/VBYEY2TFZh
	 M75KGSB6FdqISbX8ea1mMWiz+u4xP/OMeXC9zsm1gApiA8nigQ0ib1TzQvamF82WMS
	 gZaidfIliv/1zOe7DntZ9niRlR9DFGCcKjHCxBUVHJzaqOMLqhnCZsZXZG3xgOiu42
	 eIRRcQ0GilVVk2LUHKddLLkgzL8D6e3EiyYzNkzR0MMZXghLMs1iM1sZOx9bS55d7x
	 BY22wMlZaVFDU8tEhDKpCLHrDllX34Ui7ck037ifV8eZvSteD/xP+xRkLC0K1x6PqD
	 jUIkfuOTEZ+/A==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5a74ac8b40aso891746e87.1
        for <linux-gpio@vger.kernel.org>; Thu, 30 Apr 2026 04:15:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/mmoiZLljK24T0tkh3BPFPlK7qxWp26NHEj3/Nz0oZOIEmAXWoAM/BGqWj1U2NelkmmfKLQB/PYT5e@vger.kernel.org
X-Gm-Message-State: AOJu0YwAWYHShq56NcACesVkJr50LZjNDTbKCbFtgGtqmcnAIqov1xLJ
	VnQQL3g822X5bZ9FzAwPWJHBe7PD2szZaYkkMZ9oudGSUYBN0Ry/nXP9kn3eOd0V1QYPS6Ohlsm
	2YQHYEmzi1uZpmK3vc6mlv/pOVcnOu6A=
X-Received: by 2002:a05:6512:3b14:b0:5a4:a4c:658b with SMTP id
 2adb3069b0e04-5a8522dd8f1mr808421e87.40.1777547728018; Thu, 30 Apr 2026
 04:15:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260427021148.2049555-1-wenst@chromium.org>
In-Reply-To: <20260427021148.2049555-1-wenst@chromium.org>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 30 Apr 2026 13:15:16 +0200
X-Gmail-Original-Message-ID: <CAD++jLnKC4o6e2p0qJ6_2s2CfK6y+yKTw8gcGAJQnpOOmML_QQ@mail.gmail.com>
X-Gm-Features: AVHnY4Ink9nKnmzrWklC6PMDhHtyVmdHrdEJDfXlUWMPbQa8lwjP3yaXXRPJm1Y
Message-ID: <CAD++jLnKC4o6e2p0qJ6_2s2CfK6y+yKTw8gcGAJQnpOOmML_QQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: eint: Drop base from mtk_eint_chip_write_mask()
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Hao Chang <ot_chhao.chang@mediatek.com>, Qingliang Li <qingliang.li@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 27, 2026 at 4:11=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org> w=
rote:

> When support for multiple EINT base addresses was added in commit
> 3ef9f710efcb ("pinctrl: mediatek: Add EINT support for multiple
> addresses"), mtk_eint_chip_write_mask() was changed to write interrupt
> masks for all base addresses in one call. However the "base" parameter
> was left around and now causes sparse warnings:
>
>     mtk-eint.c:428:44: warning: incorrect type in argument 2 (different a=
ddress spaces)
>     mtk-eint.c:428:44:    expected void [noderef] __iomem *base
>     mtk-eint.c:428:44:    got void [noderef] __iomem **base
>     mtk-eint.c:436:44: warning: incorrect type in argument 2 (different a=
ddress spaces)
>     mtk-eint.c:436:44:    expected void [noderef] __iomem *base
>     mtk-eint.c:436:44:    got void [noderef] __iomem **base
>
> Since the "base" parameter is no longer needed, just drop it.
>
> Fixes: 3ef9f710efcb ("pinctrl: mediatek: Add EINT support for multiple ad=
dresses")
> Cc: Hao Chang <ot_chhao.chang@mediatek.com>
> Cc: Qingliang Li <qingliang.li@mediatek.com>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Patch applied because looks correct!

Yours,
Linus Walleij
