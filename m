Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795419905;
	b=BaJSfan0L6q7bfIkhG6shmCxN9PjVP/O0EQiqBuvCkixwU5zH609JS3jQpcHoSeTD+2H
	 OXaXNFHyluEQ4RdSAPIUg/5RfNuhWv+6zLFAkQWfXO9tAs6hdSmQu92iF6l90sBq4jkvb
	 0HcltD6RAsPl7h0UI8h57uBVGIZOevExtHc3GaXhZF7itgx/Yp8vlt2N3KmhYwLFxHVAS
	 +U8HmVvEPjMTkfh5IVNZcD6V9ydbUkEn8gvWnbo6SOxz8pZgE6nN1+KwAGOCd9xcaEhIZ
	 1fEGMF+bu78mOdA6+cK5A5hMoi4N47r7xTyye9Po9htLAUeDfDy3rl7BwrP0Mouw7iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795419905;
	h=Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=frTUF5AlvO5f8Ayxu8oPCHuPB4QffwTL3d7hN7QZAY8=;
	b=Uayq9fFsGmAozLgAnNgMEMyo5xsZmMZBjNyrEyaVXiIoRU1dfMG9FUaO6X367cJ/QClR
	 IRQf5AfkyiIr5xn/Jt5P25UqWt8j0LaLdajgP/+3kgaE17liPO63w8Xt4Ax62Z1WXDIOY
	 baWIa4/W4jk84tOfzg93014usMeychUns9xUwbWvxggoDK9Vn8ddcFQspRVBRr5rWApml
	 uw71EfeejLN6nObibVNF8eT7eL2oY9t6lOpBJebH6ux/1ICzIMVfz5vJLby7nm+mLBVQE
	 eG0c8EMqk1uMtv6J7Vqnsv9zDP2NnSiJv+ehsnJbmt8zfX/z9AD0oHH14IX7TH18sOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65F74606A33C;
	Mon, 23 Nov 2026 07:45:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 309321F000C4;
	Mon, 23 Nov 2026 07:45:03 +0000 (UTC)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 08:44:48 +0100
Subject: [PATCH v2 3/4] pinctrl: qcom: Consistently handle IPQ5018, MSM8953
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
Message-Id: <20261123-b4-qcom-kconfig-unify-pinctrl-v2-3-958e205b1f60@oss.qualcomm.com>
References: <20261123-b4-qcom-kconfig-unify-pinctrl-v2-0-958e205b1f60@oss.qualcomm.com>
In-Reply-To: <20261123-b4-qcom-kconfig-unify-pinctrl-v2-0-958e205b1f60@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3099;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=yFRcKz0OJe9xfTMmuvDAmjABbkZ/G+/u5SLAcNMsqnI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBrA+7xIQ40nqez1I6cB0ufkCBLTZmGlPKpOgJaW
 ziDG3XubRSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCawPu8QAKCRDBN2bmhouD
 17TcD/9+quGllw55rs2y11ABixZNl8vf8CDAfABT4J00ko9s/tJAdw3Lnm9+lj13pletjUwi3tb
 jhM7Ja166/8eqH2Qsn65c9iLmDBw/4hZJ/Mv5O+QdgqimfqUGrH/61Fm1KVFBCgqv97qEeHIRE2
 1FpquZesa2/DHJjVh5fU1eXdZJ6UMS7Am5j4GPHeLF5Q5yCDeVolNJ1YTSmxDkodaQI4O2PCygm
 TANHlKigK6Jdp80EaKTGbnSXmv6jrqk3NK0XkAHT3Lz07F+lKsBuPhUyZ/jiTvmaXLds5FJU4HH
 Quk7tAUQXbPB4n1nBVk+HcoG71ZmFGXwwmc6zRKQ34kRDIKxEt4ma2aSvnfNSg4Ae8oHf/XSXd9
 /NFipT1IfGcaUfTeJHXH6bEhjjPPGMYII4qBE/MfUTgVxm3G9xZkDt9SzlsNdFLBp6LgwsQPrAf
 tmQzn4VuHJaUsCPugiqeZf1OwOPOCJs6P0L0G749Cz1vukqFyeuGKGQP3SL2qSzq3whM9y8V00e
 yYQ4nNJrvTeCwQq0qTTUCQdvY5pcnIsdnI7zA1zA+BeaTZFOISeqawhl2iXMXwsqAFargsZN5CQ
 eKZ5+eISTY5pwZxoWvC/L2lZh3xL0Xy+2Y2TkaFw22xwymNDokrFdc0nNmvtr6BHGaKV7aKdB89
 Tt5YQYZZpRrp71Q==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Other critical drivers, like clock and interconnect, for Qualcomm
IPQ5018, MSM8953, MSM8976 MSM8994, MSM8998, QCS404 and SDX75 are allowed
for 32-bit ARM builds, so pin controller drivers should follow.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/Kconfig.msm | 21 +++++++--------------
 1 file changed, 7 insertions(+), 14 deletions(-)

diff --git a/drivers/pinctrl/qcom/Kconfig.msm b/drivers/pinctrl/qcom/Kconfig.msm
index 82730112bb38..51d005aea162 100644
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
@@ -292,8 +288,7 @@ config PINCTRL_MSM8996
 
 config PINCTRL_MSM8998
 	tristate "Qualcomm MSM8998 pin controller driver"
-	depends on ARM64 || COMPILE_TEST
-	default ARCH_QCOM
+	default ARCH_QCOM if ARM64
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  Qualcomm TLMM block found in the Qualcomm MSM8998 platform.
@@ -316,8 +311,7 @@ config PINCTRL_QCM2290
 
 config PINCTRL_QCS404
 	tristate "Qualcomm QCS404 pin controller driver"
-	depends on ARM64 || COMPILE_TEST
-	default ARCH_QCOM
+	default y if ARCH_QCOM && ARM64
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  TLMM block found in the Qualcomm QCS404 platform.
@@ -457,8 +451,7 @@ config PINCTRL_SDX65
 
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

