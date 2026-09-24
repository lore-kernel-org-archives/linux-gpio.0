Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93D9D49B1FC
	for <linux-gpio@vger.kernel.org>; Thu, 24 Sep 2026 20:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790281727; cv=pass; b=qNtCeVlii6J0Dg4j+fVu9CnI/pZAYtzQEPblfNlX4idaitePf1uYVIN5uo78iTU891g9IJ/DvsFNDMs5ddIx3W+JzhOD6oE4cJwwQLSSjSs6jWt8DFzdo6FXO5xYZJJ1K8sp3+5TniuRY+QhoCsIPBcW7rz0Mb07cy0GT5s0TYA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790281727; c=relaxed/simple;
	bh=UT6B7fQqEA2MSrKMZ61V+BMSHD5XKFXt3wagV488uAk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OOC30OmcJQqwde2OyjQtQVwTmuivwbp8np6kSWG7gC5akxMvXzv6326ixAy6qinF9L/rUJDm8T6cJaR34zE7JD2fW3bEqMf993l6qfXXNxk/XC0EpfKG9wEe0y7SdkQEmrjHWUxBGmmOhqxV3m+tTXeDaPI+Eg5ky92YKIrRZHg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NnSKJ9y9; arc=pass smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NnSKJ9y9"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-396ccd4f99dso184840a91.2
        for <linux-gpio@vger.kernel.org>; Thu, 24 Sep 2026 13:28:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790281719; cv=none;
        d=google.com; s=arc-20260327;
        b=Hka+NoI8VyvBAfNvD+CLZxMpba8V0ADiILBi3+wAalF4c7RBK3Op8sz2icdEQkSEmH
         PG2ucAxBgqqBa8x+imGdk7U33wF3JRH67dH5woJajSz+2kve61XZbcFqsRF4Z6aBIXGT
         xw/ddap+R5XoO5CUg+HaYeoXLjRG4wI9GChh6lyblSgGPOCwZIj660N1pyH6feWGWBaA
         bPlBAe1m/A3zN3KMzoaRIEivqEx623rXN8P/0hax6ezcfezp0ysxyYCpJt2FfsQqQm/Q
         tyWweoeaXdSEvHW8JK+XtZvKAxENJTXcw7+/U1BDAM/S5brotMvgEOYA06oQR7s4PMG9
         LF3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ojO6d7Cp/azkr+ydPr3NQ+RBBA1uMA9LUmgwlnFJQYQ=;
        fh=Zg25waHKowbfN9RTCq9fgolqRTViAVy6VILmZWSlBAo=;
        b=He4x/LX3mi6w2wYUvsWGC1mFBo/52texs5Au6yYemWVx3vNluDb7Tol16Ot27oRXPS
         vmo/FmLHFGgOPjsWGZhyxCPe/FO9lHBb5TkQpWi4BWBnaHHaKeDqSMDWtMr8kOjo5Qyt
         DMUMZMvKl4Pt6IYXvhdWkV+gc2hNLBVwMSsSDK74F/TAD9AjC5mpJbMnRxqGyl35BYki
         y5VFnzP4UwmQIuSmXqZVnKEiYYRjmHnSWIMEsiRXtkK7nBB0zf/8/Bafuj3KSTH/Dm2n
         wmg9M/AV1AaVdOSKE+mkCRFw+WzSwwKfiBzqMd++ZrO0s2Vb2o7f15gSMaupe9WI9M9v
         U6eg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790281719; x=1790886519; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ojO6d7Cp/azkr+ydPr3NQ+RBBA1uMA9LUmgwlnFJQYQ=;
        b=NnSKJ9y9+0Q2pMKxD0CIKv1T4omTjvufGXXKGJrlojvRw/EJdi9qwL2qB5059e86zd
         CD/QHjDZmfhMwZ0dPcCwa7qoiy7uN55dsMuAYp1zQVt/w0qSP2Z6/TFiNes2P5fR5waq
         aQTgXExFsZJE9uXU8M4cmOW7Rsfn0kpSO5vWnDRAZ1auidF6n7KcmPAuiXTk6eKF5+jK
         7VQkle4BrSx/TNdL9M25yP2Ap4FZV9LHGG17LTG2tCVqqAIxEgKEqo3hVIxSS7XJWRaf
         LIggEcIBXfrbybbnWjXCRhhX8G3dZXLb15E+J0cyeZtvC5NhoT+ejIDiDozJraXtR0Nw
         eEKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790281719; x=1790886519;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ojO6d7Cp/azkr+ydPr3NQ+RBBA1uMA9LUmgwlnFJQYQ=;
        b=lbixkFRo6QIRQ4002lJvBlCpjK1QmTcuIOnKWuGuyt7tLIJq1cNXQ/wMJDbAwkLhz2
         q/3Eiq+GXj3WrAOF55YKBYp6TV3BMncLoG6BvBAcAMtBLLBqYiFUjN+mdu4C8lKK6Rv4
         CIqkmF50PH80ZgtKhf1q0YEuJroQGquRUQPMCPkJi5lkZRoXXvGbHzZEEBCqbyGJs5tD
         CwiOQl15HyxduK68kylie6mz1RAHg+kX240EURwS/YOfomqDQ3H8Sg4lpR90Ig7gxaEB
         dPTUINSazXlXNHXt0v150HY5+KTbNY4FX1ltZnUGBFau/Fkta5oNA4zp8ZbOr8X8kJVk
         ZKBg==
X-Forwarded-Encrypted: i=1; AKwUvBxoZqxeD/By7P3ZihYGIum497qrD2MM/JVjfierBeyEA1Z/QxsWpUsUTu95fte3aM0pD0fey2ayK9pd@vger.kernel.org
X-Gm-Message-State: AFuF++ncAccS2JpO7Ex35H0GyMy5cdEJJ/Mgu8gZfDun2xv0kkDFcijG
	UaBx7TCTfIRcrxdMsFvuUNnt5b83qOtMG1GdgNVYzxodbZBB+K59jS1A8XPyJrRLFQ5Y2VlG3i5
	qK1faSfONBRe1TFgbTW+iEOMxtP+aYmU=
X-Gm-Gg: AYBFou2I0X1A80qOpep2aVvj4m63VhzHuzdl9qXDUXqc+kvduXTiXtBjpfug0heHG8P
	raolJhalY+GWH9eyHfRr7Vy7Db3fsV4wM1CMS7L9H5eDczIVjqdvsbk+PLF6qIFOwf5ldd4aANo
	OTVuAjBwt7dGwy9V+PKM3MZ3StocgfyaXHJjV3fz9QeI+TTYZo/M0uRuaVuibCv31ZLVFLHT0B9
	tF+WHY6UVY5x5Y6kuvSrWDk1sfh1otRVdq96E5hCwKd1hKZMdL2plurlFpJFtzm6ssI7von8ILs
	eanr9A4hcLOz6Ad7NNueTAfGrD+UnOARb9A+6igWh6m1bn+u6+3bnqAbkVkUHPfIHjbFkt8=
X-Received: by 2002:a17:90b:278c:b0:39e:6c69:9b99 with SMTP id
 98e67ed59e1d1-3a09929065emr2849572a91.62.1790281718782; Thu, 24 Sep 2026
 13:28:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923201701.43391-1-pmazzini@gmail.com> <20260923201701.43391-4-pmazzini@gmail.com>
 <b0861183-54df-48f3-b78b-cc0c1c4dff4c@arm.com>
In-Reply-To: <b0861183-54df-48f3-b78b-cc0c1c4dff4c@arm.com>
From: Pablo Mazzini <pmazzini@gmail.com>
Date: Thu, 24 Sep 2026 21:28:04 +0100
X-Gm-Features: AclHuK9G_SI3GgoHa0qCbnDKntKtoSmhBOxRgleKzxhUuFOnUyM7ko1rjVVmtJc
Message-ID: <CAAxh=jtj7m=0chzXG1osVy0ftHys9mwf9S62kz1Oimgm3rsCUg@mail.gmail.com>
Subject: Re: [PATCH v1 04/11] pinctrl: sunxi: add Allwinner B288 pin
 controller driver
To: Andre Przywara <andre.przywara@arm.com>
Cc: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Linus Walleij <linusw@kernel.org>, Samuel Holland <samuel@sholland.org>, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andre,

> look at pinctrl-sun55i-a523.c for an example

Thanks for the pointer - much nicer. Converted for v2.

> Can you put it into our wiki

The page already has the table and it matches the BSP exactly.

Thanks,
Pablo

On Thu, Sep 24, 2026 at 10:17=E2=80=AFAM Andre Przywara <andre.przywara@arm=
.com> wrote:
>
> Hi,
>
> many thanks for going through the task of creating this table - though I
> think you wouldn't need to do this anymore, since we now have another
> way of describing pins, which avoids this lenghty table in the driver:
> look at pinctrl-sun55i-a523.c for an example.
>
> This would allow the "driver" to be a mere high level description, and
> leave the mux values to the DT.
>
> That being said: it's good to have that info, for the lack of a manual.
> Can you by any chance try to make a table out of it and put it into our
> wiki (https://linux-sunxi.org/B288)? That would then be the replacement
> for the manual. Maybe write a small tool to convert this data struct
> into Wiki table format.
>
> Some general things inline ...
>
> On 9/23/26 22:16, Pablo Mazzini wrote:
> > 78 pins across ports B, C, D, F and G. PH0 is BSP FPGA-only and omitted=
.
> >
> > Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
> > ---
> >   drivers/pinctrl/sunxi/Kconfig              |  10 +
> >   drivers/pinctrl/sunxi/Makefile             |   1 +
> >   drivers/pinctrl/sunxi/pinctrl-sun8i-b288.c | 623 ++++++++++++++++++++=
+
> >   3 files changed, 634 insertions(+)
> >   create mode 100644 drivers/pinctrl/sunxi/pinctrl-sun8i-b288.c
> >
> > diff --git a/drivers/pinctrl/sunxi/Kconfig b/drivers/pinctrl/sunxi/Kcon=
fig
> > index dc62eba96348..a08186133090 100644
> > --- a/drivers/pinctrl/sunxi/Kconfig
> > +++ b/drivers/pinctrl/sunxi/Kconfig
> > @@ -56,6 +56,16 @@ config PINCTRL_SUN8I_A23_R
> >       default MACH_SUN8I
> >       select PINCTRL_SUNXI
> >
> > +config PINCTRL_SUN8I_B288
> > +     bool "Support for the Allwinner B288 PIO"
> > +     default MACH_SUN8I
> > +     select PINCTRL_SUNXI
> > +     help
> > +       Say Y here to enable pin controller and GPIO support for the
> > +       Allwinner B288 (sun8iw10p1) SoC, as used in e-book readers such
> > +       as the PocketBook Verse. This covers ports B, C, D, F and G,
> > +       including the four banks of external interrupt capable pins.
> > +
> >   config PINCTRL_SUN8I_H3
> >       bool "Support for the Allwinner H3 PIO"
> >       default MACH_SUN8I
> > diff --git a/drivers/pinctrl/sunxi/Makefile b/drivers/pinctrl/sunxi/Mak=
efile
> > index 951b3f1e4b4f..5129c0f19f3e 100644
> > --- a/drivers/pinctrl/sunxi/Makefile
> > +++ b/drivers/pinctrl/sunxi/Makefile
> > @@ -18,6 +18,7 @@ obj-$(CONFIG_PINCTRL_SUN50I_A100)   +=3D pinctrl-sun5=
0i-a100.o
> >   obj-$(CONFIG_PINCTRL_SUN50I_A100_R) +=3D pinctrl-sun50i-a100-r.o
> >   obj-$(CONFIG_PINCTRL_SUN8I_A83T)    +=3D pinctrl-sun8i-a83t.o
> >   obj-$(CONFIG_PINCTRL_SUN8I_A83T_R)  +=3D pinctrl-sun8i-a83t-r.o
> > +obj-$(CONFIG_PINCTRL_SUN8I_B288)     +=3D pinctrl-sun8i-b288.o
> >   obj-$(CONFIG_PINCTRL_SUN8I_H3)              +=3D pinctrl-sun8i-h3.o
> >   obj-$(CONFIG_PINCTRL_SUN8I_H3_R)    +=3D pinctrl-sun8i-h3-r.o
> >   obj-$(CONFIG_PINCTRL_SUN8I_V3S)             +=3D pinctrl-sun8i-v3s.o
> > diff --git a/drivers/pinctrl/sunxi/pinctrl-sun8i-b288.c b/drivers/pinct=
rl/sunxi/pinctrl-sun8i-b288.c
> > new file mode 100644
> > index 000000000000..ffd7eef68d19
> > --- /dev/null
> > +++ b/drivers/pinctrl/sunxi/pinctrl-sun8i-b288.c
> > @@ -0,0 +1,623 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +/*
> > + * Allwinner B288 (sun8iw10p1) SoC pinctrl driver.
> > + *
> > + * Derived from Allwinner's BSP driver pinctrl-sun8iw10p1.c, which is:
> > + * Copyright (C) 2014 Jackie Hwang <huangshr@allwinnertech.com>
> > + *
> > + * Based on pinctrl-sun8i-a23.c, which is:
> > + * Copyright (C) 2014 Chen-Yu Tsai <wens@csie.org>
> > + * Copyright (C) 2014 Maxime Ripard <maxime.ripard@free-electrons.com>
> > + */
> > +
> > +#include <linux/module.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/of.h>
> > +#include <linux/pinctrl/pinctrl.h>
> > +
> > +#include "pinctrl-sunxi.h"
> > +
> > +static const struct sunxi_desc_pin sun8i_b288_pins[] =3D {
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(B, 0),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "uart2"),
> > +               SUNXI_FUNCTION(0x3, "jtag0"),
> > +               SUNXI_FUNCTION(0x5, "vdevice"),
>
> What's vdevice? I don't think we used to describe those weird functions.
>
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
>
> I know Allwinner does this, but we do not describe the HighZ mux, it's
> all 1's anyway, and the same for all pins.
>
> Those comments are probably irrelevant if you go with the new pinctrl
> driver style. Most of the settings there should be straightforward to
> figure out, just remember to add an IRQ map, to account for the missing
> interrupts on PortC.
>
> Cheers,
> Andre
>
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 0)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(B, 1),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "uart2"),
> > +               SUNXI_FUNCTION(0x3, "jtag0"),
> > +               SUNXI_FUNCTION(0x4, "spdif0"),
> > +               SUNXI_FUNCTION(0x5, "vdevice"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 1)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(B, 2),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "uart2"),
> > +               SUNXI_FUNCTION(0x3, "jtag0"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 2)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(B, 3),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "uart2"),
> > +               SUNXI_FUNCTION(0x3, "jtag0"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 3)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(B, 4),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "uart0"),
> > +               SUNXI_FUNCTION(0x3, "pwm0"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 4)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(B, 5),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "uart0"),
> > +               SUNXI_FUNCTION(0x3, "pwm1"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 5)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(B, 6),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "twi0"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 6)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(B, 7),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "twi0"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 7)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(B, 10),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "spi1"),
> > +               SUNXI_FUNCTION(0x3, "uart4"),
> > +               SUNXI_FUNCTION(0x4, "pwm2"),
> > +               SUNXI_FUNCTION(0x5, "wifi_uart0"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 10)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(B, 11),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "spi1"),
> > +               SUNXI_FUNCTION(0x3, "uart4"),
> > +               SUNXI_FUNCTION(0x4, "pwm3"),
> > +               SUNXI_FUNCTION(0x5, "wifi_uart0"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 11)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(B, 12),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "i2s1"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 12)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(B, 13),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "i2s1"),
> > +               SUNXI_FUNCTION(0x4, "pwm4"),
> > +               SUNXI_FUNCTION(0x5, "uart3"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 13)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(B, 14),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "i2s1"),
> > +               SUNXI_FUNCTION(0x4, "pwm5"),
> > +               SUNXI_FUNCTION(0x5, "uart3"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 14)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(B, 15),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "i2s1"),
> > +               SUNXI_FUNCTION(0x3, "ac0"),
> > +               SUNXI_FUNCTION(0x4, "twi1"),
> > +               SUNXI_FUNCTION(0x5, "uart3"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 15)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(B, 16),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "i2s1"),
> > +               SUNXI_FUNCTION(0x3, "ac0"),
> > +               SUNXI_FUNCTION(0x4, "twi1"),
> > +               SUNXI_FUNCTION(0x5, "uart3"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 16)),
> > +     /*Hole*/
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 0),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "nand0"),
> > +               SUNXI_FUNCTION(0x4, "spi0"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled")),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 1),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "nand0"),
> > +               SUNXI_FUNCTION(0x3, "sdc2"),
> > +               SUNXI_FUNCTION(0x4, "spi0"),
> > +               SUNXI_FUNCTION(0x5, "sdc3"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled")),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 2),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "nand0"),
> > +               SUNXI_FUNCTION(0x4, "spi0"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled")),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 3),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "nand0"),
> > +               SUNXI_FUNCTION(0x4, "spi0"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled")),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 4),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "nand0"),
> > +               SUNXI_FUNCTION(0x3, "sdc2"),
> > +               SUNXI_FUNCTION(0x5, "sdc3"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled")),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 5),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "nand0"),
> > +               SUNXI_FUNCTION(0x3, "sdc2"),
> > +               SUNXI_FUNCTION(0x5, "sdc3"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled")),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 6),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "nand0"),
> > +               SUNXI_FUNCTION(0x3, "sdc2"),
> > +               SUNXI_FUNCTION(0x4, "uart1"),
> > +               SUNXI_FUNCTION(0x5, "sdc3"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled")),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 7),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "nand0"),
> > +               SUNXI_FUNCTION(0x3, "sdc2"),
> > +               SUNXI_FUNCTION(0x4, "uart1"),
> > +               SUNXI_FUNCTION(0x5, "sdc3"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled")),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 8),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "nand0"),
> > +               SUNXI_FUNCTION(0x3, "sdc2"),
> > +               SUNXI_FUNCTION(0x4, "uart1"),
> > +               SUNXI_FUNCTION(0x5, "sdc3"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled")),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 9),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "nand0"),
> > +               SUNXI_FUNCTION(0x3, "sdc2"),
> > +               SUNXI_FUNCTION(0x4, "uart1"),
> > +               SUNXI_FUNCTION(0x5, "sdc3"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled")),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 10),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "nand0"),
> > +               SUNXI_FUNCTION(0x3, "sdc2"),
> > +               SUNXI_FUNCTION(0x4, "uart1"),
> > +               SUNXI_FUNCTION(0x5, "sdc3"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled")),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 11),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "nand0"),
> > +               SUNXI_FUNCTION(0x3, "sdc2"),
> > +               SUNXI_FUNCTION(0x4, "uart1"),
> > +               SUNXI_FUNCTION(0x5, "sdc3"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled")),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 12),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "nand0"),
> > +               SUNXI_FUNCTION(0x3, "sdc2"),
> > +               SUNXI_FUNCTION(0x4, "uart1"),
> > +               SUNXI_FUNCTION(0x5, "sdc3"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled")),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 13),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "nand0"),
> > +               SUNXI_FUNCTION(0x3, "sdc2"),
> > +               SUNXI_FUNCTION(0x4, "uart1"),
> > +               SUNXI_FUNCTION(0x5, "sdc3"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled")),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 14),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "nand0"),
> > +               SUNXI_FUNCTION(0x3, "sdc2"),
> > +               SUNXI_FUNCTION(0x5, "sdc3"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled")),
> > +     /* Hole */
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 0),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "lcd0"),
> > +               SUNXI_FUNCTION(0x3, "uart1"),
> > +               SUNXI_FUNCTION(0x4, "csi0"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 0)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 1),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "lcd0"),
> > +               SUNXI_FUNCTION(0x3, "uart1"),
> > +               SUNXI_FUNCTION(0x4, "csi0"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 1)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 2),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "lcd0"),
> > +               SUNXI_FUNCTION(0x3, "uart5"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 2)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 3),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "lcd0"),
> > +               SUNXI_FUNCTION(0x3, "uart5"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 3)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 4),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "lcd0"),
> > +               SUNXI_FUNCTION(0x3, "uart5"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 4)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 5),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "lcd0"),
> > +               SUNXI_FUNCTION(0x3, "uart5"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 5)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 6),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "lcd0"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 6)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 7),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "lcd0"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 7)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 8),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "lcd0"),
> > +               SUNXI_FUNCTION(0x3, "uart1"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 8)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 9),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "lcd0"),
> > +               SUNXI_FUNCTION(0x3, "uart1"),
> > +               SUNXI_FUNCTION(0x4, "csi0"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 9)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 10),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "lcd0"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 10)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 11),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "lcd0"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 11)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 12),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "lcd0"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 12)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 13),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "lcd0"),
> > +               SUNXI_FUNCTION(0x4, "csi0"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 13)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 14),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "lcd0"),
> > +               SUNXI_FUNCTION(0x4, "csi0"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 14)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 15),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "lcd0"),
> > +               SUNXI_FUNCTION(0x4, "csi0"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 15)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 16),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "lcd0"),
> > +               SUNXI_FUNCTION(0x4, "csi0"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 16)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 17),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "lcd0"),
> > +               SUNXI_FUNCTION(0x4, "csi0"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 17)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 18),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "lcd0"),
> > +               SUNXI_FUNCTION(0x4, "csi0"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 18)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 19),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "lcd0"),
> > +               SUNXI_FUNCTION(0x4, "csi0"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 19)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 20),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "lcd0"),
> > +               SUNXI_FUNCTION(0x4, "csi0"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 20)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 21),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "lcd0"),
> > +               SUNXI_FUNCTION(0x4, "csi0"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 21)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 22),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "lcd0"),
> > +               SUNXI_FUNCTION(0x4, "csi0"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 22)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 23),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "lcd0"),
> > +               SUNXI_FUNCTION(0x4, "csi0"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 23)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 24),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "lcd0"),
> > +               SUNXI_FUNCTION(0x3, "spi2"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 24)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 25),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "lcd0"),
> > +               SUNXI_FUNCTION(0x3, "spi2"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 25)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 26),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "lcd0"),
> > +               SUNXI_FUNCTION(0x3, "spi2"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 26)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 27),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "lcd0"),
> > +               SUNXI_FUNCTION(0x3, "spi2"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 27)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 28),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "pwm0"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 28)),
> > +
> > +     /* Hole */
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(F, 0),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "sdc0"),
> > +               SUNXI_FUNCTION(0x4, "jtag0"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 0)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(F, 1),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "sdc0"),
> > +               SUNXI_FUNCTION(0x4, "jtag0"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 1)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(F, 2),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "sdc0"),
> > +               SUNXI_FUNCTION(0x4, "uart0"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 2)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(F, 3),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "sdc0"),
> > +               SUNXI_FUNCTION(0x4, "jtag0"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 3)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(F, 4),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "sdc0"),
> > +               SUNXI_FUNCTION(0x4, "uart0"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 4)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(F, 5),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "sdc0"),
> > +               SUNXI_FUNCTION(0x4, "jtag0"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 5)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(F, 6),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 6)),
> > +
> > +     /* Hole */
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 0),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "pwm6"),
> > +               SUNXI_FUNCTION(0x3, "dmic0"),
> > +               SUNXI_FUNCTION(0x4, "spi1"),
> > +               SUNXI_FUNCTION(0x5, "sdc1"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 3, 0)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 1),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "pwm7"),
> > +               SUNXI_FUNCTION(0x3, "dmic0"),
> > +               SUNXI_FUNCTION(0x4, "spi1"),
> > +               SUNXI_FUNCTION(0x5, "sdc1"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 3, 1)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 2),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "twi1"),
> > +               SUNXI_FUNCTION(0x3, "dmic0"),
> > +               SUNXI_FUNCTION(0x4, "spi1"),
> > +               SUNXI_FUNCTION(0x5, "sdc1"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 3, 2)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 3),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "twi1"),
> > +               SUNXI_FUNCTION(0x3, "dmic0"),
> > +               SUNXI_FUNCTION(0x4, "spi1"),
> > +               SUNXI_FUNCTION(0x5, "sdc1"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 3, 1)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 4),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "twi2"),
> > +               SUNXI_FUNCTION(0x3, "dmic0"),
> > +               SUNXI_FUNCTION(0x4, "spi1"),
> > +               SUNXI_FUNCTION(0x5, "sdc1"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 3, 4)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 5),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "twi2"),
> > +               SUNXI_FUNCTION(0x4, "ac0"),
> > +               SUNXI_FUNCTION(0x5, "sdc1"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 3, 5)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 6),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "i2s0"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 3, 6)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 7),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "i2s0"),
> > +               SUNXI_FUNCTION(0x3, "dsd0"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 3, 7)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 8),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "i2s0"),
> > +               SUNXI_FUNCTION(0x3, "dsd0"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 3, 8)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 9),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "i2s0"),
> > +               SUNXI_FUNCTION(0x3, "dsd0"),
> > +               SUNXI_FUNCTION(0x4, "bist_result0"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 3, 9)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 10),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "i2s0"),
> > +               SUNXI_FUNCTION(0x3, "dsd0"),
> > +               SUNXI_FUNCTION(0x4, "bist_result1"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 3, 10)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 11),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "spdif0"),
> > +               SUNXI_FUNCTION(0x4, "pll_lock_dbg"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 3, 11)),
> > +
> > +};
> > +
> > +static const struct sunxi_pinctrl_desc sun8i_b288_pinctrl_data =3D {
> > +     .pins =3D sun8i_b288_pins,
> > +     .npins =3D ARRAY_SIZE(sun8i_b288_pins),
> > +     .irq_banks =3D 4,
> > +};
> > +
> > +static int sun8i_b288_pinctrl_probe(struct platform_device *pdev)
> > +{
> > +     return sunxi_pinctrl_init(pdev,
> > +                               &sun8i_b288_pinctrl_data);
> > +}
> > +
> > +static const struct of_device_id sun8i_b288_pinctrl_match[] =3D {
> > +     { .compatible =3D "allwinner,sun8i-b288-pinctrl", },
> > +     {}
> > +};
> > +
> > +static struct platform_driver sun8i_b288_pinctrl_driver =3D {
> > +     .probe  =3D sun8i_b288_pinctrl_probe,
> > +     .driver =3D {
> > +             .name           =3D "sun8i-b288-pinctrl",
> > +             .of_match_table =3D sun8i_b288_pinctrl_match,
> > +     },
> > +};
> > +builtin_platform_driver(sun8i_b288_pinctrl_driver);
>
