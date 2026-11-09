Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794238999;
	b=4IGsZj8N4LlBeoq4hirrYr3MWnYagZh6Ehdn2vsnVA20fYA5+LsbMr7XuXsc/5nuG2m0
	 VAzM8DOS0wzlECPEw0d+7z4ytPYaS2LHWfYGSL4yi4AaJYFTY5kQ2Vk1qpV5ShJxw7T6a
	 hIdsIbcJ/UaMvYkEpgKGYKe3LWhRftWBLLPlECog9gxmEj6oZBsgPOvnQTwMye30ihRhP
	 +0v6CKREt221g8G8uBN4b8PPtWNrhFGPpLx2uJU+MJLZGHaLJZ8vd061SuAGdoRE0mvJ3
	 37I46fj00phMTEC6l7BeniZmdyiz8g4CksfMRH4S5Zqhbq6iR/x+EckAKWJ6Gsw1MzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794238999;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=cL++JI9C+4Cy1uXsxf69XJu4TXzjHGTPhlS+dkkhl1k=;
	b=jZQVtoWoiErAtCR0adRjpd8WAGzR6/yahSLXk3jjLYjbDORmmT+6nvMcSfOSKRgN7lrE
	 H6utfQ4+6/tsUDrK304Swt/Sfhon9vBr1lLrw0AoPsOmVRZHeHnJt89KEQ0MZ1CzORWK9
	 ShxHSLu0cMyC6pw4L9sryRYjpWTSUCMB6rNEN/wd5hQAX8l6s+tglyee4jDsjnf/Xw9SI
	 bM4hSQhrcxCyqWAPRtXfOGmsYtPE+8QwuvY/N08mn9N9kAivEQ245LBtW8gHpTdQsWdGl
	 wpPY5rSulE4IFYAxhrwFdDuayyEZq8zxS0tHinmZURU1Hd2InPWhSiPa7UKh6zsCoSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HlazxI5W;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id DBC85606A31C;
	Mon,  9 Nov 2026 15:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HlazxI5W
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id E7FD81F0089F;
	Mon,  9 Nov 2026 15:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794238998;
	bh=cL++JI9C+4Cy1uXsxf69XJu4TXzjHGTPhlS+dkkhl1k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HlazxI5WEzYsWkggYjXwI9aVHs5Rv1+vsftVJo7FV22BKBcQe6TkZG+6QLMtVG+o+
	 Ex0iQ80VQLXKcU9eWg1MZEegeXd2LdQzTx1xvTmjHLXUGW5SssMjusEPxZ120eg//9
	 /E2YW8WYL6Gt1cA14BBPaoYyaHfx8FedE1jam7J/gsViUX5OFEDzqz3GFWd6MnSARs
	 3dYgxkgCjCUPmzo+zlEQL/2oXhzgcIwNtU0pLdAgpU2GVIpXwJRrcSyMq1z4qGyDfP
	 ym9nUD4v0XWeUmjdsgUmE1vu3hhb2nUQmzyYAFr9NwHTzyh3YuJBdkUSw+GEz+Jvg9
	 L7bTSDkh4hVqw==
Date: Mon, 9 Nov 2026 16:43:14 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: document the Halliday Top
 Level Mode Multiplexer
Message-ID: <cdfwfoubvs6dvwojrjhryjejeqcpmtllu2ko7vhjcgxshgvsga@65rliahvcppf>
References: <20261109-halliday-tlmm-v1-0-a181d54214cd@gmail.com>
 <20261109-halliday-tlmm-v1-1-a181d54214cd@gmail.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261109-halliday-tlmm-v1-1-a181d54214cd@gmail.com>

On Mon, Nov 09, 2026 at 12:28:37AM +0000, Stanislav Aleksandrov wrote:
> Document the Top Level Mode Multiplexer on the Qualcomm Halliday SoC
> (SXR2250P).
> 
> Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
> ---
>  .../bindings/pinctrl/qcom,halliday-tlmm.yaml       | 146 +++++++++++++++++++++
>  1 file changed, 146 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,halliday-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,halliday-tlmm.yaml
> new file mode 100644
> index 000000000000..172de2d98997
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,halliday-tlmm.yaml
> @@ -0,0 +1,146 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/qcom,halliday-tlmm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Technologies, Inc. Halliday TLMM block
> +
> +maintainers:
> +  - Stanislav Aleksandrov <lightofmysoul@gmail.com>
> +
> +description:
> +  Top Level Mode Multiplexer pin controller in Qualcomm Halliday SoC.
> +
> +allOf:
> +  - $ref: /schemas/pinctrl/qcom,tlmm-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: qcom,halliday-tlmm
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  gpio-reserved-ranges:
> +    minItems: 1
> +    maxItems: 112
> +
> +  gpio-line-names:
> +    maxItems: 224
> +
> +patternProperties:
> +  "-state$":
> +    oneOf:
> +      - $ref: "#/$defs/qcom-halliday-tlmm-state"
> +      - patternProperties:
> +          "-pins$":
> +            $ref: "#/$defs/qcom-halliday-tlmm-state"
> +        additionalProperties: false
> +
> +$defs:
> +  qcom-halliday-tlmm-state:
> +    type: object
> +    description:
> +      Pinctrl node's client devices use subnodes for desired pin configuration.
> +      Client device subnodes use below standard properties.
> +    $ref: qcom,tlmm-common.yaml#/$defs/qcom-tlmm-state
> +    unevaluatedProperties: false
> +
> +    properties:
> +      pins:
> +        description:
> +          List of gpio pins affected by the properties specified in this
> +          subnode.
> +        items:
> +          oneOf:
> +            - pattern: "^gpio([0-9]|[1-9][0-9]|1[0-9][0-9]|2[01][0-9]|22[0-3])$"
> +            - enum: [ ufs_reset, sdc2_clk, sdc2_cmd, sdc2_data ]
> +        minItems: 1
> +        maxItems: 36
> +
> +      function:
> +        description:
> +          Specify the alternative function to be configured for the specified
> +          pins.
> +        enum: [ atest_char, atest_usb, audio_ext_mclk0, audio_ext_mclk1,
> +                audio_ref_clk, cam_mclk, cci_async_in, cci_i2c_scl,
> +                cci_i2c_sda, cci_timer, cmu_rng, dbg_out_clk,
> +                ddr_bist_complete, ddr_bist_fail, ddr_bist_start,
> +                ddr_bist_stop, ddr_pxi0, ddr_pxi1, ddr_pxi2, ddr_pxi3, dp0_hot,
> +                edp0_hot, edp0_lcd_self, edp1_dpu0_lcd, edp1_dpu1_lcd,
> +                edp1_hot, gcc_gp1, gcc_gp10, gcc_gp11, gcc_gp2, gcc_gp3,
> +                gcc_gp4, gcc_gp5, gcc_gp6, gcc_gp7, gcc_gp8, gcc_gp9, gpio,
> +                i2s0_data0, i2s0_data1, i2s0_sck, i2s0_ws, i2s2_data0,
> +                i2s2_data1, i2s2_sck, i2s2_ws, ibi_i3c, jitter_bist,
> +                mdp0_vsync, mdp0_vsync0_out, mdp0_vsync1_out, mdp0_vsync2_out,
> +                mdp0_vsync3_out, mdp0_vsync4_out, mdp0_vsync5_out,
> +                mdp0_vsync6_out, mdp0_vsync7_out, mdp0_vsync8_out, mdp1_vsync,
> +                mdp1_vsync0_out, mdp1_vsync1_out, mdp1_vsync2_out,
> +                mdp1_vsync3_out, mdp1_vsync4_out, mdp1_vsync5_out,
> +                mdp1_vsync6_out, mdp1_vsync7_out, mdp1_vsync8_out,
> +                pcie0_clk_req_n, pcie1_clk_req_n, pcie2_clk_req_n, phase_flag,
> +                pll_bist_sync, pll_clk_aux, prng_rosc0, prng_rosc1, prng_rosc2,
> +                prng_rosc3, pwm_0, pwm_1, pwm_10, pwm_11, pwm_12, pwm_13,
> +                pwm_14, pwm_15, pwm_16, pwm_17, pwm_18, pwm_19, pwm_2, pwm_3,
> +                pwm_4, pwm_5, pwm_6, pwm_7, pwm_8, pwm_9, qdss_cti, qdss_gpio,
> +                qup0_se0, qup0_se1, qup0_se2, qup0_se3, qup0_se4,
> +                qup0_se4_l0_mira, qup0_se4_l0_mirb, qup0_se4_l1_mira,
> +                qup0_se4_l1_mirb, qup0_se4_l2_mira, qup0_se4_l2_mirb,
> +                qup0_se4_l3_mira, qup0_se4_l3_mirb, qup0_se5, qup0_se6,
> +                qup1_se0, qup1_se0_l3_mira, qup1_se0_l3_mirb, qup1_se1,
> +                qup1_se1_l3_mira, qup1_se1_l3_mirb, qup1_se2, qup1_se2_l3_mira,
> +                qup1_se2_l3_mirb, qup1_se3, qup1_se3_l3_mira, qup1_se3_l3_mirb,
> +                qup1_se4, qup1_se5, qup1_se6, qup1_se6_l0_mira,
> +                qup1_se6_l0_mirb, qup1_se6_l1_mira, qup1_se6_l1_mirb,

The number of QUPv3 functions could probably be limited by merging the
entries differing just in line numbers but this is how it's always been
in sam8550 so let's leave it.

> +                sd_write_protect, sdcc5_vdd2_on, tb_trig_sdc2, tgu_ch0_trigout,
> +                tgu_ch1_trigout, tgu_ch2_trigout, tgu_ch3_trigout, tmess_prng0,
> +                tmess_prng1, tmess_prng2, tmess_prng3, tsense_pwm1,
> +                tsense_pwm2, usb0_phy_ps, usb2phy_ac_en,
> +                vsense_trigger_mirnat ]
> +
> +    required:
> +      - pins
> +
> +required:
> +  - compatible
> +  - reg
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    pinctrl@f100000 {
> +        compatible = "qcom,halliday-tlmm";
> +        reg = <0x0f100000 0x300000>;
> +        gpio-controller;
> +        #gpio-cells = <2>;
> +        gpio-ranges = <&tlmm 0 0 225>;

make dt_binding_check will not raise an error because it ignores
non-existent phandles but please make the example correct and add the
tlmm label to the pinctrl node.

> +        interrupt-controller;
> +        #interrupt-cells = <2>;
> +        interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
> +
> +        gpio-wo-state {
> +            pins = "gpio1";
> +            function = "gpio";
> +        };
> +
> +        i2c-w-state {
> +            scl-pins {
> +                pins = "gpio58";
> +                function = "qup1_se0";
> +                bias-pull-up;
> +            };
> +
> +            sda-pins {
> +                pins = "gpio57";
> +                function = "qup1_se0";
> +                bias-pull-up;
> +            };
> +        };
> +    };
> +...
> 
> -- 
> 2.55.0
>

Thanks,
Bartosz
