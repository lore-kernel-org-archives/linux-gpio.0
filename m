Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02D1F3CA4A8
	for <linux-gpio@vger.kernel.org>; Tue, 11 Aug 2026 06:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786428873; cv=none; b=R32YNkaFeNoiIyaCiI9wZR39OPUDXn2N9GCZJUpdyl1pMCYODVJhrR7MCZefMM8qdCtL1t1E5PqbPjVsz8/bXvQ0KwY+f2kVVgenEwwhgnAMNgF6hW0sodQb2+xITbeNnSsUnCrkPVKFAuQz6b9Trriukh5yE7crllUH9G/Iedg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786428873; c=relaxed/simple;
	bh=8+7dC9C52i54L8FM3R82ynyaZNWkqslAr+lY370uir0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LbnydfDQ0saBe1zBZD1sWGebZo0T4uvlnYPfEoJyJ2FnjMKvOyViLlVSvgiuOgIcaxpJ9hDWUMJ5fGoQfA1CzB5OeKtPpxTrr3iA6O1aRKUz4bHWJrPU+xll+kzuxYqKm+uCqo5LeFs4Tfa3VOnappcfI+kh0GKrHf2l2ZcDmk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kh+d8lyj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kh+d8lyj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3EB61F00A3E
	for <linux-gpio@vger.kernel.org>; Tue, 11 Aug 2026 06:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786428871;
	bh=+wNOqVDGEN5i8weJznBIp+8lqP1f4HnqpPBBjIKEJrc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Kh+d8lyjifRDpe1x2Pdx3lwtO+AF7HtDv7wBtHe3PAkWOhbWBiaAEkbjldzrRhA/f
	 YD/LV+8H5uY0RI13e4B4vWwLY0FSwgMNLQRaA77hlqculBL/pxU2arJlrHIPUfIRaE
	 /ngqogip4CpdTrVc4LDSqqE9Fbrxmw9T0TRsyWXvP4N/Zu7dFlrqhHFKjdVRn5ogYl
	 veQKsY4o1UIFgCvwmeRXMVOtmFt0Iv2npsQ2RfvRkiLcvhObIqs/J4CqgKwpS0WCzh
	 yim8IqHpXO7wu8b47sp3jochDrExMj63SIVobJ/dOln4y9+2YEZKdIbOm5BCG1DJ/w
	 5NyHEc9/SAPAQ==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5b013aa02b2so777129e87.0
        for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2026 23:14:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Ro+eSq1VtVDeuf2c+MgSC2HTTvxbc2x6VB7Qr7Wgs+ttlp9NavxWsh0q11uJ3uY8NIay7lSq0wAoNc8@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9/fFg3dUaHF26oUNmEo1MLvq16hnT+OUqjtJ4TlOoY0ba91bK
	ATY9Uo3b742ryX04aEZ07lZYxLYAejdvHWHZO4SE57EsabKJZhuainXdGHGRtJr0ZlhPgahX54W
	n86etWHaNtUdfqeOmEtSDGIJUzBFLfjo=
X-Received: by 2002:a05:6512:1383:b0:5b0:1e26:7751 with SMTP id
 2adb3069b0e04-5b44881c2bcmr127826e87.8.1786428870446; Mon, 10 Aug 2026
 23:14:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260810063650.239303-1-changhuang.liang@starfivetech.com>
In-Reply-To: <20260810063650.239303-1-changhuang.liang@starfivetech.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 11 Aug 2026 08:14:18 +0200
X-Gmail-Original-Message-ID: <CAD++jLkHYsx3FNcdiPdL_9UcEUGDGs2u8RwfTjotm7f+xiwnvQ@mail.gmail.com>
X-Gm-Features: AUfX_mzgGug6-5qsnEpmIEwyeblG76ijsb9r5KbO018SdfVmGfJDslC9BjekBp0
Message-ID: <CAD++jLkHYsx3FNcdiPdL_9UcEUGDGs2u8RwfTjotm7f+xiwnvQ@mail.gmail.com>
Subject: Re: [PATCH v5 00/21] Add basic pinctrl drivers for JHB100 SoC
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>, Paul Walmsley <pjw@kernel.org>, 
	Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Changhuang,

On Mon, Aug 10, 2026 at 8:37=E2=80=AFAM Changhuang Liang
<changhuang.liang@starfivetech.com> wrote:

> The JHB100 SoC has 13 pinctrl domains - sys0, sys0h, sys1, sys2, per0, pe=
r1,
> per2, per2pok, per3, adc0, adc1, emmc, and vga.
>
> In the current series, we will only add the following pinctrl:
>  - sys0, sys0h, sys1, sys2
>  - per0, per1, per2, per2pok, per3
>
> The remaining pinctrl will be implemented in future series.

These drivers look good, as soon as the DT bindings are reviewed I can
probably merge the series.

Yours,
Linus Walleij
