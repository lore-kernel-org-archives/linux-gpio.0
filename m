Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E535421F1B
	for <linux-gpio@vger.kernel.org>; Thu,  6 Aug 2026 21:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786052500; cv=none; b=Livd8XKoGXDM6cVw6nHtYBV0/hM6rlSGwFhG7EHhSzd25FsxRvqkTGXK9tv1/CFiB4jYmb3ttQU8h92jyDS+hs3XsitfhisreCCYKwOOo4bVETDvkKxLN/AoUVxOjTtaqRy8W4DmS0bplFirCuJsHWXQuuNbReno9VdS3m+N7Qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786052500; c=relaxed/simple;
	bh=emwhs/R12V88FksqW/fCHLiEZt+g/eeVJZV7F/tinJU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EhfpPgWBGR45cLf4MsqXUdU7meaNLE5AFGFaoOdxwxss9eOfm9loIoohg2P6XkInSJj3j9sMEIEA1aaMd2lSmDNU2NGCuYNN9L1vOXIw04+3G6VYcjr6X50OxSH43hkixhpWN8jIrPfwJVS2tLxpS80lZe/+/gNmykxAupJid6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hFjhKrHP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hFjhKrHP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F5621F00ACF
	for <linux-gpio@vger.kernel.org>; Thu,  6 Aug 2026 21:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786052499;
	bh=emwhs/R12V88FksqW/fCHLiEZt+g/eeVJZV7F/tinJU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=hFjhKrHPrnTV9AX10vJFnzua6fH29RdjhXZxDjVAXlDA9J+sh6DZabN9flRgi4shl
	 d0JOIBkGrW2l6GrRxVp20xoUJoyE9KzvkvlUAUrMAp0t4sendDUS2MqPbZ7QNxq2AD
	 BvuCcqRkuRKjq6vS+/UFihOeOZJdMx92IC1CAwn/jyMZc/2BGDmDXHx7mtpFjDI7xg
	 IjpfTNW90JyxD6PFRbamS+r3NIbqIw5+It7nwLeSFzEouuWhtM4Y85eBAiw9DQD/t3
	 1ph+Qpgb/QOrp74+XR5M+nXH9kZ5F9x9pCsszMCDtQUJ5VlSCX8KkPGlIWH2G8Iq+b
	 eFhfsMc9TZjbg==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5b0117dda13so2295420e87.0
        for <linux-gpio@vger.kernel.org>; Thu, 06 Aug 2026 14:41:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqNPk9jBsqXPsWFh7F9ynOrNbnnOQLIDWARN85N1f+JfnlOzLf3SIy3W425veEnzo0cjsZJTlCdKu44@vger.kernel.org
X-Gm-Message-State: AOJu0YxYNbUEBWPmuYZV2cqQc2Idjz6314MLDLlbZS79z3F3xueh/T/+
	zmxyBr2AomaaOVdaIE6A+M+fRudJYYe/3bkKdIFf2kWbU3oEG1il6wwzifXh6L+lWzv1UTICoeK
	lljHhlWHBCBrDU0OVbYsphq5Em1VF73g=
X-Received: by 2002:a05:6512:10cf:b0:5b1:da61:a13f with SMTP id
 2adb3069b0e04-5b2f4cd3e1emr2391855e87.43.1786052497832; Thu, 06 Aug 2026
 14:41:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260802-b4b4-irq-trigger-mask-pinctrl-v1-1-1c398ab53d28@oss.qualcomm.com>
In-Reply-To: <20260802-b4b4-irq-trigger-mask-pinctrl-v1-1-1c398ab53d28@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 6 Aug 2026 23:41:24 +0200
X-Gmail-Original-Message-ID: <CAD++jLm+sfo2pB=cM3v2-ewwdkaomRvTdKh9VVKNU8mJS3wPyA@mail.gmail.com>
X-Gm-Features: AUfX_mxUELB5EjLZQ8CDlb5p0mqmJmh3sKO6rvUX7_wSkyifvS8Bgv83X4i36kE
Message-ID: <CAD++jLm+sfo2pB=cM3v2-ewwdkaomRvTdKh9VVKNU8mJS3wPyA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: Use IRQ trigger mask helpers
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	Manivannan Sadhasivam <mani@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Avi Fishman <avifishman70@gmail.com>, 
	Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
	Benjamin Fair <benjaminfair@google.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Viresh Kumar <vireshk@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-actions@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	openbmc@lists.ozlabs.org, linux-arm-msm@vger.kernel.org, soc@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 2, 2026 at 4:06=E2=80=AFPM Maulik Shah <maulik.shah@oss.qualcom=
m.com> wrote:

> Use IRQ_TYPE_LEVEL_MASK and IRQ_TYPE_EDGE_BOTH instead of open-coded
> trigger type combinations in irqchip callbacks.
>
> No functional change intended.
>
> Assisted-by: Claude:claude-sonnet-5
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>

Nice cleanup, patch applied!

Yours,
Linus Walleij
