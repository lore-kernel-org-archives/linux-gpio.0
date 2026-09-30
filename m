Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B74CD3D6477
	for <linux-gpio@vger.kernel.org>; Wed, 30 Sep 2026 22:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790806818; cv=none; b=bhpmWNA1Y3q2OPihaLsHdorQdYVpLgn9Jd4xgP0iW4he0L5VjhNe70atQTa25tuQcsts+pcCVvnIOk4b0/K0Ipuk7hGq/eDVTvffeBnfog6w3UdYBDxpfrSoKhlm9Abgqs++96cgKFTPhhj7cvNj8C9Y3j2AKkbefkkYRsqX3a8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790806818; c=relaxed/simple;
	bh=TCwrotxQhho65zyVycgJ/Fll2R3htNcFm+x88i4FnsM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A1y+CdDJZtQSHUCJC9vs05nUpRc6dYF0GeHNuN7Q6KmsBaz7MLnMj1xLdPf7DG/gNvgtBgWkJk/6DpesgRC/JuWUvUHd7iqsYE4aPgpKB54PCRSEOr4oFnDM2CJLyy45lPqhxlxGzlZSsBGVc4OJKpq7Rph4x34eiwjdppLVAw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=apmecSKY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="apmecSKY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D7731F008A2
	for <linux-gpio@vger.kernel.org>; Wed, 30 Sep 2026 22:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790806816;
	bh=65w+P0+syMfsfRRZGa4iHCxiTRt/X9tvdIf2JYTb96Q=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=apmecSKYc5gBN42A6zWWWkk6OW+y7YoiG/6qrXTo7mJuc4R/eCMOAol1IZv9XJnDg
	 Q2rkcKZ8S10pMTa3KtmHvhOHyERUQxvjI0YPGqpBHW5mCeK0jw6nwaKGdXDT/wl5LV
	 ULEc/8Dj+pzS/Q39coXbMkP7JXcUk7QvZy9l2NsEH6caHTDh8jlAicaIdbX7J68tKx
	 kh8NbgsMRtT4rt2KtkByqSMzgFKfVWh8QiAkfiLvdRwGveolIRL8W91X4KU+O/u6A4
	 Rgq5JEre6+kkAcV8T+JTIPyXynLHxz2fTzpsMxYqtVeIEqZMpnJV6mmHU/v2l3lJX9
	 tXu38IzrQ68Pg==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5ba3d90ac37so1358655e87.3
        for <linux-gpio@vger.kernel.org>; Wed, 30 Sep 2026 15:20:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxt8bCIJDe0d6mUxv6Wo94kQgZUrqWrWWo3QSPYKWuU2iD2iSewPH2UTmDDbk+waEDY4Sw9pu3sH47k@vger.kernel.org
X-Gm-Message-State: AFq9FYLTJU1m08DJEMaYThLDZVlMZrEo1QJq8KEKrmjZIXmHIwTOwvpx
	l4DIwN7wSj9eJx0ie5jDZa7Ne2dLpQx5Ypeikb0rs2kyOFNMDeZGrjtNINEeiJuLe+6/R9GMUkG
	W/+6d1QHyISpXMMc4X6XxFR7UJtkw5U0=
X-Received: by 2002:a05:6512:1593:b0:5b8:e886:3688 with SMTP id
 2adb3069b0e04-5ba402b3b33mr1066317e87.5.1790806815272; Wed, 30 Sep 2026
 15:20:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260910100357.130134-1-changhuang.liang@starfivetech.com>
In-Reply-To: <20260910100357.130134-1-changhuang.liang@starfivetech.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 1 Oct 2026 00:20:01 +0200
X-Gmail-Original-Message-ID: <CAD++jLmts76o8wyR=eY=vdNsh8+916YqK9qwM3b=R624AYM1XA@mail.gmail.com>
X-Gm-Features: AclHuK-3WLZPojlMzN86zHmOvH9gBpstHy6qqmtykYw4QwirmmoTz47SZXLeMp8
Message-ID: <CAD++jLmts76o8wyR=eY=vdNsh8+916YqK9qwM3b=R624AYM1XA@mail.gmail.com>
Subject: Re: [PATCH v8 00/22] Add basic pinctrl drivers for JHB100 SoC
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

Hi Changuang,

On Thu, Sep 10, 2026 at 12:04=E2=80=AFPM Changhuang Liang
<changhuang.liang@starfivetech.com> wrote:

> Changhuang Liang (22):
>   dt-bindings: pincfg-node: Add property 'input-debounce-ns'
>   pinctrl: pinconf-generic: Add property 'input-debounce-ns'
>   dt-bindings: pinctrl: Add starfive,jhb100-sys0-pinctrl
>   pinctrl: starfive: Add StarFive JHB100 sys0 controller driver
>   dt-bindings: pinctrl: Add starfive,jhb100-sys0h-pinctrl
>   pinctrl: starfive: Add StarFive JHB100 sys0h controller driver
>   dt-bindings: pinctrl: Add starfive,jhb100-sys1-pinctrl
>   pinctrl: starfive: Add StarFive JHB100 sys1 controller driver
>   dt-bindings: pinctrl: Add starfive,jhb100-sys2-pinctrl
>   pinctrl: starfive: Add StarFive JHB100 sys2 controller driver
>   dt-bindings: pinctrl: Add starfive,jhb100-per0-pinctrl
>   pinctrl: starfive: Add StarFive JHB100 per0 controller driver
>   dt-bindings: pinctrl: Add starfive,jhb100-per1-pinctrl
>   pinctrl: starfive: Add StarFive JHB100 per1 controller driver
>   dt-bindings: pinctrl: Add starfive,jhb100-per2-pinctrl
>   pinctrl: starfive: Add StarFive JHB100 per2 controller driver
>   dt-bindings: pinctrl: Add starfive,jhb100-per2pok-pinctrl
>   pinctrl: starfive: Add StarFive JHB100 per2pok controller driver
>   dt-bindings: pinctrl: Add starfive,jhb100-per3-pinctrl
>   pinctrl: starfive: Add StarFive JHB100 per3 controller driver

All of those applied to the pinctrl tree!

I had to manually adjust the MAINTAINERS patch because it is based
on some reset controller patch I don't have in v7.3-rc1.

>   riscv: dts: starfive: Add JHB100 pinctrl pad number header
>   riscv: dts: starfive: jhb100: Add pinctrl nodes

Please funnel these through the SoC tree.

Yours,
Linus Walleij
