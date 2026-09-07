Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C377742E8E6;
	Mon,  7 Sep 2026 08:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788768700; cv=none; b=u6H4cVXmFAwl4Sa3VCrW9u3zfadmDrNHhg2YYX/5pXoxxCXdME7FkMcrrw0xuv4keMyLo/UX1To1M5zB0DPeFN0PQmG8YsN7UhFfFZNaIwMOQm/ClA5NlxL0nJKtTOfpf4phESibAbvfHkXTgxNQhn72jq4fYRQlFzmIH2AI+MI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788768700; c=relaxed/simple;
	bh=/PYRSzlxMbQAc4wDtRZvxWzphKtQQWT+RY2aHzimyPw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Xqcj2AAPFt7ZrAW0zcfa6/9FFovnF8khpSnuj5wHjIPuL/AbUJgOKPOc1om7NENAJoUrMgC2yHgE9ZlHWGj4SB7ySrRcntaTJkSwOWZDlvhl/zFcAHhs6PbMBaokEziNhS9N/wDsZQ6oP1L4A2gnpBjayA+dWHr74ws5xTkiLpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wf2yGERY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wf2yGERY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBE0A1F00A3A;
	Mon,  7 Sep 2026 08:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788768697;
	bh=Zuk6ehicVaUkj55bmfVMmSBzto6h0WLuvaTT7MXDg7U=;
	h=From:Date:Subject:To:Cc;
	b=Wf2yGERYeGsGAN/jBSDW9pit86qlaumW6Hkxdh92L9hUPWi+11F755l3B7Aa0TATo
	 buobyEu+QCJ46ulp3DFTHkO/t9RY6vDw0s3F/yY8bWcLsscEic+yEtLkYdKywm6+Do
	 mPl0xjiXhX/9s6Njw0wtrpg84eCVkVuraf6Qj/1sYpae9laxCasnF4mBp1AZ/4cUfZ
	 605+87FeMtjWT9A2U/JSLtAHjaBfStOKUYXW2ogV1jctqFJbdWOy1ZAiOCsp34B8jR
	 5d/A7EhK+cwz4wzMRPg0/BNgPi8f+T6XY8stzuXX68KbovGhfRfDrLte3AC90nZhqo
	 G6PDsVrq5+MYA==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Mon, 07 Sep 2026 10:11:31 +0200
Subject: [PATCH] pinctrl: qcom: Drop marketing name-prefixed duplicate
 defines
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-topic-tlmm_define_cleanup-v1-1-accdf7859e4b@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMWwqDMBCF4a3IPBuI8Za6FRGJcWynaAxJFEHcu
 7F9/Dic/wSPjtBDk5zgcCdPq4nI0gT0R5k3MhqjQXBR8RevWVgtaRbmZelHnMhgr2dUZrNM5aI
 caplJWeQQ/9bF/fi12+5vvw1f1OEJwnXdQH/ccH0AAAA=
X-Change-ID: 20260907-topic-tlmm_define_cleanup-a325b7818843
To: Bjorn Andersson <andersson@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788768694; l=34314;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=yggpLdW3jmmSclL97c/ZfTXilpMEsG8E+Qy5uoGPwak=;
 b=fofjf3Fb1GeC7V8Tc/KpAwK2bERKKaq+wV7LQkPfvZsTKhVwJK4S+xE1HCMcOmHxSIBUYJbab
 k1sXik4kyCTBbybwUGJUCBCHG7/jChY/btXUa1fbKd8jUMYRShGlv6H
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

They are identical and of no use. Drop them and use the common MSM
prefix.

Assisted-by: LLM
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
Compile-tested only.
---
 drivers/pinctrl/qcom/pinctrl-apq8064.c | 188 ++++++------
 drivers/pinctrl/qcom/pinctrl-apq8084.c | 502 ++++++++++++++++-----------------
 drivers/pinctrl/qcom/pinctrl-ipq4019.c | 208 +++++++-------
 drivers/pinctrl/qcom/pinctrl-ipq8064.c | 208 +++++++-------
 drivers/pinctrl/qcom/pinctrl-msm.h     |  25 --
 5 files changed, 553 insertions(+), 578 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-apq8064.c b/drivers/pinctrl/qcom/pinctrl-apq8064.c
index a47f3d4f1ea5..acfe1c554162 100644
--- a/drivers/pinctrl/qcom/pinctrl-apq8064.c
+++ b/drivers/pinctrl/qcom/pinctrl-apq8064.c
@@ -214,17 +214,17 @@ static const unsigned int sdc3_data_pins[] = { 95 };
 			gpio##id##_pins, 		\
 			ARRAY_SIZE(gpio##id##_pins)),	\
 		.funcs = (int[]){			\
-			APQ_MUX_gpio,			\
-			APQ_MUX_##f1,			\
-			APQ_MUX_##f2,			\
-			APQ_MUX_##f3,			\
-			APQ_MUX_##f4,			\
-			APQ_MUX_##f5,			\
-			APQ_MUX_##f6,			\
-			APQ_MUX_##f7,			\
-			APQ_MUX_##f8,			\
-			APQ_MUX_##f9,			\
-			APQ_MUX_##f10,			\
+			msm_mux_gpio,			\
+			msm_mux_##f1,			\
+			msm_mux_##f2,			\
+			msm_mux_##f3,			\
+			msm_mux_##f4,			\
+			msm_mux_##f5,			\
+			msm_mux_##f6,			\
+			msm_mux_##f7,			\
+			msm_mux_##f8,			\
+			msm_mux_##f9,			\
+			msm_mux_##f10,			\
 		},					\
 		.nfuncs = 11,				\
 		.ctl_reg = 0x1000 + 0x10 * id,		\
@@ -276,48 +276,48 @@ static const unsigned int sdc3_data_pins[] = { 95 };
 	}
 
 enum apq8064_functions {
-	APQ_MUX_cam_mclk,
-	APQ_MUX_codec_mic_i2s,
-	APQ_MUX_codec_spkr_i2s,
-	APQ_MUX_gp_clk_0a,
-	APQ_MUX_gp_clk_0b,
-	APQ_MUX_gp_clk_1a,
-	APQ_MUX_gp_clk_1b,
-	APQ_MUX_gp_clk_2a,
-	APQ_MUX_gp_clk_2b,
-	APQ_MUX_gpio,
-	APQ_MUX_gsbi1,
-	APQ_MUX_gsbi2,
-	APQ_MUX_gsbi3,
-	APQ_MUX_gsbi4,
-	APQ_MUX_gsbi4_cam_i2c,
-	APQ_MUX_gsbi5,
-	APQ_MUX_gsbi5_spi_cs1,
-	APQ_MUX_gsbi5_spi_cs2,
-	APQ_MUX_gsbi5_spi_cs3,
-	APQ_MUX_gsbi6,
-	APQ_MUX_gsbi6_spi_cs1,
-	APQ_MUX_gsbi6_spi_cs2,
-	APQ_MUX_gsbi6_spi_cs3,
-	APQ_MUX_gsbi7,
-	APQ_MUX_gsbi7_spi_cs1,
-	APQ_MUX_gsbi7_spi_cs2,
-	APQ_MUX_gsbi7_spi_cs3,
-	APQ_MUX_gsbi_cam_i2c,
-	APQ_MUX_hdmi,
-	APQ_MUX_mi2s,
-	APQ_MUX_riva_bt,
-	APQ_MUX_riva_fm,
-	APQ_MUX_riva_wlan,
-	APQ_MUX_sdc2,
-	APQ_MUX_sdc4,
-	APQ_MUX_slimbus,
-	APQ_MUX_spkr_i2s,
-	APQ_MUX_tsif1,
-	APQ_MUX_tsif2,
-	APQ_MUX_usb2_hsic,
-	APQ_MUX_ps_hold,
-	APQ_MUX_NA,
+	msm_mux_cam_mclk,
+	msm_mux_codec_mic_i2s,
+	msm_mux_codec_spkr_i2s,
+	msm_mux_gp_clk_0a,
+	msm_mux_gp_clk_0b,
+	msm_mux_gp_clk_1a,
+	msm_mux_gp_clk_1b,
+	msm_mux_gp_clk_2a,
+	msm_mux_gp_clk_2b,
+	msm_mux_gpio,
+	msm_mux_gsbi1,
+	msm_mux_gsbi2,
+	msm_mux_gsbi3,
+	msm_mux_gsbi4,
+	msm_mux_gsbi4_cam_i2c,
+	msm_mux_gsbi5,
+	msm_mux_gsbi5_spi_cs1,
+	msm_mux_gsbi5_spi_cs2,
+	msm_mux_gsbi5_spi_cs3,
+	msm_mux_gsbi6,
+	msm_mux_gsbi6_spi_cs1,
+	msm_mux_gsbi6_spi_cs2,
+	msm_mux_gsbi6_spi_cs3,
+	msm_mux_gsbi7,
+	msm_mux_gsbi7_spi_cs1,
+	msm_mux_gsbi7_spi_cs2,
+	msm_mux_gsbi7_spi_cs3,
+	msm_mux_gsbi_cam_i2c,
+	msm_mux_hdmi,
+	msm_mux_mi2s,
+	msm_mux_riva_bt,
+	msm_mux_riva_fm,
+	msm_mux_riva_wlan,
+	msm_mux_sdc2,
+	msm_mux_sdc4,
+	msm_mux_slimbus,
+	msm_mux_spkr_i2s,
+	msm_mux_tsif1,
+	msm_mux_tsif2,
+	msm_mux_usb2_hsic,
+	msm_mux_ps_hold,
+	msm_mux_NA,
 };
 
 static const char * const cam_mclk_groups[] = {
@@ -457,47 +457,47 @@ static const char * const usb2_hsic_groups[] = {
 };
 
 static const struct pinfunction apq8064_functions[] = {
-	APQ_PIN_FUNCTION(cam_mclk),
-	APQ_PIN_FUNCTION(codec_mic_i2s),
-	APQ_PIN_FUNCTION(codec_spkr_i2s),
-	APQ_PIN_FUNCTION(gp_clk_0a),
-	APQ_PIN_FUNCTION(gp_clk_0b),
-	APQ_PIN_FUNCTION(gp_clk_1a),
-	APQ_PIN_FUNCTION(gp_clk_1b),
-	APQ_PIN_FUNCTION(gp_clk_2a),
-	APQ_PIN_FUNCTION(gp_clk_2b),
-	APQ_PIN_FUNCTION(gpio),
-	APQ_PIN_FUNCTION(gsbi1),
-	APQ_PIN_FUNCTION(gsbi2),
-	APQ_PIN_FUNCTION(gsbi3),
-	APQ_PIN_FUNCTION(gsbi4),
-	APQ_PIN_FUNCTION(gsbi4_cam_i2c),
-	APQ_PIN_FUNCTION(gsbi5),
-	APQ_PIN_FUNCTION(gsbi5_spi_cs1),
-	APQ_PIN_FUNCTION(gsbi5_spi_cs2),
-	APQ_PIN_FUNCTION(gsbi5_spi_cs3),
-	APQ_PIN_FUNCTION(gsbi6),
-	APQ_PIN_FUNCTION(gsbi6_spi_cs1),
-	APQ_PIN_FUNCTION(gsbi6_spi_cs2),
-	APQ_PIN_FUNCTION(gsbi6_spi_cs3),
-	APQ_PIN_FUNCTION(gsbi7),
-	APQ_PIN_FUNCTION(gsbi7_spi_cs1),
-	APQ_PIN_FUNCTION(gsbi7_spi_cs2),
-	APQ_PIN_FUNCTION(gsbi7_spi_cs3),
-	APQ_PIN_FUNCTION(gsbi_cam_i2c),
-	APQ_PIN_FUNCTION(hdmi),
-	APQ_PIN_FUNCTION(mi2s),
-	APQ_PIN_FUNCTION(riva_bt),
-	APQ_PIN_FUNCTION(riva_fm),
-	APQ_PIN_FUNCTION(riva_wlan),
-	APQ_PIN_FUNCTION(sdc2),
-	APQ_PIN_FUNCTION(sdc4),
-	APQ_PIN_FUNCTION(slimbus),
-	APQ_PIN_FUNCTION(spkr_i2s),
-	APQ_PIN_FUNCTION(tsif1),
-	APQ_PIN_FUNCTION(tsif2),
-	APQ_PIN_FUNCTION(usb2_hsic),
-	APQ_PIN_FUNCTION(ps_hold),
+	MSM_PIN_FUNCTION(cam_mclk),
+	MSM_PIN_FUNCTION(codec_mic_i2s),
+	MSM_PIN_FUNCTION(codec_spkr_i2s),
+	MSM_PIN_FUNCTION(gp_clk_0a),
+	MSM_PIN_FUNCTION(gp_clk_0b),
+	MSM_PIN_FUNCTION(gp_clk_1a),
+	MSM_PIN_FUNCTION(gp_clk_1b),
+	MSM_PIN_FUNCTION(gp_clk_2a),
+	MSM_PIN_FUNCTION(gp_clk_2b),
+	MSM_PIN_FUNCTION(gpio),
+	MSM_PIN_FUNCTION(gsbi1),
+	MSM_PIN_FUNCTION(gsbi2),
+	MSM_PIN_FUNCTION(gsbi3),
+	MSM_PIN_FUNCTION(gsbi4),
+	MSM_PIN_FUNCTION(gsbi4_cam_i2c),
+	MSM_PIN_FUNCTION(gsbi5),
+	MSM_PIN_FUNCTION(gsbi5_spi_cs1),
+	MSM_PIN_FUNCTION(gsbi5_spi_cs2),
+	MSM_PIN_FUNCTION(gsbi5_spi_cs3),
+	MSM_PIN_FUNCTION(gsbi6),
+	MSM_PIN_FUNCTION(gsbi6_spi_cs1),
+	MSM_PIN_FUNCTION(gsbi6_spi_cs2),
+	MSM_PIN_FUNCTION(gsbi6_spi_cs3),
+	MSM_PIN_FUNCTION(gsbi7),
+	MSM_PIN_FUNCTION(gsbi7_spi_cs1),
+	MSM_PIN_FUNCTION(gsbi7_spi_cs2),
+	MSM_PIN_FUNCTION(gsbi7_spi_cs3),
+	MSM_PIN_FUNCTION(gsbi_cam_i2c),
+	MSM_PIN_FUNCTION(hdmi),
+	MSM_PIN_FUNCTION(mi2s),
+	MSM_PIN_FUNCTION(riva_bt),
+	MSM_PIN_FUNCTION(riva_fm),
+	MSM_PIN_FUNCTION(riva_wlan),
+	MSM_PIN_FUNCTION(sdc2),
+	MSM_PIN_FUNCTION(sdc4),
+	MSM_PIN_FUNCTION(slimbus),
+	MSM_PIN_FUNCTION(spkr_i2s),
+	MSM_PIN_FUNCTION(tsif1),
+	MSM_PIN_FUNCTION(tsif2),
+	MSM_PIN_FUNCTION(usb2_hsic),
+	MSM_PIN_FUNCTION(ps_hold),
 };
 
 static const struct msm_pingroup apq8064_groups[] = {
diff --git a/drivers/pinctrl/qcom/pinctrl-apq8084.c b/drivers/pinctrl/qcom/pinctrl-apq8084.c
index e3c1f86aba7d..67d06f6988ef 100644
--- a/drivers/pinctrl/qcom/pinctrl-apq8084.c
+++ b/drivers/pinctrl/qcom/pinctrl-apq8084.c
@@ -329,14 +329,14 @@ static const unsigned int sdc2_data_pins[] = { 152 };
 			gpio##id##_pins, 		\
 			ARRAY_SIZE(gpio##id##_pins)),	\
 		.funcs = (int[]){			\
-			APQ_MUX_gpio,			\
-			APQ_MUX_##f1,			\
-			APQ_MUX_##f2,			\
-			APQ_MUX_##f3,			\
-			APQ_MUX_##f4,			\
-			APQ_MUX_##f5,			\
-			APQ_MUX_##f6,			\
-			APQ_MUX_##f7			\
+			msm_mux_gpio,			\
+			msm_mux_##f1,			\
+			msm_mux_##f2,			\
+			msm_mux_##f3,			\
+			msm_mux_##f4,			\
+			msm_mux_##f5,			\
+			msm_mux_##f6,			\
+			msm_mux_##f7			\
 		},					\
 		.nfuncs = 8,				\
 		.ctl_reg = 0x1000 + 0x10 * id,		\
@@ -386,128 +386,128 @@ static const unsigned int sdc2_data_pins[] = { 152 };
 	}
 
 enum apq8084_functions {
-	APQ_MUX_adsp_ext,
-	APQ_MUX_audio_ref,
-	APQ_MUX_blsp_i2c1,
-	APQ_MUX_blsp_i2c2,
-	APQ_MUX_blsp_i2c3,
-	APQ_MUX_blsp_i2c4,
-	APQ_MUX_blsp_i2c5,
-	APQ_MUX_blsp_i2c6,
-	APQ_MUX_blsp_i2c7,
-	APQ_MUX_blsp_i2c8,
-	APQ_MUX_blsp_i2c9,
-	APQ_MUX_blsp_i2c10,
-	APQ_MUX_blsp_i2c11,
-	APQ_MUX_blsp_i2c12,
-	APQ_MUX_blsp_spi1,
-	APQ_MUX_blsp_spi1_cs1,
-	APQ_MUX_blsp_spi1_cs2,
-	APQ_MUX_blsp_spi1_cs3,
-	APQ_MUX_blsp_spi2,
-	APQ_MUX_blsp_spi3,
-	APQ_MUX_blsp_spi3_cs1,
-	APQ_MUX_blsp_spi3_cs2,
-	APQ_MUX_blsp_spi3_cs3,
-	APQ_MUX_blsp_spi4,
-	APQ_MUX_blsp_spi5,
-	APQ_MUX_blsp_spi6,
-	APQ_MUX_blsp_spi7,
-	APQ_MUX_blsp_spi8,
-	APQ_MUX_blsp_spi9,
-	APQ_MUX_blsp_spi10,
-	APQ_MUX_blsp_spi10_cs1,
-	APQ_MUX_blsp_spi10_cs2,
-	APQ_MUX_blsp_spi10_cs3,
-	APQ_MUX_blsp_spi11,
-	APQ_MUX_blsp_spi12,
-	APQ_MUX_blsp_uart1,
-	APQ_MUX_blsp_uart2,
-	APQ_MUX_blsp_uart3,
-	APQ_MUX_blsp_uart4,
-	APQ_MUX_blsp_uart5,
-	APQ_MUX_blsp_uart6,
-	APQ_MUX_blsp_uart7,
-	APQ_MUX_blsp_uart8,
-	APQ_MUX_blsp_uart9,
-	APQ_MUX_blsp_uart10,
-	APQ_MUX_blsp_uart11,
-	APQ_MUX_blsp_uart12,
-	APQ_MUX_blsp_uim1,
-	APQ_MUX_blsp_uim2,
-	APQ_MUX_blsp_uim3,
-	APQ_MUX_blsp_uim4,
-	APQ_MUX_blsp_uim5,
-	APQ_MUX_blsp_uim6,
-	APQ_MUX_blsp_uim7,
-	APQ_MUX_blsp_uim8,
-	APQ_MUX_blsp_uim9,
-	APQ_MUX_blsp_uim10,
-	APQ_MUX_blsp_uim11,
-	APQ_MUX_blsp_uim12,
-	APQ_MUX_cam_mclk0,
-	APQ_MUX_cam_mclk1,
-	APQ_MUX_cam_mclk2,
-	APQ_MUX_cam_mclk3,
-	APQ_MUX_cci_async,
-	APQ_MUX_cci_async_in0,
-	APQ_MUX_cci_i2c0,
-	APQ_MUX_cci_i2c1,
-	APQ_MUX_cci_timer0,
-	APQ_MUX_cci_timer1,
-	APQ_MUX_cci_timer2,
-	APQ_MUX_cci_timer3,
-	APQ_MUX_cci_timer4,
-	APQ_MUX_edp_hpd,
-	APQ_MUX_gcc_gp1,
-	APQ_MUX_gcc_gp2,
-	APQ_MUX_gcc_gp3,
-	APQ_MUX_gcc_obt,
-	APQ_MUX_gcc_vtt,
-	APQ_MUX_gp_mn,
-	APQ_MUX_gp_pdm0,
-	APQ_MUX_gp_pdm1,
-	APQ_MUX_gp_pdm2,
-	APQ_MUX_gp0_clk,
-	APQ_MUX_gp1_clk,
-	APQ_MUX_gpio,
-	APQ_MUX_hdmi_cec,
-	APQ_MUX_hdmi_ddc,
-	APQ_MUX_hdmi_dtest,
-	APQ_MUX_hdmi_hpd,
-	APQ_MUX_hdmi_rcv,
-	APQ_MUX_hsic,
-	APQ_MUX_ldo_en,
-	APQ_MUX_ldo_update,
-	APQ_MUX_mdp_vsync,
-	APQ_MUX_pci_e0,
-	APQ_MUX_pci_e0_n,
-	APQ_MUX_pci_e0_rst,
-	APQ_MUX_pci_e1,
-	APQ_MUX_pci_e1_rst,
-	APQ_MUX_pci_e1_rst_n,
-	APQ_MUX_pci_e1_clkreq_n,
-	APQ_MUX_pri_mi2s,
-	APQ_MUX_qua_mi2s,
-	APQ_MUX_sata_act,
-	APQ_MUX_sata_devsleep,
-	APQ_MUX_sata_devsleep_n,
-	APQ_MUX_sd_write,
-	APQ_MUX_sdc_emmc_mode,
-	APQ_MUX_sdc3,
-	APQ_MUX_sdc4,
-	APQ_MUX_sec_mi2s,
-	APQ_MUX_slimbus,
-	APQ_MUX_spdif_tx,
-	APQ_MUX_spkr_i2s,
-	APQ_MUX_spkr_i2s_ws,
-	APQ_MUX_spss_geni,
-	APQ_MUX_ter_mi2s,
-	APQ_MUX_tsif1,
-	APQ_MUX_tsif2,
-	APQ_MUX_uim,
-	APQ_MUX_uim_batt_alarm,
-	APQ_MUX_NA,
+	msm_mux_adsp_ext,
+	msm_mux_audio_ref,
+	msm_mux_blsp_i2c1,
+	msm_mux_blsp_i2c2,
+	msm_mux_blsp_i2c3,
+	msm_mux_blsp_i2c4,
+	msm_mux_blsp_i2c5,
+	msm_mux_blsp_i2c6,
+	msm_mux_blsp_i2c7,
+	msm_mux_blsp_i2c8,
+	msm_mux_blsp_i2c9,
+	msm_mux_blsp_i2c10,
+	msm_mux_blsp_i2c11,
+	msm_mux_blsp_i2c12,
+	msm_mux_blsp_spi1,
+	msm_mux_blsp_spi1_cs1,
+	msm_mux_blsp_spi1_cs2,
+	msm_mux_blsp_spi1_cs3,
+	msm_mux_blsp_spi2,
+	msm_mux_blsp_spi3,
+	msm_mux_blsp_spi3_cs1,
+	msm_mux_blsp_spi3_cs2,
+	msm_mux_blsp_spi3_cs3,
+	msm_mux_blsp_spi4,
+	msm_mux_blsp_spi5,
+	msm_mux_blsp_spi6,
+	msm_mux_blsp_spi7,
+	msm_mux_blsp_spi8,
+	msm_mux_blsp_spi9,
+	msm_mux_blsp_spi10,
+	msm_mux_blsp_spi10_cs1,
+	msm_mux_blsp_spi10_cs2,
+	msm_mux_blsp_spi10_cs3,
+	msm_mux_blsp_spi11,
+	msm_mux_blsp_spi12,
+	msm_mux_blsp_uart1,
+	msm_mux_blsp_uart2,
+	msm_mux_blsp_uart3,
+	msm_mux_blsp_uart4,
+	msm_mux_blsp_uart5,
+	msm_mux_blsp_uart6,
+	msm_mux_blsp_uart7,
+	msm_mux_blsp_uart8,
+	msm_mux_blsp_uart9,
+	msm_mux_blsp_uart10,
+	msm_mux_blsp_uart11,
+	msm_mux_blsp_uart12,
+	msm_mux_blsp_uim1,
+	msm_mux_blsp_uim2,
+	msm_mux_blsp_uim3,
+	msm_mux_blsp_uim4,
+	msm_mux_blsp_uim5,
+	msm_mux_blsp_uim6,
+	msm_mux_blsp_uim7,
+	msm_mux_blsp_uim8,
+	msm_mux_blsp_uim9,
+	msm_mux_blsp_uim10,
+	msm_mux_blsp_uim11,
+	msm_mux_blsp_uim12,
+	msm_mux_cam_mclk0,
+	msm_mux_cam_mclk1,
+	msm_mux_cam_mclk2,
+	msm_mux_cam_mclk3,
+	msm_mux_cci_async,
+	msm_mux_cci_async_in0,
+	msm_mux_cci_i2c0,
+	msm_mux_cci_i2c1,
+	msm_mux_cci_timer0,
+	msm_mux_cci_timer1,
+	msm_mux_cci_timer2,
+	msm_mux_cci_timer3,
+	msm_mux_cci_timer4,
+	msm_mux_edp_hpd,
+	msm_mux_gcc_gp1,
+	msm_mux_gcc_gp2,
+	msm_mux_gcc_gp3,
+	msm_mux_gcc_obt,
+	msm_mux_gcc_vtt,
+	msm_mux_gp_mn,
+	msm_mux_gp_pdm0,
+	msm_mux_gp_pdm1,
+	msm_mux_gp_pdm2,
+	msm_mux_gp0_clk,
+	msm_mux_gp1_clk,
+	msm_mux_gpio,
+	msm_mux_hdmi_cec,
+	msm_mux_hdmi_ddc,
+	msm_mux_hdmi_dtest,
+	msm_mux_hdmi_hpd,
+	msm_mux_hdmi_rcv,
+	msm_mux_hsic,
+	msm_mux_ldo_en,
+	msm_mux_ldo_update,
+	msm_mux_mdp_vsync,
+	msm_mux_pci_e0,
+	msm_mux_pci_e0_n,
+	msm_mux_pci_e0_rst,
+	msm_mux_pci_e1,
+	msm_mux_pci_e1_rst,
+	msm_mux_pci_e1_rst_n,
+	msm_mux_pci_e1_clkreq_n,
+	msm_mux_pri_mi2s,
+	msm_mux_qua_mi2s,
+	msm_mux_sata_act,
+	msm_mux_sata_devsleep,
+	msm_mux_sata_devsleep_n,
+	msm_mux_sd_write,
+	msm_mux_sdc_emmc_mode,
+	msm_mux_sdc3,
+	msm_mux_sdc4,
+	msm_mux_sec_mi2s,
+	msm_mux_slimbus,
+	msm_mux_spdif_tx,
+	msm_mux_spkr_i2s,
+	msm_mux_spkr_i2s_ws,
+	msm_mux_spss_geni,
+	msm_mux_ter_mi2s,
+	msm_mux_tsif1,
+	msm_mux_tsif2,
+	msm_mux_uim,
+	msm_mux_uim_batt_alarm,
+	msm_mux_NA,
 };
 
 static const char * const gpio_groups[] = {
@@ -897,127 +897,127 @@ static const char * const uim_batt_alarm_groups[] = {
 	"gpio102"
 };
 static const struct pinfunction apq8084_functions[] = {
-	APQ_PIN_FUNCTION(adsp_ext),
-	APQ_PIN_FUNCTION(audio_ref),
-	APQ_PIN_FUNCTION(blsp_i2c1),
-	APQ_PIN_FUNCTION(blsp_i2c2),
-	APQ_PIN_FUNCTION(blsp_i2c3),
-	APQ_PIN_FUNCTION(blsp_i2c4),
-	APQ_PIN_FUNCTION(blsp_i2c5),
-	APQ_PIN_FUNCTION(blsp_i2c6),
-	APQ_PIN_FUNCTION(blsp_i2c7),
-	APQ_PIN_FUNCTION(blsp_i2c8),
-	APQ_PIN_FUNCTION(blsp_i2c9),
-	APQ_PIN_FUNCTION(blsp_i2c10),
-	APQ_PIN_FUNCTION(blsp_i2c11),
-	APQ_PIN_FUNCTION(blsp_i2c12),
-	APQ_PIN_FUNCTION(blsp_spi1),
-	APQ_PIN_FUNCTION(blsp_spi1_cs1),
-	APQ_PIN_FUNCTION(blsp_spi1_cs2),
-	APQ_PIN_FUNCTION(blsp_spi1_cs3),
-	APQ_PIN_FUNCTION(blsp_spi2),
-	APQ_PIN_FUNCTION(blsp_spi3),
-	APQ_PIN_FUNCTION(blsp_spi3_cs1),
-	APQ_PIN_FUNCTION(blsp_spi3_cs2),
-	APQ_PIN_FUNCTION(blsp_spi3_cs3),
-	APQ_PIN_FUNCTION(blsp_spi4),
-	APQ_PIN_FUNCTION(blsp_spi5),
-	APQ_PIN_FUNCTION(blsp_spi6),
-	APQ_PIN_FUNCTION(blsp_spi7),
-	APQ_PIN_FUNCTION(blsp_spi8),
-	APQ_PIN_FUNCTION(blsp_spi9),
-	APQ_PIN_FUNCTION(blsp_spi10),
-	APQ_PIN_FUNCTION(blsp_spi10_cs1),
-	APQ_PIN_FUNCTION(blsp_spi10_cs2),
-	APQ_PIN_FUNCTION(blsp_spi10_cs3),
-	APQ_PIN_FUNCTION(blsp_spi11),
-	APQ_PIN_FUNCTION(blsp_spi12),
-	APQ_PIN_FUNCTION(blsp_uart1),
-	APQ_PIN_FUNCTION(blsp_uart2),
-	APQ_PIN_FUNCTION(blsp_uart3),
-	APQ_PIN_FUNCTION(blsp_uart4),
-	APQ_PIN_FUNCTION(blsp_uart5),
-	APQ_PIN_FUNCTION(blsp_uart6),
-	APQ_PIN_FUNCTION(blsp_uart7),
-	APQ_PIN_FUNCTION(blsp_uart8),
-	APQ_PIN_FUNCTION(blsp_uart9),
-	APQ_PIN_FUNCTION(blsp_uart10),
-	APQ_PIN_FUNCTION(blsp_uart11),
-	APQ_PIN_FUNCTION(blsp_uart12),
-	APQ_PIN_FUNCTION(blsp_uim1),
-	APQ_PIN_FUNCTION(blsp_uim2),
-	APQ_PIN_FUNCTION(blsp_uim3),
-	APQ_PIN_FUNCTION(blsp_uim4),
-	APQ_PIN_FUNCTION(blsp_uim5),
-	APQ_PIN_FUNCTION(blsp_uim6),
-	APQ_PIN_FUNCTION(blsp_uim7),
-	APQ_PIN_FUNCTION(blsp_uim8),
-	APQ_PIN_FUNCTION(blsp_uim9),
-	APQ_PIN_FUNCTION(blsp_uim10),
-	APQ_PIN_FUNCTION(blsp_uim11),
-	APQ_PIN_FUNCTION(blsp_uim12),
-	APQ_PIN_FUNCTION(cam_mclk0),
-	APQ_PIN_FUNCTION(cam_mclk1),
-	APQ_PIN_FUNCTION(cam_mclk2),
-	APQ_PIN_FUNCTION(cam_mclk3),
-	APQ_PIN_FUNCTION(cci_async),
-	APQ_PIN_FUNCTION(cci_async_in0),
-	APQ_PIN_FUNCTION(cci_i2c0),
-	APQ_PIN_FUNCTION(cci_i2c1),
-	APQ_PIN_FUNCTION(cci_timer0),
-	APQ_PIN_FUNCTION(cci_timer1),
-	APQ_PIN_FUNCTION(cci_timer2),
-	APQ_PIN_FUNCTION(cci_timer3),
-	APQ_PIN_FUNCTION(cci_timer4),
-	APQ_PIN_FUNCTION(edp_hpd),
-	APQ_PIN_FUNCTION(gcc_gp1),
-	APQ_PIN_FUNCTION(gcc_gp2),
-	APQ_PIN_FUNCTION(gcc_gp3),
-	APQ_PIN_FUNCTION(gcc_obt),
-	APQ_PIN_FUNCTION(gcc_vtt),
-	APQ_PIN_FUNCTION(gp_mn),
-	APQ_PIN_FUNCTION(gp_pdm0),
-	APQ_PIN_FUNCTION(gp_pdm1),
-	APQ_PIN_FUNCTION(gp_pdm2),
-	APQ_PIN_FUNCTION(gp0_clk),
-	APQ_PIN_FUNCTION(gp1_clk),
-	APQ_PIN_FUNCTION(gpio),
-	APQ_PIN_FUNCTION(hdmi_cec),
-	APQ_PIN_FUNCTION(hdmi_ddc),
-	APQ_PIN_FUNCTION(hdmi_dtest),
-	APQ_PIN_FUNCTION(hdmi_hpd),
-	APQ_PIN_FUNCTION(hdmi_rcv),
-	APQ_PIN_FUNCTION(hsic),
-	APQ_PIN_FUNCTION(ldo_en),
-	APQ_PIN_FUNCTION(ldo_update),
-	APQ_PIN_FUNCTION(mdp_vsync),
-	APQ_PIN_FUNCTION(pci_e0),
-	APQ_PIN_FUNCTION(pci_e0_n),
-	APQ_PIN_FUNCTION(pci_e0_rst),
-	APQ_PIN_FUNCTION(pci_e1),
-	APQ_PIN_FUNCTION(pci_e1_rst),
-	APQ_PIN_FUNCTION(pci_e1_rst_n),
-	APQ_PIN_FUNCTION(pci_e1_clkreq_n),
-	APQ_PIN_FUNCTION(pri_mi2s),
-	APQ_PIN_FUNCTION(qua_mi2s),
-	APQ_PIN_FUNCTION(sata_act),
-	APQ_PIN_FUNCTION(sata_devsleep),
-	APQ_PIN_FUNCTION(sata_devsleep_n),
-	APQ_PIN_FUNCTION(sd_write),
-	APQ_PIN_FUNCTION(sdc_emmc_mode),
-	APQ_PIN_FUNCTION(sdc3),
-	APQ_PIN_FUNCTION(sdc4),
-	APQ_PIN_FUNCTION(sec_mi2s),
-	APQ_PIN_FUNCTION(slimbus),
-	APQ_PIN_FUNCTION(spdif_tx),
-	APQ_PIN_FUNCTION(spkr_i2s),
-	APQ_PIN_FUNCTION(spkr_i2s_ws),
-	APQ_PIN_FUNCTION(spss_geni),
-	APQ_PIN_FUNCTION(ter_mi2s),
-	APQ_PIN_FUNCTION(tsif1),
-	APQ_PIN_FUNCTION(tsif2),
-	APQ_PIN_FUNCTION(uim),
-	APQ_PIN_FUNCTION(uim_batt_alarm),
+	MSM_PIN_FUNCTION(adsp_ext),
+	MSM_PIN_FUNCTION(audio_ref),
+	MSM_PIN_FUNCTION(blsp_i2c1),
+	MSM_PIN_FUNCTION(blsp_i2c2),
+	MSM_PIN_FUNCTION(blsp_i2c3),
+	MSM_PIN_FUNCTION(blsp_i2c4),
+	MSM_PIN_FUNCTION(blsp_i2c5),
+	MSM_PIN_FUNCTION(blsp_i2c6),
+	MSM_PIN_FUNCTION(blsp_i2c7),
+	MSM_PIN_FUNCTION(blsp_i2c8),
+	MSM_PIN_FUNCTION(blsp_i2c9),
+	MSM_PIN_FUNCTION(blsp_i2c10),
+	MSM_PIN_FUNCTION(blsp_i2c11),
+	MSM_PIN_FUNCTION(blsp_i2c12),
+	MSM_PIN_FUNCTION(blsp_spi1),
+	MSM_PIN_FUNCTION(blsp_spi1_cs1),
+	MSM_PIN_FUNCTION(blsp_spi1_cs2),
+	MSM_PIN_FUNCTION(blsp_spi1_cs3),
+	MSM_PIN_FUNCTION(blsp_spi2),
+	MSM_PIN_FUNCTION(blsp_spi3),
+	MSM_PIN_FUNCTION(blsp_spi3_cs1),
+	MSM_PIN_FUNCTION(blsp_spi3_cs2),
+	MSM_PIN_FUNCTION(blsp_spi3_cs3),
+	MSM_PIN_FUNCTION(blsp_spi4),
+	MSM_PIN_FUNCTION(blsp_spi5),
+	MSM_PIN_FUNCTION(blsp_spi6),
+	MSM_PIN_FUNCTION(blsp_spi7),
+	MSM_PIN_FUNCTION(blsp_spi8),
+	MSM_PIN_FUNCTION(blsp_spi9),
+	MSM_PIN_FUNCTION(blsp_spi10),
+	MSM_PIN_FUNCTION(blsp_spi10_cs1),
+	MSM_PIN_FUNCTION(blsp_spi10_cs2),
+	MSM_PIN_FUNCTION(blsp_spi10_cs3),
+	MSM_PIN_FUNCTION(blsp_spi11),
+	MSM_PIN_FUNCTION(blsp_spi12),
+	MSM_PIN_FUNCTION(blsp_uart1),
+	MSM_PIN_FUNCTION(blsp_uart2),
+	MSM_PIN_FUNCTION(blsp_uart3),
+	MSM_PIN_FUNCTION(blsp_uart4),
+	MSM_PIN_FUNCTION(blsp_uart5),
+	MSM_PIN_FUNCTION(blsp_uart6),
+	MSM_PIN_FUNCTION(blsp_uart7),
+	MSM_PIN_FUNCTION(blsp_uart8),
+	MSM_PIN_FUNCTION(blsp_uart9),
+	MSM_PIN_FUNCTION(blsp_uart10),
+	MSM_PIN_FUNCTION(blsp_uart11),
+	MSM_PIN_FUNCTION(blsp_uart12),
+	MSM_PIN_FUNCTION(blsp_uim1),
+	MSM_PIN_FUNCTION(blsp_uim2),
+	MSM_PIN_FUNCTION(blsp_uim3),
+	MSM_PIN_FUNCTION(blsp_uim4),
+	MSM_PIN_FUNCTION(blsp_uim5),
+	MSM_PIN_FUNCTION(blsp_uim6),
+	MSM_PIN_FUNCTION(blsp_uim7),
+	MSM_PIN_FUNCTION(blsp_uim8),
+	MSM_PIN_FUNCTION(blsp_uim9),
+	MSM_PIN_FUNCTION(blsp_uim10),
+	MSM_PIN_FUNCTION(blsp_uim11),
+	MSM_PIN_FUNCTION(blsp_uim12),
+	MSM_PIN_FUNCTION(cam_mclk0),
+	MSM_PIN_FUNCTION(cam_mclk1),
+	MSM_PIN_FUNCTION(cam_mclk2),
+	MSM_PIN_FUNCTION(cam_mclk3),
+	MSM_PIN_FUNCTION(cci_async),
+	MSM_PIN_FUNCTION(cci_async_in0),
+	MSM_PIN_FUNCTION(cci_i2c0),
+	MSM_PIN_FUNCTION(cci_i2c1),
+	MSM_PIN_FUNCTION(cci_timer0),
+	MSM_PIN_FUNCTION(cci_timer1),
+	MSM_PIN_FUNCTION(cci_timer2),
+	MSM_PIN_FUNCTION(cci_timer3),
+	MSM_PIN_FUNCTION(cci_timer4),
+	MSM_PIN_FUNCTION(edp_hpd),
+	MSM_PIN_FUNCTION(gcc_gp1),
+	MSM_PIN_FUNCTION(gcc_gp2),
+	MSM_PIN_FUNCTION(gcc_gp3),
+	MSM_PIN_FUNCTION(gcc_obt),
+	MSM_PIN_FUNCTION(gcc_vtt),
+	MSM_PIN_FUNCTION(gp_mn),
+	MSM_PIN_FUNCTION(gp_pdm0),
+	MSM_PIN_FUNCTION(gp_pdm1),
+	MSM_PIN_FUNCTION(gp_pdm2),
+	MSM_PIN_FUNCTION(gp0_clk),
+	MSM_PIN_FUNCTION(gp1_clk),
+	MSM_PIN_FUNCTION(gpio),
+	MSM_PIN_FUNCTION(hdmi_cec),
+	MSM_PIN_FUNCTION(hdmi_ddc),
+	MSM_PIN_FUNCTION(hdmi_dtest),
+	MSM_PIN_FUNCTION(hdmi_hpd),
+	MSM_PIN_FUNCTION(hdmi_rcv),
+	MSM_PIN_FUNCTION(hsic),
+	MSM_PIN_FUNCTION(ldo_en),
+	MSM_PIN_FUNCTION(ldo_update),
+	MSM_PIN_FUNCTION(mdp_vsync),
+	MSM_PIN_FUNCTION(pci_e0),
+	MSM_PIN_FUNCTION(pci_e0_n),
+	MSM_PIN_FUNCTION(pci_e0_rst),
+	MSM_PIN_FUNCTION(pci_e1),
+	MSM_PIN_FUNCTION(pci_e1_rst),
+	MSM_PIN_FUNCTION(pci_e1_rst_n),
+	MSM_PIN_FUNCTION(pci_e1_clkreq_n),
+	MSM_PIN_FUNCTION(pri_mi2s),
+	MSM_PIN_FUNCTION(qua_mi2s),
+	MSM_PIN_FUNCTION(sata_act),
+	MSM_PIN_FUNCTION(sata_devsleep),
+	MSM_PIN_FUNCTION(sata_devsleep_n),
+	MSM_PIN_FUNCTION(sd_write),
+	MSM_PIN_FUNCTION(sdc_emmc_mode),
+	MSM_PIN_FUNCTION(sdc3),
+	MSM_PIN_FUNCTION(sdc4),
+	MSM_PIN_FUNCTION(sec_mi2s),
+	MSM_PIN_FUNCTION(slimbus),
+	MSM_PIN_FUNCTION(spdif_tx),
+	MSM_PIN_FUNCTION(spkr_i2s),
+	MSM_PIN_FUNCTION(spkr_i2s_ws),
+	MSM_PIN_FUNCTION(spss_geni),
+	MSM_PIN_FUNCTION(ter_mi2s),
+	MSM_PIN_FUNCTION(tsif1),
+	MSM_PIN_FUNCTION(tsif2),
+	MSM_PIN_FUNCTION(uim),
+	MSM_PIN_FUNCTION(uim_batt_alarm),
 };
 
 static const struct msm_pingroup apq8084_groups[] = {
diff --git a/drivers/pinctrl/qcom/pinctrl-ipq4019.c b/drivers/pinctrl/qcom/pinctrl-ipq4019.c
index adf7c8631f72..ea407e426bba 100644
--- a/drivers/pinctrl/qcom/pinctrl-ipq4019.c
+++ b/drivers/pinctrl/qcom/pinctrl-ipq4019.c
@@ -221,21 +221,21 @@ DECLARE_QCA_GPIO_PINS(99);
 			gpio##id##_pins, 		\
 			ARRAY_SIZE(gpio##id##_pins)),	\
 		.funcs = (int[]){			\
-			qca_mux_gpio, /* gpio mode */	\
-			qca_mux_##f1,			\
-			qca_mux_##f2,			\
-			qca_mux_##f3,			\
-			qca_mux_##f4,			\
-			qca_mux_##f5,			\
-			qca_mux_##f6,			\
-			qca_mux_##f7,			\
-			qca_mux_##f8,			\
-			qca_mux_##f9,			\
-			qca_mux_##f10,			\
-			qca_mux_##f11,			\
-			qca_mux_##f12,			\
-			qca_mux_##f13,			\
-			qca_mux_##f14			\
+			msm_mux_gpio, /* gpio mode */	\
+			msm_mux_##f1,			\
+			msm_mux_##f2,			\
+			msm_mux_##f3,			\
+			msm_mux_##f4,			\
+			msm_mux_##f5,			\
+			msm_mux_##f6,			\
+			msm_mux_##f7,			\
+			msm_mux_##f8,			\
+			msm_mux_##f9,			\
+			msm_mux_##f10,			\
+			msm_mux_##f11,			\
+			msm_mux_##f12,			\
+			msm_mux_##f13,			\
+			msm_mux_##f14			\
 		},				        \
 		.nfuncs = 15,				\
 		.ctl_reg = 0x0 + 0x1000 * id,		\
@@ -260,51 +260,51 @@ DECLARE_QCA_GPIO_PINS(99);
 
 
 enum ipq4019_functions {
-	qca_mux_gpio,
-	qca_mux_aud_pin,
-	qca_mux_audio_pwm,
-	qca_mux_blsp_i2c0,
-	qca_mux_blsp_i2c1,
-	qca_mux_blsp_spi0,
-	qca_mux_blsp_spi1,
-	qca_mux_blsp_uart0,
-	qca_mux_blsp_uart1,
-	qca_mux_chip_rst,
-	qca_mux_i2s_rx,
-	qca_mux_i2s_spdif_in,
-	qca_mux_i2s_spdif_out,
-	qca_mux_i2s_td,
-	qca_mux_i2s_tx,
-	qca_mux_jtag,
-	qca_mux_led0,
-	qca_mux_led1,
-	qca_mux_led2,
-	qca_mux_led3,
-	qca_mux_led4,
-	qca_mux_led5,
-	qca_mux_led6,
-	qca_mux_led7,
-	qca_mux_led8,
-	qca_mux_led9,
-	qca_mux_led10,
-	qca_mux_led11,
-	qca_mux_mdc,
-	qca_mux_mdio,
-	qca_mux_pcie,
-	qca_mux_pmu,
-	qca_mux_prng_rosc,
-	qca_mux_qpic,
-	qca_mux_rgmii,
-	qca_mux_rmii,
-	qca_mux_sdio,
-	qca_mux_smart0,
-	qca_mux_smart1,
-	qca_mux_smart2,
-	qca_mux_smart3,
-	qca_mux_tm,
-	qca_mux_wifi0,
-	qca_mux_wifi1,
-	qca_mux_NA,
+	msm_mux_gpio,
+	msm_mux_aud_pin,
+	msm_mux_audio_pwm,
+	msm_mux_blsp_i2c0,
+	msm_mux_blsp_i2c1,
+	msm_mux_blsp_spi0,
+	msm_mux_blsp_spi1,
+	msm_mux_blsp_uart0,
+	msm_mux_blsp_uart1,
+	msm_mux_chip_rst,
+	msm_mux_i2s_rx,
+	msm_mux_i2s_spdif_in,
+	msm_mux_i2s_spdif_out,
+	msm_mux_i2s_td,
+	msm_mux_i2s_tx,
+	msm_mux_jtag,
+	msm_mux_led0,
+	msm_mux_led1,
+	msm_mux_led2,
+	msm_mux_led3,
+	msm_mux_led4,
+	msm_mux_led5,
+	msm_mux_led6,
+	msm_mux_led7,
+	msm_mux_led8,
+	msm_mux_led9,
+	msm_mux_led10,
+	msm_mux_led11,
+	msm_mux_mdc,
+	msm_mux_mdio,
+	msm_mux_pcie,
+	msm_mux_pmu,
+	msm_mux_prng_rosc,
+	msm_mux_qpic,
+	msm_mux_rgmii,
+	msm_mux_rmii,
+	msm_mux_sdio,
+	msm_mux_smart0,
+	msm_mux_smart1,
+	msm_mux_smart2,
+	msm_mux_smart3,
+	msm_mux_tm,
+	msm_mux_wifi0,
+	msm_mux_wifi1,
+	msm_mux_NA,
 };
 
 static const char * const gpio_groups[] = {
@@ -470,50 +470,50 @@ static const char * const wifi1_groups[] = {
 };
 
 static const struct pinfunction ipq4019_functions[] = {
-	QCA_PIN_FUNCTION(aud_pin),
-	QCA_PIN_FUNCTION(audio_pwm),
-	QCA_PIN_FUNCTION(blsp_i2c0),
-	QCA_PIN_FUNCTION(blsp_i2c1),
-	QCA_PIN_FUNCTION(blsp_spi0),
-	QCA_PIN_FUNCTION(blsp_spi1),
-	QCA_PIN_FUNCTION(blsp_uart0),
-	QCA_PIN_FUNCTION(blsp_uart1),
-	QCA_PIN_FUNCTION(chip_rst),
-	QCA_GPIO_PIN_FUNCTION(gpio),
-	QCA_PIN_FUNCTION(i2s_rx),
-	QCA_PIN_FUNCTION(i2s_spdif_in),
-	QCA_PIN_FUNCTION(i2s_spdif_out),
-	QCA_PIN_FUNCTION(i2s_td),
-	QCA_PIN_FUNCTION(i2s_tx),
-	QCA_PIN_FUNCTION(jtag),
-	QCA_PIN_FUNCTION(led0),
-	QCA_PIN_FUNCTION(led1),
-	QCA_PIN_FUNCTION(led2),
-	QCA_PIN_FUNCTION(led3),
-	QCA_PIN_FUNCTION(led4),
-	QCA_PIN_FUNCTION(led5),
-	QCA_PIN_FUNCTION(led6),
-	QCA_PIN_FUNCTION(led7),
-	QCA_PIN_FUNCTION(led8),
-	QCA_PIN_FUNCTION(led9),
-	QCA_PIN_FUNCTION(led10),
-	QCA_PIN_FUNCTION(led11),
-	QCA_PIN_FUNCTION(mdc),
-	QCA_PIN_FUNCTION(mdio),
-	QCA_PIN_FUNCTION(pcie),
-	QCA_PIN_FUNCTION(pmu),
-	QCA_PIN_FUNCTION(prng_rosc),
-	QCA_PIN_FUNCTION(qpic),
-	QCA_PIN_FUNCTION(rgmii),
-	QCA_PIN_FUNCTION(rmii),
-	QCA_PIN_FUNCTION(sdio),
-	QCA_PIN_FUNCTION(smart0),
-	QCA_PIN_FUNCTION(smart1),
-	QCA_PIN_FUNCTION(smart2),
-	QCA_PIN_FUNCTION(smart3),
-	QCA_PIN_FUNCTION(tm),
-	QCA_PIN_FUNCTION(wifi0),
-	QCA_PIN_FUNCTION(wifi1),
+	MSM_PIN_FUNCTION(aud_pin),
+	MSM_PIN_FUNCTION(audio_pwm),
+	MSM_PIN_FUNCTION(blsp_i2c0),
+	MSM_PIN_FUNCTION(blsp_i2c1),
+	MSM_PIN_FUNCTION(blsp_spi0),
+	MSM_PIN_FUNCTION(blsp_spi1),
+	MSM_PIN_FUNCTION(blsp_uart0),
+	MSM_PIN_FUNCTION(blsp_uart1),
+	MSM_PIN_FUNCTION(chip_rst),
+	MSM_GPIO_PIN_FUNCTION(gpio),
+	MSM_PIN_FUNCTION(i2s_rx),
+	MSM_PIN_FUNCTION(i2s_spdif_in),
+	MSM_PIN_FUNCTION(i2s_spdif_out),
+	MSM_PIN_FUNCTION(i2s_td),
+	MSM_PIN_FUNCTION(i2s_tx),
+	MSM_PIN_FUNCTION(jtag),
+	MSM_PIN_FUNCTION(led0),
+	MSM_PIN_FUNCTION(led1),
+	MSM_PIN_FUNCTION(led2),
+	MSM_PIN_FUNCTION(led3),
+	MSM_PIN_FUNCTION(led4),
+	MSM_PIN_FUNCTION(led5),
+	MSM_PIN_FUNCTION(led6),
+	MSM_PIN_FUNCTION(led7),
+	MSM_PIN_FUNCTION(led8),
+	MSM_PIN_FUNCTION(led9),
+	MSM_PIN_FUNCTION(led10),
+	MSM_PIN_FUNCTION(led11),
+	MSM_PIN_FUNCTION(mdc),
+	MSM_PIN_FUNCTION(mdio),
+	MSM_PIN_FUNCTION(pcie),
+	MSM_PIN_FUNCTION(pmu),
+	MSM_PIN_FUNCTION(prng_rosc),
+	MSM_PIN_FUNCTION(qpic),
+	MSM_PIN_FUNCTION(rgmii),
+	MSM_PIN_FUNCTION(rmii),
+	MSM_PIN_FUNCTION(sdio),
+	MSM_PIN_FUNCTION(smart0),
+	MSM_PIN_FUNCTION(smart1),
+	MSM_PIN_FUNCTION(smart2),
+	MSM_PIN_FUNCTION(smart3),
+	MSM_PIN_FUNCTION(tm),
+	MSM_PIN_FUNCTION(wifi0),
+	MSM_PIN_FUNCTION(wifi1),
 };
 
 static const struct msm_pingroup ipq4019_groups[] = {
diff --git a/drivers/pinctrl/qcom/pinctrl-ipq8064.c b/drivers/pinctrl/qcom/pinctrl-ipq8064.c
index 0a50486337d3..02682eb82be1 100644
--- a/drivers/pinctrl/qcom/pinctrl-ipq8064.c
+++ b/drivers/pinctrl/qcom/pinctrl-ipq8064.c
@@ -166,17 +166,17 @@ static const unsigned int sdc3_data_pins[] = { 71 };
 			gpio##id##_pins, 		\
 			ARRAY_SIZE(gpio##id##_pins)),	\
 		.funcs = (int[]){			\
-			IPQ_MUX_gpio,			\
-			IPQ_MUX_##f1,			\
-			IPQ_MUX_##f2,			\
-			IPQ_MUX_##f3,			\
-			IPQ_MUX_##f4,			\
-			IPQ_MUX_##f5,			\
-			IPQ_MUX_##f6,			\
-			IPQ_MUX_##f7,			\
-			IPQ_MUX_##f8,			\
-			IPQ_MUX_##f9,			\
-			IPQ_MUX_##f10,			\
+			msm_mux_gpio,			\
+			msm_mux_##f1,			\
+			msm_mux_##f2,			\
+			msm_mux_##f3,			\
+			msm_mux_##f4,			\
+			msm_mux_##f5,			\
+			msm_mux_##f6,			\
+			msm_mux_##f7,			\
+			msm_mux_##f8,			\
+			msm_mux_##f9,			\
+			msm_mux_##f10,			\
 		},					\
 		.nfuncs = 11,				\
 		.ctl_reg = 0x1000 + 0x10 * id,		\
@@ -228,53 +228,53 @@ static const unsigned int sdc3_data_pins[] = { 71 };
 	}
 
 enum ipq8064_functions {
-	IPQ_MUX_gpio,
-	IPQ_MUX_mdio,
-	IPQ_MUX_mi2s,
-	IPQ_MUX_pdm,
-	IPQ_MUX_ssbi,
-	IPQ_MUX_spmi,
-	IPQ_MUX_audio_pcm,
-	IPQ_MUX_gsbi1,
-	IPQ_MUX_gsbi2,
-	IPQ_MUX_gsbi4,
-	IPQ_MUX_gsbi5,
-	IPQ_MUX_gsbi5_spi_cs1,
-	IPQ_MUX_gsbi5_spi_cs2,
-	IPQ_MUX_gsbi5_spi_cs3,
-	IPQ_MUX_gsbi6,
-	IPQ_MUX_gsbi7,
-	IPQ_MUX_nss_spi,
-	IPQ_MUX_sdc1,
-	IPQ_MUX_spdif,
-	IPQ_MUX_nand,
-	IPQ_MUX_tsif1,
-	IPQ_MUX_tsif2,
-	IPQ_MUX_usb_fs_n,
-	IPQ_MUX_usb_fs,
-	IPQ_MUX_usb2_hsic,
-	IPQ_MUX_rgmii2,
-	IPQ_MUX_sata,
-	IPQ_MUX_pcie1_rst,
-	IPQ_MUX_pcie1_prsnt,
-	IPQ_MUX_pcie1_pwrflt,
-	IPQ_MUX_pcie1_pwren_n,
-	IPQ_MUX_pcie1_pwren,
-	IPQ_MUX_pcie1_clk_req,
-	IPQ_MUX_pcie2_rst,
-	IPQ_MUX_pcie2_prsnt,
-	IPQ_MUX_pcie2_pwrflt,
-	IPQ_MUX_pcie2_pwren_n,
-	IPQ_MUX_pcie2_pwren,
-	IPQ_MUX_pcie2_clk_req,
-	IPQ_MUX_pcie3_rst,
-	IPQ_MUX_pcie3_prsnt,
-	IPQ_MUX_pcie3_pwrflt,
-	IPQ_MUX_pcie3_pwren_n,
-	IPQ_MUX_pcie3_pwren,
-	IPQ_MUX_pcie3_clk_req,
-	IPQ_MUX_ps_hold,
-	IPQ_MUX_NA,
+	msm_mux_gpio,
+	msm_mux_mdio,
+	msm_mux_mi2s,
+	msm_mux_pdm,
+	msm_mux_ssbi,
+	msm_mux_spmi,
+	msm_mux_audio_pcm,
+	msm_mux_gsbi1,
+	msm_mux_gsbi2,
+	msm_mux_gsbi4,
+	msm_mux_gsbi5,
+	msm_mux_gsbi5_spi_cs1,
+	msm_mux_gsbi5_spi_cs2,
+	msm_mux_gsbi5_spi_cs3,
+	msm_mux_gsbi6,
+	msm_mux_gsbi7,
+	msm_mux_nss_spi,
+	msm_mux_sdc1,
+	msm_mux_spdif,
+	msm_mux_nand,
+	msm_mux_tsif1,
+	msm_mux_tsif2,
+	msm_mux_usb_fs_n,
+	msm_mux_usb_fs,
+	msm_mux_usb2_hsic,
+	msm_mux_rgmii2,
+	msm_mux_sata,
+	msm_mux_pcie1_rst,
+	msm_mux_pcie1_prsnt,
+	msm_mux_pcie1_pwrflt,
+	msm_mux_pcie1_pwren_n,
+	msm_mux_pcie1_pwren,
+	msm_mux_pcie1_clk_req,
+	msm_mux_pcie2_rst,
+	msm_mux_pcie2_prsnt,
+	msm_mux_pcie2_pwrflt,
+	msm_mux_pcie2_pwren_n,
+	msm_mux_pcie2_pwren,
+	msm_mux_pcie2_clk_req,
+	msm_mux_pcie3_rst,
+	msm_mux_pcie3_prsnt,
+	msm_mux_pcie3_pwrflt,
+	msm_mux_pcie3_pwren_n,
+	msm_mux_pcie3_pwren,
+	msm_mux_pcie3_clk_req,
+	msm_mux_ps_hold,
+	msm_mux_NA,
 };
 
 static const char * const gpio_groups[] = {
@@ -480,52 +480,52 @@ static const char * const ps_hold_groups[] = {
 };
 
 static const struct pinfunction ipq8064_functions[] = {
-	IPQ_GPIO_PIN_FUNCTION(gpio),
-	IPQ_PIN_FUNCTION(mdio),
-	IPQ_PIN_FUNCTION(ssbi),
-	IPQ_PIN_FUNCTION(spmi),
-	IPQ_PIN_FUNCTION(mi2s),
-	IPQ_PIN_FUNCTION(pdm),
-	IPQ_PIN_FUNCTION(audio_pcm),
-	IPQ_PIN_FUNCTION(gsbi1),
-	IPQ_PIN_FUNCTION(gsbi2),
-	IPQ_PIN_FUNCTION(gsbi4),
-	IPQ_PIN_FUNCTION(gsbi5),
-	IPQ_PIN_FUNCTION(gsbi5_spi_cs1),
-	IPQ_PIN_FUNCTION(gsbi5_spi_cs2),
-	IPQ_PIN_FUNCTION(gsbi5_spi_cs3),
-	IPQ_PIN_FUNCTION(gsbi6),
-	IPQ_PIN_FUNCTION(gsbi7),
-	IPQ_PIN_FUNCTION(nss_spi),
-	IPQ_PIN_FUNCTION(sdc1),
-	IPQ_PIN_FUNCTION(spdif),
-	IPQ_PIN_FUNCTION(nand),
-	IPQ_PIN_FUNCTION(tsif1),
-	IPQ_PIN_FUNCTION(tsif2),
-	IPQ_PIN_FUNCTION(usb_fs_n),
-	IPQ_PIN_FUNCTION(usb_fs),
-	IPQ_PIN_FUNCTION(usb2_hsic),
-	IPQ_PIN_FUNCTION(rgmii2),
-	IPQ_PIN_FUNCTION(sata),
-	IPQ_GPIO_PIN_FUNCTION(pcie1_rst),
-	IPQ_PIN_FUNCTION(pcie1_prsnt),
-	IPQ_PIN_FUNCTION(pcie1_pwren_n),
-	IPQ_PIN_FUNCTION(pcie1_pwren),
-	IPQ_PIN_FUNCTION(pcie1_pwrflt),
-	IPQ_PIN_FUNCTION(pcie1_clk_req),
-	IPQ_GPIO_PIN_FUNCTION(pcie2_rst),
-	IPQ_PIN_FUNCTION(pcie2_prsnt),
-	IPQ_PIN_FUNCTION(pcie2_pwren_n),
-	IPQ_PIN_FUNCTION(pcie2_pwren),
-	IPQ_PIN_FUNCTION(pcie2_pwrflt),
-	IPQ_PIN_FUNCTION(pcie2_clk_req),
-	IPQ_GPIO_PIN_FUNCTION(pcie3_rst),
-	IPQ_PIN_FUNCTION(pcie3_prsnt),
-	IPQ_PIN_FUNCTION(pcie3_pwren_n),
-	IPQ_PIN_FUNCTION(pcie3_pwren),
-	IPQ_PIN_FUNCTION(pcie3_pwrflt),
-	IPQ_PIN_FUNCTION(pcie3_clk_req),
-	IPQ_PIN_FUNCTION(ps_hold),
+	MSM_GPIO_PIN_FUNCTION(gpio),
+	MSM_PIN_FUNCTION(mdio),
+	MSM_PIN_FUNCTION(ssbi),
+	MSM_PIN_FUNCTION(spmi),
+	MSM_PIN_FUNCTION(mi2s),
+	MSM_PIN_FUNCTION(pdm),
+	MSM_PIN_FUNCTION(audio_pcm),
+	MSM_PIN_FUNCTION(gsbi1),
+	MSM_PIN_FUNCTION(gsbi2),
+	MSM_PIN_FUNCTION(gsbi4),
+	MSM_PIN_FUNCTION(gsbi5),
+	MSM_PIN_FUNCTION(gsbi5_spi_cs1),
+	MSM_PIN_FUNCTION(gsbi5_spi_cs2),
+	MSM_PIN_FUNCTION(gsbi5_spi_cs3),
+	MSM_PIN_FUNCTION(gsbi6),
+	MSM_PIN_FUNCTION(gsbi7),
+	MSM_PIN_FUNCTION(nss_spi),
+	MSM_PIN_FUNCTION(sdc1),
+	MSM_PIN_FUNCTION(spdif),
+	MSM_PIN_FUNCTION(nand),
+	MSM_PIN_FUNCTION(tsif1),
+	MSM_PIN_FUNCTION(tsif2),
+	MSM_PIN_FUNCTION(usb_fs_n),
+	MSM_PIN_FUNCTION(usb_fs),
+	MSM_PIN_FUNCTION(usb2_hsic),
+	MSM_PIN_FUNCTION(rgmii2),
+	MSM_PIN_FUNCTION(sata),
+	MSM_GPIO_PIN_FUNCTION(pcie1_rst),
+	MSM_PIN_FUNCTION(pcie1_prsnt),
+	MSM_PIN_FUNCTION(pcie1_pwren_n),
+	MSM_PIN_FUNCTION(pcie1_pwren),
+	MSM_PIN_FUNCTION(pcie1_pwrflt),
+	MSM_PIN_FUNCTION(pcie1_clk_req),
+	MSM_GPIO_PIN_FUNCTION(pcie2_rst),
+	MSM_PIN_FUNCTION(pcie2_prsnt),
+	MSM_PIN_FUNCTION(pcie2_pwren_n),
+	MSM_PIN_FUNCTION(pcie2_pwren),
+	MSM_PIN_FUNCTION(pcie2_pwrflt),
+	MSM_PIN_FUNCTION(pcie2_clk_req),
+	MSM_GPIO_PIN_FUNCTION(pcie3_rst),
+	MSM_PIN_FUNCTION(pcie3_prsnt),
+	MSM_PIN_FUNCTION(pcie3_pwren_n),
+	MSM_PIN_FUNCTION(pcie3_pwren),
+	MSM_PIN_FUNCTION(pcie3_pwrflt),
+	MSM_PIN_FUNCTION(pcie3_clk_req),
+	MSM_PIN_FUNCTION(ps_hold),
 };
 
 static const struct msm_pingroup ipq8064_groups[] = {
diff --git a/drivers/pinctrl/qcom/pinctrl-msm.h b/drivers/pinctrl/qcom/pinctrl-msm.h
index b94ba1a4177e..342bf306e9be 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.h
+++ b/drivers/pinctrl/qcom/pinctrl-msm.h
@@ -14,21 +14,6 @@ struct platform_device;
 
 struct pinctrl_pin_desc;
 
-#define APQ_PIN_FUNCTION(fname)					\
-	[APQ_MUX_##fname] = PINCTRL_PINFUNCTION(#fname,		\
-					fname##_groups,		\
-					ARRAY_SIZE(fname##_groups))
-
-#define IPQ_PIN_FUNCTION(fname)					\
-	[IPQ_MUX_##fname] = PINCTRL_PINFUNCTION(#fname,		\
-					fname##_groups,		\
-					ARRAY_SIZE(fname##_groups))
-
-#define IPQ_GPIO_PIN_FUNCTION(fname)					\
-	[IPQ_MUX_##fname] = PINCTRL_GPIO_PINFUNCTION(#fname,		\
-					fname##_groups,		\
-					ARRAY_SIZE(fname##_groups))
-
 #define MSM_PIN_FUNCTION(fname) 				\
 	[msm_mux_##fname] = PINCTRL_PINFUNCTION(#fname,		\
 					fname##_groups,		\
@@ -39,16 +24,6 @@ struct pinctrl_pin_desc;
 					fname##_groups,		\
 					ARRAY_SIZE(fname##_groups))
 
-#define QCA_PIN_FUNCTION(fname)					\
-	[qca_mux_##fname] = PINCTRL_PINFUNCTION(#fname,		\
-					fname##_groups,		\
-					ARRAY_SIZE(fname##_groups))
-
-#define QCA_GPIO_PIN_FUNCTION(fname)				\
-	[qca_mux_##fname] = PINCTRL_GPIO_PINFUNCTION(#fname,	\
-					fname##_groups,		\
-					ARRAY_SIZE(fname##_groups))
-
 /**
  * struct msm_pingroup - Qualcomm pingroup definition
  * @grp:                  Generic data of the pin group (name and pins)

---
base-commit: 9d80aa4617b32f5054c5aa471d06b66704854935
change-id: 20260907-topic-tlmm_define_cleanup-a325b7818843

Best regards,
--  
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

