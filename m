Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4247A419FBE
	for <linux-gpio@vger.kernel.org>; Mon, 17 Aug 2026 12:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786970739; cv=none; b=i1MxToChpnYRKckIY4TEUgYJienqzA/IL1+2dMySlxZjVNxfL7Bb525np5NBkKZ7RuLZm8RXk8Gw13lp1vJ0a87R91Y+nybTpZ2q7rvJ3Hm0rk135QiatI10KhX9gJpbiw99csQ5lTyQq7UNItHMcOeEzHpDQ6kSvHTViDkEe1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786970739; c=relaxed/simple;
	bh=gRi3Hl6kL53OCVaT6AtkoZdIORGc+PqsHeHnyxChSbI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UbQAAL6MvQy44/k0TreJd+JjxMyTEHdNG9oPZtfUepoD+Prv6LaiAisuD63JZSDs/9j+gHISgZwihefYcconLmtBquqjHOMP6CXbwlBHqjxJpiVxhuSeU0gd+wxLy4dsPxBHS2dPAL2TdtMqcdEclD04R8UwAHK5h6PTR6ODuQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NX8pzzZ6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NX8pzzZ6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6B0E1F00ACA
	for <linux-gpio@vger.kernel.org>; Mon, 17 Aug 2026 12:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786970736;
	bh=gRi3Hl6kL53OCVaT6AtkoZdIORGc+PqsHeHnyxChSbI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=NX8pzzZ6WYCsuaSCNmOBg6Ii5Ep1KStDBG3auZPy1zuzzU9n3S7JQOi2NmQFANO8G
	 ksSZrVoKGpqvx6KsikmqziEmYfwhtGdJnfSAxqGpzOL+4Ynlq0oWJtcXH14mOKspZt
	 dODfQZ/X0JHRa6MlxvnxjciBO9CAzIC7lWsSNseKI6u6WKv7hy2wYEbg/e0HaXJ5ce
	 +fHiTRHfQDbZMvFpPBZJCmmUSuE9IvZSp0bsYHFCDBFy4gLmIcxJH5/tgxBHklaJa5
	 VzcZpMOykl7xoEM0RoZpTBa4cJl4NDJc6FnwtBj07/fUBxUl66EZRVV7WJUnNoSpxT
	 iLJSCURbo55zQ==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-39c86ce9e29so26673781fa.3
        for <linux-gpio@vger.kernel.org>; Mon, 17 Aug 2026 05:45:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RquL3HqLPmgjISmP11O7zmBdM3TNCctY9T1Trl/rLGD7E0M6avVa/vTKYukTX5bAyC+XrHGk/PlqdxT@vger.kernel.org
X-Gm-Message-State: AOJu0YzUxJGytPNz7BPKroCDgchdO376yYfT5mvUxjIgbxu0NuDNdWhd
	0dpmgIRq0EgeWZsfyAuctdd8TQztCZXZdZNOmjYSlbNMZM2kmYDxavG3S5XT6FOBDIGlJFrxf2s
	ChNBuTd97bppUHwD8g9P+vYcRFZX5lYY=
X-Received: by 2002:a05:6512:3d9f:b0:5b2:e6a6:af72 with SMTP id
 2adb3069b0e04-5b47069f791mr41452e87.28.1786970735583; Mon, 17 Aug 2026
 05:45:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260810063650.239303-1-changhuang.liang@starfivetech.com>
 <20260810063650.239303-4-changhuang.liang@starfivetech.com>
 <178634991918.1014951.7989635238440361454.robh@kernel.org>
 <ZQ4PR01MB120202070B9006984B8677EAF2DE2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
 <20260810144012.GA1574021-robh@kernel.org> <ZQ4PR01MB12020D2031C400FF805791B7F2DD2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
 <ZQ4PR01MB120275B9C0CF6BCE8C88261CF2DA2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
 <20260814-shapeless-onyx-pronghorn-d423a9@quoll> <ZQ4PR01MB12022F6D6F71542033CF857BF2DA2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
In-Reply-To: <ZQ4PR01MB12022F6D6F71542033CF857BF2DA2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 17 Aug 2026 14:45:22 +0200
X-Gmail-Original-Message-ID: <CAD++jL=Q38HwraN1NEOxLf_hE+k=3Q6JP+DUgQsThfYve0t0RA@mail.gmail.com>
X-Gm-Features: AcwNN1V6zplB90pHlStjSOoEPiNttfHYnU2qXaCxmbT30t1V6M1l1ZLtNygTX0E
Message-ID: <CAD++jL=Q38HwraN1NEOxLf_hE+k=3Q6JP+DUgQsThfYve0t0RA@mail.gmail.com>
Subject: Re: [PATCH v5 03/21] dt-bindings: pinctrl: Add starfive,jhb100-sys0-pinctrl
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Emil Renner Berthing <kernel@esmil.dk>, Alexandre Ghiti <alex@ghiti.fr>, 
	Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 14, 2026 at 1:22=E2=80=AFPM Changhuang Liang
<changhuang.liang@starfivetech.com> wrote:

> > You still did not explain the cells - neither in reply nor in commit - =
thus start
> > with that. Why do you need it? Multiple controllers have groupped pins =
or
> > GPIOs in registers, so explanation "every 32 GPIOs correspond to one re=
gister"
> > tells me nothing. Why would that matter how many GPIOs is in one regist=
er?
>
> Since every 32 GPIOs correspond to one register, Linus suggested at the t=
ime that I could try using:
> gpios =3D <&gpio [instance] offset flags>;
> gpio-ranges =3D <&pinctrl [gpio_instance] gpio_offset pin_offset count>;
>
> The advantage of using this is that in a GPIO controller with more than 3=
2 GPIOs, every 32 GPIOs
> can be treated as one GPIO bank. This way, in the driver, converting pin_=
offset to gpio_offset does
> not require a large number of /32 and %32 operations.
>
> the following is Linus's original suggestion at the time
> https://lore.kernel.org/all/CAD++jL=3DtvDBWJHRGGJw4nnox_kcJKn5hwvwz9zxadM=
RedyvRhw@mail.gmail.com/

Just copy this explanation into the commit so it is clear why you
need three cells for this.

Yours,
Linus Walleij
