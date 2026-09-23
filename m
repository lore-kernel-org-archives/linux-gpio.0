Received: from mail-vs2-f40.google.com (mail-vs2-f40.google.com [74.125.227.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C59315335B4
	for <linux-gpio@vger.kernel.org>; Wed, 23 Sep 2026 14:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790174267; cv=none; b=lBv6DXnEynM+ahfqzWV0kKc3O8Jznjoui1NeyqBa1Koy74rdMHVdpdBz2Z4BEJbVcQTEQJ+q3zitDj7wrXUFWYm+6uHm6REQWtXJg2NHizeQxDiPUs7KbcHs5MF1qzVQHcVg+V8N/LX6j/D8a4Uz9j/GCMYR8kloCLNsmKJkKbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790174267; c=relaxed/simple;
	bh=/U1MgBD6VoBqJ/8qiTtjqod/dz4JUJFqpqKojTxWot0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iXPH265H2fbC0iwYDSiMt3WKAoWcQ3Kip/svysNw0Dj9Ye9OixdBcWjaFfxhYLWl9ouWPuRFP9xSzbePS9roEqAwApkXuB40zEAuq62QSMtrvC2OXCQeHWc4TMNzRaGud2+jgD6maeoxVIIjL16PCOBBKGMdXcpyAANFLAKnfm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f40.google.com with SMTP id ada2fe7eead31-7ac5b4011a4so413349137.2
        for <linux-gpio@vger.kernel.org>; Wed, 23 Sep 2026 07:37:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790174265; x=1790779065;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uSSwLrH/CqP5v9Ad6ht8i1AuRmzB1BOZysjgQqfiEm0=;
        b=jgIV2I7UUQlmh/e2zyIStobVH7/e1qe2hYzLF/obavm1WIqgjF1P1+IMwm1p2rY76E
         jQxswSTBtFB2y0HHzMNjGfu8YPKHLHLQKMT7IuuOKOY0FSbPdph0+hQUET4UQnmANRMB
         jiIclM2SXNFT3Q3b7xa4Kl8g8Va6pPKbd9AhnOSrTsh3mACVxWMZ8dbQEWF93UQB3SNI
         OnoqRNygraY7cOckfUaP1mJ0GMuXHe6JeZy5m9tjB+l40I7GqBjGYnIM22OL/3O1hGYe
         ly14yYZOI91yh6V8S/K8VKJOvtqI0Y9j//ZoZQLdYjE+W/UUj+sCn85ssrXhjGQOwp+0
         oGJA==
X-Forwarded-Encrypted: i=1; AKwUvByqgnR88qjBay1jAB2OGik1m2JWAM+e5kK4PvnrU8LiFXYIt6CSMd+BcJVq68W9Z2kWiUfDuMFn5wCi@vger.kernel.org
X-Gm-Message-State: AFuF++kGxlsJfXYKZJk5dq//GD9u+V4ZnBQ6P/h1nBz3FhbRG5ODhI8s
	LjZfn+D0MdY7M3epnMmUP6G5L8O+nASusIWTZE5113wNoEM6ZVVegoifb5/ZFgFcE8c=
X-Gm-Gg: AYBFou0XuD5HS4+EOT3VGKiPPZmtpQmIyasmQlRZVKlAf6zYX7o5PnhkbZaXh3JPmLW
	58CxadTHB6h0lh4JtJ0/STlgsxm3XxmRDvgzW7SzJrV9lqFmG9icar/8PnxNRyUereYA0o20Jqt
	g6Q/A5Sabm+IQk/C5OgUVmw64v16T0zO2TRqXOSfOrnZrXuEARLQm7KWYtuz6nEWz8Lyc9hnJyN
	UX2R/Nco4IaJfKqmCVbMK9zu5ez2ZZUhjZVM/xy31i3XdijVZ54xqAQK8POen6sjR0ti7344ymj
	c2iXb4o6u9u6Hc7ynpDSHimQm43N4k9vtkyeXzQzbUcMSj+MhrGv8zWtZBgWdZ3KPCy7COy793c
	95KfyhYRkJM5gFJj1ETj3bisOVxTyKHWNsb+1X0Nos0cV7G0nAbv/hn2dXmbcSsRZdPUpIUtzlK
	AcAHVsazEhrLJ1HjgJziiN8AQoeZ2T9Uier+XIQW1cCTISXgFcJXh9TifNjT/voThgh0/FPvBft
	IlosyavCZRMpHWl1txme7dgiU5hSYSENroy98sDQdivoNEf
X-Received: by 2002:a05:6102:26c5:b0:7a5:2427:ecc1 with SMTP id ada2fe7eead31-7ac1c998ff2mr2594812137.19.1790174264660;
        Wed, 23 Sep 2026 07:37:44 -0700 (PDT)
Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com. [74.125.226.204])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7abf5a7fb17sm3692106137.7.2026.09.23.07.37.42
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 07:37:43 -0700 (PDT)
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-97eaa1155b1so521936241.3
        for <linux-gpio@vger.kernel.org>; Wed, 23 Sep 2026 07:37:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxtf0nkInuQ2h5xvOXEoqYRFtja3i4piXJLiYJlhuUox+OMFEeNd88nBgUvG3zOE+biWuRHhg/VeO7b@vger.kernel.org
X-Received: by 2002:a05:6102:2922:b0:7a7:198a:c2bd with SMTP id
 ada2fe7eead31-7ac1da2015fmr2739749137.37.1790174262272; Wed, 23 Sep 2026
 07:37:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904-rzg2-sr-boards-v8-0-94c4674927e8@solid-run.com> <20260904-rzg2-sr-boards-v8-4-94c4674927e8@solid-run.com>
In-Reply-To: <20260904-rzg2-sr-boards-v8-4-94c4674927e8@solid-run.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Sep 2026 16:37:31 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUGOLr6TQvfS9i2W1ihBWUUuTG0=TcfyZ-Seb02+XW_3w@mail.gmail.com>
X-Gm-Features: AclHuK-Y4yRPc5ygPTDjA1xgXgYnA6hz3s-S6a8gc_ggzPpYCTe_qr4a-TZ4I5w
Message-ID: <CAMuHMdUGOLr6TQvfS9i2W1ihBWUUuTG0=TcfyZ-Seb02+XW_3w@mail.gmail.com>
Subject: Re: [PATCH v8 04/11] arm64: dts: renesas: add support for solidrun
 rzg2l som and hb-iiot evb
To: Josua Mayer <josua@solid-run.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Benjamin Bara <benjamin.bara@skidata.com>, 
	Linus Walleij <linusw@kernel.org>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Jon Nettleton <jon@solid-run.com>, Mikhail Anikin <mikhail.anikin@solid-run.com>, 
	Yazan Shhady <yazan.shhady@solid-run.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Josua,

On Fri, 4 Sept 2026 at 13:56, Josua Mayer <josua@solid-run.com> wrote:
> Add support for the SolidRun RZ/G2L SoM [1] on HummingBoard IIoT [2].
>
> The SoM features:
> - 2x 1Gbps Ethernet with PHY
> - eMMC
> - 1/2GB DDR
> - WiFi + Bluetooth
> - SDHI Mux switching between eMMC and Carrier Board
>
> The HummingBoard IIoT features:
> - 3x USB-2.0 Type A connector
> - 2x 1Gbps RJ45 Ethernet
> - USB Type-C Console Port
> - microSD connector
> - RTC with backup battery
> - RGB Status LED
> - 1x M.2 B-Key connector with USB-2.0 + SIM card holder
> - 1x DSI Display Connector
> - GPIO header
> - 2x RS232/RS485 ports (configurable)
> - 2x CAN
>
> Descriptions for eMMC, microSD and RS485 are provided as overlays due to
> their dependency on configurable mux states.
>
> [1] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-g2l-som/
> [2] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/hummingboard-rz-series-sbcs/hummingboard-rz-g2l-iot-sbc/
>
> Signed-off-by: Josua Mayer <josua@solid-run.com>

Thanks for your patch!

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/rzg2l-hummingboard-iiot-common.dtsi

> +       aliases {
> +               gpio1 = &tca6408_u48;
> +               gpio2 = &tca6408_u37;
> +               gpio3 = &tca6416_u20;
> +               gpio4 = &tca6416_u21;

The TCA64xx driver does not seem to support gpio aliases, so please
drop these.

> +               i2c3 = &i2c_exp;
> +               i2c4 = &i2c_csi;
> +               i2c5 = &i2c_dsi;
> +               i2c6 = &i2c_lvds;
> +               rtc0 = &carrier_rtc;
> +               rtc1 = &pmic;
> +               serial3 = &scif3;
> +       };

> +       v_1_2: regulator-1-2 {

Preferred node name is "regulator-1v2"...

> +               compatible = "regulator-fixed";
> +               regulator-name = "1v2";
> +               regulator-max-microvolt = <1200000>;
> +               regulator-min-microvolt = <1200000>;
> +       };
> +
> +       v_3_3: regulator-3-3 {

... "regulator-3v3".

> +               compatible = "regulator-fixed";
> +               regulator-name = "3v3";
> +               regulator-max-microvolt = <3300000>;
> +               regulator-min-microvolt = <3300000>;
> +       };

> +&i2c0 {
> +       /* highest i2c clock supported by all peripherals is 400kHz */

We have a DT propery for that ;-)

    clock-frequency = <400000>;

Same for i2c1.

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/rzg2l-sr-som.dtsi
> @@ -0,0 +1,480 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +/*
> + * Device Tree Source for the RZ/G2L Solidrun SoM
> + *
> + * Copyright 2023 SolidRun Ltd.
> + * Copyright 2025 Josua Mayer <josua@solid-run.com>
> + */
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/pinctrl/rzg2l-pinctrl.h>
> +
> +/ {
> +       aliases {
> +               ethernet0 = &eth0;
> +               ethernet1 = &eth1;
> +               gpio0 = &pinctrl;

The pin control driver does not support gpio aliases, so please
drop this.

> +               i2c0 = &i2c0;
> +               i2c1 = &i2c1;
> +               i2c2 = &i2c3;
> +               mmc0 = &sdhi0;
> +               mmc1 = &sdhi1;
> +               rtc0 = &pmic;
> +               serial0 = &scif0;
> +               serial1 = &scif1;
> +               serial2 = &scif2;
> +       };

I didn't compare with the board schematics, but the rest LGTM.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
