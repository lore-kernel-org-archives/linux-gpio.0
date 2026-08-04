Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9874526ED33;
	Tue,  4 Aug 2026 06:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785825293; cv=none; b=DuleD1hKcQTjmpKOUjSBAvr6L2ljLMWJeIa3Zt7Ptu4vkUq5f4bHne7Zy7zBkwHamRenFNnvoQOASCWBmTisoExKaoVy2uWJW5LnQldnVq9I7qQ+CD7lPWKzUPd2T17Xo+wOpQ06LoP6pYSAnkllUCGQ7gQVY9kdWRy0LvsWauc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785825293; c=relaxed/simple;
	bh=ksLuLP9L61STj7l8Y3f0TRckDPVfvzETJaZ9C8sWxEM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=PZEyXB64VnE3bRllNTHzdB6aABUu54zv70C2Ir282NMYQFhenoZkhfKiI4A6+AOmLxQ/hd9Bx6zJpjlpu4BjrF/9zkvqX8Axw+fqvn/vhm3ykrQfIpVS5YB0bzEtX7DM4UnzIYQiQshcrqDyLbt01aCRP0lszwL3P1mwqnFBkvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qwl4j2hf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qwl4j2hf"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 364EDC2BCF5;
	Tue,  4 Aug 2026 06:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785825293;
	bh=ksLuLP9L61STj7l8Y3f0TRckDPVfvzETJaZ9C8sWxEM=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=qwl4j2hfc3IH9S+zUMz99Ox1oNqBAcC2ISm/UzecNMlBoY2HFmn2ETMXgIBlG9NNh
	 utF/SzQ6Lz/i+yjQ1Yk/mUMyLppTh+S5nz94wtg9imKdM4Ooxenf4+I7QQm5K+TPpk
	 4rUbt04boPZCH7hvEncaJRULP61PUmIMQWUh9yplvO0anvffwSnQh6fuolu+Bwrxoq
	 Y3z3TwzPp+m76GYAPalh9qla+/Lx5ABkzYLd42K+WJe+PR9qaiJcefG1uncppX/y5d
	 JsxaQHcUc2fEE3Bcm3wGnjoMOdIniRnUSpWci5aAf3qLgBdRPAhxhaplvhSg3YDycf
	 SF3rgsTsnrU7w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03403C55184;
	Tue,  4 Aug 2026 06:34:53 +0000 (UTC)
From: Alexandre MINETTE via B4 Relay <devnull+contact.alex-min.fr@kernel.org>
Subject: [PATCH v5 0/6] Add Samsung Galaxy S4 support
Date: Tue, 04 Aug 2026 08:34:25 +0200
Message-Id: <20260804-mainline-send-v1-sending-v5-0-149dd4372ac8@alex-min.fr>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPGHcWoC/43NTQrCMBAF4KtI1kby26SuvIe4SJOpDmiURIpSe
 nfTbqoUiquZ92C+6UmGhJDJftOTBB1mvMcS9HZD/MXFM1AMJRPBRMWU4PTmMF4xAs0QA+34NDG
 eqbA1+NpCFTwn5fyRoMXXRB9PJV8wP+/pPX3q+Nj+gZaV0cY3zGpjhApwcFd40RvGXZvIyHbim
 zIrlChU8M7V3FjGTLOk5ExpXq9QslAyBOMcF1pquaTUTFVsjVKFstJUtm1axVT4pYZh+ACKFS7
 YowEAAA==
X-Change-ID: 20260421-mainline-send-v1-sending-289ec98e6dc1
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, MyungJoo Ham <myungjoo.ham@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Guru Das Srinagesh <linux@gurudas.dev>, Linus Walleij <linusw@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, Lee Jones <lee@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 phone-devel@vger.kernel.org, Alexandre MINETTE <contact@alex-min.fr>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Antony Kurniawan Soemardi <linux@smankusors.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785825291; l=4604;
 i=contact@alex-min.fr; s=20260421; h=from:subject:message-id;
 bh=ksLuLP9L61STj7l8Y3f0TRckDPVfvzETJaZ9C8sWxEM=;
 b=9OM7C6h+Ew1HyC361g/ORRwFn3yLQWmpclGWjIv21AbIzAy3MhyJFZHxPSAksilNfuZGBGq3I
 CQk0R/vF+42AR5VnxNPTdJndbL8AwiTvPh14Xd8rh78eEvNm3g4/9Se
X-Developer-Key: i=contact@alex-min.fr; a=ed25519;
 pk=KOCaxY4v16ptaT0uk1FRkuaDF2n1JhmnYwLiqWD76M4=
X-Endpoint-Received: by B4 Relay for contact@alex-min.fr/20260421 with
 auth_id=743
X-Original-From: Alexandre MINETTE <contact@alex-min.fr>
Reply-To: contact@alex-min.fr

Add initial mainline support for the Samsung Galaxy S4, codenamed jflte.

This series adds the devicetree binding and board DTS, together with the
small driver and common DTS changes needed to boot the device with working
USB peripheral mode.

Tested on a Samsung Galaxy S4 GT-I9505. This series adds support for
UART, USB peripheral mode with USB networking, the front notification
LED and the physical buttons.

Booting the device also requires an MSM IOMMU master handling fix,
which will be submitted separately.

Signed-off-by: Alexandre MINETTE <contact@alex-min.fr>
---
Changes in v5:
- Added Reviewed-by/Acked-by collected on v4
- Link to v4: https://lore.kernel.org/r/20260609-mainline-send-v1-sending-v4-0-83768fbf404d@alex-min.fr

Changes in v4:
- Rework PM8921 USB ID support by registering the extcon device from the
  parent PMIC driver instead of describing a separate DT child node.
- Add GPIO_OPEN_DRAIN flag to i2c-gpio
- Drop the Reviewed-by tag from the Galaxy S4 DTS patch because its USB
  extcon description changed.
- Drop the MSM IOMMU master lookup fix from this series. It needs a
  broader rework and will be sent separately.
- jflte still needs that follow-up MSM IOMMU fix to boot.
- Link to v3: https://lore.kernel.org/r/20260519-mainline-send-v1-sending-v3-0-3dd7aa125353@alex-min.fr

Changes in v3:
- Clarify that the Galaxy S4 compatible is for the Qualcomm
  APQ8064-based variant, and add Krzysztof's Acked-by.
- Clarify the PM8921 USB ID binding, driver and DTS commit messages to
  describe the PMIC interrupt-controller interface and the lack of a
  known register resource for this interrupt-only path.
- Keep the PM8921 USB ID extcon node non-addressable rather than adding a
  speculative reg value.
- Keep the MUIC and LED buses as i2c-gpio. Testing the corresponding
  GSBI controllers on GT-I9505 made USB fail to enumerate with the MUIC
  on GSBI2, and made LED brightness writes time out with the LED on
  GSBI3.
- Reorder APQ8064 USB clock entries to match the related ci-hdrc binding
  update, using iface, core, fs order.
- Sort the jflte DTB Makefile entry after the LG Nexus 4 entry.
- Link to v2: https://lore.kernel.org/r/20260427-mainline-send-v1-sending-v2-0-dcaa9178007b@alex-min.fr

Changes in v2:
- Keep the APQ8064 compatible list in qcom.yaml alphabetically sorted.
- Clarify the Qualcomm pinctrl commit message and include the failing hog
  lookup trace seen on APQ8064.
- Clarify the MSM IOMMU commit message and include the NULL dereference
  trace seen during IOMMU probe on APQ8064.
- Move the PM8921 USB ID extcon node to the end of the PM8921 child nodes.
- Reorder the jflte DTS nodes and pinctrl properties as requested by
  reviewers.
- Add Reviewed-by/Acked-by tags collected on v1.
- Link to v1: https://lore.kernel.org/r/20260421-mainline-send-v1-sending-v1-0-bcb0857724de@alex-min.fr

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Linus Walleij <linusw@kernel.org>
To: Lee Jones <lee@kernel.org>
To: MyungJoo Ham <myungjoo.ham@samsung.com>
To: Chanwoo Choi <cw00.choi@samsung.com>
To: Kees Cook <kees@kernel.org>
To: Tony Luck <tony.luck@intel.com>
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-gpio@vger.kernel.org

---
Alexandre MINETTE (6):
      dt-bindings: arm: qcom: Add Samsung Galaxy S4
      pinctrl: qcom: Register functions before enabling pinctrl
      ARM: dts: qcom: apq8064: Fix USB controller clocks
      mfd: qcom-pm8xxx: register PM8921 USB ID extcon
      extcon: qcom-spmi-misc: match PM8xxx USB ID platform device
      ARM: dts: qcom: Add Samsung Galaxy S4

 Documentation/devicetree/bindings/arm/qcom.yaml    |   1 +
 arch/arm/boot/dts/qcom/Makefile                    |   1 +
 .../boot/dts/qcom/qcom-apq8064-samsung-jflte.dts   | 481 +++++++++++++++++++++
 arch/arm/boot/dts/qcom/qcom-apq8064.dtsi           |  18 +-
 drivers/extcon/extcon-qcom-spmi-misc.c             |   7 +
 drivers/mfd/qcom-pm8xxx.c                          |  78 +++-
 drivers/pinctrl/qcom/pinctrl-msm.c                 |  15 +-
 7 files changed, 588 insertions(+), 13 deletions(-)
---
base-commit: 4bf3800382b91c2898d14452cf4332782b3fe80a
change-id: 20260421-mainline-send-v1-sending-289ec98e6dc1

Best regards,
--  
Alexandre MINETTE <contact@alex-min.fr>


