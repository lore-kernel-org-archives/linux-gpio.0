Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F39A23F65EB
	for <linux-gpio@vger.kernel.org>; Fri, 26 Jun 2026 13:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782479860; cv=none; b=tQQIFvFkt+Iwnz+Nb2Z0jclg2uskLAYi+QA/BgNtN8frrNHEBngUXVrTrCTA8TuzoIncdlqiby2NoISPnQJCo92JU4GCGIEMnRJ3MhD7O9N1qH3Q7nZIrSna8z1Pzkor3EzChAmM8y9v1/fgq3/BWf2ajhyFE9+xfRD/J9q/Cw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782479860; c=relaxed/simple;
	bh=fQzxpHDPmMUhQ5m0EVzOtgQZ5fJ/fXzDdwweWPz02G4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hFD1iyZRzvyEw/jtkDDp5f/xPG5OBYrQr4iq8suNIJXt9sr2U61Cbf+SV8ckbL+NPkBbIkVxT/QRZDQAo+G76F4NwO8vHDs3otmz9VhxgLplyICz4Yj94FNGaMg12/5gztZ1fx6sD/J+ecHZCcinDCJkrW64dq62z0wHVlxwmCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cVDfBXK1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cVDfBXK1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A92D51F00ADE
	for <linux-gpio@vger.kernel.org>; Fri, 26 Jun 2026 13:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782479857;
	bh=A4vDT4EEZn6+2WtampBAadESwOoT43cMWLomjnlvLJg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=cVDfBXK1wi6sHolMrytW/EODPOA1l/owd9gBTTKRIYXOCo/gww7kswoB5d0AqptLL
	 kdZvipirsxhGODtRWARvvUjKBZjQZIZhlQSW5b/iknOvjsy7mV0GsUj3eRqlky49TJ
	 VMax3fOdEQvqP2nFB9Y1cxvp8JYEKg2WI98hMMz90Yc6XwDd8FgasAtKx28u8NLSLD
	 oNlBLRyCiKtak8tkdiWBASSnjXQLeovB0UkeREaHdWg2RgkiANkAM9UdHrUpRjyjon
	 HTbwzFIO9wrRc/KqKEwtnyjd+tutcI2wNZjVlvxHPxsihab+3+ABDR6Jwaqg9OaULN
	 zsNDuWsVvucNw==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-396775c2720so7227441fa.2
        for <linux-gpio@vger.kernel.org>; Fri, 26 Jun 2026 06:17:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpX411SVS8+IGuMRn4ham7MltNEqP8kvfOaM+VCBDWqwvoGg329HLCO8MrR0drHCB69fbcKq/PMzAdp@vger.kernel.org
X-Gm-Message-State: AOJu0Yxfjsa96OrwK+Qb7UjvkVRanQwtrXP9L/YKuFYSXuKLxBrbKHIR
	g/eNarR+yCC5nV+tI+p5BO0crfHOGvbVd5aYZhnRxGZ8W1ufPLney33qFYH1ZZeD5XfRu/eoLs0
	zEzbAds0IIAcvdFWyxsQAgl3pJJiV1tQ=
X-Received: by 2002:a05:6512:838b:b0:5a3:ff6b:cb5d with SMTP id
 2adb3069b0e04-5aea1f48ce2mr1706345e87.19.1782479856436; Fri, 26 Jun 2026
 06:17:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260626040112.2436185-1-justin.yeh@mediatek.com>
In-Reply-To: <20260626040112.2436185-1-justin.yeh@mediatek.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 26 Jun 2026 15:17:23 +0200
X-Gmail-Original-Message-ID: <CAD++jLkD1MPDoHwRZKdjXXdxrQQy4i0ng2vFeRzOt_KO8b8jow@mail.gmail.com>
X-Gm-Features: AVVi8CfW5xfvvAY8G8GzrRwn7wrX5MX60w2BIJRfdRQUnR88TG5fMqB_kg5azE0
Message-ID: <CAD++jLkD1MPDoHwRZKdjXXdxrQQy4i0ng2vFeRzOt_KO8b8jow@mail.gmail.com>
Subject: Re: [PATCH v4 00/32] pinctrl: mediatek: Enable module build support
 for all drivers
To: Justin Yeh <justin.yeh@mediatek.com>, Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Project_Global_Chrome_Upstream_Group@mediatek.com, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Justin,

thanks for your patches!

On Fri, Jun 26, 2026 at 6:01=E2=80=AFAM Justin Yeh <justin.yeh@mediatek.com=
> wrote:

> Sorry for the quick v4 - v3 was sent with an incomplete cover letter
> (template placeholders) by mistake. This v4 also unifies MODULE_LICENSE
> to consistently use "GPL v2" across all patches.
>
> This series enables all MediaTek pinctrl drivers to be built as loadable
> kernel modules. This is required for Android GKI (Generic Kernel Image) +
> vendor_dlkm deployments where vendor-specific drivers must be kept separa=
te
> from the GKI vmlinux.
>
> Each patch adds MODULE_LICENSE("GPL v2") and MODULE_DESCRIPTION() macros =
where
> missing, and changes the Kconfig option from bool to tristate. This allow=
s
> these drivers to be properly packaged as vendor kernel modules while
> maintaining the existing built-in option.

Two things to fix:
1. Squash all these 32 patches into one, "one technical step". We don't wan=
na
  have to revery 32 patches, if this doesn't work on one driver it doesn't =
work
  on any driver.

2. Consider this Sashiko report on an unrelated patch by Luca:
  https://lore.kernel.org/linux-input/20260621083053.A3B641F000E9@smtp.kern=
el.org/

----8<----------8<--------8<----------8<--------
[Severity: High]
This is a pre-existing issue, but does mtk_pinctrl_driver in
drivers/pinctrl/mediatek/pinctrl-mt6397.c need a .remove callback or
suppress_bind_attrs set to true to prevent unbinding?

In drivers/pinctrl/mediatek/pinctrl-mtk-common.c:mtk_pctrl_init(), the driv=
er
allocates the pctl and pctl->chip structures using devm_kzalloc() but
registers the GPIO chip using the unmanaged gpiochip_add_data() API:

mtk_pctrl_init() {
    ...
    pctl->chip =3D devm_kzalloc(&pdev->dev, sizeof(*pctl->chip), GFP_KERNEL=
);
    ...
    ret =3D gpiochip_add_data(pctl->chip, pctl);
    ...
}

If the driver is unbound via sysfs, the devm_ subsystem will free the memor=
y
backing the GPIO chip while it remains registered with the core subsystem.
Could this lead to a use-after-free if the GPIOs are accessed after the
driver is unbound?
----8<----------8<--------8<----------8<--------

Well now we will unbind the driver by rmmod as well, so this needs fixing.

Please prepend a patch fixing this to the series.

Yours,
Linus Walleij
