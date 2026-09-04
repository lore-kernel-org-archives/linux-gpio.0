Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 618F33F3296
	for <linux-gpio@vger.kernel.org>; Fri,  4 Sep 2026 06:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788504856; cv=none; b=t6fcjRPl4N9ZeA0k7dSNPOxl1tL5L2Cdf0BEtebJsYRFvbeLZLp4sO7zrsqeE2ZFDW0Caj5L/BHeKucs/NrasnVbDoqkDTU/Gnejy0Hh7mrP8/MlwZ0s9qV+kqhXzrTfZqkC7eMmuPSSsTttLeJ3AaBIDvXcULjz68nlKXKsivE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788504856; c=relaxed/simple;
	bh=03G0YYbfLRmZaX1/Bj43h7t8H/IhGZbMFVeL2gNKUXI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=dTzXuF3VGBKpuQSFBJD/T2PeEeLN140BDqhJgI95lOnc2gZn5iZuTkVupVEcfHbFRjqsRKz1Wh4FML4gQZoxAxHL23ArGmsSsQCcCpnCnWjvd5IT6l6+setJX79rR7RyHZV/h+MWxV7IxIu6yX7WNeDTrsmK7Q2wRHUpLBTekFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=bBnDbBPF; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="bBnDbBPF"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-485888b3c3dso535860f8f.2
        for <linux-gpio@vger.kernel.org>; Thu, 03 Sep 2026 23:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1788504850; x=1789109650; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=opFAzeC6yLs6Vrjv44QhUvB3fomfpvweq22z4f5Cs58=;
        b=bBnDbBPFnOW6oBZTGmW3/9CRc6kvk3PnNHfYh0AJWxdIjGk8fCg0ck1y7eNagtEdTn
         jVPghTyf6TsAsX2vtfTrX4MuUy4vb6J1ehU19+Zi1H8Jiu40zagzWp287HlrrYQejAlD
         XlwlKyYJ1yyJ7qb4bKoQywDq1CjZSjyGkuMvycGON/13JECebZ9NDNGAURsgGk9Mzajr
         yWK/tX3P54I0iX5dr6Bm5fUPlFvcuYrBsN6fU+aAdQfDkUAde4bB2vfO+bIvUcX396L/
         qE7i4z/jvmcabOYO4rKMJhaAQv/nJzVRG27umiEO0Zz1/nJoy+3hK1PfiqGvlbOcg7tQ
         FgvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788504850; x=1789109650;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=opFAzeC6yLs6Vrjv44QhUvB3fomfpvweq22z4f5Cs58=;
        b=W8hTuSRkNF/eQTvsPqTvBJaT6e3x6YabCCdhXlgZQ8IPRxyrzNvQaPxHIbOu/ALSmN
         KoCSiDknKtIx86bLA8dXmG+exPWHw84sSIVNrbeFvozT5m+no2v3z7LJsktW8qy+f3md
         R3wZa+kv55wPgeap1QoLQeTgaolS9zsz9pfqD8y5I0RJkkj/78s/H/s0EYzbHTjYyOaI
         lOz6+wn7o7NxR+xH5NRWorP/FqawxLuI5KetYCDj+sPe2waD8uIr8LAqA3I+3boeGh5K
         fMsmbWvQxNrIwKil1mDrtHpnfbSyA4BpPQoMkgPCMtjjBD4hml+v1kGfvBI6fxYVIZ1G
         Xesg==
X-Forwarded-Encrypted: i=1; AKwUvBxq2Idmn/85rfM7k4MTM8ptTB8mLrt9EJ3MsDyTnoP404I0zozo1NvsFdSu/hAK5sofKQAbp9ZFM2sz@vger.kernel.org
X-Gm-Message-State: AFuF++nPe3pBZwN8ns3Cks+GzbgxX9C8cZLdCW58er2ICvF40zL0kdGA
	vQ/pYMuCbo2vgmUgLWhn9wHCkz1tmAE4pYH6eqDP7vEnMnUbMADxH0JraLK1Zc/FUjg=
X-Gm-Gg: AYBFou3v7jwzRus2+XgVIf59L+4pp70LgfS0rWyyPsGlbIDFL2QJ1b+w3EKwUhcSH23
	nv2NYaHIxR8JQ1HpnGU1H7GQshGPjandmoHkv+nl0LjrtqWT/WUyKH+Ifw9Xwa6aVsv+YkvtLIl
	0Z1VQmQFflVw02qrx298ech2La5OfEE3NuPfjwbO3T11VVroxkQ2htA3b4BRi6zCe//QWr9n8ri
	vJSQi187u6/GT2U4ZZIlo8n7RNp5ZhE5g3X4DC90eA9VQ5rtf/2QnPjZe/1nYDJtS7QTL8TvKzY
	Er3Na27x9dTbxr7CEu8rL0F5Ll7uGaYxJlaZdVJtJgB8r02HVLjeB+MDNutjRxcVGRyuo0MIi/L
	fNklhippIRIs6ur21YnoTpOqQMpYEx21vEaprgzuHhwutArzujCci4mxO82D8JJXpRwDPsD9DdQ
	H675zLykcT9y7Ioq48KDhHPjEQAA5ZI8GmkF9HYMGGDlP6dwuo79oZT7Uko5wsjEXZcmXr9fazi
	V8ZN5Q=
X-Received: by 2002:a05:6000:4a0b:b0:485:8c16:5ef2 with SMTP id ffacd0b85a97d-4858c16610fmr1044275f8f.44.1788504849840;
        Thu, 03 Sep 2026 23:54:09 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c5bc5sm4347121f8f.24.2026.09.03.23.54.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 23:54:08 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Long Zhao via B4 Relay <devnull+longzhao.ambarella.com@kernel.org>, Arnd
 Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>, Alexandre
 Belloni <alexandre.belloni@bootlin.com>, soc@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Cc: Long Zhao <longzhao@ambarella.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, Andy
 Shevchenko <andriy.shevchenko@linux.intel.com>, Ilpo =?utf-8?Q?J=C3=A4rvi?=
 =?utf-8?Q?nen?=
 <ilpo.jarvinen@linux.intel.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Long Zhao
 <zl020895@163.com>, Lee Jones <lee@kernel.org>, mfd@lists.linux.dev,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski
 <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v6 00/13] Ambarella CV75 SoC minimal bring-up
In-Reply-To: <20260904-cv75-v5-v6-0-e918514cb3b1@ambarella.com>
References: <20260904-cv75-v5-v6-0-e918514cb3b1@ambarella.com>
Date: Fri, 04 Sep 2026 08:54:03 +0200
Message-ID: <1jwlt1ld6c.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On ven. 04 sept. 2026 at 14:38, Long Zhao via B4 Relay <devnull+longzhao.am=
barella.com@kernel.org> wrote:

> This series adds minimal Ambarella CV75 support for early bring-up with
> a serial console: DT bindings, RCT/CCU clocks, pinctrl, PL061 GPIO via
> gpio-regmap, 8250_dw UART quirks, ARCH_AMBARELLA, CV75 EVK DT, and
> MAINTAINERS.
>
> This is a single unified series. Please apply via the SoC tree;
> subsystem maintainers are Cc'd for their pieces.
>
> Verified with:
> - scripts/checkpatch.pl --strict (0 errors)
> - make dt_binding_check DT_SCHEMA_FILES=3Dambarella:pl061-gpio.yaml:sysco=
n.yaml:snps-dw-apb-uart.yaml
> - make CHECK_DTBS=3Dy ambarella/cv75-evk.dtb
> - arm64 build of new drivers/DTS
> - CV75 EVK: console via 8250_dw (dw-apb-uart); GPIO edge IRQ
>   (gpio-hammer / gpio-event-mon)
>
> Signed-off-by: Long Zhao <longzhao@ambarella.com>
> ---
> Changes in v6:
> - gpio: convert gpio-pl061 data path to gpio-regmap; keep PL061 irqchip
>   (Andy, Linus). Add write_data_after_dir + girq helpers to gpio-regmap.
>   Ambarella layout uses JEP106 periphid 0x000e8061; no AFSEL clearing in
>   the GPIO driver; Ambarella skips unverified GPIO PM save/restore
> - serial: restore 8250_dw Ambarella quirks from v3; drop standalone
>   8250_ambarella (Andy). Commit message clarifies Ambarella IP with a
>   DW-like register map needing only a thin quirk. Binding under
>   snps-dw-apb-uart; DT uses ambarella,cv75-uart + snps,dw-apb-uart with
>   reg-shift/reg-io-width
> - clock/RCT: document #reset-cells (Krzysztof); soft-reset ID header and
>   reset provider deferred (no resets=3D consumers in this series)
> - arm64/Kconfig: do not select ARM_PSCI / HAVE_ARM_ARCH_TIMER (Sashiko)
> - pinctrl: no Ambarella suspend/resume claim without validated PM
>
> Link to v5:
> https://lore.kernel.org/r/20260818-cv75-v5-v5-0-7bbb12f0360f@ambarella.com
> Link to v2:
> https://lore.kernel.org/r/20260806-longzhao-upstream-cv75-v2-v2-0-6b09707=
c5fe9@ambarella.com
> Link to v3-A:
> https://lore.kernel.org/r/20260813-cv75-v3-a-v3-0-cfdd20b1b4dd@ambarella.=
com
> Link to v3-B:
> https://lore.kernel.org/r/20260813-cv75-v3-b-v3-0-1d82e18da09b@ambarella.=
com
> Link to v3-C:
> https://lore.kernel.org/r/20260813-cv75-v3-c-v3-0-9352b3fd6026@ambarella.=
com
> Link to v4-B:
> https://lore.kernel.org/r/20260814-cv75-v4-b-v4-0-622e63153d97@ambarella.=
com
>

No change log ?

> To: Arnd Bergmann <arnd@arndb.de>
> To: Krzysztof Kozlowski <krzk@kernel.org>
> To: Alexandre Belloni <alexandre.belloni@bootlin.com>
> To: soc@lists.linux.dev
> To: linux-arm-kernel@lists.infradead.org
> Cc: Rob Herring <robh@kernel.org>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Linus Walleij <linusw@kernel.org>
> Cc: Bartosz Golaszewski <brgl@kernel.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Jiri Slaby <jirislaby@kernel.org>
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Long Zhao <zl020895@163.com>
> Cc: Lee Jones <lee@kernel.org>
> Cc: mfd@lists.linux.dev
> Cc: devicetree@vger.kernel.org
> Cc: linux-clk@vger.kernel.org
> Cc: linux-gpio@vger.kernel.org
> Cc: linux-serial@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
>
> ---
> Long Zhao (13):
>       dt-bindings: arm: add Ambarella CV75 platforms
>       dt-bindings: mfd: syscon: add Ambarella CV75 secure scratchpad
>       dt-bindings: clock: add Ambarella CV75 RCT
>       dt-bindings: pinctrl: add Ambarella CV75 pinctrl
>       dt-bindings: gpio: pl061: add Ambarella CV75 variant
>       dt-bindings: serial: snps-dw-apb-uart: add ambarella,cv75-uart
>       clk: ambarella: add CV75 CCU driver
>       gpio: regmap: support write_data_after_dir and girq
>       gpio: pl061: use gpio-regmap and add Ambarella layout
>       pinctrl: ambarella: add CV75 pin controller
>       serial: 8250_dw: add Ambarella CV75 quirks
>       arm64: ambarella: add ARCH_AMBARELLA and CV75 EVK DT
>       MAINTAINERS: add ARM/AMBARELLA SoC support
>
>  .../devicetree/bindings/arm/ambarella.yaml         |  24 +
>  .../bindings/clock/ambarella,cv75-rct.yaml         |  64 ++
>  .../devicetree/bindings/gpio/pl061-gpio.yaml       |  32 +-
>  Documentation/devicetree/bindings/mfd/syscon.yaml  |   1 +
>  .../bindings/pinctrl/ambarella,cv75-pinctrl.yaml   | 239 +++++++
>  .../bindings/serial/snps-dw-apb-uart.yaml          |   1 +
>  .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
>  MAINTAINERS                                        |  14 +
>  arch/arm64/Kconfig.platforms                       |   6 +
>  arch/arm64/boot/dts/Makefile                       |   1 +
>  arch/arm64/boot/dts/ambarella/Makefile             |   3 +
>  arch/arm64/boot/dts/ambarella/cv75-evk.dts         |  30 +
>  arch/arm64/boot/dts/ambarella/cv75.dtsi            | 177 +++++
>  arch/arm64/configs/defconfig                       |   1 +
>  drivers/clk/Kconfig                                |   1 +
>  drivers/clk/Makefile                               |   1 +
>  drivers/clk/ambarella/Kconfig                      |  13 +
>  drivers/clk/ambarella/Makefile                     |   6 +
>  drivers/clk/ambarella/ccu-cv75.c                   | 296 ++++++++
>  drivers/clk/ambarella/ccu_common.c                 |  60 ++
>  drivers/clk/ambarella/ccu_common.h                 |  25 +
>  drivers/clk/ambarella/ccu_mux_div.c                | 234 +++++++
>  drivers/clk/ambarella/ccu_mux_div.h                |  35 +
>  drivers/clk/ambarella/ccu_pll.c                    | 421 ++++++++++++
>  drivers/clk/ambarella/ccu_pll.h                    |  70 ++
>  drivers/gpio/Kconfig                               |   2 +
>  drivers/gpio/gpio-pl061.c                          | 342 +++++----
>  drivers/gpio/gpio-regmap.c                         |  24 +-
>  drivers/pinctrl/Kconfig                            |  15 +
>  drivers/pinctrl/Makefile                           |   2 +
>  drivers/pinctrl/pinctrl-ambarella-cv75.c           | 561 +++++++++++++++
>  drivers/pinctrl/pinctrl-ambarella.c                | 761 +++++++++++++++=
++++++
>  drivers/pinctrl/pinctrl-ambarella.h                |  50 ++
>  drivers/tty/serial/8250/8250_dw.c                  |  34 +
>  include/dt-bindings/clock/ambarella,cv75-rct.h     |  15 +
>  include/linux/amba/bus.h                           |   1 +
>  include/linux/gpio/regmap.h                        |  13 +
>  37 files changed, 3439 insertions(+), 138 deletions(-)

That is a lot of stuff mixed into a single series that could easily split

> ---
> base-commit: 34cf6dafc47441dfb6b356a095b89c3585a93714
> change-id: 20260818-cv75-v5-9e2039b349bc
>
> Best regards,
> --=20=20
> Long Zhao <longzhao@ambarella.com>
>
>

--=20
Jerome
