Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793100682;
	b=D3RyWF0L0dRtzR3csnWfr0HzCPuas4rYujqKfVntCEpqSDgVBZ605XZzrjTMvWMaRP3H
	 xF5MlLOr+QV7ea/d3kCC7bQ2a6UHCTT6/btPZ+GUA7aZbrRFyKKvF+0VSDGtDONcsv9Hy
	 gxCwnwe1OpKF53rXmLXm5SjcumppF0LJWg+iLmGB4ul1R8gLCClBQbRb3dcD7qOgJX588
	 2tgOxXr4YFunQ6kubqJsIzxl+jE2LZXtOgAqpMiogQePaP0q0UoHujmn4U/Lem2BzWHIT
	 48rZYHTnT1kSWbLbQ0QZcm71BzZ9t1E1uBV13zlr4owE6YKpxayUE7lqgnZOpjyNEhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793100682;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=G3LvWOxUnjLoQmRGKIBl8CxWX4qZcang/Y7IR5ca5Os=;
	b=abhWQWSGnN4A/L/ZqIJrWOSnZUdLJpzmpSWdxtX9mevCNOvAZez8ksCOvrAKd8AqXRDH
	 JbNbOCH4xdJtlDO1GX2t9UyxJlxk9btQt7GEWwCRFN2ByPfoBlKzCsNAkVJNo9UUChtvl
	 +7d/Fnmku/p5CgR1Fnf1xuTbCadwUx9nHGsIagjjp1YGx3zbpgoQiADvLVwGWk4rgfWvR
	 zoArGADxztYIeknuTZi551DY7BKpj4+sv8b8H7BVoj9H52e5LLQPlNSj3/728/GXR6HLW
	 boa81SK2OFDuzCurJxikjlDeZYYRJvIk5/WFejEu6oL4c9J51RVhjHhX+cneHihSZCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dyNF11sY;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 368FD606A327;
	Tue, 27 Oct 2026 11:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dyNF11sY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B503F1F031E1;
	Tue, 27 Oct 2026 11:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793100682;
	bh=G3LvWOxUnjLoQmRGKIBl8CxWX4qZcang/Y7IR5ca5Os=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dyNF11sYND05GG2QhcJAU53sXGgNA5IFOjHiABUfOcy40uVb3CqT22RQHfwb1E1rO
	 ZnipXhkP6VsT5mjx4pOAjaGEW8BNTMXZw3pMM2rqYVZ1arxITzmwRs9MWCmxfcbeh4
	 OUg3KtPOuf13NVRnnZLdzJlCQonMp1WwA0/rql3jZnbl1p3L6KtZkLFVijPQPeCee+
	 DzZpNRbslDKuqe3MargxK7Z98GgZx8qj06pXHSBr7JBASC5XHNEqpcXZWK1wHjwiy9
	 9HQjeyibPmCmqzm9VDGVhw/Ls3HKK5qTW129wPZ1/GtgBqomU+QAZ/WRXzhg3mFsMW
	 K2uMrqdBaJqxA==
Message-ID: <sashiko-outbox-186454@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 09/12] arm64: dts: qcom: qcs8300: Add GP M/N clock
 controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Taniya Das" <taniya.das@oss.qualcomm.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261026-b4-pdm_clk_gp_mnd_v2-v2-9-ff8e4bc8d567@oss.qualcomm.com>
References: <20261026-b4-pdm_clk_gp_mnd_v2-v2-0-ff8e4bc8d567@oss.qualcomm.com>
 <20261026-b4-pdm_clk_gp_mnd_v2-v2-9-ff8e4bc8d567@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 27 Oct 2026 11:31:21 +0000
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] arm64: dts: qcom: monaco: undocumented gp_mn function fails dtbs_ch=
eck
--

commit ec768e562985a95ab74c10638b6159100f9048cc
Author: Taniya Das <taniya.das@oss.qualcomm.com>

arm64: dts: qcom: qcs8300: Add GP M/N clock controller

This commit adds the GP M/N clock controller node and its pin configuration=
 on
gpio32 to arch/arm64/boot/dts/qcom/monaco.dtsi for QCS8300.

> diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/q=
com/monaco.dtsi
> index 35fbee63d4c65..e122f70eaf20c 100644
> --- a/arch/arm64/boot/dts/qcom/monaco.dtsi
> +++ b/arch/arm64/boot/dts/qcom/monaco.dtsi

[ ... ]

> @@ -6457,6 +6471,13 @@ dp_hot_plug_det: dp-hot-plug-det-state {
>  				bias-disable;
>  			};
> =20
> +			gp_mn_active: gp-mn-active-state {
> +				pins =3D "gpio32";
> +				function =3D "gp_mn";
> +				drive-strength =3D <2>;
> +				bias-disable;
> +			};

[Severity: Low]
Will adding gp_mn_active with function =3D "gp_mn" under tlmm
(compatible =3D "qcom,qcs8300-tlmm") cause dtbs_check regressions for device
trees including arch/arm64/boot/dts/qcom/monaco.dtsi?

While commit 70134b186a81 ("pinctrl: qcom: qcs8300: Add gp_mn mux function")
added the gp_mn function to drivers/pinctrl/qcom/pinctrl-qcs8300.c, the sch=
ema
in Documentation/devicetree/bindings/pinctrl/qcom,qcs8300-tlmm.yaml does not
list gp_mn in the function enum under $defs/qcom-qcs8300-tlmm-state:

        enum: [ aoss_cti, atest_char, atest_usb2, audio_ref, cam_mclk,
                cci_async, cci_i2c_scl, cci_i2c_sda, cci_timer, cri_trng,
                dbg_out, ddr_bist, ddr_pxi0, ddr_pxi1, ddr_pxi2, ddr_pxi3,
                edp0_hot, edp0_lcd, edp1_lcd, egpio, emac0_mcg0, emac0_mcg1,
                emac0_mcg2, emac0_mcg3, emac0_mdc, emac0_mdio, emac0_ptp_au=
x,
                emac0_ptp_pps, gcc_gp1, gcc_gp2, gcc_gp3, gcc_gp4, gcc_gp5,
                gpio, hs0_mi2s, hs1_mi2s, hs2_mi2s, ibi_i3c, jitter_bist,

Should gp_mn also be added to the function enum in
Documentation/devicetree/bindings/pinctrl/qcom,qcs8300-tlmm.yaml?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261026-b4-pdm_clk=
_gp_mnd_v2-v2-0-ff8e4bc8d567@oss.qualcomm.com?part=3D9
