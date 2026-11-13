Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794597253;
	b=z6OgkNK8Hd5uqjYS6VmbnS7X+DrD5OOilrzgDVZVq/CPRAhXqQnwBv9OrvTYWSlyQWkv
	 9PY3qiQaY6Y9stpn61egCwOU3L5tCyI/4HqpyaBqMtYO+pBaI8/EpcIiRNXkQo1YyCRl8
	 +mL06Eah7/d+xHf6XxtdKqUwBF6dC8KABbSBkDf+XYZkhihFOtGBEjyHJsWmP8izyst0U
	 Waqo0xsfzFjH5Bzq/xk1vsczwMjzTQAFfgFHn/TH5thde6y4CLQN00hmZx+xnycWI9+uu
	 1x3rOguETzyI5G57U6kvmLgsokKyCMLwcFSlQiL3uhWVYepkIxrEWePrvUYXgHcZvBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794597253;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=3dfOJhNa1GUb5NUr+WMQKiKJyqNmDJduyIjSRQWgD50=;
	b=YkEJKk4FJPqevT9Pt8Nr8FOJw1fTUPz/q5nWYquVVOpX1UnRwroywSteX3BrhYqR3Tjf
	 tnO9yDN735UnjI2w9/hhtp70OA/xa8oPbvY237psN5SkpPRMsIlEtZ36xxOuCHAX9bxrJ
	 NU9zeSUAG52Li+5i+NNNJybUuc0mTerw7kjjzSRKL1zHkSZiek4w/Inv1PkN/MuGhKkHr
	 +Z80vHIH9S4+tQ27PCUjIvCrx/ce1K/boOXFKRl+kEvrwZ1RRuz4NDsFK/yh/2Le8F/XD
	 FiRFPl0feFEt5L6F5krX53W+tW+1K+7qjokWazXx0nXUDXHhU/sXu16bRab+iL20JGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EqTWNN11;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 541EF606A898;
	Fri, 13 Nov 2026 19:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EqTWNN11
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 968F61F000C6;
	Fri, 13 Nov 2026 19:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794597252;
	bh=3dfOJhNa1GUb5NUr+WMQKiKJyqNmDJduyIjSRQWgD50=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EqTWNN11lCrzxr2oyb0hHn8pbqpX2nguyqqDNKqpLUPnybPuk0udEkdxJWcvrMmpQ
	 tWnIx6bLg3qdp509Ttv/iX1lYShwZ9BfsCsaBXnbLrdOoIFLIabgYp8c6ZeqCQr1eS
	 BXdtjc9Jj1d/AA8N30mMSBkeDmd3QoFt6M/g0vz3CjeXUN/bhcJRJQxkoiNPHeSKQi
	 IN12uZcodD6OvPFMhTmvXZC02VGPez+PPxfXSN3eFk1dE7zY7LalnYZgTWTb3e6m0d
	 YXlhTiEXK5/EWvlZ40t7iwsG0S3sRsjiyGx3TFwG8309Q14ep2L46lPkX66KOO9FIC
	 mdrj4skqqgmxQ==
Message-ID: <sashiko-outbox-213528@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 02/23] clk: qcom: add SM8650 LPASS core & audio
 clock controllers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Neil Armstrong" <neil.armstrong@linaro.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261113-topic-sm8650-el2-v1-2-5183f6aab9fc@linaro.org>
References: <20261113-topic-sm8650-el2-v1-0-5183f6aab9fc@linaro.org>
 <20261113-topic-sm8650-el2-v1-2-5183f6aab9fc@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 19:14:12 +0000
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 5 potential
issues to consider:
- [High] clk: qcom: missing pm_clk setup for iface clock in
  lpass_hm_core_probe()
- [High] clk: qcom: wrong DT clock index for BI_TCXO in
  lpass_core_cc_parent_data_ao_2
- [Medium] clk: qcom: missing driver unregister on error in SM8650 LPASS
  init functions
- [Medium] clk: qcom: wrong postdiv clk_ops and user_ctl_val for
  lpass_core_cc_dig_pll
- [Low] clk: qcom: dead code, unused declaration, and unwrapped pm_ops
  in SM8650 LPASS
--

commit b45bde29cb5ec941ad6de37d77c22a656fbda080
Author: Neil Armstrong <neil.armstrong@linaro.org>

clk: qcom: add SM8650 LPASS core & audio clock controllers

This commit adds clock and power domain controller drivers for the SM8650
LPASS HM, core, audio, and AON blocks when running without ADSP firmware.

> diff --git a/drivers/clk/qcom/lpassaudiocc-sm8650.c b/drivers/clk/qcom/lp=
assaudiocc-sm8650.c
> new file mode 100644
> index 0000000000000..636ce9a1b3451
> --- /dev/null
> +++ b/drivers/clk/qcom/lpassaudiocc-sm8650.c
[ ... ]
> +static struct clk_rcg2 lpass_aon_cc_ext_if1_clk_src =3D {
> +	.cmd_rcgr =3D 0xb004,
> +	.mnd_width =3D 16,
> +	.hid_width =3D 5,
> +	.parent_map =3D lpass_audio_cc_parent_map_0,
> +	.freq_tbl =3D ftbl_lpass_cc_ext_clk_src,
> +	.clkr.hw.init =3D &(const struct clk_init_data){
> +		.name =3D "lpass_aon_cc_ext_if1_clk_src",
> +		.parent_data =3D lpass_aon_cc_parent_data_0,
> +		.num_parents =3D ARRAY_SIZE(lpass_aon_cc_parent_data_0),
> +		.ops =3D &clk_rcg2_ops,
> +	},
> +};
[ ... ]
> +static struct clk_rcg2 lpass_aon_cc_tx_mclk_clk_src =3D {
> +	.cmd_rcgr =3D 0x1b004,
> +	.mnd_width =3D 0,
> +	.hid_width =3D 5,
> +	.parent_map =3D lpass_aon_cc_parent_map_0,
> +	.freq_tbl =3D ftbl_lpass_mclk_clk_src,
> +	.clkr.hw.init =3D &(const struct clk_init_data){
> +		.name =3D "lpass_aon_cc_tx_mclk_clk_src",
> +		.parent_data =3D lpass_aon_cc_parent_data_0,
> +		.num_parents =3D ARRAY_SIZE(lpass_aon_cc_parent_data_0),
> +		//.flags =3D CLK_OPS_PARENT_ENABLE,
> +		.ops =3D &clk_rcg2_ops,
> +	},
> +};
[ ... ]
> +static struct clk_branch lpass_aon_cc_tx_mclk_clk;
[ ... ]
> +static const struct dev_pm_ops lpass_audio_cc_sm8650_pm_ops =3D {
> +	SET_RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
> +};
> +
> +static struct platform_driver lpass_audio_cc_sm8650_driver =3D {
> +	.probe =3D lpass_audio_cc_sm8650_probe,
> +	.driver =3D {
> +		.name =3D "lpass_audio_cc-sm8650",
> +		.of_match_table =3D lpass_audio_cc_sm8650_match_table,
> +		.pm =3D &lpass_audio_cc_sm8650_pm_ops,
> +	},
> +};

[Severity: Low]
This isn't a bug, but the `.pm` assignments in `lpass_audio_cc_sm8650_drive=
r`,
`lpass_aon_cc_sm8650_driver`, and `lpass_hm_sm8650_driver` do not use
`pm_ptr()` (with `RUNTIME_PM_OPS()`), so the `dev_pm_ops` structures are not
dropped when PM is disabled.

Also, `lpass_aon_cc_tx_mclk_clk_src` has a commented-out `.flags` line, the
forward declaration of `lpass_aon_cc_tx_mclk_clk` is unused because the
following clocks reference `lpass_aon_cc_tx_mclk_clk_src`,
`lpass_aon_cc_ext_if1_clk_src` uses `lpass_audio_cc_parent_map_0` instead of
`lpass_aon_cc_parent_map_0`, and `lpass_audio_cc_sm8650_probe()` and
`lpass_aon_cc_sm8650_probe()` duplicate the same `pm_clk` setup.

[ ... ]
> +static int __init lpass_audio_cc_sm8650_init(void)
> +{
> +	int ret;
> +
> +	ret =3D platform_driver_register(&lpass_aon_cc_sm8650_driver);
> +	if (ret)
> +		return ret;
> +
> +	return platform_driver_register(&lpass_audio_cc_sm8650_driver);
> +}
> +subsys_initcall(lpass_audio_cc_sm8650_init);

[Severity: Medium]
Does `lpass_audio_cc_sm8650_init()` leave `lpass_aon_cc_sm8650_driver`
registered if registering `lpass_audio_cc_sm8650_driver` fails?  When built=
 as
a module, failing module init without calling
`platform_driver_unregister(&lpass_aon_cc_sm8650_driver)` leaves a freed
`platform_driver` structure linked on the platform bus list, causing a
use-after-free.  `lpass_core_cc_sm8650_init()` in `lpasscorecc-sm8650.c` has
the same issue with `lpass_hm_sm8650_driver`.

> diff --git a/drivers/clk/qcom/lpasscorecc-sm8650.c b/drivers/clk/qcom/lpa=
sscorecc-sm8650.c
> new file mode 100644
> index 0000000000000..4f91ab0d772ec
> --- /dev/null
> +++ b/drivers/clk/qcom/lpasscorecc-sm8650.c
> @@ -0,0 +1,509 @@
[ ... ]
> +static const struct alpha_pll_config lpass_core_cc_dig_pll_config =3D {
> +	/* 614.4 MHz */
> +	.l =3D 0x20,
> +	.alpha =3D 0x0,
> +	.config_ctl_val =3D 0x20485699,
> +	.config_ctl_hi_val =3D 0x00182261,
> +	.config_ctl_hi1_val =3D 0x82aa299c,
> +	.test_ctl_val =3D 0x00000000,
> +	.test_ctl_hi_val =3D 0x00000003,
> +	.test_ctl_hi1_val =3D 0x00009000,
> +	.test_ctl_hi2_val =3D 0x00000034,
> +	.user_ctl_val =3D 0x00000000,
> +	.user_ctl_hi_val =3D 0x00000005,
> +};
[ ... ]
> +static struct clk_alpha_pll_postdiv lpass_core_cc_dig_pll_out_odd =3D {
> +	.offset =3D 0x0,
> +	.post_div_shift =3D 14,
> +	.post_div_table =3D post_div_table_lpass_core_cc_dig_pll_out_odd,
> +	.num_post_div =3D ARRAY_SIZE(post_div_table_lpass_core_cc_dig_pll_out_o=
dd),
> +	.width =3D 4,
> +	.regs =3D clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
> +	.clkr.hw.init =3D &(struct clk_init_data){
> +		.name =3D "lpass_core_cc_dig_pll_out_odd",
> +		.parent_hws =3D (const struct clk_hw*[]){
> +			&lpass_core_cc_dig_pll.clkr.hw,
> +		},
> +		.num_parents =3D 1,
> +		.flags =3D CLK_SET_RATE_PARENT,
> +		.ops =3D &clk_alpha_pll_postdiv_lucid_ops,
> +	},
> +};

[Severity: Medium]
Should `lpass_core_cc_dig_pll_out_odd` use `clk_alpha_pll_postdiv_lucid_ole=
_ops`
instead of `clk_alpha_pll_postdiv_lucid_ops`?

`lpass_core_cc_dig_pll` is a Lucid OLE PLL, where the FSM vote bit lives at
bit 25 of `user_ctl` (`clk_lucid_evo_pll_postdiv_set_rate()`), whereas
`clk_alpha_pll_postdiv_lucid_ops` checks bit 20 of `mode`
(`clk_alpha_pll_postdiv_fabia_set_rate()`).  In addition,
`lpass_core_cc_dig_pll_config` sets `.user_ctl_val =3D 0x00000000`, so
`clk_alpha_pll_write_config()` skips writing `user_ctl` and never programs =
the
odd post-divider or output enable bits during PLL configuration.

[ ... ]
> +static const struct parent_map lpass_core_cc_parent_map_2[] =3D {
> +	{ P_BI_TCXO, 0 },
> +	{ P_LPASS_CORE_CC_DIG_PLL_OUT_MAIN, 1 },
> +	{ P_LPASS_CORE_CC_DIG_PLL_OUT_MAIN_DIV_CLK_SRC, 2 },
> +};
> +
> +static const struct clk_parent_data lpass_core_cc_parent_data_ao_2[] =3D=
 {
> +	{ .index =3D 1 },
> +	{ .hw =3D &lpass_core_cc_dig_pll.clkr.hw },
> +	{ .hw =3D &lpass_core_cc_dig_pll_out_main_div_clk_src.clkr.hw },
> +};
> +
> +static const struct freq_tbl ftbl_lpass_core_cc_core_clk_src[] =3D {
> +	F(19200000, P_BI_TCXO, 1, 0, 0),
> +	F(51200000, P_LPASS_CORE_CC_DIG_PLL_OUT_MAIN_DIV_CLK_SRC, 6, 0, 0),
> +	F(102400000, P_LPASS_CORE_CC_DIG_PLL_OUT_MAIN_DIV_CLK_SRC, 3, 0, 0),
> +	F(204800000, P_LPASS_CORE_CC_DIG_PLL_OUT_MAIN, 3, 0, 0),
> +	{ }
> +};
> +
> +static struct clk_rcg2 lpass_core_cc_core_clk_src =3D {
> +	.cmd_rcgr =3D 0x25000,
> +	.mnd_width =3D 8,
> +	.hid_width =3D 5,
> +	.parent_map =3D lpass_core_cc_parent_map_2,
> +	.freq_tbl =3D ftbl_lpass_core_cc_core_clk_src,
> +	.clkr.hw.init =3D &(const struct clk_init_data){
> +		.name =3D "lpass_core_cc_core_clk_src",
> +		.parent_data =3D lpass_core_cc_parent_data_ao_2,
> +		.num_parents =3D ARRAY_SIZE(lpass_core_cc_parent_data_ao_2),
> +		.ops =3D &clk_rcg2_shared_ops,
> +	},
> +};

[Severity: High]
Should `lpass_core_cc_parent_data_ao_2[0]` use `.index =3D 0` instead of
`.index =3D 1`?

`qcom,sm8650-lpasscorecc` only has a single DT input clock (`bi_tcxo` at in=
dex
0), as used by `lpass_core_cc_dig_pll` and `lpass_core_cc_parent_data_0`.
With `.index =3D 1`, parent 0 of `lpass_core_cc_core_clk_src` cannot be
resolved, so `lpass_core_cc_core_clk_src` and its child branches report rat=
e 0
when parked on `bi_tcxo` via `clk_rcg2_shared_ops`, and requesting 19.2 MHz
fails with `-EINVAL` in `_freq_tbl_determine_rate()`.

[ ... ]
> +static int lpass_hm_core_probe(struct platform_device *pdev)
> +{
> +	return qcom_cc_probe(pdev, &lpass_core_hm_sm8650_desc);
> +}
> +
> +static const struct dev_pm_ops lpass_hm_sm8650_pm_ops =3D {
> +	SET_RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
> +};

[Severity: High]
Does `lpass_hm_core_probe()` need to set up `pm_clk` and add the `"iface"`
clock before calling `qcom_cc_probe()`, like `lpass_audio_cc_sm8650_probe()`
and `lpass_aon_cc_sm8650_probe()` do?

`qcom_cc_really_probe()` with `.use_rpm =3D true` only calls
`devm_pm_runtime_enable()` and `pm_runtime_resume_and_get()`; it does not c=
all
`devm_pm_clk_create()` or `pm_clk_add(&pdev->dev, "iface")`.  Without that
setup, `pm_clk_resume()` and `pm_clk_suspend()` in `lpass_hm_sm8650_pm_ops`=
 do
nothing, leaving the LPASS HM interface clock unacquired and potentially ga=
ted
when `qcom_cc_really_probe()` and `gdsc_register()` access the HM registers.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113-topic-sm86=
50-el2-v1-0-5183f6aab9fc@linaro.org?part=3D2
