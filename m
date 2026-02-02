Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFB3E37472B;
	Mon,  2 Feb 2026 14:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770044295; cv=none; b=NxLbSsxfyecs1K57i471neYXcHmEEgy6ha3Gbt2z/MirKXos3feamVfFxoMycGL9LY+RpGYUcrVBm/uF/4Yw7Xo+lXkxTmkbGfNhdengKRpAHs+e6xqm9KV5Tu05xA3h3A3hRWZT0JG2nlD8melke2jJ0NcmoDITFFx9YAapi0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770044295; c=relaxed/simple;
	bh=7Fs4rmbK0Ff+POq72JxzszkG5pm67gk9GsJwUoYtR1o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=psbA5SKJpiJW8hfzsp1zLKb2Ld6Phaoj4duqYkJXQJX/G0dHXqZywmuZpulYylQSIceI51FRSddnhZvHCSaaL4McLkwhvJwtUSW6ozypfyxYlv6rIGGYv0WnDMZ7jmbn78TAEB5+sb7BpetuDiACIUCrHFpxu1+0lZj6SZAlUIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=crl6xMsx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="crl6xMsx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0EDDC19422;
	Mon,  2 Feb 2026 14:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770044294;
	bh=7Fs4rmbK0Ff+POq72JxzszkG5pm67gk9GsJwUoYtR1o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=crl6xMsxVZQ21u9tRTTozRUuGj/mKH0wIVf5MrZePEYEGYtqUqeS38sJ4rujkOUxr
	 hz3vV1470H86429tVgbTCaBL29p5RM2m2XEGsP+2DzaUphrm80bVoctgd57/vzPMZV
	 m24Huu8ByajzUDyqyetI+OYaZhXMyhMCNmoOYIjVNU2ZK8IeYE2mo+/4KElvp3DqSt
	 YBZ4s1Kbj1p2skvISGJAFjeRlNYXTJFoXFOibEV1XWBkNBr0thfrQRDs1lO62tPC3V
	 w9skQaNXV5B0XxtCEWTWaDRnx3KspGkvGMAyJnjNizdZohGoBB4QVC/v1giEKZ3oWy
	 vaRkijFnfSejw==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Mon, 02 Feb 2026 15:57:36 +0100
Subject: [PATCH RFC 4/8] pinctrl: qcom: sm8750: Expose reference clocks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260202-topic-8750_tcsr-v1-4-cd7e6648c64f@oss.qualcomm.com>
References: <20260202-topic-8750_tcsr-v1-0-cd7e6648c64f@oss.qualcomm.com>
In-Reply-To: <20260202-topic-8750_tcsr-v1-0-cd7e6648c64f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Taniya Das <taniya.das@oss.qualcomm.com>, Linus Walleij <linusw@kernel.org>, 
 Melody Olvera <quic_molvera@quicinc.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, Taniya Das <quic_tdas@quicinc.com>, 
 Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>, 
 Jishnu Prakash <quic_jprakash@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770044267; l=2133;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=yzUyRH59OBNczGFIAIHc2f6o025S4p/CU0IPMJZgb2I=;
 b=zMGliDW55glApOyCdPHnUx9jUqGC8oPOkZqvP88Q7V5deuwLRctB3Pnnn7oPssWeoF8aFYkcg
 Z66AsjmDUj+D8Wi1ELi92sSqwmTmiLABKyc52I6ChVlL7WpQcdLb4W3
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

The gating toggles were moved to the TLMM register space on this
platform. They lived inside TCSR a generation prior and are back there
again a generation after.

Expose them, so that they can be consumed by other blocks.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-sm8750.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-sm8750.c b/drivers/pinctrl/qcom/pinctrl-sm8750.c
index 6f92f176edd4..1d29cc89e72f 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm8750.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm8750.c
@@ -9,6 +9,8 @@
 
 #include "pinctrl-msm.h"
 
+#include <dt-bindings/clock/qcom,sm8750-tcsr.h>
+
 #define REG_SIZE 0x1000
 
 #define PINGROUP(id, f1, f2, f3, f4, f5, f6, f7, f8, f9, f10, f11)	\
@@ -1682,6 +1684,33 @@ static const struct msm_gpio_wakeirq_map sm8750_pdc_map[] = {
 	{ 204, 158 }, { 205, 107 }, { 209, 159 },
 };
 
+static const struct ref_clk_init_data pcie_0_refclk = {
+	.name = "pcie_0_clkref",
+	.offset = 0x104008,
+};
+
+static const struct ref_clk_init_data ufs_refclk = {
+	.name = "ufs_clkref",
+	.offset = 0x105008,
+};
+
+static const struct ref_clk_init_data usb2_refclk = {
+	.name = "usb2_clkref",
+	.offset = 0x106008,
+};
+
+static const struct ref_clk_init_data usb3_refclk = {
+	.name = "usb3_clkref",
+	.offset = 0x107008,
+};
+
+static const struct ref_clk_init_data *sm8750_ref_clks[] = {
+	[TCSR_PCIE_0_CLKREF_EN] = &pcie_0_refclk,
+	[TCSR_UFS_CLKREF_EN] = &ufs_refclk,
+	[TCSR_USB2_CLKREF_EN] = &usb2_refclk,
+	[TCSR_USB3_CLKREF_EN] = &usb3_refclk,
+};
+
 static const struct msm_pinctrl_soc_data sm8750_tlmm = {
 	.pins = sm8750_pins,
 	.npins = ARRAY_SIZE(sm8750_pins),
@@ -1693,6 +1722,8 @@ static const struct msm_pinctrl_soc_data sm8750_tlmm = {
 	.wakeirq_map = sm8750_pdc_map,
 	.nwakeirq_map = ARRAY_SIZE(sm8750_pdc_map),
 	.egpio_func = 11,
+	.ref_clks = sm8750_ref_clks,
+	.num_ref_clks = ARRAY_SIZE(sm8750_ref_clks),
 };
 
 static int sm8750_tlmm_probe(struct platform_device *pdev)

-- 
2.52.0

