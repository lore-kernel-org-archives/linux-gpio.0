Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795699525;
	b=0dZXHSYhuWmWvy9um8HLTR84ZprASWcd60AAMEih4vOW1ImjEF4CtovAyeFWnatExQ5n
	 aSXXbZguG+g4vcmLsZCIy/lMx/juzWIIB4iYdWUExlLSCDdeuPbLvw9kHzdpCJZbTGl8B
	 09FTGz3QQt8A6tBMmEBKf3Va868ljqGaVOxNASmq+FF/ZowsR2MbYGnv4dKDU5uvoKMA7
	 rFG68KEd+jiA1ASjo6wswJdoERROFqK26nwjj1hFDYVzjs/XGFkxxPcegorDmOGVkaF/x
	 zlpwp2a+so6ZgppdFJ4To11QMGzNh0rPGC2szPr1xjSpGZwfUH6Pdprjr1pP0EcHNSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795699525;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=iECrdmtxVCEOEDzVZ7vxIbL2vsIcsAtR5y2etdhZVu0=;
	b=OBsWGjWDV0fZ3qaie54tEWsz/QISaiQ0cSzCc8+2o7RtvQYDXVyrlZOF8UItrIOLvHbp
	 uxjoIrHE8EzFrlmOjQMdhEkmhJhU231B427UrKgVECzJiI61eZnnPHsjWrD9pu6hDV9vO
	 CrAsEVJCbY560xgx3iLDb2UdoWLb3fhlvP4ApFiBs5nPGyYanpxva23yDCkcpz/z6oRme
	 F+Yft6NEIur7FbOJuIo1Xl/WCVYypsQSEXd2n28DY2Pes072Ar0iyC49f4nnLX5unSA3O
	 FoWXUyAjlvhdg78kRP4mBEo8OMFet8wX+cdsw3QMdd1NYGvgnZ9mt57uiDNIou6bzIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bDh+Ut2O;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13CA0606A321
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 13:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bDh+Ut2O
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5615B1F000D4
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 13:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795699524;
	bh=iECrdmtxVCEOEDzVZ7vxIbL2vsIcsAtR5y2etdhZVu0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=bDh+Ut2OMge4agv91hnty9kRPSuKqqYCaeh/TrFOco6KlcvoTwHRAOtOyg3S01nQC
	 skD11sOkFjrFkxIiCz42k24+uO9ZojSzigH2BDYVvezZQ2M66eY7jfJ4Y/Uwdn3zPn
	 tRl2o8vw1Ilc/M0cvh2TlBoTbnfcNCI+yMsN73C0z2/Rzb3rtuPSvK4QysuFlcnzSH
	 hyEtxcV3udmvFwvNEx4kpj7FLlF3SuaBT9PrnFTrlfyX1nm50JfyDM//nVjrvDtx46
	 IeBfiaVMeMMvh5MrSj1UpYSqoc3jWzI9O97wWFXMSj/go6kmid7q3feuvfPtzIdU0F
	 t1dqQdyUsCcmg==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5c08539c827so5526976e87.2
        for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 05:25:24 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGQJVxVfyXW66iGYG6TpvL4ZY/bX9uCj4LeuoG9RJ/82ZaX1C9tr90ttT+8RVLIJ92Bi+WVsRQ1UIgi@vger.kernel.org
X-Gm-Message-State: APuU4Z8PyY0iKSMw+PT/dQcf1gt0VgbeNwO/lqvbPOCa8ImQc+iuUOdY
	31rGUhsxFm1F61GQR9iMyfVvjiv7KtRUk199AZmN42UQocHpv1DzDvbuQZO0luolA8Tadx0Bdpi
	DpA7NVo1CuvZgHpqqHeTUyZJkrv8RYMc=
X-Received: by 2002:a05:6512:669b:10b0:5c3:2330:d723 with SMTP id
 2adb3069b0e04-5c32330d761mr1376713e87.15.1795699523098; Thu, 26 Nov 2026
 05:25:23 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116075510.5722-1-Chloe_Chen@asmedia.com.tw>
In-Reply-To: <20261116075510.5722-1-Chloe_Chen@asmedia.com.tw>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 26 Nov 2026 14:25:10 +0100
X-Gmail-Original-Message-ID: <CAD++jLniqoXQUGb+rS0aff0h6evF4cwGYoF0XgPU8D0g_e0guQ@mail.gmail.com>
X-Gm-Features: Aa3M54q_CQm2u_mi7VkGLDQQbPkytJcsCPgPa1sEYHQLrYg0uS_KzxlCxCYnaI8
Message-ID: <CAD++jLniqoXQUGb+rS0aff0h6evF4cwGYoF0XgPU8D0g_e0guQ@mail.gmail.com>
Subject: Re: [PATCH v4] gpio: amdptpci: add support for AMD PT PCI controller
To: Szuying Chen <Chloe_Chen@asmedia.com.tw>
Cc: Markus.Elfring@web.de, linux-gpio@vger.kernel.org, brgl@kernel.org, 
	linux-kernel@vger.kernel.org, Yd_Tseng@asmedia.com.tw, 
	Jesse1_Chang@asmedia.com.tw, Richard_Hsu@asmedia.com.tw
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hio Szuying,

thanks for your patch!

On Mon, Nov 16, 2026 at 8:55=E2=80=AFAM Szuying Chen <Chloe_Chen@asmedia.co=
m.tw> wrote:

> The GPIO controller on AMD PT PCI platforms currently has no in-tree
> driver, so its pins cannot be used from Linux.
>
> The existing gpio-amdpt driver cannot be reused. Setting aside ACPI
> vs. PCI probing, the hardware differs significantly:
>
>  - Register semantics conflict: offset 0x0C controls the clock rate
>    in gpio-amdpt but enables interrupts in this controller.
>  - Interrupt controller: gpio-amdpt has no interrupt support, while
>    this controller has its own INT_LVL, INT_STAT and INT_MASK
>    registers that require a full irq_chip implementation.
>  - Wakeup: this controller can wake the system from GPIO interrupts,
>    which gpio-amdpt does not support.
>
> Only the basic data registers are common, and they are handled
> through gpio-generic, so little code is left to share.
>
> Add the gpio-amdptpci driver to support the GPIO functionality on
> AMD PT PCI platforms.
>
> Co-developed-by: YD Tseng <Yd_Tseng@asmedia.com.tw>
> Signed-off-by: YD Tseng <Yd_Tseng@asmedia.com.tw>
> Signed-off-by: Szuying Chen <Chloe_Chen@asmedia.com.tw>

(...)
> +config GPIO_AMDPTPCI
> +       tristate "AMD Promontory PCI GPIO support"
> +       depends on X86
> +       select GPIO_GENERIC

Neat!

> +#include <linux/bits.h>
> +#include <linux/gpio/driver.h>
> +#include <linux/gpio/generic.h>

> +static void pt27_irq_ack(struct irq_data *d)
> +{
> +       struct gpio_chip *gc   =3D irq_data_get_irq_chip_data(d);
> +       struct pt27_gpio *chip =3D gpiochip_get_data(gc);
> +
> +       iowrite32(BIT(irqd_to_hwirq(d)), chip->base + PT27_REG_INT_STAT);
> +}

No need to use the lock here? I think this should probably take a lock
and use read-modify-write, think about what happens if two interrupts
arrive at the same time.

Other than that it looks good, but look into Sashiko's comments too.

Yours,
Linus Walleij
