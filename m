Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795419908;
	b=a1C/j+HfREjcebyEbmPYtOa35c1+NXYxtQrE5pFxk7wMHiGyPJpt5vQaRtL4zqWgzTkE
	 RrYw2DI+mVkTfLDlbJm1ubSBoJoj8s6a4fbEHRjyiSlqGKphDR1ZZVon1lbYDrai0Y6hm
	 N0Sf9Llj4a3IGEgHkrNHLm+QpqiXeQ0LEfipFFZNzu38v6uMtPKc2AmshDzRmW1uEQ+vw
	 8hF48GshTUTeFhUA4Ptytkrwcmcs1X5ra3RjtI36F3Udfzckyn0/6uux9hOvS/sM/2CC9
	 3KOJTKhvioIFyfICMCgjWA8DftZ8uQ5/0V9ETo+mEDtFHg6zFDVrxgOkRS6MDlmIpzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795419908;
	h=Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=nlDCK9VWXGDaB3guceRvEmNAmbx8U++rKhduEurw+wk=;
	b=OjOfVOUsQJt4/eTXbQFtNY64a9qG/uMawNsQ3Yl1P1ISNOdbUGN109eH1Nr7oYiMhAR3
	 qFVsoD45xYo7Ik984MzdtcZ6k6YrPEQ6hZJjc6xbcIS5UeulEy94PC6p/M7yu5VCeTcah
	 53fYLcjdRLpBeOyr90jA1i2stsTOk9GzZvSFxodNnUll7Njvzp1U+joY4Jw6gUjXggDzT
	 qsr8KSnoSAxEjQq7dCpjY+h5cvKPPa7U2dlmEDPES768zMSzkuRgMjP5Lo1gEw3poo/W1
	 8SJ00w/O6X1uyZWwHatM5HpxDZ+j112IMSQY9WOE6lHInS8fUnZnzwLfwRGJ+8G8nqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E882B606A33B;
	Mon, 23 Nov 2026 07:45:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6978A1F000C6;
	Mon, 23 Nov 2026 07:45:07 +0000 (UTC)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 08:44:49 +0100
Subject: [PATCH v2 4/4] pinctrl: qcom: Correct indentation
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
Message-Id: <20261123-b4-qcom-kconfig-unify-pinctrl-v2-4-958e205b1f60@oss.qualcomm.com>
References: <20261123-b4-qcom-kconfig-unify-pinctrl-v2-0-958e205b1f60@oss.qualcomm.com>
In-Reply-To: <20261123-b4-qcom-kconfig-unify-pinctrl-v2-0-958e205b1f60@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3390;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=05HSQp7D1BTYTMSD8GhsWe4YfRK2y146voP7u3KV5vw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBrA+7yz6ZGQb9NNs03VPU5/pLVhY8VqN2DFHQ/V
 TJ4MZfYEoKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCawPu8gAKCRDBN2bmhouD
 14cXD/4+AY/mQ3X9MStgPPy/KMKWYrpY31edo7dRznoZqa5WYv7P/7u3kuZP4iKnReYi1v0186i
 i7u/DGeYxvBPIDeDAlpQGOwcg2P5guWEbLhJa26OL52ExJa292gXSXpzdMXibp1OPnDiU466U9+
 Lm1dVu3CF4ut6mTgdN3hSQhZl3lbTzsVke2kJ5IEhV0szMFKzdikg4Pwqzl5WFpoBWyMLaUBwT3
 Li5snOs/1uavazyOaD3czjYnoTG890LPtVSSjJpbjLm9CRyAMmlmAPhw5G0HAeiiY/MEm9HLros
 V8DzhFnPbjwea4PHcJI0eoa9xobJaCXpfAtXPoj1ArOMhr+MKh6b1WIel9vjsyUkG2wSElB1v+i
 HTwc40bv040s/rvnrPndQhqSogNtwUSdigVMVKYiUC0Pz4Pp27J/T/8F1TqUNP35fKeL9XpmK+g
 X1nj3Fjxnb93LcYv5xq2y5wghAMJ+TVEClOg+JdaOH1NWMJ9oqzYgagtnbRKy58Mz85d0sovZIA
 nHzObORkUDNRPIfUcdBTopwPlAiOVo6PMyuZC/gFR/ECQQVXMocjZPkGT9QRDa8BJbspmDdB8fb
 NPyWgbY9t77/z9EiEXdhR3N0xhWbQw5gu4DdIZ3qDHKw172Mo3PulPaUDYNo5zOPoEzKXpnqTuJ
 AuL4ADCIWDTiq0A==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Correct Kconfig indentation style to expected tab, instead of spaces.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/Kconfig.msm | 40 ++++++++++++++++++++--------------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/drivers/pinctrl/qcom/Kconfig.msm b/drivers/pinctrl/qcom/Kconfig.msm
index 51d005aea162..abb743d2235a 100644
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
@@ -441,21 +441,21 @@ config PINCTRL_SDX55
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

