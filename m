Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792613079;
	b=25fxaw62oY3CSGiZ97QscN92xIUK2qNKcUhwKIwa2Mozn/AOD7B892o0JCdvjF+A9dKo
	 jonX3u8UATEVHQMH8jQegE5BtpcNvxodGgxZ5Cl2DmSqEw+EzeV+P95MoOOIi1P61IYwZ
	 967/LSqwIj4kmBypk2bqQ3+TZosT1wAv+yQuGuuwmJAd4pMtwgDRN9rj29NsMI96wZjSQ
	 LlgIoQP8F3MELhSolz4zOdSeGg16u41WAAkOWOLedaqXlUotJtoJTCepkyCZpS0nLN9uE
	 gwdfeDnusEVgDgYSGTInaA8QLpJ70dpa2u4FTQGyZNKlF4gb8Jfu9W1t3gbxh70n62Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792613079;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=JQcbBTTCNeW/OzCCgmDwiOJ4ikwv7Cb8Y/Xfb1GFEQc=;
	b=zMKwsct2l+gIRLWQZ9BqEUIZKqUGmEvklcAP337TesJskX7NBgECvddZcpLCsjCXNN2w
	 ik62O3OXdoN4kM9hQg7BpYWQqDBwi9WjJJ74tb9NyoWlqZuOtvNVLRpw9xRKEh3C4mEKo
	 E3qngVvILVKkRW3Hu/K8XADrL9bOsX3EGr03GL3z/Ob3eLiF4UCUM9W5IAwjbmfRvp3Xf
	 g4O8Lh8J+7kyYkUD2xtJnFhqtSh3kH+BVg7TMvniObJHCVyBCsoAN9p9UpCPdif7Uivby
	 QXX5wtiscEKYnkzF7JmT+VV2OeqHcRlsS3De9BQqMDKC0jZv1jSpuwNJvIHKmkVTZjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hQCFWmdt;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2EA5606A31B;
	Wed, 21 Oct 2026 20:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hQCFWmdt
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 076751F000C1;
	Wed, 21 Oct 2026 20:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792613078;
	bh=JQcbBTTCNeW/OzCCgmDwiOJ4ikwv7Cb8Y/Xfb1GFEQc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hQCFWmdtHz4jog1ZUkZ1L/LUIpuNKY2lHezyWDZThDclcBUwceLwZpFEjTz6PQxqq
	 E9kTicfGwSAk2eZvEbvvCU3GrwN03uBX6xnQhmQOiiwgayL9Ptf+gReGTKjAZeptoa
	 XviCQGOaD02kTltsOYvCJtFIuWv4gvJ8b8rapeloX5nbgYh6vVpzmHgrgpJrHBxnU3
	 TAa7Z7wMICU2WN0jNMxYkkcmsmsmpPo4o25WS9VilJukySBXLCNAKGhmoHtDpmvdW0
	 B/qZ0OT/L0V1nydHNoohZXHa/bl1IKN446ISV6CSmjxPDGtUz3+V7ad3bLxoU8xHF6
	 VOigrPb4/8Amw==
Message-ID: <sashiko-outbox-180623@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 03/18] dt-bindings: clock: add Zhihe A210 clock
 controllers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Han Gao" <gaohan@iscas.ac.cn>
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261022-a210-init-v1-3-5e438f972d24@iscas.ac.cn>
References: <20261022-a210-init-v1-0-5e438f972d24@iscas.ac.cn>
 <20261022-a210-init-v1-3-5e438f972d24@iscas.ac.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 20:04:37 +0000
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] dt-bindings: clock: zhihe,a210-clk: missing subsystem controller=
 input clocks
- [Medium] dt-bindings: clock: zhihe,a210-clk: disjoint register blocks mer=
ged in one node
- [Medium] dt-bindings: clock: zhihe,a210-clk: non-clock macros and global =
IDs in header
--

commit f418ceaa00f70a29b9cfb989d2292f9ccba767ae
Author: Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>

dt-bindings: clock: add Zhihe A210 clock controllers

This patch adds the devicetree binding schema and clock ID header for the
Zhihe A210 SoC clock controllers.

> diff --git a/Documentation/devicetree/bindings/clock/zhihe,a210-clk.yaml =
b/Documentation/devicetree/bindings/clock/zhihe,a210-clk.yaml
> new file mode 100644
> index 0000000000000..a3546d2f5977c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/zhihe,a210-clk.yaml
> @@ -0,0 +1,231 @@

[ ... ]

> +  clocks:
> +    description: Input reference oscillators.
> +    minItems: 1
> +    maxItems: 3
> +
> +  clock-names:
> +    minItems: 1
> +    maxItems: 3
> +    items:
> +      enum:
> +        - osc-32k
> +        - osc-24m
> +        - rc-24m

[Severity: Medium]
In the A210 SoC clock hierarchy, zhihe,a210-clk (managing pll-wrap and
top-crg) and zhihe,a210-aon-clk generate the root PLLs, dividers, muxes, and
subsystem clock gates (such as top_cfg_aclk, uart_sclk, video_pll_foutvco,
gmac_pll_foutpostdiv, dpu0_pll_foutpostdiv, aon_osc_clk_logic, aon_rtc_clk,
npu_aclk, npu_cclk, vp_aclk, and tee_clk), which then feed the 8 subsystem
clock controllers.

In Documentation/devicetree/bindings/clock/zhihe,a210-clk.yaml, the
top-level properties:clocks and properties:clock-names definitions only all=
ow
up to 3 external reference oscillators (osc-32k, osc-24m, rc-24m) with
maxItems: 3, and in allOf only the zhihe,a210-clk branch requires clocks and
clock-names.

Any devicetree node using one of the 8 subsystem clock controller compatible
strings (zhihe,a210-peri-clk, zhihe,a210-gpu-clk, zhihe,a210-pcie-clk,
zhihe,a210-usb-clk, zhihe,a210-vi-clk, zhihe,a210-vp-clk, zhihe,a210-vo-clk,
or zhihe,a210-npu-clk) that specifies its parent clocks from zhihe,a210-clk
or zhihe,a210-aon-clk will fail dtbs_check schema validation, while omitting
clocks leaves the hardware clock tree topology undocumented in devicetree a=
nd
forces the driver to rely on hardcoded global clock names.

How can the 8 subsystem clock controller nodes declare their upstream input
clocks in devicetree if clocks and clock-names only permit the 3 external
reference oscillators, and should each subsystem compatible in allOf specify
and require its input clocks?

[ ... ]

> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          const: zhihe,a210-clk
> +    then:
> +      properties:
> +        reg:
> +          minItems: 9
> +        reg-names:
> +          items:
> +            - const: pll-wrap
> +            - const: top-crg
> +            - const: cpu-ss-clk-sysreg
> +            - const: cpu-ss-cpu-pll
> +            - const: ddr0-sysreg
> +            - const: ddr1-sysreg
> +            - const: slc-dual-sysreg
> +            - const: top-crg-t
> +            - const: cpu-ss-ccu
> +        clocks:
> +          minItems: 3
> +        clock-names:
> +          items:
> +            - const: osc-32k
> +            - const: osc-24m
> +            - const: rc-24m
> +      required:
> +        - clocks
> +        - clock-names
> +
> +  - if:
> +      properties:
> +        compatible:
> +          const: zhihe,a210-peri-clk
> +    then:
> +      properties:
> +        reg:
> +          minItems: 5
> +          maxItems: 5
> +        reg-names:
> +          items:
> +            - const: peri0-sysreg
> +            - const: peri1-sysreg
> +            - const: peri2-sysreg
> +            - const: peri3-sysreg
> +            - const: tee-crg

[ ... ]

> +examples:
> +  - |
> +    #include <dt-bindings/clock/zhihe,a210-clk.h>
> +
> +    clock-controller@260000 {
> +        compatible =3D "zhihe,a210-clk";
> +        reg =3D <0x00260000 0x1000>,
> +              <0x00250000 0x1000>,
> +              <0x10141600 0x100>,
> +              <0x10141400 0x100>,
> +              <0x04810000 0x1000>,
> +              <0x05810000 0x1000>,
> +              <0x04900000 0x1000>,
> +              <0x20250000 0x1000>,
> +              <0x10140000 0xe00>;
> +        reg-names =3D "pll-wrap", "top-crg", "cpu-ss-clk-sysreg", "cpu-s=
s-cpu-pll",
> +                    "ddr0-sysreg", "ddr1-sysreg", "slc-dual-sysreg", "to=
p-crg-t",
> +                    "cpu-ss-ccu";
> +        #clock-cells =3D <1>;
> +        clocks =3D <&osc_32k>, <&osc_24m>, <&rc_24m>;
> +        clock-names =3D "osc-32k", "osc-24m", "rc-24m";
> +    };

[Severity: Medium]
In Documentation/devicetree/bindings/clock/zhihe,a210-clk.yaml, the
allOf:zhihe,a210-clk schema and the clock-controller@260000 example node
aggregate 9 disjoint hardware register blocks across unrelated SoC
subsystems into a single devicetree node: pll-wrap (0x00260000), top-crg
(0x00250000), cpu-ss-clk-sysreg (0x10141600), cpu-ss-cpu-pll (0x10141400),
ddr0-sysreg (0x04810000), ddr1-sysreg (0x05810000), slc-dual-sysreg
(0x04900000), top-crg-t (0x20250000), and cpu-ss-ccu (0x10140000).

Similarly, allOf:zhihe,a210-peri-clk aggregates 5 separate hardware blocks
(peri0-sysreg, peri1-sysreg, peri2-sysreg, peri3-sysreg, and tee-crg) at
disjoint address ranges into a single devicetree node, even though those 5
subsystems are independent hardware blocks (and are modeled as 5 separate
nodes zhihe,a210-peri0-reset through zhihe,a210-peri3-reset and
zhihe,a210-tee-reset in the reset binding). Merging these blocks into single
virtual nodes also claims entire 0x1000 *-sysreg ranges that contain
non-clock control registers.

Should these separate hardware register blocks be modeled as individual
devicetree nodes matching the physical SoC layout instead of grouping
disjoint register ranges into zhihe,a210-clk and zhihe,a210-peri-clk?

> diff --git a/include/dt-bindings/clock/zhihe,a210-clk.h b/include/dt-bind=
ings/clock/zhihe,a210-clk.h
> new file mode 100644
> index 0000000000000..aa59d91a9ad05
> --- /dev/null
> +++ b/include/dt-bindings/clock/zhihe,a210-clk.h
> @@ -0,0 +1,649 @@

[ ... ]

> +#define VO_PLL2_DIV_EN                                     347
> +#define VO_PLL2_DIV_NUM                                    348
> +#define VO_PLL1_DIV_EN                                     349
> +#define VO_PLL1_DIV_NUM                                    350
> +#define VO_PLL0_DIV_EN                                     351
> +#define VO_PLL0_DIV_NUM                                    352

[ ... ]

> +#define CLK_DUMMY                                          505
> +#define OSC_32K                                            506
> +#define OSC_24M                                            507
> +#define RC_24M                                             508

[ ... ]

> +#define CLK_END 590
> +
> +#endif

[Severity: Medium]
In include/dt-bindings/clock/zhihe,a210-clk.h, all 9 clock controller
compatibles share a single interleaved global 0..589 ID space rather than
per-controller 0-based clock IDs, which requires every controller instance =
in
drivers/clk/zhihe/clk-a210-ap.c to allocate a 590-entry clk_hw_onecell_data
array.

In the VI_SYSREG, VO_SYSREG, and VP_SYSREG sections, hardware divider enable
bits and divider ratio bitfields of the same composite divider clock are
exposed as separate clock IDs (for example, VI_PRE_ISP_CORE_CLK_DIV_EN and
VI_PRE_ISP_CORE_CLK_DIV_NUM, VO_PLL0_DIV_EN and VO_PLL0_DIV_NUM, and
VP_DECOMP_DIV_EN and VP_DECOMP_DIV_NUM). In drivers/clk/zhihe/clk-a210-ap.c,
only the *_DIV_NUM IDs are registered as composite dividers (using the
corresponding *_DIV_EN bit as the gate bit), leaving all 16 *_DIV_EN macros
as unused register-bitfield definitions in the devicetree ABI header.

Additionally, CLK_DUMMY is a software driver implementation artifact,
OSC_32K, OSC_24M, and RC_24M are external input reference clocks passed via
the clocks property rather than outputs of the clock controller, and CLK_END
is an internal array bound whose value changes whenever new clock IDs are
added, breaking devicetree binding ABI invariance.

Could CLK_END, CLK_DUMMY, OSC_32K, OSC_24M, RC_24M, and the unused *_DIV_EN
bitfield macros be dropped from include/dt-bindings/clock/zhihe,a210-clk.h,
and should each clock controller define its own 0-based clock IDs?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261022-a210-init-=
v1-0-5e438f972d24@iscas.ac.cn?part=3D3
