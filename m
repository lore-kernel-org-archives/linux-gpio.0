Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795419897;
	b=T8IiCzkwgo720V61uh6sVXPrJ4PREM/3Mihhifj57tpxH7LD1R5vKwetbpIRBRPjkywV
	 TW4BDpqHEOH8i4V2ARBtZOw4TzHeOithLSf3XLmzAjeGhfrFl2RHR7sPoFEgz0ZlkoXxz
	 hao/IImcC1CVVirp6eUF0XvydZ9SiKZUCbg76aBNaZ1NnaWhrY1f/wgMrmkJ8K6IInPtz
	 1fQjWdlTbBAFRGPNYCkbiCoj6AONJrUQcQRm+T1w6Zqa1T3uLHEk+eA91YBIKRJRmAb+7
	 OCfOZD7q4U1/BsKpDjCKkF45IZnyfJD8TIOc9VFnoBl7M7HGyK3daLznuZJxIBWtFKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795419897;
	h=Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=9mHrneLO5YeQxJxtYfup6iTKvl1KGdxc2t3Qp4hgBR4=;
	b=U9j6o+uC+Ce6Jxrp90LpEHWYA+bCriBifAI2QjlGdAVi7hSXuxw/umtm1ZzcHqjBNEcb
	 Y0IyQjYFQOH+zu3AlnZpDtrQWhJc8a9BDdqkTsxxKpjJl+Tm6Mdap0U1Fvr7MscV/PJEm
	 teyxXy+9YJTXg+aBkemx0Ag1Wkt9jknj9Dn3xTV/xw3jNrJJ61OpSo3YATMc7k7fT/Gh9
	 kanEyq5LLXhFRPFzwzqZnqbuOTeu0OrIvjSyEUOLhzpEsE5zvUNM4PMvi/hQlgBTjbZrW
	 pQHihI67G5csI74u9mN9M3agfv9jec3VvTaWtk3HeiG7uiV+yVQ9+6va2m9PCKwqzIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CDCA606A33D;
	Mon, 23 Nov 2026 07:44:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 756DD1F000CF;
	Mon, 23 Nov 2026 07:44:56 +0000 (UTC)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 08:44:46 +0100
Subject: [PATCH v2 1/4] pinctrl: qcom: Consistently restrict MSM8917 to
 ARM64
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
Message-Id: <20261123-b4-qcom-kconfig-unify-pinctrl-v2-1-958e205b1f60@oss.qualcomm.com>
References: <20261123-b4-qcom-kconfig-unify-pinctrl-v2-0-958e205b1f60@oss.qualcomm.com>
In-Reply-To: <20261123-b4-qcom-kconfig-unify-pinctrl-v2-0-958e205b1f60@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=828;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=hihEppDh6fQtulqdk5wYxU/HR/T0HAYslHUlEMg3fO8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBrA+7vwsa1XZ6Lbxk79sW715weFx7+qd+ia3ghy
 xhNhFdqEoSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCawPu7wAKCRDBN2bmhouD
 1/BsD/wJW9rQaJ1in4oIlnJik3MkPdiXPP/j8o6XuYm2jFAWDpo0ujro5BEJ3H2TyiVY5b/632J
 R0VrF/kZmkzsLK8cn7lmGT5NLs02FUJFO33n1TEvXldcEFhtyRqhQolIqLkcsxPPLIhn+GIF2SF
 EDE5TxKC8AZ2AUayaepT8ix1Qj3qdyJczl2Rio7Rx1cecvAL8N5fYEBMTByqVkagcA871Y/bqG1
 80MNlnT/G8FxjSPctPi9fJYFwEfPAbB8M9ibXwS3IG6KsTg8yinDVybm3r8cxo4fVGP4wM8bFoL
 vRr54ra6jVEPoxdJ8MzFXRwDbslcIhRDZhiiSQIiQrVlEUxW7D9XE6aqjLbtrEK3ck6GRJJMlxM
 1+DN9P6pR+VQyjJ+1xHDVuF33lZQN5OPeznj9k+kTR+orLwjdTiMkokq93jN1gVHRPJLKFyRFPb
 L47L6n7jQjPrnZPDW/KgHkn72lrsK1QOGBsXa18V34GGaOk5i22gcxhgnO7djnNInjmipQoAuib
 yWa22I4eOd4GiE3OqPVPKxmIam725sXyKyeCagKDr18ygT+M7mS1/+Gz8tkDzoUQM1N80TyXQRU
 Yq3brSyrQ8agUaB4MAzBBkQ3+EN+KdO1brnTF0pBiyoA5jmcxUWY5WAeerA446U+k6MiJ50qJj9
 2Wmg5kml6RocHGQ==
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

