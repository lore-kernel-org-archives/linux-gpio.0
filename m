Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795354456;
	b=2fcp65nVDz9Y2iJiyaaC5vOw3nsG4oiwQt6cwUiOJ5ghW0dKBU3goo43bIWlauAolGUF
	 xRuTUy3h4pGhJ7kGg3VIWUZEFHaOaI2SZ7DoOHNb8e8DT8GnQdd2eRa8tv6rLctSCCDwz
	 WHbKzeO6zfF8psektSebcaNU2IP4XWLbGMlyGuC0pC53Z3SOCw3UzaDZzC4lGhQG1akFt
	 eB5QScrGvwyCL9zo08pYZJmQITc2kcnAKR40W1j/NJFlYqkFANF1bNvGgQrGezGXLZ5Jz
	 x+ulJJcidf6XKuFm1RnNJCuKm+Oexe1Vu9UJ6vwDogLg88YW4Ou2WqA3wBeaQkIXPxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795354456;
	h=Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=9mHrneLO5YeQxJxtYfup6iTKvl1KGdxc2t3Qp4hgBR4=;
	b=lZ5zET52MENB3cFf7/9cWwdFgMlkjd665Nz8+Nht0D6XLXBulddblkSieWjqKGvpm5Cf
	 OgspTjP6D+3nyDaTHdRNDmWw5KLUsCveITGfxZkC5LTv7fY0cMEGJHn865CvaXGEecy0e
	 kjvISa2X27bkdOpO5wTsPdmL+xKnijGUYJ1sNaEBxzklEjBDCmznTJ74ET/aXl0JGnzpZ
	 WtD0PA0V/GC07uE+K95/aX8+jBf+nEG175WNpJ7mlgZTnDXZon0PU3cK8QLINIwRFDLOf
	 ir30/GKSz51f0/LuXt4WHYG4ZAdDwTasH1Rf6vY8006zVK71FayipJ9JWq6+o0Gjv3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED450606A332;
	Sun, 22 Nov 2026 13:34:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CC011F000D2;
	Sun, 22 Nov 2026 13:34:14 +0000 (UTC)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 22 Nov 2026 14:34:04 +0100
Subject: [PATCH 1/4] pinctrl: qcom: Consistently restrict MSM8917 to ARM64
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
Message-Id: <20261122-b4-qcom-kconfig-unify-pinctrl-v1-1-f0068f161636@oss.qualcomm.com>
References: <20261122-b4-qcom-kconfig-unify-pinctrl-v1-0-f0068f161636@oss.qualcomm.com>
In-Reply-To: <20261122-b4-qcom-kconfig-unify-pinctrl-v1-0-f0068f161636@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=828;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=hihEppDh6fQtulqdk5wYxU/HR/T0HAYslHUlEMg3fO8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBrAu9N6N5LHmnbk///C9RwxKoxdvZhGBbJPO+ej
 vtm8DCmM6OJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCawLvTQAKCRDBN2bmhouD
 1xdSD/92ngS/Y+s5mtAPjbaSwD9raBDTBr61/t4oxwq5u3hQv1PrO/mg9t/tuZI0T1D26W6KTkl
 dtbagpxsHKKj0DI1dIM7QRJtvPYAmx61rB28saXj0qN6h1yorRzO4+cmzwFrPC7lxElxqPzxuXq
 Ry0aKgbIylUuvl2RLWpSsbFPcIeri4UH7pkACfpLmZwo61jSuLQvFko/bp2oPF1mImwEVKm3uWn
 1ttwXK1v5v0dq6Ma5xWzxMVuLAeWoWvF2q6jDn5Y/ADoylxlNE2D3hi1Vfcp1+TjRa0Y1T642fY
 iIjFjsrNAALtH3HuF9S6Wwnyt7MSOQ9IaKxoIy0TllMR2eEDG0tAEpDVALClum3lh5puu58pXle
 ++gQcjFkLOIunyf1MKlyYQiO5dsQX1OG2lVunzyFyx90KZorF2TDVoy11lHQ/ais6B2g4hwgiCI
 JKaJDQ1bneTR2PT2YHMjA6WdyrwgBz3YrZ8uG9WU6JgC2iTrLApomhoBOa2qhLrPKn6nUa3E1ZB
 Z8c4f/88/+2bwDplVq4aiH5UAOh8+8vpuXptlCKjzWS+ocmK+fpj3O/gt/e+8w3XU+fK9XQUSf+
 cBLWYZY2l3QcCMTuA8EcsxWCB0RLJsK+5LjaeOQa+VLRyAgWwMBByxmiw7af02yApm509CBwQn/
 dDZXY/9RU0oPznw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Clock drivers for MSM8917 are restricted to ARM64 and there is only
ARM64 DTS, thus consistently handle also its pin controller driver.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/Kconfig.msm | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/qcom/Kconfig.msm b/drivers/pinctrl/qcom/Kconfig.msm
index e45c701db627..3a2a97948e6e 100644
--- a/drivers/pinctrl/qcom/Kconfig.msm
+++ b/drivers/pinctrl/qcom/Kconfig.msm
@@ -239,6 +239,7 @@ config PINCTRL_MSM8916
 
 config PINCTRL_MSM8917
 	tristate "Qualcomm 8917/8937 pin controller driver"
+	depends on ARM64 || COMPILE_TEST
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  Qualcomm TLMM block found on the Qualcomm MSM8917, MSM8937 platform.

-- 
2.53.0

