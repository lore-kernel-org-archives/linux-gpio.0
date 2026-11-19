Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795080236;
	b=18ZoljI2COkp26OORHz4NAHhInZ5lT5VkAuhwVmJTKOwnLodZJalGaRgDEehdfhTiE8h
	 Cn5cuPJCayNNF9sbsMQAVg3owugxOVfC1RPYCUZG5Ww72xTpn3EA5aanWEMY4BxCZ1tE0
	 GzcAqGxv/KmVbeYk8fCwguGE0BzZmD9aveZNDzlfDmora/1erl9s+CDQMJnAclVqEgwYu
	 DPOBgvGFpDwHSfggXZtS4pGqOmz7huuf/cWLBpsJdi9Bn0+xFFZ+1MkLxHfvv44cn4usQ
	 NMmZXxX/KDb6B3S88x2YGL8CU1FLOXTP+cPJgLQx7RIiBYD9w1m0bGUVPvWtTERF9FQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795080236;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:Organization:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=dgcsVJh97AVUtfi+/IriKqXTUvwmDL8uMBe8HU3ivU4=;
	b=uX+D0AOqNhNMajexo+DOBhpXHj4bTgDRc3gp3lP5yZ4R6kyEIpASAXJB5eaNAJkReKGr
	 PBvJeZsSD0njObkWe14u0YtLF78AAq3t3YKpagPjg78B4/nEnTQWt7I8sPXja0GMotEuS
	 qHEBeEl74hs/kMS+G97C2K7HeDttFQXMYuzQVNHVWt6j6K8BjvwxVLhOh+Zl6uxBuDznL
	 7hGlmzF2W6unt23PlRO0ABhR7MZqMo/hNpCs8QQvRoUbD4W2xyl0rhesRsA3ZBhU82xmH
	 VIIiYVKI1sVSO4xMBaen0rlXEIJsweVs6kVqHwzU0IB3FAm58w274YkRcT9QG3pe1tA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=WdYkct6B;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F817606A33F;
	Thu, 19 Nov 2026 09:23:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F817606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=WdYkct6B
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id BA6E61A170C;
	Thu, 19 Nov 2026 09:23:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 863F060237;
	Thu, 19 Nov 2026 09:23:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0504111BC0C10;
	Thu, 19 Nov 2026 10:23:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795080232; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=dgcsVJh97AVUtfi+/IriKqXTUvwmDL8uMBe8HU3ivU4=;
	b=WdYkct6BVjlKaUeu9qD9uWz3RwoF9BoMegkynIy9pQgGHj8VmmhA/MmFdB8wnEhCwu8yh5
	5TMkYkhSX1x3uReTch+h8KRSU7p6wElKiFeE2XVSXSTHp5qOGQjkqDsBdWSbnO7Fu2WgV7
	KVnKN+L58Jz2l5v/dE0+r1oaB3gyeceT3r2cPjrb3ED8MFgfWwy24VGRn94UmnP0ZesqA4
	gjwrKCjizn6BnaDg9EGPMs6e81g2ct5hsVFEioI5EyY3o/1YzYNgJDejW2lVhGK/qphsMv
	OSn+UlEelGAlCqTvbFLCuwwimS81QmCPiM2BYyfgPoWa12hFoKmt4e7qiwWLqQ==
Message-ID: <53f65c05-1c09-410d-8f49-9175f46a0609@bootlin.com>
Date: Thu, 19 Nov 2026 10:23:47 +0100
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/13] arm64: dts: synaptics: add SL2610 family RDK
 boards
To: Jisheng Zhang <jszhang@kernel.org>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Linus Walleij <linusw@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org
References: <20261115102401.3520-1-jszhang@kernel.org>
 <20261115102401.3520-14-jszhang@kernel.org>
From: Richard GENOUD <richard.genoud@bootlin.com>
Content-Language: en-US, fr
Organization: Bootlin
In-Reply-To: <20261115102401.3520-14-jszhang@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Le 15/11/2026 à 11:23, Jisheng Zhang a écrit :
> Add device trees for the SL2611, SL2613, SL2615, SL2617 and SL2619
> reference development kits. Share their common console, memory, pin
> configuration and regulator descriptions and enable the populated
> peripherals.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>   arch/arm64/boot/dts/synaptics/Makefile        |   5 +
>   arch/arm64/boot/dts/synaptics/sl2611-rdk.dts  |  16 +++
>   arch/arm64/boot/dts/synaptics/sl2613-rdk.dts  |  16 +++
>   arch/arm64/boot/dts/synaptics/sl2615-rdk.dts  |  16 +++
>   arch/arm64/boot/dts/synaptics/sl2617-rdk.dts  |  16 +++
>   arch/arm64/boot/dts/synaptics/sl2619-rdk.dts  |  16 +++
>   .../boot/dts/synaptics/sl261x-rdk-common.dtsi | 135 ++++++++++++++++++
>   7 files changed, 220 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/synaptics/sl2611-rdk.dts
>   create mode 100644 arch/arm64/boot/dts/synaptics/sl2613-rdk.dts
>   create mode 100644 arch/arm64/boot/dts/synaptics/sl2615-rdk.dts
>   create mode 100644 arch/arm64/boot/dts/synaptics/sl2617-rdk.dts
>   create mode 100644 arch/arm64/boot/dts/synaptics/sl2619-rdk.dts
>   create mode 100644 arch/arm64/boot/dts/synaptics/sl261x-rdk-common.dtsi
> 
> diff --git a/arch/arm64/boot/dts/synaptics/Makefile b/arch/arm64/boot/dts/synaptics/Makefile
> index de71ddda6835..810d0d08c2de 100644
> --- a/arch/arm64/boot/dts/synaptics/Makefile
> +++ b/arch/arm64/boot/dts/synaptics/Makefile
> @@ -2,3 +2,8 @@
>   # Berlin SoC Family
>   dtb-$(CONFIG_ARCH_BERLIN) += berlin4ct-dmp.dtb
>   dtb-$(CONFIG_ARCH_BERLIN) += berlin4ct-stb.dtb
> +dtb-$(CONFIG_ARCH_BERLIN) += sl2611-rdk.dtb
> +dtb-$(CONFIG_ARCH_BERLIN) += sl2613-rdk.dtb
> +dtb-$(CONFIG_ARCH_BERLIN) += sl2615-rdk.dtb
> +dtb-$(CONFIG_ARCH_BERLIN) += sl2617-rdk.dtb
> +dtb-$(CONFIG_ARCH_BERLIN) += sl2619-rdk.dtb
> diff --git a/arch/arm64/boot/dts/synaptics/sl2611-rdk.dts b/arch/arm64/boot/dts/synaptics/sl2611-rdk.dts
> new file mode 100644
> index 000000000000..585872307834
> --- /dev/null
> +++ b/arch/arm64/boot/dts/synaptics/sl2611-rdk.dts
> @@ -0,0 +1,16 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright (C) 2025 Synaptics Incorporated
> + *
> + * Author: Jisheng Zhang <jszhang@kernel.org>
> + */
> +
> +/dts-v1/;
> +
> +#include "sl2611.dtsi"
> +#include "sl261x-rdk-common.dtsi"
> +
> +/ {
> +	model = "Synaptics SL2611 RDK";
> +	compatible = "syna,sl2611-rdk", "syna,sl2611";
> +};
> diff --git a/arch/arm64/boot/dts/synaptics/sl2613-rdk.dts b/arch/arm64/boot/dts/synaptics/sl2613-rdk.dts
> new file mode 100644
> index 000000000000..de75c9fab6a2
> --- /dev/null
> +++ b/arch/arm64/boot/dts/synaptics/sl2613-rdk.dts
> @@ -0,0 +1,16 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright (C) 2025 Synaptics Incorporated
> + *
> + * Author: Jisheng Zhang <jszhang@kernel.org>
> + */
> +
> +/dts-v1/;
> +
> +#include "sl2613.dtsi"
> +#include "sl261x-rdk-common.dtsi"
> +
> +/ {
> +	model = "Synaptics SL2613 RDK";
> +	compatible = "syna,sl2613-rdk", "syna,sl2613";
> +};
> diff --git a/arch/arm64/boot/dts/synaptics/sl2615-rdk.dts b/arch/arm64/boot/dts/synaptics/sl2615-rdk.dts
> new file mode 100644
> index 000000000000..ae03638a3a53
> --- /dev/null
> +++ b/arch/arm64/boot/dts/synaptics/sl2615-rdk.dts
> @@ -0,0 +1,16 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright (C) 2025 Synaptics Incorporated
> + *
> + * Author: Jisheng Zhang <jszhang@kernel.org>
> + */
> +
> +/dts-v1/;
> +
> +#include "sl2615.dtsi"
> +#include "sl261x-rdk-common.dtsi"
> +
> +/ {
> +	model = "Synaptics SL2615 RDK";
> +	compatible = "syna,sl2615-rdk", "syna,sl2615";
> +};
> diff --git a/arch/arm64/boot/dts/synaptics/sl2617-rdk.dts b/arch/arm64/boot/dts/synaptics/sl2617-rdk.dts
> new file mode 100644
> index 000000000000..ba4ea21ac505
> --- /dev/null
> +++ b/arch/arm64/boot/dts/synaptics/sl2617-rdk.dts
> @@ -0,0 +1,16 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright (C) 2025 Synaptics Incorporated
> + *
> + * Author: Jisheng Zhang <jszhang@kernel.org>
> + */
> +
> +/dts-v1/;
> +
> +#include "sl2617.dtsi"
> +#include "sl261x-rdk-common.dtsi"
> +
> +/ {
> +	model = "Synaptics SL2617 RDK";
> +	compatible = "syna,sl2617-rdk", "syna,sl2617";
> +};
> diff --git a/arch/arm64/boot/dts/synaptics/sl2619-rdk.dts b/arch/arm64/boot/dts/synaptics/sl2619-rdk.dts
> new file mode 100644
> index 000000000000..58901ac2a050
> --- /dev/null
> +++ b/arch/arm64/boot/dts/synaptics/sl2619-rdk.dts
> @@ -0,0 +1,16 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright (C) 2025 Synaptics Incorporated
> + *
> + * Author: Jisheng Zhang <jszhang@kernel.org>
> + */
> +
> +/dts-v1/;
> +
> +#include "sl2619.dtsi"
> +#include "sl261x-rdk-common.dtsi"
> +
> +/ {
> +	model = "Synaptics SL2619 RDK";
> +	compatible = "syna,sl2619-rdk", "syna,sl2619";
> +};
> diff --git a/arch/arm64/boot/dts/synaptics/sl261x-rdk-common.dtsi b/arch/arm64/boot/dts/synaptics/sl261x-rdk-common.dtsi
> new file mode 100644
> index 000000000000..78a9b28fdf99
> --- /dev/null
> +++ b/arch/arm64/boot/dts/synaptics/sl261x-rdk-common.dtsi
> @@ -0,0 +1,135 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright (C) 2025 Synaptics Incorporated
> + *
> + * Author: Jisheng Zhang <jszhang@kernel.org>
> + */
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/linux-event-codes.h>
> +
> +/ {
> +	aliases {
> +		serial0 = &sm_uart0;
> +		serial1 = &sm_uart1;
> +		serial2 = &sm_uart2;
> +		serial3 = &sm_uart3;
> +		serial4 = &soc_uart0;
> +		serial5 = &soc_uart1;
> +		serial6 = &soc_uart2;
> +		serial7 = &soc_uart3;
> +		i2c0 = &sm_i2c0;
> +		i2c1 = &sm_i2c1;
> +		i2c2 = &soc_i2c0;
> +		i2c3 = &soc_i2c1;
> +		spi1 = &sm_spi1;
> +		spi2 = &soc_spi0;
> +		spi3 = &soc_spi1;
> +		spi4 = &soc_spi2;
> +		spi5 = &soc_spi3;
> +	};
> +
> +	cpus {
> +		cpu@0 {
> +			cpu0-supply = <&vcore>;
> +		};
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +		bootargs = "earlycon";
> +	};
> +
> +	memory@0 {
> +		device_type = "memory";
> +		reg = <0x0 0x00000000 0x0 0x80000000>;
> +	};
Some memory is dedicated to the trust zone:
     tz                      0x00100000 - 0x00600000 (secure)
     bootloader              0x00600000 - 0x00D00000
     NonSecure-NonCacheable  0x00D00000 - 0x01500000
     system                  0x01500000 - 0x7FFFFF00
(from mr_config)

Should it be added here as reserved-memory, or it's intended to be set 
at run time by the bootloader?
I was thinking of something like:
	reserved_memory: reserved-memory {
		#address-cells = <2>;
		#size-cells = <2>;
		ranges;

		tz: tz@100000 {
			reg = <0x0 0x00100000 0x0 0x00500000>;
			no-map;
		};
	};


> +};
> +
> +&osc {
> +	clock-frequency = <25000000>;
> +};
> +
> +&pinctrl {
> +	soc_i2c0_pmux: soc_i2c0-pmux {
> +		groups = "GPIO23", "GPIO24";
> +		function = "tw2";
> +		drive-strength = <7>;
> +	};
> +};
> +
> +&sm_pinctrl {
> +	sm_i2c0_pmux: i2c0-pmux {
> +		groups = "SM_GPIO12", "SM_GPIO13";
> +		function = "tw0";
> +		drive-strength = <7>;
> +	};
> +
> +	sm_i2c1_pmux: i2c1-pmux {
> +		groups = "SM_GPIO3", "SM_GPIO4";
> +		function = "tw1";
> +		drive-strength = <7>;
> +	};
> +
> +	vcore_gpio_pmux: vcore-gpio-pmux {
> +		groups = "SM_GPIO5";
> +		function = "gpio";
> +	};
> +};
> +
> +&sm_uart0 {
> +	status = "okay";
> +};
> +
> +&sm_i2c0 {
> +	status = "okay";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&sm_i2c0_pmux>;
> +	clock-frequency = <100000>;
> +
> +	expander0: gpio@43 {
> +		compatible = "fcs,fxl6408";
> +		reg = <0x43>;
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +	};
> +
> +	expander1: gpio@44 {
> +		compatible = "fcs,fxl6408";
> +		reg = <0x44>;
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +	};
> +};
> +
> +&sm_i2c1 {
> +	status = "okay";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&sm_i2c1_pmux>;
> +	clock-frequency = <100000>;
> +
> +	vcore: regulator@60 {
> +		compatible = "silergy,sy8827n";
> +		reg = <0x60>;
> +		regulator-name = "vcore";
> +		regulator-min-microvolt = <700000>;
> +		regulator-max-microvolt = <987500>;
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-active-discharge = <0>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&vcore_gpio_pmux>;
> +		enable-gpios = <&portc 5 GPIO_ACTIVE_LOW>;
> +	};
> +};
> +
> +&soc_i2c0 {
> +	status = "okay";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&soc_i2c0_pmux>;
> +	clock-frequency = <100000>;
> +};
> +
> +&sm_uart1 {
> +	status = "okay";
> +};
