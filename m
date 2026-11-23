Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795419900;
	b=DrYgndDiqgBmt1uLzi8hbxpeHlUsVJr9aiF7QxuN2TlANvPN0ymaGqCLNtl8oJ9eNkoK
	 WL8aga9P+PKe6LDteSKzdJbsrBzIy2mQS18y+L3dV8J5mmiNYHbMsF7cRZYnkQ5ejQ5fl
	 Yo3g548HrrMlmP+5xt/1VXedmeR/fJyiLkR/Ws4FxwRXOtaiAKjzdQYwYhDAEeVxQjES8
	 A2Cy/Fdd6wX2o04zNDDv4uMmB12/KKfEW1oFlN/L5oSabkZTZAMJtytljfNfmtu/1rvj/
	 luOEmchpRdOf9YZlX3gMrNf8DRYMcMfmXM8Lx+yfDHj9FH024+bzlDqnFX3hFIivd7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795419900;
	h=Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=Md3kuYf1GaB1yWF2LA6le6Iyt4A/hSD+jihrVK3TUPI=;
	b=UU3AfkWP8rX4zo8V1HUdRIKpUQO22D017qqOrC+oMsxczc6zc6lwrm5oNhgEwZemWCQk
	 JrL9974iVL6sjO93x19xXD7hzqLgNTM4hnGTEDd+twZRifMGaElf2K8ZDIENWm4Pz9XLZ
	 CKUVvOUxsPi0mJJ0zMYAQJk/3PyzmGOjktjs8Px4d10M3idEHQubZC5JbW/w4iGItiIVs
	 kcevVJI1Ju0HNJCrtrmcFokNy3rA8cywmLsyEP5RsoNPJF/s3SdKHtZsZ0dLRZ5CkvZXx
	 CCrg+rF2OkV+ZyTZ9GtraUDI6FwG6K8RLJPj+ydDy1dPrbNMyyO0gwMDxwkNO9V3ULg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BF13606A321;
	Mon, 23 Nov 2026 07:45:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FA301F000D3;
	Mon, 23 Nov 2026 07:44:59 +0000 (UTC)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 08:44:47 +0100
Subject: [PATCH v2 2/4] pinctrl: qcom: Enable by default MSM8917 and
 SAR2130P
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
Message-Id: <20261123-b4-qcom-kconfig-unify-pinctrl-v2-2-958e205b1f60@oss.qualcomm.com>
References: <20261123-b4-qcom-kconfig-unify-pinctrl-v2-0-958e205b1f60@oss.qualcomm.com>
In-Reply-To: <20261123-b4-qcom-kconfig-unify-pinctrl-v2-0-958e205b1f60@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1429;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=P5wQvg/j87Kqd1p2g0KY9IxkjB4IL3aUMNUTDwuwCjo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBrA+7wy9pl/YOvUZL4BNtLk4givD+S6aIPrWp+a
 AieaYPlYx2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCawPu8AAKCRDBN2bmhouD
 16VPD/462sk+ZruhxvPLz6Q6TZEJITsOePWantTJIRultWzfYZfa5aGhkVXDEozJMO6jSaXuX38
 4XgCMwUePOvOOAiq86GuMyefGEf9/BSRQYe8dSR/lTWhkQjCayxhxw15lfOa7NPdF5PI6xB4HBp
 DCCuivZCGw1l93dNAyCKILo4nbPGBURrAojCrlvZMr1uo1Su6sMWz9IjyniQSSMxn9jir4Z6TVE
 Vf3fYDc/N8luxAUUwJ9tp4VgAgKYoT2M6+fwPHImqArBlMcBj8fhf+59GJReA/k51nmzwoVr90/
 avuOc3HoHBUwCaSbCFY2uJqPKEAL7NOioqTRr2XvIAbqV0p/arufSApTq9tNrjFtSUYa2dxcRPs
 +1sQncSvhFNVDVVdbjjYeoWjF3XZPbZdKTScR1F2MPfRyLB6tL16jORUo5Qu6eQDKPeUZoTHrPO
 6IDohj8nD+P9xtuKzDUzEz8K0elyJBUQSolHXumGz3YTiArEBLWRHMRCygu2kSxO8tnly7zW/D7
 R86gVGhv7d9AJb8LupkFOqJ6qJnfGM/ne1yu7PIGsILdxOuw9jTS895nhrIPC3mkhPZ+weVOqc0
 f0voOH8iz3OerIZ8J5jz6fNWPVa+/GdIzg0DuLMFlHTuwWl5XkRaMepgWMuUQRCvuP8ZmvjBabL
 ShkspMwDX6YcS7g==
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

