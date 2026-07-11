Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B5EB315D29;
	Sat, 11 Jul 2026 21:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783803719; cv=none; b=gFZAAfGRvJ9KH3mV7FG8/ADByezuyv18k7oji9+IqXfebuP4KnzVgQXiG6vIpqnU9sbzsduVu3RWybhML6T01rSw7SOHa09Xkh8NmwpS9GLLPRb3GkXiuTiTqffAy9u/B1uBjfbFju0sN+7IC6ntO7zqZBlN2tA8TgLIek02ZT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783803719; c=relaxed/simple;
	bh=7B4HlN9m6+lCaBISeVnHmFcI4fwTIFTHSJvLW/oQdVY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=udXcXzKjfZhB/rCtrKp1siZAHQe8E2d7eeAZEubSiXm/Phu8Np8Q3txNM/YN8WHLoHz9gEylPvRmb8CkoFMheFJ/u3mSnqPOIdJfiNGc8YJJaNgfvUmfIhEU4NOdDzPprhaAunIyu0GMjuKcUntRBM5IyWUDa5rsGhQsO7YIlRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=ZGujiJqR; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="ZGujiJqR"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 17FF6119847;
	Sat, 11 Jul 2026 23:01:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1783803709; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=PxOheComZsT6yxnkUvSnvmdiUDv7GpiTTASR486Q+Ko=;
	b=ZGujiJqR+iMIpvYV6aLG0wtsmR4mSSle4HsUHt63FFCrKFzLt6F8NQyRhWR9Ckx49tFkwZ
	nQqWcr0HNqI/divQFP2crS9XkXAExBw18sYM6qRf9Ghne7fvcdLY3Yj2xmKsYg6g+TOVLi
	VxXaxewRYVlDgf3a+V+3/f87sO0t0nnoYNfXX9tyGfAeKd35HaPkvuMHBJf5VGHUUMFo37
	N2BNPIfbEjtN2Q3eMjSjhaYlYI+8Cl8oXcdyeCaW/1kfmFslzQXiFBiLk8JxmA7SLLl22g
	Z0DmvBxmFpQehs4n0g9tnxRWUcMv8VQ8kCsimm20k/d/5FlJUY5cyT77g5fxFQ==
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
Subject: [PATCH 03/10] arm64: dts: st: Fix SDMMC1 indent on stm32mp231
Date: Sat, 11 Jul 2026 22:59:32 +0200
Message-ID: <20260711210131.236025-4-marex@nabladev.com>
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

Drop bogus space. No functional change.

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
 arch/arm64/boot/dts/st/stm32mp231.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/st/stm32mp231.dtsi b/arch/arm64/boot/dts/st/stm32mp231.dtsi
index 9e1d240888ff2..a9de9fc5eb411 100644
--- a/arch/arm64/boot/dts/st/stm32mp231.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp231.dtsi
@@ -720,7 +720,7 @@ sdmmc1: mmc@48220000 {
 				reg = <0x48220000 0x400>, <0x44230400 0x8>;
 				arm,primecell-periphid = <0x00353180>;
 				interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&rcc CK_KER_SDMMC1 >;
+				clocks = <&rcc CK_KER_SDMMC1>;
 				clock-names = "apb_pclk";
 				resets = <&rcc SDMMC1_R>;
 				cap-sd-highspeed;
-- 
2.53.0

