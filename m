Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795549996;
	b=4uhD0N384fy3qmRkgZ4uHY+MI17vBVmClGKbrURASOtm35+DhwHXivnN011qNObOB1Vx
	 orRI9aOhrKpBEyJRsYmv3QuscDwhUHzQZhiXnssvvyxbByEpaddr9C2LPlQFTWNhg6zlB
	 RhkAT2VAsp0Mq67LgX3pLYP0atsVM8EfHIoYagkYJVkVogHtCf2HA2zFRpVFr0mKE+1qq
	 TTbvRkgtkXqQvLalcjYC718Jl8xAYUq8aSxrqiv+yT7ubHxkbpLxNWrKZzuw8JV2ipziX
	 aZKZ3n+p//YzLFGxKnx6l3kX6Hq5heG9agJ1XgELVdjeWJzj/OLbpQxugUUx8SeZDjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795549996;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=OsMdFyncfgbMmrTq3goiWr8HCVERbBrpE+CB8EHRq7s=;
	b=c8R43O6NnnF/NMHDA0hWNoh2CIrElkTqBbwLmmG9/2zoU0YuZY6E9GYUc8654h4RY0UC
	 p/DS/aBDS+aoYDTlipgkNSLXqCjLiKIvry/fTfaaAQPrVwBosotqKhdnxgJ/S81AJhn0Q
	 9Bpt7UGqDvALGeEFFmVvmjwSrjpVjkDZVs4xuS0eP82tgB6Xi36YzYPPhgkm/QA9JD4L9
	 AzSeeRXjoyEL4sL2M713lhFuy+hWhcGP6KSwSfVkjcPaKSAKmEgbTXzmzq5sgoGisk134
	 x79wokq3zoYa0M98Nrp6auTYEEi01YGTbMxNBuSHwG4ZAsHpZ5jSSizwsSvoAYw4bYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FvF5QMHU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DFBF606A33B;
	Tue, 24 Nov 2026 19:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FvF5QMHU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4C551F000C6;
	Tue, 24 Nov 2026 19:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795549996;
	bh=OsMdFyncfgbMmrTq3goiWr8HCVERbBrpE+CB8EHRq7s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FvF5QMHUD7GfTLqgnVqpJTsp1oXjVQ+OXIuKGhMHiZ6xStLzlvJjKEHA8lLfzwQ9H
	 KMJt+3L46GtNRpoAAIMnwG1BjSNU8bwuKnh2AwdPgcuwWOpWM9AYqqkCsynEKgEbkl
	 2O+9S4Kqt+dJyIS21YR77+yEAXE3AQGtqFOZdYgkie6pgGhNzzUjQRzQzKsrXwEivj
	 zV02AbFM1SLKZgadzQ9LudS+QBYYJ8xBfLoyXgaL785ztt4zMGO6srdb3/MyE8fXTa
	 wMmpHqwcgYJVwlVIBI5h9OJTn91mVpoJWBdjwXZcvneWVIBlWxKf5IoZCg3UX8Dbyh
	 7jXU75k+t2jEg==
Message-ID: <sashiko-outbox-231918@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 09/10] arm64: dts: qcom: sm8750: Add GP M/N clock
 controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Taniya Das" <taniya.das@oss.qualcomm.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261124-b4-pdm_clk_gp_mnd_v2-v3-9-98db26a87500@oss.qualcomm.com>
References: <20261124-b4-pdm_clk_gp_mnd_v2-v3-0-98db26a87500@oss.qualcomm.com>
 <20261124-b4-pdm_clk_gp_mnd_v2-v3-9-98db26a87500@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 19:53:15 +0000
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [High] arm64: dts: qcom: sm8750: undefined gp_mn pinctrl function
  breaks gp_mn probe
--

commit 1a48f00d1e707622e8662f63536985b47631218d
Author: Taniya Das <taniya.das@oss.qualcomm.com>

arm64: dts: qcom: sm8750: Add GP M/N clock controller

This commit adds the GP M/N clock controller node and its gpio53 pin
configuration to the SM8750 Devicetree.

> diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/q=
com/sm8750.dtsi
> index d8a853c31eeb1..fcc78bb3c8334 100644
> --- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
> @@ -3067,6 +3067,20 @@ opp-202000000 {
>  			};
>  		};
> =20
> +		gp_mn: clock-controller@88d3000 {
> +			compatible =3D "qcom,sm8750-gp-mnd", "qcom,sc7280-gp-mnd";
> +			reg =3D <0x0 0x088d3000 0x0 0x1000>;
> +			clocks =3D <&gcc GCC_PDM_XO4_CLK>,
> +				 <&gcc GCC_PDM_AHB_CLK>;
> +			clock-names =3D "pdm", "ahb";
> +			#clock-cells =3D <0>;
> +			pinctrl-0 =3D <&gp_mn_active>;
> +			pinctrl-names =3D "default";
> +			assigned-clocks =3D <&gcc GCC_PDM_XO4_CLK>;
> +			assigned-clock-rates =3D <4800000>;
> +			status =3D "disabled";
> +		};
> +
>  		usb_hsphy: phy@88e3000 {
>  			compatible =3D "qcom,sm8750-m31-eusb2-phy";
>  			reg =3D <0x0 0x88e3000 0x0 0x29c>;
> @@ -3921,6 +3935,13 @@ tlmm: pinctrl@f100000 {
>  			gpio-ranges =3D <&tlmm 0 0 216>;
>  			wakeup-parent =3D <&pdc>;
> =20
> +			gp_mn_active: gp-mn-active-state {
> +				pins =3D "gpio53";
> +				function =3D "gp_mn";
> +				drive-strength =3D <2>;
> +				bias-disable;
> +			};

[Severity: High]
Is "gp_mn" supported by the SM8750 pinctrl driver and binding?

drivers/pinctrl/qcom/pinctrl-sm8750.c does not define a gp_mn function in
sm8750_functions[], and pin 53 leaves mux slot 3 unmapped:

drivers/pinctrl/qcom/pinctrl-sm8750.c:sm8750_groups[] {
	...
	[53] =3D PINGROUP(53, qup1_se5, qspi1, _, ddr_pxi3, _, _, _, _, _, _, _),
	...
}

When a board enables gp_mn, pinctrl_bind_pins() ->
pinmux_func_name_to_selector() fails with -EINVAL and prevents gp_mn from
probing.  Documentation/devicetree/bindings/pinctrl/qcom,sm8750-tlmm.yaml
also omits gp_mn from the function enum, so gp_mn_active under tlmm causes
dtbs_check validation errors.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124-b4-pdm_clk=
_gp_mnd_v2-v3-0-98db26a87500@oss.qualcomm.com?part=3D9
