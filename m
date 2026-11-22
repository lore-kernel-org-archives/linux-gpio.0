Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795354459;
	b=rqJIJ9SC4O2SpM7P97YPqQzOVeB/S9m0wMbdccIG55pg6DGrtJyeCwHPdF40+pQU02Rs
	 zV2sTZD8OlZwCg3G5MqfFb0m0BjHcazwpBcgtsO1Rl9mI9MR8olYfOae4PmSjZkC82u4X
	 BQPH2fSgkVhcKes1WW4mZSQZUc/pkagSIHeu0f6d+E3cQwi3TKZTORrnbqbt+PS4lF/0i
	 pwyBgoGwKViBzqePOuos47YVrpAUaDMb3C3Qv+q3FvcsouTgL8/ooTbewK9v7NV2G/wEG
	 6bMKeUida6lB9Q1B1W6tyOmoRKnkmvxG3cEyc6MoRFzzxDUAd6bdLf+MMK21cI5ZDKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795354459;
	h=Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=Md3kuYf1GaB1yWF2LA6le6Iyt4A/hSD+jihrVK3TUPI=;
	b=wnUsHGoAYQyioRmkOhVuB8HiE2lOezh2UM4905TETGBXWnkIb301ZufHqTDRxdc7vjOu
	 4fztPc2uR9ibo/r21LCI/yOdbfgvxT5YI5OdUtefXkB5B5M1f7TjqKEEd+k2cVJXTX40i
	 cuULb8cnYYtsX+PF2+ZDBddifBdRdgPc76Yzos1QEDK5s2tNTkOu3B6jsnQF3dV1XSnxM
	 D8VRbkmq3TLMqrMpssollqaxdC3pO0aDI5laF6gqywHNqjTL9732VkkOVUaNTMsv1LBO+
	 gQupBBMBrG0tOkhLeYiuZaF5pcIizb7AZT+Js4Ma9BUXhYzC64/lKSJzedxmXdqH9eQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCAC4606A681;
	Sun, 22 Nov 2026 13:34:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4F551F00A3E;
	Sun, 22 Nov 2026 13:34:18 +0000 (UTC)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 22 Nov 2026 14:34:05 +0100
Subject: [PATCH 2/4] pinctrl: qcom: Enable by default MSM8917 and SAR2130P
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261122-b4-qcom-kconfig-unify-pinctrl-v1-2-f0068f161636@oss.qualcomm.com>
References: <20261122-b4-qcom-kconfig-unify-pinctrl-v1-0-f0068f161636@oss.qualcomm.com>
In-Reply-To: <20261122-b4-qcom-kconfig-unify-pinctrl-v1-0-f0068f161636@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1429;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=P5wQvg/j87Kqd1p2g0KY9IxkjB4IL3aUMNUTDwuwCjo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBrAu9Op1ihdu5ctHgbU41GuUwhX49HmR+VHd0EW
 f9JEHtezVSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCawLvTgAKCRDBN2bmhouD
 112hD/9frZGWZKg6W1i3Zy5mmGV+93ROEOoo45dxyH4yczkUDYtRqBI8EFpreQkPYO0z75qtqb0
 ne4TRNu+RtFWVmE9ybK0R9DMWs3X0CG7XU94J71bh0C9QWL2GvfITzNsdD1IcIkSNjLH+kX4YyB
 zGJ01QgVTMeC/vGQM1zBZA3ooOTmGPe/6yaFzMKVXuPHUZWQ0bCWySJJJ4ygr0Ow8SciqGXLKGj
 QYoH52H8Xpx0poefGWNlJo1sJjM58gEgpDy2VsyauViTw35O7DAvT9Nk9fT7nl4D+5U9xJ51hFV
 Borfyu4xd7R/zZ9edwHBum43z1vc08SfMnxpG7S/ctEnO6/Ei945CmeC5fVU52W9BWjM7xNzjaY
 SUrTxsJSQu/CAclfGfaJUjR/n9Z1SNMhhf7efJW4ZDt1XnXMrThdYHNnaG4mOElTKl8hWEKl1Je
 +dj1A9ZXBoLgaNapLrlD+DBIM2b9qEutPrWsTtZHlHMcyCfZkR3/r41dvVlYpGd58gps/N0C70c
 JuTSUOEiTP4CHQ2CBYHlxuiwr25PytPELurArbVklsWeGqfCwrrztJXH7VBGj7MEp2GJq7TUkaa
 /RCDNks9urlcRpG8/+Nv5RxQCKaLXoa3V6ESVwxn6YN/0jTmoGB8QIouv74xqHdbWtmZX6h0/UV
 qMu9YxJHuVWLOcA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

The main SoC TLMM (Top-Level Multiplexer) pin controller drivers are
essential for booting up SoCs and are not really optional for a given
platform.  Kernel should not ask users choice of drivers when that
choice is obvious and known to the developers that answer should be
'yes' or 'module'.

Enable by default pin controller drivers MSM8917 and SAR2130P SoCs to
match above expectation.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/Kconfig.msm | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pinctrl/qcom/Kconfig.msm b/drivers/pinctrl/qcom/Kconfig.msm
index 3a2a97948e6e..82730112bb38 100644
--- a/drivers/pinctrl/qcom/Kconfig.msm
+++ b/drivers/pinctrl/qcom/Kconfig.msm
@@ -240,6 +240,7 @@ config PINCTRL_MSM8916
 config PINCTRL_MSM8917
 	tristate "Qualcomm 8917/8937 pin controller driver"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  Qualcomm TLMM block found on the Qualcomm MSM8917, MSM8937 platform.
@@ -365,6 +366,7 @@ config PINCTRL_SA8775P
 config PINCTRL_SAR2130P
 	tristate "Qualcomm SAR2130P pin controller driver"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  Qualcomm Technologies Inc TLMM block found on the Qualcomm

-- 
2.53.0

