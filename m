Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 962B055294B;
	Tue, 29 Sep 2026 19:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790710860; cv=none; b=BpB68rtQSf7VeQOL2irn/tC/4fhH1kgxs4q0xFqfak2UJQGU2YfH6U/lRAG0mXQ+FtvuivWbPpoQ3kh2ChlnDzpG+EEXaurMcL8DibzcwzUc84Ayt6hg1hcm15cF6WQ6ASPS9Ftakpvx+SlRSw9oTbbHecWKwlBHMVt953l3IBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790710860; c=relaxed/simple;
	bh=/3oppZ1lj+bfSt0MxaumA3glPswhnyVplu+SEbpzAFs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TQd2fkFOxZUCvKYFR7RMzelbWmh3aa+KnZtVOO71OdOArwmgyr9lkuN8//u5tKx0AHmt6ljp8YpuNBp5LGwgN9NcvUxSuTfeQgjjdnSmPf3vG6KXmKZdNgdmKsix4BXm5OsTlhS/kg7lNv3zWKiITKgFWANsggTdiE4Vp3IkMvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=EJsTIUn1; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="EJsTIUn1"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A6DCE106ABE;
	Tue, 29 Sep 2026 21:40:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1790710851; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=RHAAFr+i4usoPv5gUuG1ugztlpBAc9vmyog+ELSH+E4=;
	b=EJsTIUn17iuIRv7f6AK9AhVw9+aDIworF1kuMOWML6hQTnl70O7oz/vx24WqHjJ3T9dc9e
	MDNiQInbCBs27z2KB98LT3zymoMGPohvXElOGK+j6J9V3JZRcYRsXCCiVzHG3SGKWASw/v
	r09txWCwCAy+3JV7ua1n0CTovl5z7FoDBSPumLEQ4XdeZiete4uL8ZmRir8AKbUizzDy7/
	GiWGf94d87qMdrX0q0hc5Gr3Z3oEU0fksxbLRW8/M73SLI0qesEgLY7SHDPsGDbG95e+0y
	XmoFSFnClL4Pdl51rwjC/2CBu6BUG0e3vtQA+LLB0m0EfK6Nqx89qvhngeF0Hg==
From: Marek Vasut <marex@nabladev.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marex@nabladev.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	kernel@dh-electronics.com,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH 1/5] arm64: dts: st: Add st,io-sync into eth2_rgmii_pins_b
Date: Tue, 29 Sep 2026 21:39:55 +0200
Message-ID: <20260929194035.496244-1-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Add st,io-sync into eth2_rgmii_pins_b to configure the RGMII data pins
for DDR operation. This pinmux is used on DH electronics STM32MP23xx
and STM32MP25xx DHCOS DHSBC.

Fixes: e2fce4620933 ("arm64: dts: st: Add pinmux nodes for DH electronics STM32MP23xx/STM32MP25xx DHCOS SoM and Breakout Board")
Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: kernel@dh-electronics.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
---
 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
index 757cdd2415394..75f516b8d6af7 100644
--- a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
@@ -240,6 +240,7 @@ pins1 {
 			bias-disable;
 			drive-push-pull;
 			slew-rate = <3>;
+			st,io-sync = "data on both edges";
 		};
 		pins2 {
 			pinmux = <STM32_PINMUX('F', 8, AF10)>, /* ETH_RGMII_CLK125 */
@@ -255,6 +256,7 @@ pins3 {
 				 <STM32_PINMUX('C', 11, AF10)>, /* ETH_RGMII_RXD3 */
 				 <STM32_PINMUX('C', 3, AF10)>; /* ETH_RGMII_RX_CTL */
 			bias-disable;
+			st,io-sync = "data on both edges";
 		};
 		pins4 {
 			pinmux = <STM32_PINMUX('F', 6, AF10)>; /* ETH_RGMII_RX_CLK */
-- 
2.53.0

