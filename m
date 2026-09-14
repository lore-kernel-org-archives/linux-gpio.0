Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 386BE3F166A
	for <linux-gpio@vger.kernel.org>; Mon, 14 Sep 2026 08:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789374761; cv=none; b=ujtG8x6LEv1PLKaEJF9SqHJ+ELT907d422H6J4LSnoCDpxUmBCLbiBHpAPFqo+xnxV9J6SFeDTDCKnma+qo6Ha/bXyFVVigkNy/5Ndx7GfKJ0CejG/tqKY/xEkeM+W/jx0EPYPyLgIOgeHMF+6T4zuPi19glM7NcHFZxKgp39bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789374761; c=relaxed/simple;
	bh=qXsN6ASTioxpMOZwh3003sB5uFTydTMnSnfRabI5eIk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VTVdV/O2XRSDJ9wUJQ7GfNENjnfkubT3Xn2tNP5X2FTN4mlWSZe6ootTaDooIV36xQP449+1Uj1cX/MX8RpcQJTm4Sw3BvWOZPtsjuDvIZWfYaJgjFM778814FkLRwdNgIluemurM5NcRJ1wJDP2rZc8MCOdD9Bsm6yRkG3f7T4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zhc94jaO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zhc94jaO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF23A1F0089B
	for <linux-gpio@vger.kernel.org>; Mon, 14 Sep 2026 08:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789374759;
	bh=qXsN6ASTioxpMOZwh3003sB5uFTydTMnSnfRabI5eIk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Zhc94jaOfI9Wc0yfZqw2SN4fL/8BQ6DTOVrm3T7M2HFY2WWVD3GTl/NwmkSwMNpYU
	 L1/c5HFOwq3CCbuCa9Y27W+erCwg3FCJXvuXSAqJHYC2HRVP5XBhzpCDWFLPmRULZx
	 RGqmNN3fGQSDsv44Ie3xTOcP/wCjuztNspwraeBvlcP5JlXs1xpKBn2u0FSvt5U+a8
	 bkWQQGj2bC48hZIq47vf4pd6bJ5ZOL2zly5UFLhB97jJWrWih/gduM8IeOxXXcNDMa
	 aG1ttQksY5ktu0rLBlTBnL3UyBQmOokgqlI6e0AH28Gv3RL+QtmEsm/NNIHQPFbmWu
	 ozqMZfJPz6r4Q==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b5e4f17452so1320166e87.3
        for <linux-gpio@vger.kernel.org>; Mon, 14 Sep 2026 01:32:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzKmqwjT1FO1vD2DJcwAEimHNSFnxhZSADadcJQ6VtSmR2Y6kEmlJmginpoNYwPVVl75uVNDNNxnDAu@vger.kernel.org
X-Gm-Message-State: AFuF++kAd+gA+3CQTD8/FL6OQ+LnjR6VXjYfMOfKAos8cZnJvPWDYV4W
	+QP8PP+gwmpfdkCrdJNphk2ck1uC7tn/mCb4pPpKqWbSuA2bxr1oC53TL/FII4zP70Zqko9F4O1
	mOG/DgEfuzSXbVfet046tHf+H33ahh5A=
X-Received: by 2002:a05:6512:1594:b0:5b6:183c:5c9c with SMTP id
 2adb3069b0e04-5b8ae69fa48mr341028e87.58.1789374757643; Mon, 14 Sep 2026
 01:32:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260825030428.1685182-1-gonglinkai@kylinos.cn>
In-Reply-To: <20260825030428.1685182-1-gonglinkai@kylinos.cn>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 14 Sep 2026 10:32:25 +0200
X-Gmail-Original-Message-ID: <CAD++jL=ehn-6KQhsr20_ZHUAoK-VMJRdCj0r3+BNDdWcMvrV4g@mail.gmail.com>
X-Gm-Features: AcwNN1VZWvbdY_RjRUs6KUzckceiwGii86ZoGg2mdr4PY9dss79U6PSTzN-HcxE
Message-ID: <CAD++jL=ehn-6KQhsr20_ZHUAoK-VMJRdCj0r3+BNDdWcMvrV4g@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: amd: add timeout to irq-enable readback
To: Linkai Gong <gonglinkai@kylinos.cn>
Cc: Basavaraj Natikar <Basavaraj.Natikar@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
	Daniel Kurtz <djkurtz@chromium.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 25, 2026 at 5:04=E2=80=AFAM Linkai Gong <gonglinkai@kylinos.cn>=
 wrote:

> amd_gpio_irq_set_type() polls INTERRUPT_ENABLE with IRQs off
> and no timeout. Use readl_poll_timeout_atomic() and return
> -ETIMEDOUT.
>
> Fixes: b85bfa246efd ("pinctrl/amd: poll InterruptEnable bits in amd_gpio_=
irq_set_type")
> Signed-off-by: Linkai Gong <gonglinkai@kylinos.cn>

Looks sane, patch applied.

Yours,
Linus Walleij
