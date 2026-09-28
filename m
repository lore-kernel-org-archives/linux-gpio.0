Received: from mail-vs2-f39.google.com (mail-vs2-f39.google.com [74.125.227.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB0A62DA768
	for <linux-gpio@vger.kernel.org>; Mon, 28 Sep 2026 17:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790614869; cv=none; b=NLH3OPJYUbJ8iYwqOjd9PUtm62N9cVbgJkSts/JSS0VnSlSB6iEH/+ZwL9Y6iKJG3OsI4hxUcn0TN+v1BLcflbT267XZpJszmpHhZyLqZBJcL2V714TgXVP5PLalLP07HCpNw3MFl9eKp0vodCT5Rx5GvZ5jjdCZjXtIojaeq3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790614869; c=relaxed/simple;
	bh=+hIOk59b2H3pTCZgJaBTE5mJHtyR19kXkDBOZEQc6yM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fqt89lcgmSmVsy1oJ27miDbqXhIzwgaQejSAg8Ey3kO9iUmNjlW66lY1CBWK/xvUWg9RJfPjqw6hbyeWQRhQNHusvTNT7fXl42uWlEpa14uIM/hpvTkgU4XwbDyuP4k4IIcVETXwbbQ19TFPyKbWFvQYYY6GXEqVscKXHzclL5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f39.google.com with SMTP id ada2fe7eead31-7b2c87a0311so741145137.1
        for <linux-gpio@vger.kernel.org>; Mon, 28 Sep 2026 10:01:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790614867; x=1791219667;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pwLC5W4u+V0GTSh2RZtGBKpKQq0r57Jm6ZwK/nvUP6s=;
        b=N30x/MJugXRyiBhEDm91aKrLAGqRcZEUTxvrMlUIt9Dhv3Ps2uBpNxaAZgMWKC09eL
         ueW6c1r6A4fRJGU4AUWHN9OQoFkECxIUP3mO4SapQiuFqQsyKOhKZHmB2u5JzvF0oKEy
         dtocT23vkl1FcPykbmEqEwkHXisCfxaJ6y2p4rBdULnu0qZviZM6SeTB0TZN9o6IHsBK
         Rau4oopYcWlnSvpRD3vdi+sWOEhKXcUG29/3LoBAqYqKI9oFBMf78pK6eiUmcTUXNQ+c
         o6plYPXDOvTFcTYcss6siWYk0Z+A3Ddk3VC5eDxy5FQIMrHqHukFy4bk+bhnxA8V20mc
         8TKg==
X-Forwarded-Encrypted: i=1; AKwUvByLaxYe+GO4ybJVNJio6DNR3i7hRUIG/q8QUkb7RD8ttXesTqTSFNHnNFH35F1EHooPFvY2xnahCPCa@vger.kernel.org
X-Gm-Message-State: AFq9FYJleB6Ifpei+NQIKUnzWHLJI8YzBGPgJqFciw2r7DBJ6SMzib95
	txPdoLEV2DdZZFpIiw/ElPtgD7JnhHvyyBgh1eH2oPNf4BJji4fs6QQ0xslf1LpKysU=
X-Gm-Gg: AYBFou3nN2CAv0tXzNk5Z+cVJ55LY2UwIapHCbhPeZaVZVsQ8P94YITdFLwzJA147BS
	mrGn6M7F+VrnSYgmDuKuVAmvqwfSJlw2Ah6EFAQuNQB0s29l75riwFtZyAJ+Qlf5zAmSX2QVnVf
	nHglSDRTyEVR0qeEv3Tw2+L4yu4Cri+ZMwEle+M+KKcSpTc5+bZZ1BpJ9EVzXgh1Fhf+O9R8z41
	1cO9OG5p1OGzD7kzGgolEsCOO7JKNlO4A482lyYWiHHq5fQjUz9QYhaq6SWL5Om8iSQcHbqGLpV
	+NPwuwoU8kUcGLihTmD/7iHfOzclEoX+gnL/Yn/adzNQ6/tRTqv6Clkiyx1ZOpzqu0+rNH/lYeO
	FHxT1Js4F9xx8Azg1ePILrDZSXeqNIUhjbZL2lUxk+ihGFl4K+w3uOaFHhOhH9sMuRYLtcKLWBT
	sd6vTylMMajP0xi0orOA+pUTrQ35wJ0R3uBa7Zb2IBJNvh1FSNRU5/gcCTnynruS11rKzPDHHj/
	dPUGcz8KYbh4aqQomd3Cl3/FUquWvGdbXuD
X-Received: by 2002:a05:6102:5f92:b0:7b2:b159:98c3 with SMTP id ada2fe7eead31-7b2b159a337mr1601770137.28.1790614817862;
        Mon, 28 Sep 2026 10:00:17 -0700 (PDT)
Received: from mail-vs2-f42.google.com (mail-vs2-f42.google.com. [74.125.227.42])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7b39640471csm10163545137.0.2026.09.28.10.00.17
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 10:00:17 -0700 (PDT)
Received: by mail-vs2-f42.google.com with SMTP id 71dfb90a1353d-5c963a787c9so1161435e0c.2
        for <linux-gpio@vger.kernel.org>; Mon, 28 Sep 2026 10:00:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxEAGv80wxc8Q/IcZBbD4qV5WfVP7tKb2NxGMAOAzANJ+9lIke1vZOqpA0thcHs8Ze5p2RpJFbAN9g/@vger.kernel.org
X-Received: by 2002:a05:6102:1627:b0:7b3:67d6:4d7f with SMTP id
 ada2fe7eead31-7b367d65363mr1527719137.17.1790614816969; Mon, 28 Sep 2026
 10:00:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928-rzg2-sr-boards-v9-0-5901e0fc9e44@solid-run.com>
 <20260928-rzg2-sr-boards-v9-8-5901e0fc9e44@solid-run.com> <CAMuHMdUEC9YoZySP3+-UMP0s9XHg4OOsS1Lh65ew2zka=5RC+Q@mail.gmail.com>
 <1a208595-6442-43d3-b1e8-c4f93856a7ea@solid-run.com>
In-Reply-To: <1a208595-6442-43d3-b1e8-c4f93856a7ea@solid-run.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 28 Sep 2026 19:00:03 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXAe7U1u69L-O5bvErXN6V3L-=59ewYezcEHcoDodjQpg@mail.gmail.com>
X-Gm-Features: AclHuK_mHVsKKXBL6m4Sk57vt_PCy6cF4ftlcvUQYkzUcI9-oEgY3mVcHJJ2ndQ
Message-ID: <CAMuHMdXAe7U1u69L-O5bvErXN6V3L-=59ewYezcEHcoDodjQpg@mail.gmail.com>
Subject: Re: [PATCH v9 08/11] arm64: dts: renesas: add support for solidrun
 hb-ripple with rzg2l som
To: Josua Mayer <josua@solid-run.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Benjamin Bara <benjamin.bara@skidata.com>, 
	Linus Walleij <linusw@kernel.org>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Jon Nettleton <jon@solid-run.com>, Mikhail Anikin <mikhail.anikin@solid-run.com>, 
	Yazan Shhady <yazan.shhady@solid-run.com>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Josua,

On Mon, 28 Sept 2026 at 18:21, Josua Mayer <josua@solid-run.com> wrote:
> Am 28.09.26 um 18:10 schrieb Geert Uytterhoeven:
> > On Mon, 28 Sept 2026 at 16:40, Josua Mayer <josua@solid-run.com> wrote:
> >> Add support for the SolidRun HummingBoard Ripple [2] with RZ/G2L
> >> SoM [1].
> >>
> >> The HummingBoard Ripple is a reduced version of HummingBoard Pulse,
> >> featuring:
> >> - 2x USB-2.0 Type-A connector
> >> - 1x 1Gbps RJ45 Ethernet
> >> - micro-HDMI connector
> >> - microSD connector
> >> - mini-PCI-E connector with SIM slot supporting USB-2.0 interface
> >> - MIPI-CSI Camera Connector (not described without specific camera)
> >> - RTC with backup battery
> >>
> >> The carrier board is identical between RZ/G2L, RZ/G2LC, RZ/G2UL and
> >> RZ/V2L SoMs, yet only the RZ/G2LC combination has a product page [2].
> >>
> >> While the variant being supported here is named "Ripple", shared include
> >> files are still named according to the full board for consistency with
> >> schematics, silk screen labels and other SoMs on same board.
> >>
> >> Description for microSD is shared with HummingBoard IIoT.
> >>
> >> [1] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-g2l-som/
> >> [2] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/hummingboard-rz-series-sbcs/hummingboard-rz-g2lc-base/
> >>
> >> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >> Signed-off-by: Josua Mayer <josua@solid-run.com>
> > Thanks for the update!
> >
> >> --- /dev/null
> >> +++ b/arch/arm64/boot/dts/renesas/r9a07g044l2-hummingboard-ripple.dts
> >> @@ -0,0 +1,17 @@
> >> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >> +/*
> >> + * Copyright 2025 Josua Mayer <josua@solid-run.com>
> >> + */
> >> +
> >> +/dts-v1/;
> >> +
> >> +#include "r9a07g044l2.dtsi"
> >> +#include "rzg2l-sr-som.dtsi"
> >> +#include "rzg2l-hummingboard-ripple.dtsi"
> >> +#include "rzg2l-hummingboard-pulse-micro-hdmi.dtsi"
> > This new include is not needed, as rzg2l-hummingboard-ripple.dtsi
> > already includes it:
> >
> >
> >> --- /dev/null
> >> +++ b/arch/arm64/boot/dts/renesas/rzg2l-hummingboard-ripple.dtsi
> >> @@ -0,0 +1,125 @@
> >> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >> +/*
> >> + * Copyright 2025 Josua Mayer <josua@solid-run.com>
> >> + */
> >> +
> >> +#include "rzg2l-hummingboard-pulse-common.dtsi"
> >> +#include "rzg2l-hummingboard-pulse-micro-hdmi.dtsi"
> > Same for patch [09/11].
> >
> > Patch [10/11] is fine, as that one does not share
> > rzg2l-hummingboard-ripple.dtsi.
> >
> > As the rest LGTM, I can fix that while applying, so no need to send
> > a v10.
>
> Thanks!
>
> Since Sashiko also found a small issue in patch 11/11 ... v10 can still
> be considered.

OK.

> To the includes, I would actually suggest a different solution for the
> duplicate include,
> considering that I got confused about it:
>
> diff --git
> a/arch/arm64/boot/dts/renesas/r9a07g044l2-hummingboard-ripple.dts
> b/arch/arm64/boot/dts/renesas/r9a07g044l2-hummingboard-ripple.dts
> index 493a2b9b51d25..95a36f8804b55 100644
> --- a/arch/arm64/boot/dts/renesas/r9a07g044l2-hummingboard-ripple.dts
> +++ b/arch/arm64/boot/dts/renesas/r9a07g044l2-hummingboard-ripple.dts
> @@ -7,8 +7,9 @@
>
>   #include "r9a07g044l2.dtsi"
>   #include "rzg2l-sr-som.dtsi"
> -#include "rzg2l-hummingboard-ripple.dtsi"
> +#include "rzg2l-hummingboard-pulse-common.dtsi"
>   #include "rzg2l-hummingboard-pulse-micro-hdmi.dtsi"
> +#include "rzg2l-hummingboard-ripple.dtsi"
>
>   / {
>       compatible = "solidrun,rzg2l-hummingboard-ripple",
> "solidrun,rzg2l-sr-som",
> diff --git
> a/arch/arm64/boot/dts/renesas/r9a07g054l2-hummingboard-ripple.dts
> b/arch/arm64/boot/dts/renesas/r9a07g054l2-hummingboard-ripple.dts
> index 3df7c67d75a25..0c73871524541 100644
> --- a/arch/arm64/boot/dts/renesas/r9a07g054l2-hummingboard-ripple.dts
> +++ b/arch/arm64/boot/dts/renesas/r9a07g054l2-hummingboard-ripple.dts
> @@ -7,8 +7,9 @@
>
>   #include "r9a07g054l2.dtsi"
>   #include "rzg2l-sr-som.dtsi"
> -#include "rzg2l-hummingboard-ripple.dtsi"
> +#include "rzg2l-hummingboard-pulse-common.dtsi"
>   #include "rzg2l-hummingboard-pulse-micro-hdmi.dtsi"
> +#include "rzg2l-hummingboard-ripple.dtsi"
>
>   / {
>       compatible = "solidrun,rzv2l-hummingboard-ripple",
> "solidrun,rzv2l-sr-som",
> diff --git a/arch/arm64/boot/dts/renesas/rzg2l-hummingboard-ripple.dtsi
> b/arch/arm64/boot/dts/renesas/rzg2l-hummingboard-ripple.dtsi
> index d5bd9b7de4282..aeb92630f4c6b 100644
> --- a/arch/arm64/boot/dts/renesas/rzg2l-hummingboard-ripple.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzg2l-hummingboard-ripple.dtsi
> @@ -3,9 +3,6 @@
>    * Copyright 2025 Josua Mayer <josua@solid-run.com>
>    */
>
> -#include "rzg2l-hummingboard-pulse-common.dtsi"
> -#include "rzg2l-hummingboard-pulse-micro-hdmi.dtsi"
> -
>   / {
>       aliases {
>           /* this board does not use second phy / ethernet on SoM */

That sounds good to me, too.

BTW, there seem to be more commonalities that can be factored out of
rzg2l-hummingboard-ripple.dtsi and r9a07g044c2-hummingboard-ripple.dts.
Of course that can be done later, too.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
