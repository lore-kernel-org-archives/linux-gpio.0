Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F9DB3242BE;
	Sat, 11 Jul 2026 21:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783803720; cv=none; b=ZRk/U8d+YAeECkCIgT8BjglfFxFE3AWuN23U8LFK1QE4tdVaDQ0YxSGLBs2j2oR+Y8MPsSC1e2hYrGw8lwmJLJTZRtUU/FjU012UWT4goZ9CXpK8nhELw23d1iIT1E5sSY9IOtNEk16znWyANSa9tCLJ81YZEHKcxhyJZi+mLl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783803720; c=relaxed/simple;
	bh=s0dEhrOCQrtcXpiGq1CCSSLYUMnExIP36w9JRaVSwEM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mRGpZJaFGKfNs4iraqigyXiDycKZrSgLTSX90OsVJ6LbN7LHehxUH47ln/r6K8bkvlyOTGnH20mdbrjn64Ff4Ha9RL5KHwqQn6qfGfL2fQLnjYCa1rpv25Bt3brODZV3U3sGNQC9+YcwuPVFb0lRT5KlEW56oTYfN5TjmngiO+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=Nmt32673; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="Nmt32673"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E2117119846;
	Sat, 11 Jul 2026 23:01:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1783803710; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=YxKx3is/yCeVSwU3UhNrLTwlQPWlNmb1dz/uD0wRxXw=;
	b=Nmt32673ywguMRBqEVI498ph9uGH3f01nXTPRFB2E2pb5njYXYCnLc6sJKfdMPjDPlNTJC
	W+kKpPEBZnDeZ2E9GIkCv2E88lfg7dVZ3dnzhNnhBeRdsOPB7/ZRd/GAWvf+nDpAWrcP1V
	8EZfuabofjtadEeGIbzkuLq2skXrU3m4Yj1QIDYBlDuQDQXTZaMPPFqBujk5jn6XbC27SI
	WHi1P6/rQoyUbyqBWYzqpEa+a81U8tMNo72GV1LUAehYirKUYuEnZFuer2DruNxujBZe/r
	CaGw04XUOVA6Kecw3u/JdWKfskErUQtjPp7vL4ygxSlYtDTLpCLCXN3rAMh0MA==
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
Subject: [PATCH 04/10] arm64: dts: st: Fix SDMMC1 indent on stm32mp251
Date: Sat, 11 Jul 2026 22:59:33 +0200
Message-ID: <20260711210131.236025-5-marex@nabladev.com>
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
 arch/arm64/boot/dts/st/stm32mp251.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
index 9c63fdb5a885a..66f3f83b8731f 100644
--- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
@@ -1657,7 +1657,7 @@ sdmmc1: mmc@48220000 {
 				arm,primecell-periphid = <0x00353180>;
 				reg = <0x48220000 0x400>, <0x44230400 0x8>;
 				interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&rcc CK_KER_SDMMC1 >;
+				clocks = <&rcc CK_KER_SDMMC1>;
 				clock-names = "apb_pclk";
 				resets = <&rcc SDMMC1_R>;
 				cap-sd-highspeed;
-- 
2.53.0

