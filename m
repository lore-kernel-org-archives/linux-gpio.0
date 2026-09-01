Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E255949DB8D;
	Tue,  1 Sep 2026 18:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788287579; cv=none; b=QWt7N7CLWXng2B6ptyijyWfb3j8jCfpCjPhMmSPy9hcb2MrJBovPCTZoKqIHQqxbiDqLRdZt4tj7eNEs5vevu8sGPyXFX1KU1CpfP06w4umZnGKRiNL8oxxTJjYT4iFAP4zAXmUTX3W14ZHMKeh5o4DjKrw7ddzec4cgJc1QzAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788287579; c=relaxed/simple;
	bh=LG35q0rB7aisyVByQa8zIVI53//Au7O+KpzXaNGI2SE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ADPL2wNelh3od5YGNoX1rREmGtIVFxn+S/whac7RzearEFdebX6YfSL3ad/Xsq0iKQrBsAFRw9/ovtvHDEYWMOaHO2ZR0yQM50jsfopYL5kKTSWEbzF9k+hF3o6v2PDlgbXOr8kOiWDcDZoAVpCyFSm1lGo7VdQdPVBlgyq13j0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from edelgard.fodlan.icenowy.me (unknown [120.85.96.74])
	by APP-01 (Coremail) with SMTP id qwCowAAn__I8GpdqvbIDBw--.20040S2;
	Wed, 02 Sep 2026 02:32:30 +0800 (CST)
Message-ID: <51a0c0657870a424f6bc9e149542a57ff6fb3ecd.camel@iscas.ac.cn>
Subject: Re: [PATCH 12/12] riscv: dts: thead: enable USB3 ports on Lichee Pi
 4A
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei	
 <wefu@redhat.com>, Michael Turquette <mturquette@baylibre.com>, Stephen
 Boyd	 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Vinod
 Koul	 <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,  Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Jisheng Zhang <jszhang@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, linux-riscv@lists.infradead.org,
 	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-usb@vger.kernel.org, Han Gao	
 <rabenda.cn@gmail.com>, Yao Zi <ziyao@disroot.org>
Date: Wed, 02 Sep 2026 02:32:28 +0800
In-Reply-To: <20260507081710.4090814-13-zhengxingda@iscas.ac.cn>
References: <20260507081710.4090814-1-zhengxingda@iscas.ac.cn>
	 <20260507081710.4090814-13-zhengxingda@iscas.ac.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-CM-TRANSID:qwCowAAn__I8GpdqvbIDBw--.20040S2
X-Coremail-Antispam: 1UD129KBjvJXoW3XF13XrWrJFyUKrW3uw1Utrb_yoWxJFWkpa
	9xJan3uay0vr17Ka13J3WDG3Z8Cr4v9a4v9r15Gr10kwsruwnFkryakrsY9ayUGF4xX34q
	vr4kuFWIgrnIg3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvlb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I
	8E87Iv6xkF7I0E14v26r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
	F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r
	4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACI402YVCY1x02628vn2kIc2xK
	xwCY1x0262kKe7AKxVW8ZVWrXwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJV
	W8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF
	1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6x
	IIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvE
	x4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvj
	DU0xZFpf9x07bIBTOUUUUU=
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/

=E5=9C=A8 2026-05-07=E5=9B=9B=E7=9A=84 16:17 +0800=EF=BC=8CIcenowy Zheng=E5=
=86=99=E9=81=93=EF=BC=9A
> The Lichee Pi 4A board features an onboard VIA VL817 hub connected to
> the SoC's USB3 as upstream and 4 USB-3.0-capable Type-A ports as
> downstream.
>=20
> Enable SoC USB3 and the hub on Lichee Pi 4A.
>=20
> Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> ---
> =C2=A0.../dts/thead/th1520-lichee-module-4a.dtsi=C2=A0=C2=A0=C2=A0 |=C2=
=A0 15 ++
> =C2=A0.../boot/dts/thead/th1520-lichee-pi-4a.dts=C2=A0=C2=A0=C2=A0 | 231
> ++++++++++++++++++
> =C2=A02 files changed, 246 insertions(+)
>=20
> diff --git a/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
> b/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
> index 8e76b63e0100a..bfda5a6b56b8f 100644
> --- a/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
> +++ b/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
> @@ -20,6 +20,16 @@ memory@0 {
> =C2=A0		device_type =3D "memory";
> =C2=A0		reg =3D <0x0 0x00000000 0x2 0x00000000>;
> =C2=A0	};
> +
> +	/* TODO: Switch to AON regulator when it's available. */
> +	avdd33_usb3: regulator-avdd33-usb3 {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "AVDD33_USB3";
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-max-microvolt =3D <3300000>;
> +		/* Marked as always on on the schematics */
> +		regulator-always-on;
> +	};
> =C2=A0};
> =C2=A0
> =C2=A0&osc {
> @@ -202,3 +212,8 @@ &sdio0 {
> =C2=A0	max-frequency =3D <198000000>;
> =C2=A0	status =3D "okay";
> =C2=A0};
> +
> +&usb_phy {
> +	avdd33-usb3-supply =3D <&avdd33_usb3>;
> +	status =3D "okay";
> +};
> diff --git a/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts
> b/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts
> index 354f3893aa8cf..de38f1f457e6b 100644
> --- a/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts
> +++ b/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts
> @@ -4,6 +4,7 @@
> =C2=A0 */
> =C2=A0
> =C2=A0#include "th1520-lichee-module-4a.dtsi"
> +#include <dt-bindings/gpio/gpio.h>
> =C2=A0
> =C2=A0/ {
> =C2=A0	model =3D "Sipeed Lichee Pi 4A";
> @@ -97,6 +98,141 @@ fan: pwm-fan {
> =C2=A0		cooling-levels =3D <0 66 196 255>;
> =C2=A0	};
> =C2=A0
> +	hub_5v: regulator-hub-5v {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "HUB_5V";
> +		regulator-min-microvolt =3D <5000000>;
> +		regulator-max-microvolt =3D <5000000>;
> +		gpio =3D <&ioexp3 3 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
> +
> +	vcc5v_usb: regulator-vcc5v-usb {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "VCC5V_USB";
> +		regulator-min-microvolt =3D <5000000>;
> +		regulator-max-microvolt =3D <5000000>;
> +		gpio =3D <&gpio1 22 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +		/*
> +		 * Workaround for Linux currently being not able to
> power on
> +		 * Vbus for USB Type-A connectors.
> +		 */
> +		regulator-always-on;

OHHHHH onboard_usb_dev now matches "usb-a-connector" and is able to
power on the vbus-supply regulator.

This hack should be removable now.

Thanks,
Icenowy

> +	};
> +
> +	connector-usb-a-1 {
> +		compatible =3D "usb-a-connector";
> +		vbus-supply =3D <&vcc5v_usb>;
> +
> +		ports {
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +
> +			port@0 {
> +				reg =3D <0>;
> +
> +				usb_a_1_hs_ep: endpoint {
> +					remote-endpoint =3D
> <&hub_hs_port1_ep>;
> +				};
> +			};
> +
> +			port@1 {
> +				reg =3D <1>;
> +
> +				usb_a_1_ss_ep: endpoint {
> +					remote-endpoint =3D
> <&hub_ss_port1_ep>;
> +				};
> +			};
> +		};
> +	};
> +
> +	connector-usb-a-2 {
> +		compatible =3D "usb-a-connector";
> +		vbus-supply =3D <&vcc5v_usb>;
> +
> +		ports {
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +
> +			port@0 {
> +				reg =3D <0>;
> +
> +				usb_a_2_hs_ep: endpoint {
> +					remote-endpoint =3D
> <&hub_hs_port2_ep>;
> +				};
> +			};
> +
> +			port@1 {
> +				reg =3D <1>;
> +
> +				usb_a_2_ss_ep: endpoint {
> +					remote-endpoint =3D
> <&hub_ss_port2_ep>;
> +				};
> +			};
> +		};
> +	};
> +
> +	connector-usb-a-3 {
> +		compatible =3D "usb-a-connector";
> +		vbus-supply =3D <&vcc5v_usb>;
> +
> +		ports {
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +
> +			port@0 {
> +				reg =3D <0>;
> +
> +				usb_a_3_hs_ep: endpoint {
> +					remote-endpoint =3D
> <&hub_hs_port3_ep>;
> +				};
> +			};
> +
> +			port@1 {
> +				reg =3D <1>;
> +
> +				usb_a_3_ss_ep: endpoint {
> +					remote-endpoint =3D
> <&hub_ss_port3_ep>;
> +				};
> +			};
> +		};
> +	};
> +
> +	connector-usb-a-4 {
> +		compatible =3D "usb-a-connector";
> +		vbus-supply =3D <&vcc5v_usb>;
> +
> +		ports {
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +
> +			port@0 {
> +				reg =3D <0>;
> +
> +				usb_a_4_hs_ep: endpoint {
> +					remote-endpoint =3D
> <&hub_hs_port4_ep>;
> +				};
> +			};
> +
> +			port@1 {
> +				reg =3D <1>;
> +
> +				usb_a_4_ss_ep: endpoint {
> +					remote-endpoint =3D
> <&hub_ss_port4_ep>;
> +				};
> +			};
> +		};
> +	};
> +};
> +
> +&aogpio {
> +	/* Route USB2 to the onboard hub for normal operation */
> +	sel-usb-hub-hog {
> +		gpio-hog;
> +		gpios =3D <4 GPIO_ACTIVE_HIGH>;
> +		output-high;
> +	};
> =C2=A0};
> =C2=A0
> =C2=A0&dpu {
> @@ -262,3 +398,98 @@ &uart0 {
> =C2=A0	pinctrl-0 =3D <&uart0_pins>;
> =C2=A0	status =3D "okay";
> =C2=A0};
> +
> +&usb {
> +	dr_mode =3D "host";
> +	#address-cells =3D <1>;
> +	#size-cells =3D <0>;
> +	status =3D "okay";
> +
> +	hub_hs: hub@1 {
> +		compatible =3D "usb2109,2817";
> +		reg =3D <1>;
> +		peer-hub =3D <&hub_ss>;
> +		vdd-supply =3D <&hub_5v>;
> +
> +		ports {
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +
> +			port@1 {
> +				reg =3D <1>;
> +
> +				hub_hs_port1_ep: endpoint {
> +					remote-endpoint =3D
> <&usb_a_1_hs_ep>;
> +				};
> +			};
> +
> +			port@2 {
> +				reg =3D <2>;
> +
> +				hub_hs_port2_ep: endpoint {
> +					remote-endpoint =3D
> <&usb_a_2_hs_ep>;
> +				};
> +			};
> +
> +			port@3 {
> +				reg =3D <3>;
> +
> +				hub_hs_port3_ep: endpoint {
> +					remote-endpoint =3D
> <&usb_a_3_hs_ep>;
> +				};
> +			};
> +
> +			port@4 {
> +				reg =3D <4>;
> +
> +				hub_hs_port4_ep: endpoint {
> +					remote-endpoint =3D
> <&usb_a_4_hs_ep>;
> +				};
> +			};
> +		};
> +	};
> +
> +	hub_ss: hub@2 {
> +		compatible =3D "usb2109,817";
> +		reg =3D <2>;
> +		peer-hub =3D <&hub_hs>;
> +		vdd-supply =3D <&hub_5v>;
> +
> +		ports {
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +
> +			port@1 {
> +				reg =3D <1>;
> +
> +				hub_ss_port1_ep: endpoint {
> +					remote-endpoint =3D
> <&usb_a_1_ss_ep>;
> +				};
> +			};
> +
> +			port@2 {
> +				reg =3D <2>;
> +
> +				hub_ss_port2_ep: endpoint {
> +					remote-endpoint =3D
> <&usb_a_2_ss_ep>;
> +				};
> +			};
> +
> +			port@3 {
> +				reg =3D <3>;
> +
> +				hub_ss_port3_ep: endpoint {
> +					remote-endpoint =3D
> <&usb_a_3_ss_ep>;
> +				};
> +			};
> +
> +			port@4 {
> +				reg =3D <4>;
> +
> +				hub_ss_port4_ep: endpoint {
> +					remote-endpoint =3D
> <&usb_a_4_ss_ep>;
> +				};
> +			};
> +		};
> +	};
> +};

