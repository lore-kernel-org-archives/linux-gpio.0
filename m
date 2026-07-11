Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97C163264F6;
	Sat, 11 Jul 2026 21:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783803723; cv=none; b=Fv9+RLWFEylEF2zm28LK0zgdGGndgLtGAGoNRMewzVCbmKlgx2BM1QllUzoxwCU1C9/Lia1K0OD0UT7i3puus2BibRsUOJTkFWzXQmAnNWNGEzY0y98Sq8mwk+/tj/4bvirdaXRBYOes8RaiqogrmoHoDZ6XrriwhHOecr8KWsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783803723; c=relaxed/simple;
	bh=HI+0VwoX6NSOf0cZ3ucA69VcKxi64Um+l0I7RARKxTI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ecVjQkWILn5B63/VKx5kT++OqfiaTBU7FGQPzFQNJ7snEEL7rppodkd0+27YThQkpa/IMb/aZ29DTDyOVkdIdiSSvdWMj55uQK1pVW9nHd4POp10K4UthX+xangCZefLtM65qhQ2BB4hRrBaDuKKSk4YBtRz1/8uoguscjIqoqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=b6nquMRo; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="b6nquMRo"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BA05711984F;
	Sat, 11 Jul 2026 23:01:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1783803711; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=sLCyXf4fSaul0KJMCLi1kEMoFgnLRGwVU3DVuKnCCcU=;
	b=b6nquMRojWyPdQHGg8IzliPYNnFVNTXutLtEoMZb5Kg34ut3o5p2yVHL23YoHDwxVlCO9z
	UNNxud59Y2/3I8o2oPxjNMVYlbnmgOs5HSZgHfombumdoKMFef3kPI4chfWZWtEqSoPGcz
	0L9X7omWlNj1sZHcTBdCvyCuyTzmp+e/dZT66POo5p9AgilTriMehuWUonKpI6+7bF0eJK
	HSu1CpDxEvL/l3RNihtoFnLxxbypRexIPJzK074RV4wBOUZqMKVVpA2kspHN3fTQvtOwuv
	y1d9AqZdSeryGUFU005rC9td1Ftr52wfqIOa2GriT/PwhAAmXyJBTZK7Zn+doA==
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
Subject: [PATCH 05/10] arm64: dts: st: Add SDMMC2 and SDMMC3 nodes on stm32mp231
Date: Sat, 11 Jul 2026 22:59:34 +0200
Message-ID: <20260711210131.236025-6-marex@nabladev.com>
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

Add DT nodes for the remaining SDMMC controllers 2 and 3.

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
 arch/arm64/boot/dts/st/stm32mp231.dtsi | 30 ++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp231.dtsi b/arch/arm64/boot/dts/st/stm32mp231.dtsi
index a9de9fc5eb411..d70812f094142 100644
--- a/arch/arm64/boot/dts/st/stm32mp231.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp231.dtsi
@@ -730,6 +730,36 @@ sdmmc1: mmc@48220000 {
 				status = "disabled";
 			};
 
+			sdmmc2: mmc@48230000 {
+				compatible = "st,stm32mp25-sdmmc2", "arm,pl18x", "arm,primecell";
+				arm,primecell-periphid = <0x00353180>;
+				reg = <0x48230000 0x400>, <0x44230800 0x8>;
+				interrupts = <GIC_SPI 197 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&rcc CK_KER_SDMMC2>;
+				clock-names = "apb_pclk";
+				resets = <&rcc SDMMC2_R>;
+				cap-sd-highspeed;
+				cap-mmc-highspeed;
+				max-frequency = <166000000>;
+				access-controllers = <&rifsc 77>;
+				status = "disabled";
+			};
+
+			sdmmc3: mmc@48240000 {
+				compatible = "st,stm32mp25-sdmmc2", "arm,pl18x", "arm,primecell";
+				arm,primecell-periphid = <0x00353180>;
+				reg = <0x48240000 0x400>, <0x44230c00 0x8>;
+				interrupts = <GIC_SPI 214 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&rcc CK_KER_SDMMC3>;
+				clock-names = "apb_pclk";
+				resets = <&rcc SDMMC3_R>;
+				cap-sd-highspeed;
+				cap-mmc-highspeed;
+				max-frequency = <166000000>;
+				access-controllers = <&rifsc 78>;
+				status = "disabled";
+			};
+
 			ethernet1: ethernet@482c0000 {
 				compatible = "st,stm32mp25-dwmac", "snps,dwmac-5.20";
 				reg = <0x482c0000 0x4000>;
-- 
2.53.0

