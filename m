Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795354468;
	b=QcLIU5C2MUyfDtKJ0SOT35+QF0y9hmARHUIVPHjdGjX7ynm3Xq2XOdhtnqimyjd4rU6g
	 apmn5RJbk8aUv+rCDxbP8UV4olbAepifaMJIGcb0oiMPHFg/ObHqNXXVluqHXPcfOqHAS
	 YNwKe3DDjSdSOJC2O38vFjXZ/kfT7HDrzscVvbQzyXn/aVSvBf9jL39wrn4tSIvFvJAA6
	 dCmyKjeOM2gAlB/qgN6P74yfHHAu3rNt6Enz6yj1JREGebQ/kntk4eFK1YsLtlmZ5vRcJ
	 pgjqTt2hM9A0TxNEkMvptb0FF8/8xkiVREHwqSJdcGKtJWD7D5mhuDHrXLjsRBJu+mQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795354468;
	h=Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=Qa6b84n8xcGcl2ezLQI9cYJ/y0dJWqSu6S35IePzMHA=;
	b=nQAYP+anTTQrWk0YmU96NjAn0Fj4EWG/nVqLLKTQYqd9ebr0nyCtYLQveaI+WUsNFb8z
	 t4cM0FK0fKbMPaq+6oW5WAvr33XwkylUGUyw2kwTXqpPNaNk5SxNZmOukGfchpd8tJSxO
	 4TQ5zmXmnU9s5qeUIxUJmDp1hJlLkpBPq+3x75HvBpI5Jh0ripY9qPor2+95GcvQviymU
	 6btJ4I3tUhibDMHUpqOD4ylaNN/sp8DKQn2mz56wsRxrJgAhkuAp2JqG+XzbNeYTn1u/g
	 5O+XdCcCw3Irf6oIxlgmZWK13LtuQS4tDqHZSv255zol6Cv3MzEsUEolyCorzH2WXWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7BCB606A32C;
	Sun, 22 Nov 2026 13:34:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 865FC1F0156D;
	Sun, 22 Nov 2026 13:34:27 +0000 (UTC)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 22 Nov 2026 14:34:07 +0100
Subject: [PATCH 4/4] pinctrl: qcom: Correct indentation
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
Message-Id: <20261122-b4-qcom-kconfig-unify-pinctrl-v1-4-f0068f161636@oss.qualcomm.com>
References: <20261122-b4-qcom-kconfig-unify-pinctrl-v1-0-f0068f161636@oss.qualcomm.com>
In-Reply-To: <20261122-b4-qcom-kconfig-unify-pinctrl-v1-0-f0068f161636@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3390;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=U5moWmCDXpymfG3mgtgvmi89T+f9xtuOOB5Fy4gexe4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBrAu9QBojPYnZuyOr12Uka+Bto8iNNZnmGOtdZV
 dCiTQNdiJqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCawLvUAAKCRDBN2bmhouD
 1xKjEACEzW6immHxQo72d2DvBRm/Z2ZUSVfQsLDRLoHhJyEmApVv842uLj+et4kzC376j5zh3f8
 Q1F9sOHQsAOkAcSVQd9uwfEAOpiMXFgL5DUqdFSQFLANTygQUdulVcGs86U8Fm87ys0g72Issmv
 9pZc6JrdVkzCOd4Gew9LPntKpAQme5EMmKM5RaxYbWEn1quQihrR4V+T/G+ueKSM0820gXbIyeJ
 sgFYpuis13OAw6/gFZzSLbRqF4y2bCrUygyOju8FZfbp+HzJnxDxKjsPAVMRzTy2f0abGg6VL+4
 vvNyvlgdD1Lex0+ZCG8BEQirnSkYQnM21m4vkPFFi61Jc8HlJ/L+BSH5+XC/WOfrdNKvaUMX8Wc
 NeSA0RANkv90B7lzCA4nUuFULb3GoRdUnW3eyL/yxxDSavGKZMp87LbYmMWNBeQVMd3E+Uye50m
 SzxykcJPKCddgQpqs0prDqVUf//lmEUttLcvu6MPDYkSMKBtC6ACcG35ev4WuW06eyvL1XykI7f
 uN9mPZJa+58UvDUEYIEh2nFdY6nhk0cInCurLbT8DfFhvmdT5o98XIZJjpI/cFOHAnqQI93FzKR
 MiSov71txQgatF2WBwEUNjs8czpJEEc17SBachv2DfsRrVB9PFk2hijAOnmPBdKDtD/XLpakKFN
 ji2o3VxYJKJbMaA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Correct Kconfig indentation style to expected tab, instead of spaces.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/Kconfig.msm | 40 ++++++++++++++++++++--------------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/drivers/pinctrl/qcom/Kconfig.msm b/drivers/pinctrl/qcom/Kconfig.msm
index be7458aab9d8..d57114535bd4 100644
--- a/drivers/pinctrl/qcom/Kconfig.msm
+++ b/drivers/pinctrl/qcom/Kconfig.msm
@@ -99,9 +99,9 @@ config PINCTRL_IPQ5424
 	default ARCH_QCOM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for
-          the Qualcomm Technologies Inc. TLMM block found on the
-          Qualcomm Technologies Inc. IPQ5424 platform. Select this for
-          IPQ5424.
+	  the Qualcomm Technologies Inc. TLMM block found on the
+	  Qualcomm Technologies Inc. IPQ5424 platform. Select this for
+	  IPQ5424.
 
 config PINCTRL_IPQ8074
 	tristate "Qualcomm IPQ8074 pin controller driver"
@@ -129,9 +129,9 @@ config PINCTRL_IPQ9574
 	default ARCH_QCOM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for
-          the Qualcomm Technologies Inc. TLMM block found on the
-          Qualcomm Technologies Inc. IPQ9574 platform. Select this for
-          IPQ9574.
+	  the Qualcomm Technologies Inc. TLMM block found on the
+	  Qualcomm Technologies Inc. IPQ9574 platform. Select this for
+	  IPQ9574.
 
 config PINCTRL_IPQ9650
 	tristate "Qualcomm IPQ9650 pin controller driver"
@@ -139,9 +139,9 @@ config PINCTRL_IPQ9650
 	default ARCH_QCOM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for
-          the Qualcomm Technologies Inc. TLMM block found on the
-          Qualcomm Technologies Inc. IPQ9650 platform. Select this for
-          IPQ9650.
+	  the Qualcomm Technologies Inc. TLMM block found on the
+	  Qualcomm Technologies Inc. IPQ9650 platform. Select this for
+	  IPQ9650.
 
 config PINCTRL_KAANAPALI
 	tristate "Qualcomm Kaanapali pin controller driver"
@@ -440,21 +440,21 @@ config PINCTRL_SDX55
 	 Technologies Inc SDX55 platform.
 
 config PINCTRL_SDX65
-        tristate "Qualcomm SDX65 pin controller driver"
-        depends on ARM || COMPILE_TEST
+	tristate "Qualcomm SDX65 pin controller driver"
+	depends on ARM || COMPILE_TEST
 	default ARCH_QCOM
-        help
-         This is the pinctrl, pinmux, pinconf and gpiolib driver for the
-         Qualcomm Technologies Inc TLMM block found on the Qualcomm
-         Technologies Inc SDX65 platform.
+	help
+	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
+	  Qualcomm Technologies Inc TLMM block found on the Qualcomm
+	  Technologies Inc SDX65 platform.
 
 config PINCTRL_SDX75
-        tristate "Qualcomm SDX75 pin controller driver"
+	tristate "Qualcomm SDX75 pin controller driver"
 	default ARCH_QCOM if ARM64
-        help
-         This is the pinctrl, pinmux, pinconf and gpiolib driver for the
-         Qualcomm Technologies Inc TLMM block found on the Qualcomm
-         Technologies Inc SDX75 platform.
+	help
+	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
+	  Qualcomm Technologies Inc TLMM block found on the Qualcomm
+	  Technologies Inc SDX75 platform.
 
 config PINCTRL_SHIKRA
 	tristate "Qualcomm Shikra pin controller driver"

-- 
2.53.0

