Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795710864;
	b=BSTtUCtrcNdONepHtCNHWvc9tv0/rE353nGZIliRezsoRlFx2/8UFKRrzm31LXt5tSGY
	 tQF36ZwuS1x2I5kvm8J0S5k9ig1c5uJJms7ehUHuzeXEMIXtmUaZ1DquS3sN1HweraalL
	 2Uoit5JhmjUx+CxeitO6rSW5CgsNY3ZwSPVP3pM7YQo0gZl6bDUS8JZatqNLjfWU3/SN+
	 cNa950Q5pD6vWB/zKL2XIL+sU+zIJgqInOfaycxUK2kSGdR2j1+rkhj/+nxC2/LmcYC5W
	 Cbhmrr0/EXn9P+RUu9/c16imDOGyMVztvMwRIERvBNj6PPjKc+BZpZjTPj2JGpAo4yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795710864;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=4GGeAo5/eJpQM5XTDcKfzKRoN8xVvNaF8+APziQ8k/c=;
	b=1yO6CsHKMIR+sX755yJbuxbXMuC5sURClQdegGU7Nm5r7XQF/+KEhQ9EZsencLiPPVTU
	 62MUufyMioLVdS6yCnGUnd6rypulcvGuyxUmtGEshf16cdwSrRNf+ci1tPCSmtCsgHuuS
	 zemY3evHfY63F6R/qifxE6kK6G961gv8G5AB+kLho9kbV6LX3A1IXDhayn6KC2QPLfsPx
	 VoagUD7SkCKKwlI6jyuB/3bdZv2f9HWeTPXvdth0IYlPoplpm7jAmYf0ZFvQiiufv2jwj
	 Xf36N14Ez+dsqnY+A8nLPYWqeQDIsQB+oelDEvByJgQXHeZHwIVCLk/oscXAjevlmqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ljIiPK2Y;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9E68606A321;
	Thu, 26 Nov 2026 16:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ljIiPK2Y
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6F291F000C0;
	Thu, 26 Nov 2026 16:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795710864;
	bh=4GGeAo5/eJpQM5XTDcKfzKRoN8xVvNaF8+APziQ8k/c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ljIiPK2YrvbA/5AQqXuIfegj0dOvorMd/00bpSo7nLXnxR+XC7pmo7u1q7fgNbJ6V
	 CQ3wVeFtJdXeIAO3MnyUKpNOm+Q756zZ7antkFSo0rnZAKu5enP6cZDOi0fC3GZ2UF
	 WA8mcaQp4IRkp3/+X9y8+U5XRzwfDhHdTWtTIN5GS3GtYvOZq5AE27qaZwXamJsmkC
	 hcBYyOpPweBqRyOazJZCdY6tgSfTg8Eb/cjnjoBon9yFF+aWSRqcEO0HyhbkRB4qTe
	 aHeAIDQlMJQmAIEbycMtjG0VefAQrm2N3EA/b1+FeBlLbGKPbqx1iXHCmqg9CnB8s3
	 vKu98dc/reWzQ==
Message-ID: <sashiko-outbox-235922@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: pinctrl: Add Qualcomm Netrani TLMM
Reply-To: sashiko-reviews@lists.linux.dev
To: SignKirigami <prcups@krgm.moe>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261127-netrani-tlmm-v3-v3-1-3bf3f0bbe5df@krgm.moe>
References: <20261127-netrani-tlmm-v3-v3-0-3bf3f0bbe5df@krgm.moe>
 <20261127-netrani-tlmm-v3-v3-1-3bf3f0bbe5df@krgm.moe>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 16:34:23 +0000
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential
issues to consider:
- [Medium] dt-bindings: pinctrl: qcom: unconsolidated per-lane function
  names
- [Low] dt-bindings: pinctrl: qcom: unconstrained interrupts and
  redundant properties
- [Low] dt-bindings: pinctrl: qcom: non-canonical interrupts order in
  example
--

commit 6ec67914517e38e03fb92aa9d60a76850afd82d3
Author: SignKirigami <prcups@krgm.moe>

dt-bindings: pinctrl: Add Qualcomm Netrani TLMM

This commit adds the Device Tree binding schema for the Top Level Mode
Multiplexer (TLMM) pin controller on the Qualcomm Netrani SoC.

> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,netrani-tlmm.=
yaml b/Documentation/devicetree/bindings/pinctrl/qcom,netrani-tlmm.yaml
> new file mode 100644
> index 0000000000000..c8f9d15fa692e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,netrani-tlmm.yaml
> @@ -0,0 +1,190 @@

[ ... ]

> +allOf:
> +  - $ref: /schemas/pinctrl/qcom,tlmm-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: qcom,netrani-tlmm
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts: true
> +  interrupt-controller: true
> +  "#interrupt-cells": true
> +  gpio-controller: true
> +
> +  gpio-reserved-ranges:
> +    minItems: 1
> +    maxItems: 71
> +
> +  gpio-line-names:
> +    maxItems: 141
> +
> +  "#gpio-cells": true
> +  gpio-ranges: true
> +  wakeup-parent: true

[Severity: Low]
Should interrupts specify maxItems: 1 here instead of true?
qcom,tlmm-common.yaml allows up to 9 interrupts, whereas Netrani TLMM uses
a single summary IRQ.

Also, interrupt-controller, #interrupt-cells, gpio-controller,
#gpio-cells, gpio-ranges, and wakeup-parent are already defined in
qcom,tlmm-common.yaml and can be dropped since this schema uses
unevaluatedProperties: false.

[ ... ]

> +      function:
> +        description:
> +          Specify the alternative function to be configured for the spec=
ified
> +          pins.
> +        enum: [ gpio, egpio,
> +                atest_char_start, atest_char_status0, atest_char_status1,
> +                atest_char_status2, atest_char_status3, atest_usb0_atere=
set,
> +                atest_usb0_testdataout00, atest_usb0_testdataout01, ates=
t_usb0_testdataout02,
> +                atest_usb0_testdataout03, audio_ref_clk, cam_mclk,
> +                cci_async_in0, cci_i2c_scl0, cci_i2c_scl1,
> +                cci_i2c_scl2, cci_i2c_scl3, cci_i2c_sda0,
> +                cci_i2c_sda1, cci_i2c_sda2, cci_i2c_sda3,
> +                cci_timer0, cci_timer1, cci_timer2,
> +                cci_timer3, cmu_rng_entropy0, cmu_rng_entropy1,
> +                cmu_rng_entropy2, cmu_rng_entropy3, coex_uart1_rx,
> +                coex_uart1_tx, cri_trng_rosc, cri_trng_rosc0,
> +                cri_trng_rosc1, dbg_out_clk, ddr_bist_complete,
> +                ddr_bist_fail, ddr_bist_start, ddr_bist_stop,
> +                ddr_pxi0_test, ddr_pxi1_test, dp0_hot_plug,
> +                gcc_gp1_clk, gcc_gp2_clk, gcc_gp3_clk, gp_mn,
> +                host2wlan_sol_mira, host2wlan_sol_mirb, i2s0_data0,
> +                i2s0_data1, i2s0_sck, i2s0_ws,
> +                ibi_i3c_qup0, ibi_i3c_qup1, jitter_bist_ref,
> +                mdp_vsync0_out, mdp_vsync1_out, mdp_vsync2_out,
> +                mdp_vsync3_out, mdp_vsync_e, mdp_vsync_p,
> +                mdp_vsync_s, nav_gpio0, nav_gpio1,
> +                nav_gpio2, pcie0_clk_req, phase_flag_status0,
> +                phase_flag_status1, phase_flag_status10, phase_flag_stat=
us11,
> +                phase_flag_status12, phase_flag_status13, phase_flag_sta=
tus14,
> +                phase_flag_status15, phase_flag_status16, phase_flag_sta=
tus17,
> +                phase_flag_status18, phase_flag_status19, phase_flag_sta=
tus2,
> +                phase_flag_status20, phase_flag_status21, phase_flag_sta=
tus22,
> +                phase_flag_status23, phase_flag_status24, phase_flag_sta=
tus25,
> +                phase_flag_status26, phase_flag_status27, phase_flag_sta=
tus28,
> +                phase_flag_status29, phase_flag_status3, phase_flag_stat=
us30,
> +                phase_flag_status31, phase_flag_status4, phase_flag_stat=
us5,
> +                phase_flag_status6, phase_flag_status7, phase_flag_statu=
s8,
> +                phase_flag_status9, pll_bist_sync, pll_clk_aux,
> +                prng_rosc_test0, prng_rosc_test1, prng_rosc_test2,
> +                prng_rosc_test3, qdss_cti_trig0, qdss_cti_trig1,
> +                qdss_gpio_traceclk, qdss_gpio_tracectl, qdss_gpio_traced=
ata0,
> +                qdss_gpio_tracedata1, qdss_gpio_tracedata10, qdss_gpio_t=
racedata11,
> +                qdss_gpio_tracedata12, qdss_gpio_tracedata13, qdss_gpio_=
tracedata14,
> +                qdss_gpio_tracedata15, qdss_gpio_tracedata2, qdss_gpio_t=
racedata3,
> +                qdss_gpio_tracedata4, qdss_gpio_tracedata5, qdss_gpio_tr=
acedata6,
> +                qdss_gpio_tracedata7, qdss_gpio_tracedata8, qdss_gpio_tr=
acedata9,
> +                qlink0_enable, qlink0_request, qlink0_wmss_reset,
> +                qlink1_enable, qlink1_request, qlink1_wmss_reset,
> +                qspi0, qspi1, qspi2,
> +                qspi3, qspi_clk, qspi_cs_n,
> +                qup0_se0_l0, qup0_se0_l1, qup0_se0_l2,
> +                qup0_se0_l3, qup0_se1_l0, qup0_se1_l1,
> +                qup0_se1_l2, qup0_se1_l3, qup0_se1_l4,
> +                qup0_se2_l0, qup0_se2_l1, qup0_se2_l2,
> +                qup0_se2_l3, qup0_se3_l0, qup0_se3_l1,
> +                qup0_se3_l2, qup0_se3_l3, qup0_se4_l0,
> +                qup0_se4_l1, qup0_se4_l2, qup0_se4_l3,
> +                qup0_se5_l0, qup0_se5_l1, qup0_se5_l2,
> +                qup0_se5_l3, qup0_se5_l4, qup0_se5_l5,
> +                qup0_se5_l6, qup1_se0_l0, qup1_se0_l1,
> +                qup1_se0_l2, qup1_se0_l3, qup1_se1_l0,
> +                qup1_se1_l1, qup1_se1_l2, qup1_se1_l3,
> +                qup1_se2_l0, qup1_se2_l1, qup1_se2_l2,
> +                qup1_se2_l3, qup1_se2_l4, qup1_se3_l0,
> +                qup1_se3_l1, qup1_se3_l2, qup1_se3_l3,
> +                qup1_se5_l0, qup1_se5_l1, qup1_se5_l2,
> +                qup1_se5_l3, sd_write_protect, tb_trig_sdc1,
> +                tb_trig_sdc2, tgu_ch0_trigout, tgu_ch1_trigout,
> +                tgu_ch2_trigout, tgu_ch3_trigout, tmess_prng_rosc0,
> +                tmess_prng_rosc1, tmess_prng_rosc2, tmess_prng_rosc3,

[Severity: Medium]
Should the per-lane and per-bit signal names in this function enum be
consolidated into logical function groups (such as qup0_se0..qup0_se5,
qup1_se0..qup1_se5, phase_flag, qdss_gpio, atest_char, atest_usb0,
cci_i2c_scl, cci_i2c_sda, cci_timer, cmu_rng, cri_trng, prng_rosc, and
tmess_prng)?

Exposing raw per-lane names such as qup0_se3_l2 and qup0_se3_l3 in the DT
binding ABI forces client nodes (like uart-w-state in the example below)
to split pins of the same peripheral interface across separate subnodes
with different function strings instead of using function =3D "qup0_se3".

[ ... ]

> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    tlmm: pinctrl@f000000 {
> +        compatible =3D "qcom,netrani-tlmm";
> +        reg =3D <0x0f000000 0x1000000>;
> +        gpio-controller;
> +        #gpio-cells =3D <2>;
> +        gpio-ranges =3D <&tlmm 0 0 142>;
> +        interrupt-controller;
> +        #interrupt-cells =3D <2>;
> +        interrupts =3D <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;

[Severity: Low]
This isn't a bug, but in the example node, interrupts should be placed
right after reg to follow standard DT property ordering.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261127-netrani-tl=
mm-v3-v3-0-3bf3f0bbe5df@krgm.moe?part=3D1
