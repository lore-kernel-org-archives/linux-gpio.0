Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 014C9569F39;
	Tue, 29 Sep 2026 19:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790710874; cv=none; b=goEKmJ3HsrkR/S5q0S0TMh1PhOVrjXVdkB6kDzhMUfkWlntvVUkzTgLpi/M3bQ7TqIako8SSr4Le0+dChK3Ena830CF2VqYkKZbUhVzx36DKJS9hHTAbTKmySsHsslpXfaGlWSV1VRYfG4E5E4O42bP8cB9wF+eL0ZReDPp0XGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790710874; c=relaxed/simple;
	bh=NVPQJyNwfQqeydzVy8+iMETmosn0I7qEN63OUG3tqWU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nDfaRJizcYfRg3AsP2hvqhaTWkNaXdS4mHmy4dzVpYRqLbBOt3ICVRR6OLQSS7ZKHQwqMrs4UP+ZyKjB85Q29yDEu2MqUCQ8u90fpTr3H47c3DYz33bMUqTLHyKifZRSzPwQP56M90/cIjluzt93JFQbHiCUNyfZ989+/1GtSOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=IPbdgafZ; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="IPbdgafZ"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 47BE0106D6D;
	Tue, 29 Sep 2026 21:41:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1790710866; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=1qn2vPl+bLf1rEfvW1ixik2K1+aWCQFjBxOn4BAqqRA=;
	b=IPbdgafZbRjm9P+uVkyE8YJDv6d8AoAcee4lx/tfJc1tuez9f+sEHaxfrGXzwk8ZNSyYm9
	LSVEgf1bffW1fGM7Rieb01pvmGo9p3CK5LImECb7kuGg05Scexg8YdwgaFwZfTIqrVZfTm
	1rNOvV52FItXBtTjPmALC69Mj+3SvFT7Ou5hRwzlD+Cxc5MGkA7QQ0v4w64z8Gu5mwDShH
	MTqb9K2kmvloM4k7Ct45KYiVDC3jCPolKKpOKmJQ9CBa08Zi4PZyBnUL7FQwqs8L3OHjUN
	lNR546lam+hqoLTYYg28qdjZEOfV2+Jkwm7EX7bsYJmWCYSL5TyDX7hC7htkcg==
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
Subject: [PATCH 4/5] arm64: dts: st: Drop sdmmc1_*_pins_b pinmux
Date: Tue, 29 Sep 2026 21:39:58 +0200
Message-ID: <20260929194035.496244-4-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260929194035.496244-1-marex@nabladev.com>
References: <20260929194035.496244-1-marex@nabladev.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

The sdmmc1_*_pins_b pinmux nodes are unused, drop them.

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
 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 45 -------------------
 1 file changed, 45 deletions(-)

diff --git a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
index 674d30dac4d09..56c2c99a05d4d 100644
--- a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
@@ -675,26 +675,6 @@ pins2 {
 		};
 	};
 
-	/omit-if-no-ref/
-	sdmmc1_b4_pins_b: sdmmc1-b4-1 {
-		pins1 {
-			pinmux = <STM32_PINMUX('E', 4, AF10)>, /* SDMMC1_D0 */
-				 <STM32_PINMUX('E', 5, AF10)>, /* SDMMC1_D1 */
-				 <STM32_PINMUX('E', 0, AF10)>, /* SDMMC1_D2 */
-				 <STM32_PINMUX('E', 1, AF10)>, /* SDMMC1_D3 */
-				 <STM32_PINMUX('E', 2, AF10)>; /* SDMMC1_CMD */
-			slew-rate = <1>;
-			drive-push-pull;
-			bias-disable;
-		};
-		pins2 {
-			pinmux = <STM32_PINMUX('E', 3, AF10)>; /* SDMMC1_CK */
-			slew-rate = <2>;
-			drive-push-pull;
-			bias-disable;
-		};
-	};
-
 	/omit-if-no-ref/
 	sdmmc1_b4_od_pins_a: sdmmc1-b4-od-0 {
 		pins1 {
@@ -720,31 +700,6 @@ pins3 {
 		};
 	};
 
-	/omit-if-no-ref/
-	sdmmc1_b4_od_pins_b: sdmmc1-b4-od-1 {
-		pins1 {
-			pinmux = <STM32_PINMUX('E', 4, AF10)>, /* SDMMC1_D0 */
-				 <STM32_PINMUX('E', 5, AF10)>, /* SDMMC1_D1 */
-				 <STM32_PINMUX('E', 0, AF10)>, /* SDMMC1_D2 */
-				 <STM32_PINMUX('E', 1, AF10)>; /* SDMMC1_D3 */
-			slew-rate = <1>;
-			drive-push-pull;
-			bias-disable;
-		};
-		pins2 {
-			pinmux = <STM32_PINMUX('E', 3, AF10)>; /* SDMMC1_CK */
-			slew-rate = <2>;
-			drive-push-pull;
-			bias-disable;
-		};
-		pins3 {
-			pinmux = <STM32_PINMUX('E', 2, AF10)>; /* SDMMC1_CMD */
-			slew-rate = <1>;
-			drive-open-drain;
-			bias-disable;
-		};
-	};
-
 	/omit-if-no-ref/
 	sdmmc1_b4_sleep_pins_a: sdmmc1-b4-sleep-0 {
 		pins {
-- 
2.53.0

