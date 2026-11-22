Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795354464;
	b=nJao5gHpy44TKhHrm4kFga3qNburfwaShW1+ON+G0Rh7zC9pVhKuh+p9zjn/1p20Mk1f
	 fywV7Myvyjes1NN8lhL56PwmXdBHyPeUbFLoS9zPzGmfrkzjqgWF6vbG8pglDKAnL9g6S
	 xrRbHXxMBJgfkrMawUKn3Px4JLWoZakb+Dv2DWcfKEiDpv3HfakCKtJS02RsSiv2Fcg4H
	 6Mmf648JaIX/GndhlTrnmiQGZu3ws9oafnVam1pIG8csw55hwenq4d63XkswUbOrdzm/l
	 niEO4BgG7Mga+gGpq9RSyndkWzwHRDvOcGItdc4GJTYDSjNE82rmB4tzZJOMXGEqcSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795354464;
	h=Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=TJC5LwXjyN6K3U0aZ6NtQioegxnd38BsYmlWALXEBBs=;
	b=ts4qsBzX93U5RD0NPetZx40M27lyV+dmXvrS8BMuZryW1YK9AcY2NrEWiprjkOcGPlPP
	 I2APvSfqDlLOKkWeCMd2O/q53b3wei3JzCgNffPw1IbdAFmyZBz+ptiK59MoPrUA1r3ED
	 9Y7sITyt0cEzL9OM1FbvG5gU0V94hKCsVFTLpesmFJtvp90OHPdDqNkB+pTsMY6gg/DMD
	 NitBRfFMI5hc3bR2Zz97i57pTcAQaIrG5a74ZoflAY9f6pGjpgiWVN3mn6oaXe/vi6L/g
	 9gHwgYWAaJyqv/n+1fMNDFUPoLnTfHoHnvtYMsKFWBPsmfbB8v5pzF1+ka0D52jJfTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A066F606A320;
	Sun, 22 Nov 2026 13:34:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70B4F1F01574;
	Sun, 22 Nov 2026 13:34:23 +0000 (UTC)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 22 Nov 2026 14:34:06 +0100
Subject: [PATCH 3/4] pinctrl: qcom: Consistently handle IPQ5018, MSM8953
 and others
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
Message-Id: <20261122-b4-qcom-kconfig-unify-pinctrl-v1-3-f0068f161636@oss.qualcomm.com>
References: <20261122-b4-qcom-kconfig-unify-pinctrl-v1-0-f0068f161636@oss.qualcomm.com>
In-Reply-To: <20261122-b4-qcom-kconfig-unify-pinctrl-v1-0-f0068f161636@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3424;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Ud1WyF6aDNUDof6EjNz9HmEHSftHQV6bNdG3g92zFVY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBrAu9Pstz1Ws/BMoIzU2G71lUMwCJazzpSdyaiS
 HxpO4o8wsCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCawLvTwAKCRDBN2bmhouD
 150UD/9E2WAcqR9stVlMJSOLqvCgcnAe234KexVCOSmgZwNIulTS7+o/Rj0VaWlfMIXbnaujuUx
 rscT62YsGSy0Fbh9YfophYK7SNCDYvTWVvKOeMCbycK8J6Amuxy0mqzYH9nnDi28ZYHUpv4I642
 uMj5BBc1eMrkrABof6u9KL1yzrabQ0Vc2RPmG3bVpKCoGwV8KAoTBFo7KRVm7LMbR74bbbssuII
 RiJfoxjFMVp1uY8mK9OrUIeB8De3y67Osmz5UxhGsxlq2DY7vJqj07ECbasV2PLVdWjaYM3nULy
 5TXWZBbOyzkpy5vWps2/Y7YCSV77NCEdmfgYGma1bhaCR6DPKGdXiYKL8m1Z8kiG057qjj+dgde
 c8QT+IThB1dlaGMn32S+UbVCGtwc3jUQexHPJvb9CeBkVMfGkUjnPjpkUat2A94STQXfFIuRJhQ
 1kAXu+XRSpbANMA34zakApViFTV3Y67nxHhGJd05ASzZYM3HuBbCL5iSA2IF2y3m3nJYtuKGCg+
 09OxlKusO3GYkjZnqOc5mHLlbNOBJVzDYR67wEMHV2XZEfJ6YxdUPr/qWiHVIsg5PNjja3eGlYQ
 K6YqRZL5PAOceOSoQe6aVFq/WkIgtdgC7GOmDHic2GCrv/MKyDCcEmRgQri3QbCvHkYw8Yqp49d
 QCYYwMXJsIUq0Tw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Other critical drivers, like clock and interconnect, for Qualcomm
IPQ5018, MSM8953, MSM8976 MSM8994, MSM8996, MSM8998, QCS404 and SDX75
are allowed for 32-bit ARM builds, so pin controller drivers should
follow.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/Kconfig.msm | 24 ++++++++----------------
 1 file changed, 8 insertions(+), 16 deletions(-)

diff --git a/drivers/pinctrl/qcom/Kconfig.msm b/drivers/pinctrl/qcom/Kconfig.msm
index 82730112bb38..be7458aab9d8 100644
--- a/drivers/pinctrl/qcom/Kconfig.msm
+++ b/drivers/pinctrl/qcom/Kconfig.msm
@@ -60,8 +60,7 @@ config PINCTRL_IPQ4019
 
 config PINCTRL_IPQ5018
 	tristate "Qualcomm IPQ5018 pin controller driver"
-	depends on ARM64 || COMPILE_TEST
-	default ARCH_QCOM
+	default ARCH_QCOM if ARM64
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for
 	  the Qualcomm Technologies Inc. TLMM block found on the
@@ -255,8 +254,7 @@ config PINCTRL_MSM8952
 
 config PINCTRL_MSM8953
 	tristate "Qualcomm 8953 pin controller driver"
-	depends on ARM64 || COMPILE_TEST
-	default ARCH_QCOM
+	default ARCH_QCOM if ARM64
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  Qualcomm TLMM block found on the Qualcomm MSM8953 platform.
@@ -265,8 +263,7 @@ config PINCTRL_MSM8953
 
 config PINCTRL_MSM8976
 	tristate "Qualcomm 8976 pin controller driver"
-	depends on ARM64 || COMPILE_TEST
-	default ARCH_QCOM
+	default ARCH_QCOM if ARM64
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  Qualcomm TLMM block found on the Qualcomm MSM8976 platform.
@@ -275,8 +272,7 @@ config PINCTRL_MSM8976
 
 config PINCTRL_MSM8994
 	tristate "Qualcomm 8994 pin controller driver"
-	depends on ARM64 || COMPILE_TEST
-	default ARCH_QCOM
+	default ARCH_QCOM if ARM64
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  Qualcomm TLMM block found in the Qualcomm 8994 platform. The
@@ -284,16 +280,14 @@ config PINCTRL_MSM8994
 
 config PINCTRL_MSM8996
 	tristate "Qualcomm MSM8996 pin controller driver"
-	depends on ARM64 || COMPILE_TEST
-	default ARCH_QCOM
+	default ARCH_QCOM if ARM64
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  Qualcomm TLMM block found in the Qualcomm MSM8996 platform.
 
 config PINCTRL_MSM8998
 	tristate "Qualcomm MSM8998 pin controller driver"
-	depends on ARM64 || COMPILE_TEST
-	default ARCH_QCOM
+	default ARCH_QCOM if ARM64
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  Qualcomm TLMM block found in the Qualcomm MSM8998 platform.
@@ -316,8 +310,7 @@ config PINCTRL_QCM2290
 
 config PINCTRL_QCS404
 	tristate "Qualcomm QCS404 pin controller driver"
-	depends on ARM64 || COMPILE_TEST
-	default ARCH_QCOM
+	default y if ARCH_QCOM && ARM64
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  TLMM block found in the Qualcomm QCS404 platform.
@@ -457,8 +450,7 @@ config PINCTRL_SDX65
 
 config PINCTRL_SDX75
         tristate "Qualcomm SDX75 pin controller driver"
-        depends on ARM64 || COMPILE_TEST
-	default ARCH_QCOM
+	default ARCH_QCOM if ARM64
         help
          This is the pinctrl, pinmux, pinconf and gpiolib driver for the
          Qualcomm Technologies Inc TLMM block found on the Qualcomm

-- 
2.53.0

