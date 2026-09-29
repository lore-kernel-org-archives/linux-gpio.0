Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5865C392819;
	Tue, 29 Sep 2026 19:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790710864; cv=none; b=MsoIOb/u5uP3rKIPZSMqtHZ+4d8kQQvy62xYNi86wQXwa52UUSVn5PJCBBveJEIpKxjsdqMtaqVUJWkjmCs0+4/MLQWqeXlKO8c9TfKXDHf7s8R0aKwWuO5pm4IJPiyAfhX/lwt4brzASn20Olr12D4JSVtrDeBu0nmG5JYgbaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790710864; c=relaxed/simple;
	bh=kf8cJxegOnEvzcceATcrPHhuyqcpuxFgu1M4QrN672I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G+nFjMBodzFthQyz7YpywaB6DfvIE/9xYbnBwIXL9Pa9ZZ+b1n+DyUMA0thz7DXE1B7e7T80AOPQMd+7eFqJAh1nTVYt5psAmfxkLRYdKW0Iu3bdtCgiRaE415eNWB8BzFFhzn5P1p98uoQw7eo7ZRCNLyhCca5uNABee1sHZ8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=IT3x5eyV; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="IT3x5eyV"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 265A8106C95;
	Tue, 29 Sep 2026 21:40:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1790710856; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=0XCBv3O3B5U/0RI7i7/PfYDk3hpKzkqZDOf+4YfGQmw=;
	b=IT3x5eyVq2rxZJTC300zmKmC8Go0EtXwiKIEkZOJYaWoLMLm4+RQSJKczSiOGxguUc26vD
	OEGHO6P5I6D4w4+HyfXPKsk1oN4leLVIFFJFCC8/DfduT/HbgHR08r+gpzgKEW8cGN/qzA
	oyrA2YNlWQnG15ww8pbnUX3y4WuJIJKxjyEA63ni2dnBymi7fLu0IF7+qBtqwpACeNzuK8
	bFa+oyY/S+mZ1nMlRmAIt9ibHmNn7esTLN0M0TBBS6pGV+NkNbevxHM3K7TakszOpaMDLz
	pwMdQ3xautJe2jmo1ZecklsQQocW9+wFNsFFs6wHBkepSEhIVrL0i1OOoH/O7w==
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
Subject: [PATCH 2/5] arm64: dts: st: Fix PF7 AF10 comment
Date: Tue, 29 Sep 2026 21:39:56 +0200
Message-ID: <20260929194035.496244-2-marex@nabladev.com>
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

The PF10 AF10 is ETH_RGMII_GTX_CLK , fix the comment.

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
 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
index 75f516b8d6af7..674d30dac4d09 100644
--- a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
@@ -244,7 +244,7 @@ pins1 {
 		};
 		pins2 {
 			pinmux = <STM32_PINMUX('F', 8, AF10)>, /* ETH_RGMII_CLK125 */
-				 <STM32_PINMUX('F', 7, AF10)>; /* ETH_MDC */
+				 <STM32_PINMUX('F', 7, AF10)>; /* ETH_RGMII_GTX_CLK */
 			bias-disable;
 			drive-push-pull;
 			slew-rate = <3>;
-- 
2.53.0

