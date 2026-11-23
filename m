Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795419894;
	b=XVgMysFdaWBlqm3lrP8/KbIBkDmnhYN29/UW6rFKoZLX8k+ohHZag38jAEDC4Wx/HeYj
	 QK04FBkpLENkJL43Djz728SioAWCRkKBUp9LdKGAfm96Rdrz8V+HIU5oM59vBIB8ihBdW
	 VCHA+7sUIgNfP5jDk34T5N5sccip0NGHgSFXAB+kf05QtBraMk68vOQeuTdHKbcticAR1
	 ZDELRMaL4OBgKO7FngkfM0Rt6l9NF8JIUDZQjjUYnC5A3rprpkaN1gwJnzRckejhshF3w
	 9U6gkg4IJOH1LwSuHxXDF9VxLgOY82g3c7LeaPu0SiXJ1roq3UlMZHgZbArzaYq6O6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795419894;
	h=Received:From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=7QBfAHBdeUTK9ibw3OTs/CNXIDit/t1Cm7LSMzK/Bm4=;
	b=hwuj5YrwCbPtCaEBC5Y4lwvwgcbYi39nvXEoUtT5W6lpGhRtBRewZ0tZqCj009vu7tkm
	 jtSVf/GwsSF5769bPxQZm8nk9bz3a0Q/lACqsK2QM+gESsb4XcyhxBjgI/Cgk9IS5EB7t
	 jb+Gfu2oZt5WbFeJc3/nVPw0sgkxQR2jTAfWTC6L+cLlG55hQ8JPxbjbSlcQvXVyQuVCx
	 N3//LxzHP4cO6Blshz9tDFVDnbMxxWkfwzcgDUr98Ozafl+Q8pFoW9umsAnvIbZG3th69
	 DRCa5yuhdXSgURi26G2ZPijXcnza0xLLpuNmahLbJdsWtTpJ66ZttMZ8tcnu5QU6iTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E13606A31E;
	Mon, 23 Nov 2026 07:44:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D7B21F000CF;
	Mon, 23 Nov 2026 07:44:53 +0000 (UTC)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 0/4] pinctrl: qcom: Unify KConfig choices between clk,
 pinctrl and interconnect
Date: Mon, 23 Nov 2026 08:44:45 +0100
Message-Id: <20261123-b4-qcom-kconfig-unify-pinctrl-v2-0-958e205b1f60@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WOQQ6CMBBFr0K6dggtWNCV9zAsoLYwCi20QCSEu
 1tQ49LNJG/y589biJMWpSPnYCFWTujQaA/sEBBRF7qSgDfPhEWMU8oolAn0wrTwEEYrrGDUqGb
 oUIvBNpDGTJzKNE4ydiS+o7NS4XPvv+ZvdmN5l2LYSj8JK/vRPx5+sRrdYOy8W010234F2B+Bi
 UIEKop4piinPOYX41zYj0Xjb9rQD5Kv6/oCPNfrbvgAAAA=
X-Change-ID: 20261121-b4-qcom-kconfig-unify-pinctrl-732c9b734825
To: Bartosz Golaszewski <brgl@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1210;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=fNj1mnNivJbKbNFvLaYyXWKpVrmgMFyt+nOn7yacxWg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBrA+7vZBiAmRHqOe01kfJNrOxNEyWcA2PLwXeUj
 wkjgP1IJMCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCawPu7wAKCRDBN2bmhouD
 10fqD/9+Ke2B906VZzVVXdNpgum/mf+oqa5fxTTFdaastjHm3OKz3WNLtnI8mJR0zeDfaaEZwnY
 QjTZxcCBMJmwsSzh1IeusJPkz/lEfk3ZXfMvONiwUwrsR4CPBUVowbZWdG6EJttmRPHhfzFlOkS
 BAxXirkU0Xpin1MG+wPZeYsSfZhXO+xRH1AReig63FNJW8sFGqz6kz0SKlBp36pMEIAXs99K304
 u9vnv25a9NE94CzqgarwlmcgORANWQMS032KIUjnAEkS7cBmDXVgic4aERdxzDULOSWaS8fsRRT
 7LuyR/KymqdGDagCFQoq+G5LMStz5U18QuaP4D3uy/xJknp8rwOtpR+3UZ/4e8qdPiCbEDyJbnk
 +VT8PPDB3jyCX3YhD1dSG0E6RKJ1c3Fh9OnUYYEGeWfx8xmwJHUBmL4e6pEeKmYxhxSYgpZFuHM
 tfWsLSPkW5jDsSyrAyDFeCKSG66BZF4Etr3j2G6bEomIRjqE/LpXW4p/rZQj1z5wh44IQdMfAZJ
 IQiE5qyeZVIitWcB0+jsActqDkhcDiQs+eCRvEDvzdUglzpANTirbOI6BG16DRjzEVU4es0mWh6
 LZu3S6d+r2US73KO+pa0Hp9e+18o48uxLInFbxp9HSBmkbLe5qkoXaEwi3bvrAViQp9nTS9VrIK
 glFZjmthQdNRJvw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Changes in v2:
- Patch #3: Do not touch MSM8996, because it should stay arm64 only (see
  clock patchset)
- Link to v1: https://patch.msgid.link/20261122-b4-qcom-kconfig-unify-pinctrl-v1-0-f0068f161636@oss.qualcomm.com

Recent commits adding defaults to clock, pinctrl and interconnect
drivers left a options inconsistent between them, e.g. SDX65 clock
driver not enabled by default but its pin controller enabled. This
should be a consistent choice - we want by default all critical drivers
enabled.

There will be separate patches for clock and interconnect.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (4):
      pinctrl: qcom: Consistently restrict MSM8917 to ARM64
      pinctrl: qcom: Enable by default MSM8917 and SAR2130P
      pinctrl: qcom: Consistently handle IPQ5018, MSM8953 and others
      pinctrl: qcom: Correct indentation

 drivers/pinctrl/qcom/Kconfig.msm | 64 +++++++++++++++++++---------------------
 1 file changed, 30 insertions(+), 34 deletions(-)
---
base-commit: 4dee4fff023d62984d87d0e0ec58000c66b09eff
change-id: 20261121-b4-qcom-kconfig-unify-pinctrl-732c9b734825

Best regards,
--  
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

