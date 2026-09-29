Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1969737F8BD;
	Tue, 29 Sep 2026 19:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790710869; cv=none; b=X91L3Z5dWCvjnnTwql7yDuyQyFptQGb30A5LqL+qvDa5k2zfW3yTrEQIL/hyPW6jYA2mjELUXkMBMhJf7VfObzSC6dZ2K8OsUELkkjxARiOcbZWfyyV8GMY/qH4dKXdc4e250U7DvX24E2oYrK2N9Y6tjZ3edbmJDDDlRSYsshs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790710869; c=relaxed/simple;
	bh=exlntef7sTE9pe035iCxescJF5PA4YBMfWyq2HxbHNA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lSFn6yvhEKfHNIx+ruUV7H2o1r6ilYgDk3JW8ICj6gVcG71gegp2X2mIXJswrfZHhzyfzyYfSLpllTwfgTdZI3Uy0eC3aex4BWpet8EK+f7HhsodE2t7GGCXfbNiQff/KRo5JdLZ9MThVgm2voq2ulGAr02t3L5xg1lXawwxe9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=FeJJbuLF; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="FeJJbuLF"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 45166106D69;
	Tue, 29 Sep 2026 21:41:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1790710862; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=PODLXCRFLWkJ9Cd44TlRnXrHGHAgSH6/cDTQhJY6Y6U=;
	b=FeJJbuLFBuxSXWDfU8B+6vj0OXaX1XfnVMCl8aWUnHWWcSow3ciomC4WCtmQ0ntiZeNHBT
	g9bfralnnPzb2Ubvkat2fXP4Edc60sbHl5eIkBKqcYaJTVmVYX319pdgx0l5hZmoP7s9nA
	+sHBn03+tKiScSlaO0JBpyLaSvoY554DVmEQm5Kd5Zq+x4n2GwEJb86iw6sOlASXuaouBx
	PFplloFstxoQMssU8HojV0TDSiA6bKDszn748ZJmKT5T2aDOV00R+x7GAqVpAMLkdIIg5b
	L+X2RXV7Vn4hyAVj+e3bDllbNHJOE3WmWICBxxgEQU4+L4zJIzusxEmpBQIoBw==
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
Subject: [PATCH 3/5] arm64: dts: st: Reuse sdmmc1_*_pins_a pinmux
Date: Tue, 29 Sep 2026 21:39:57 +0200
Message-ID: <20260929194035.496244-3-marex@nabladev.com>
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

It is perfectly possible to use sdmmc1_*_pins_a on the DH electronics
STM32MP23xx/STM32MP25xx DHCOS SoM, the only difference is the slew rate.
Reuse sdmmc1_*_pins_a with updated slew rate on board level.

Fixes: 9b584c92f94f ("arm64: dts: st: Add support for DH electronics STM32MP23xx/STM32MP25xx DHCOS SoM and Breakout Board and DHSBC")
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
 .../boot/dts/st/stm32mp255c-dhcos-dhsbc.dts   | 28 +++++++++++++++++--
 1 file changed, 26 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/st/stm32mp255c-dhcos-dhsbc.dts b/arch/arm64/boot/dts/st/stm32mp255c-dhcos-dhsbc.dts
index 332a8034cc372..eea7a76953639 100644
--- a/arch/arm64/boot/dts/st/stm32mp255c-dhcos-dhsbc.dts
+++ b/arch/arm64/boot/dts/st/stm32mp255c-dhcos-dhsbc.dts
@@ -145,10 +145,34 @@ &scmi_vddio1 {
 	regulator-settling-time-down-us = <100000>;
 };
 
+&sdmmc1_b4_pins_a {
+	pins1 {
+		slew-rate = <1>;
+	};
+
+	pins2 {
+		slew-rate = <2>;
+	};
+};
+
+&sdmmc1_b4_od_pins_a {
+	pins1 {
+		slew-rate = <1>;
+	};
+
+	pins2 {
+		slew-rate = <2>;
+	};
+
+	pins3 {
+		slew-rate = <1>;
+	};
+};
+
 &sdmmc1 {
 	pinctrl-names = "default", "opendrain", "sleep";
-	pinctrl-0 = <&sdmmc1_b4_pins_b>;
-	pinctrl-1 = <&sdmmc1_b4_od_pins_b>;
+	pinctrl-0 = <&sdmmc1_b4_pins_a>;
+	pinctrl-1 = <&sdmmc1_b4_od_pins_a>;
 	pinctrl-2 = <&sdmmc1_b4_sleep_pins_a>;
 	cd-gpios = <&ioexp 8 GPIO_ACTIVE_HIGH>;
 	disable-wp;
-- 
2.53.0

