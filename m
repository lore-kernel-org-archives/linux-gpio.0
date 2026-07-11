Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E654D32861F;
	Sat, 11 Jul 2026 21:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783803723; cv=none; b=F6vaNwAJHUzMiu2eVP5OH/W/PGHsBSwjEuImDPvC0ushC061Fjm5REYXSvOvhSVLEuN7G7S68uKdjdR4S8pawUFm8cKch3Qde8/Mc0WNJmOsOhk9Vo3XrrEHg9vplZY1nem15KwAbHyUWIy2TnBnT6tWDGBJc4z/iT0iJ/+t1Y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783803723; c=relaxed/simple;
	bh=J8zTCPjh+nDK/fnxnNOiHc+hMPCinAXVsQqyaY8cEtg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GKeeekcsJkc4plG20Tuv6+0pNFsx2RCq+Sr7NUoLu5On/18eO8eYmPz2eZQE3/SXFrPWYvMxuxE7vdNr1bqyN47EYHoBCjkWCf0hn+xxnExOBlkSYIvAn/Stb6HW27ia9sEVKMZM1kx/qcKeaMDH6L4hByK1+RqGX50aijwBzZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=JIKUv9Qw; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="JIKUv9Qw"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 800B111984D;
	Sat, 11 Jul 2026 23:01:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1783803713; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=FKsUHHGH/SII730m2DtTgjJ0hYE983TDVtK6awQQBNM=;
	b=JIKUv9Qw6FRXnOuL5Z1N+Hy8bYD1Z+NiLmyTYNl1GUVcJdd2tSeMmXf7fbZY06mb1MF+IS
	y2r4YDPj8veMp0iLkufZW4q1uoje0dwSGugrb0O4jBfXNXB8ur7QbaCL0rWWPfWu/ZR3Y6
	s1mOujyzLb2OgFVP4dnPoJmduWxZEAEpcLwPW/m4RqWTcGFiaz+klVCp8pgjU2Ie2JHkMo
	+6rane4Dqv8lqAZOqIEhr4v16p65f3ujNwa0fdhnQGsizxpiyLE3BkB1nLZmoZSjvWCijt
	vMY7lNhFqS1WNdf200ipRTenl3enjVxwXyE2RVJ6WgXAUZCTc2g5Hsjadwjw2Q==
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
Subject: [PATCH 07/10] arm64: dts: st: Add OMM node on stm32mp231
Date: Sat, 11 Jul 2026 22:59:36 +0200
Message-ID: <20260711210131.236025-8-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260711210131.236025-1-marex@nabladev.com>
References: <20260711210131.236025-1-marex@nabladev.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Add Octo Memory Manager (OMM) entry on stm32mp231 and its two
OSPI instance.

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
 arch/arm64/boot/dts/st/stm32mp231.dtsi | 54 ++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp231.dtsi b/arch/arm64/boot/dts/st/stm32mp231.dtsi
index d70812f094142..4505fc0e3b537 100644
--- a/arch/arm64/boot/dts/st/stm32mp231.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp231.dtsi
@@ -222,6 +222,60 @@ hpdma3: dma-controller@40420000 {
 			#dma-cells = <3>;
 		};
 
+		ommanager: ommanager@40500000 {
+			compatible = "st,stm32mp25-omm";
+			reg = <0x40500000 0x400>, <0x60000000 0x10000000>;
+			reg-names = "regs", "memory_map";
+			ranges = <0 0 0x40430000 0x400>,
+				 <1 0 0x40440000 0x400>;
+			clocks = <&rcc CK_BUS_OSPIIOM>,
+				 <&scmi_clk CK_SCMI_OSPI1>,
+				 <&scmi_clk CK_SCMI_OSPI2>;
+			clock-names = "omm", "ospi1", "ospi2";
+			resets = <&rcc OSPIIOM_R>,
+				 <&scmi_reset RST_SCMI_OSPI1>,
+				 <&scmi_reset RST_SCMI_OSPI2>;
+			reset-names = "omm", "ospi1", "ospi2";
+			access-controllers = <&rifsc 111>;
+			power-domains = <&cluster_pd>;
+			#address-cells = <2>;
+			#size-cells = <1>;
+			st,syscfg-amcr = <&syscfg 0x2c00 0x7>;
+			status = "disabled";
+
+			ospi1: spi@0 {
+				compatible = "st,stm32mp25-ospi";
+				reg = <0 0 0x400>;
+				interrupts = <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>;
+				dmas = <&hpdma 2 0x62 0x3121>,
+				       <&hpdma 2 0x42 0x3112>;
+				dma-names = "tx", "rx";
+				clocks = <&scmi_clk CK_SCMI_OSPI1>;
+				resets = <&scmi_reset RST_SCMI_OSPI1>,
+					 <&scmi_reset RST_SCMI_OSPI1DLL>;
+				access-controllers = <&rifsc 74>;
+				power-domains = <&cluster_pd>;
+				st,syscfg-dlyb = <&syscfg 0x1000>;
+				status = "disabled";
+			};
+
+			ospi2: spi@1 {
+				compatible = "st,stm32mp25-ospi";
+				reg = <1 0 0x400>;
+				interrupts = <GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>;
+				dmas = <&hpdma 3 0x62 0x3121>,
+				       <&hpdma 3 0x42 0x3112>;
+				dma-names = "tx", "rx";
+				clocks = <&scmi_clk CK_SCMI_OSPI2>;
+				resets = <&scmi_reset RST_SCMI_OSPI2>,
+					 <&scmi_reset RST_SCMI_OSPI2DLL>;
+				access-controllers = <&rifsc 75>;
+				power-domains = <&cluster_pd>;
+				st,syscfg-dlyb = <&syscfg 0x1400>;
+				status = "disabled";
+			};
+		};
+
 		rifsc: bus@42080000 {
 			compatible = "st,stm32mp25-rifsc", "simple-bus";
 			reg = <0x42080000 0x1000>;
-- 
2.53.0

