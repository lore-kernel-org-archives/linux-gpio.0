Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793908519;
	b=bC9mEIJUlzH9W1xO7Bqae8bp2VtB9dVkj2vP1Yau+ug2ddE0vag/k2cRtn7si5qxU38x
	 16naYSOEzJMWbqprD8dEQxECNX471RDEVXUWhFZkY1AXh3JR0+FyG8nw89jftSYrMZ9tf
	 t+hV+eQDDx5M/dgrwRXahElEX0Qdvir/2+Z2vTnwK/8qx5OAIyLyPvriAHGSc+jZtDqhk
	 8kwK+dfdokzzenDb/uC40kmz5qO871whTdRYs/yXvmj+9KfdTmcrznbj48RglLtcqquRV
	 9e1SQXHlJ9DCnh56Gx+l7ByhNEEG0JOnfSYaK5B5aLrk+b3cQ9gqRGGrF7/SF1vzJbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793908519;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=kSakqCvIRYmZp4Kah4XkFCmivNJpbW+r8furabcNvo4=;
	b=4b0gZDrzjmnTB/8RIa9Wvjd1Ul14UOIramgSdu8jA6bXUfSrneYWj3Pwpxqz7KPFAzGG
	 Pm4an/HUzQrI7xJNwErk9vaMRntEveYyYBA17hQuEX9vGcfqfqv2Wv1LA8zsDUgdS+PZ7
	 9n+hmbv9IZU4LRynrcuGJLr9Lww0JK9oVkmdHgaRl/6shLvzL0R5ll/uBQmYoQsVHbc4W
	 fRxbrXf2ZHXDuu2vLCiD6H0FSczfuFKFvvLh8Xkri5qdzVpGX7xp5bf5PMu7quTCfV6lN
	 3sluPYZuf5dNnF/BWoEglfMPlRwW4fnUztJRudwr3KNXTg329EBC4b+W+IOmSqkUQdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qvLLcQNt;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEE0F606D821
	for <linux-gpio@vger.kernel.org>; Thu,  5 Nov 2026 19:55:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CEE0F606D821
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qvLLcQNt
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a214af2076so16979455e9.0
        for <linux-gpio@vger.kernel.org>; Thu, 05 Nov 2026 11:55:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793908517; x=1794513317; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kSakqCvIRYmZp4Kah4XkFCmivNJpbW+r8furabcNvo4=;
        b=qvLLcQNtgJw1h8ipzcaSkR1lmwIJrqC1AFECRVaek3oI6lK5OtE98lExxnGvM0fvCU
         GojEDMIBnDnagS60gS1AnFE/Nmue4V2s879W+IZE2Lkl6QEd135hofco9PovVS2lC+FY
         xSMk7dQ+JlpzPAH9AObsOSonUjMNfNF/Q9DXb7lwyx33y11u7TsiL3oLVK4jXt4tbkwz
         o3LYpKpYogPxAjyBIZpl7zJ5Kvez+RFvLESYCX2H7VGm+G/jyk/ZcXuniMsEpXjTE783
         EZrYtWcRuY6LYCEZUQHMA5VPK5zZHx6JSNOdIyrNpQN6nO07/EkCO4An95PO24fXcn6Y
         5pHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793908517; x=1794513317;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kSakqCvIRYmZp4Kah4XkFCmivNJpbW+r8furabcNvo4=;
        b=f7u2lTC/AEnkcRxD0Oh9ZHnQbp89XHSyn2na9DaDSq1QJjD3UgvxGalRQoBM7tHXdq
         7PsM/hvvyuOnln754dYRCKJ2J5KL3wplINvRAkUO8hR33gburLEz2Fk76kugyYcCWSwV
         9F8N9jSVRIB2obA6T+wHpMLMBj79VryY5ryFXRBIJVobZetM8O2pj8kAj5sZ7Rlb9t4V
         3/nbHu9Dpcu0uBixpruENSpZJvkzlsVPtR4d8HXiTb6Ux+gCSnAaj7sg/tQn/WeWCwmi
         H21u9owv9jygvYtIwSjb9fKHNyxCJKgv7Xy5EeZraTo6EujQxtrVX7uqc6pc+rwAWEP4
         oXfw==
X-Forwarded-Encrypted: i=1; AKwUvBwc6T18HJTxIs9Ovhb/rcttwaLvLjBbKmeR2jDSUjLv5oyXsf7D1rU3VdQRGUDBTLw9li0UMg8qlTDU@vger.kernel.org
X-Gm-Message-State: APuU4Z8Z8gw3cgJWU2ax8LuihK9JBXsdFXvYH5bdO4xxcPRmwbr3GM9o
	N7f1mBxa1DS993ykbpNAeqEcTvXHAxi6MA5itbWaiYLFF6xAb7CwA55b
X-Gm-Gg: AYBFou0L3ZEPJ1uujEY+mK0irgpZhU+NHLPrh+Tsp1yEXTPv1WyPGcvPqhjgVQCO//v
	lJd73rgLG0cdrdN7VTPqs1CFAoiRse74kVcJqHjK3O0AbLD/OH/CGBYrKPT+lMxS334Q3Bqkfm2
	+XsYPAG08qVSjx4m0wP2ER62Eb9JH6Se23Oc1sIQ/C7rDVb1tlCTLk00XEDwQ7e+0qB4BwryQWD
	fBuuBCkainepm4P16ORbDG70G65lFSIDEgyR22BQJH3Q0niWXKPJkePjQDcnoPhW21tCbJIN1Vl
	NYWhTT7QG4GvTjW2yh966GLOrgYf3z5EogyHYSkeb/Oa47B6C0OrOgjnI9rfOfJg5mCTCPAh7sl
	YLUmtql8llRN4y4gavNkgAGh1r6Xik4UVX7JSkvsfgXAgGaIxNy3gmEaOsHkkCqLrSwY3UYMhi0
	i5Wy0d7AH+ePTGi2VWDkevMXJgt4HErqqaREfMe9ZQE1KMMIS+d1x7sMbsEnGmz4YB/R0/qSIgK
	Nt+AUhS1h6lP0buUPqsGj+LWVT61uzk71nu2S5lACPsK0bfQP99TB5EEqMGgsv34zkKmwTIL1ZG
	rne11nRFxS2IWcrA1NVf2u+0
X-Received: by 2002:a05:600c:871b:b0:4a1:e57b:667c with SMTP id 5b1f17b1804b1-4b6df5e87f8mr2566715e9.26.1793908517156;
        Thu, 05 Nov 2026 11:55:17 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b5725fb0d1sm83862895e9.8.2026.11.05.11.55.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 11:55:16 -0800 (PST)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Val Packett <val@packett.cool>,
	Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Fabien Parent <parent.f@gmail.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-input@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-gpio@vger.kernel.org
Subject: [PATCH v12 8/8] arm64: dts: mediatek: Add MediaTek MT6392 PMIC dtsi
Date: Thu,  5 Nov 2026 20:50:28 +0100
Message-ID: <20261105195206.3440-6-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261105195206.3440-1-l.scorcia@gmail.com>
References: <20261105195206.3440-1-l.scorcia@gmail.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Val Packett <val@packett.cool>

Add the dtsi to be included by all boards using the MT6392 PMIC,
providing support for regulator, keys, pinctrl and RTC.

Import the new file in the shared device tree for the Pumpkin boards and
declare the regulators that must be enabled at boot for proper operation.

Signed-off-by: Val Packett <val@packett.cool>
Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt6392.dtsi      | 145 ++++++++++++++++++
 .../boot/dts/mediatek/pumpkin-common.dtsi     |  82 ++++++++++
 2 files changed, 227 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt6392.dtsi

diff --git a/arch/arm64/boot/dts/mediatek/mt6392.dtsi b/arch/arm64/boot/dts/mediatek/mt6392.dtsi
new file mode 100644
index 000000000000..cc4770d70246
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt6392.dtsi
@@ -0,0 +1,145 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2019 MediaTek Inc.
+ * Copyright (c) 2024 Val Packett <val@packett.cool>
+ * Copyright (c) 2026 Luca Leonardo Scorcia <l.scorcia@gmail.com>
+ */
+
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/regulator/mediatek,mt6392-regulator.h>
+
+&pwrap {
+	pmic: pmic {
+		compatible = "mediatek,mt6392";
+		interrupt-controller;
+		#interrupt-cells = <2>;
+
+		mt6392keys: keys {
+			compatible = "mediatek,mt6392-keys";
+
+			key-power {
+				linux,keycodes = <KEY_POWER>;
+				wakeup-source;
+			};
+
+			key-home {
+				linux,keycodes = <KEY_HOME>;
+				wakeup-source;
+			};
+		};
+
+		mt6392pio: pinctrl {
+			compatible = "mediatek,mt6392-pinctrl";
+
+			gpio-controller;
+			#gpio-cells = <2>;
+		};
+
+		mt6392regulators: regulators {
+			compatible = "mediatek,mt6392-regulator";
+
+			/* Fixed supply defined in the data sheet */
+			avddldo-supply = <&mt6392_vsys_reg>;
+
+			mt6392_vcore_reg: vcore {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_BUCK_MODE_FORCE_PWM>;
+			};
+			mt6392_vproc_reg: vproc {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_BUCK_MODE_FORCE_PWM>;
+			};
+			mt6392_vsys_reg: vsys {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_BUCK_MODE_FORCE_PWM>;
+			};
+			mt6392_vaud28_reg: vaud28 {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_LDO_MODE_LP>;
+			};
+			mt6392_vxo22_reg: vxo22 {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_LDO_MODE_LP>;
+			};
+			mt6392_vaud22_reg: vaud22 {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_LDO_MODE_LP>;
+			};
+			mt6392_vadc18_reg: vadc18 {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_LDO_MODE_LP>;
+			};
+			mt6392_vcama_reg: vcama { };
+			mt6392_vcn35_reg: vcn35 {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_LDO_MODE_LP>;
+			};
+			mt6392_vio28_reg: vio28 {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_LDO_MODE_LP>;
+			};
+			mt6392_vusb_reg: vusb {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_LDO_MODE_LP>;
+			};
+			mt6392_vmc_reg: vmc {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_LDO_MODE_LP>;
+			};
+			mt6392_vmch_reg: vmch {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_LDO_MODE_LP>;
+			};
+			mt6392_vemc3v3_reg: vemc3v3 {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_LDO_MODE_LP>;
+			};
+			mt6392_vcamaf_reg: vcamaf {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_LDO_MODE_LP>;
+			};
+			mt6392_vgp1_reg: vgp1 {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_LDO_MODE_LP>;
+			};
+			mt6392_vgp2_reg: vgp2 {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_LDO_MODE_LP>;
+			};
+			mt6392_vefuse_reg: vefuse {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_LDO_MODE_LP>;
+			};
+			mt6392_vm25_reg: vm25 {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_LDO_MODE_LP>;
+			};
+			mt6392_vdig18_reg: vdig18 { };
+			mt6392_vm_reg: vm {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_LDO_MODE_LP>;
+			};
+			mt6392_vio18_reg: vio18 {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_LDO_MODE_LP>;
+			};
+			mt6392_vcn18_reg: vcn18 {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_LDO_MODE_LP>;
+			};
+			mt6392_vcamd_reg: vcamd {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_LDO_MODE_LP>;
+			};
+			mt6392_vcamio_reg: vcamio {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_LDO_MODE_LP>;
+			};
+			mt6392_vrtc_reg: vrtc { };
+		};
+
+		mt6392rtc: rtc {
+			compatible = "mediatek,mt6392-rtc", "mediatek,mt6323-rtc";
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi b/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi
index 805fb82138a8..c6af3def4a29 100644
--- a/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi
+++ b/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi
@@ -6,6 +6,8 @@
 
 #include <dt-bindings/gpio/gpio.h>
 
+#include "mt6392.dtsi"
+
 / {
 	aliases {
 		serial0 = &uart0;
@@ -160,6 +162,11 @@ &i2c2 {
 	status = "okay";
 };
 
+&pmic {
+	interrupt-parent = <&pio>;
+	interrupts = <28 IRQ_TYPE_LEVEL_HIGH>;
+};
+
 &uart0 {
 	status = "okay";
 };
@@ -251,3 +258,78 @@ pins-eth {
 		};
 	};
 };
+
+&mt6392_vcore_reg {
+	regulator-min-microvolt = <700000>;
+	regulator-max-microvolt = <1350000>;
+	regulator-always-on;
+	regulator-boot-on;
+};
+
+&mt6392_vproc_reg {
+	regulator-min-microvolt = <700000>;
+	regulator-max-microvolt = <1350000>;
+	regulator-always-on;
+	regulator-boot-on;
+};
+
+&mt6392_vsys_reg {
+	regulator-min-microvolt = <1400000>;
+	regulator-max-microvolt = <2987500>;
+	regulator-always-on;
+	regulator-boot-on;
+};
+
+&mt6392_vxo22_reg {
+	regulator-always-on;
+	regulator-boot-on;
+};
+
+&mt6392_vaud22_reg {
+	regulator-min-microvolt = <1800000>;
+	regulator-max-microvolt = <2200000>;
+	regulator-always-on;
+	regulator-boot-on;
+};
+
+&mt6392_vaud28_reg {
+	regulator-always-on;
+	regulator-boot-on;
+};
+
+&mt6392_vadc18_reg {
+	regulator-always-on;
+	regulator-boot-on;
+};
+
+&mt6392_vio28_reg {
+	regulator-always-on;
+	regulator-boot-on;
+};
+
+&mt6392_vusb_reg {
+	regulator-always-on;
+	regulator-boot-on;
+};
+
+&mt6392_vmc_reg {
+	regulator-boot-on;
+};
+
+&mt6392_vmch_reg {
+	regulator-boot-on;
+};
+
+&mt6392_vemc3v3_reg {
+	regulator-boot-on;
+};
+
+&mt6392_vm_reg {
+	regulator-always-on;
+	regulator-boot-on;
+};
+
+&mt6392_vio18_reg {
+	regulator-always-on;
+	regulator-boot-on;
+};
-- 
2.43.0

