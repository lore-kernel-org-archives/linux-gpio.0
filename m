Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792580079;
	b=JPxUrl2AVvmy7DCrnSAElsbgvqyQqDKUeFXeMBeqNrBwC88/iqKKQZY2R3Wy3fPtIwsj
	 CYQLjbkW736axGW4vviIZV+FDVDaYI3XJ93ei2ymy96jOzIfu8MTSVjkS7mHxwJ/OqxHI
	 GZVp7R7UEbQAXhrxa0suuxWavwh6xOwop8gokh2zRtGZm5yYdM1BnrTDzGGCD+q/rCTRz
	 igdP7g9VerGLYf/BI8MYN1BqY4FGH88zgizv3PXjN95VdEsB1OQuJfyDQ11l+/b2HPO2Z
	 PvZhDCcy+lGbPJ0N7FbCV9BaCYMDMVwHurLLu6tPgbp7ssq9mF5drYDtpp9Wd+exAgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792580079;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ocwe/ua5bx6fTunJTjbDvG/Rp4d0BH8Fbx4UwIDjj0c=;
	b=K6FBx5ugwANWDXhVj6MMoaGNhw5+Shl1nOwNWtVsE0xQaI2xJmgtBOP+mKbI+LYIrTj+
	 ER+87bSnkaRCa7xi4I/rbLsW72AUAwIuez+T86qSDMif6kj5WxmbRVXqVT/pj06eJ+FNf
	 KrhZviaYuilresnlcoqQEb2z09Ih/HZjoxPSxv1Bnzxpp13N3Y7CbYNah3ivvA7ahCoa5
	 3yg4iA8WQ8+Aoosc7UPshUIV9m0u9W0iEzeKjv5DudpxGUawQZN02Cm1ASISoEgXuLQhb
	 HnYxglpX4iHOF2wOg+oY6JfJoyjlD7tipKvlJg/5qvEzl0xRtPWak8p/cjwLAP7S/8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gfzKp+Jf;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E669B606A31F
	for <linux-gpio@vger.kernel.org>; Wed, 21 Oct 2026 10:54:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E669B606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gfzKp+Jf
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a1fe9efc0eso5400855e9.2
        for <linux-gpio@vger.kernel.org>; Wed, 21 Oct 2026 03:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792580077; x=1793184877; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ocwe/ua5bx6fTunJTjbDvG/Rp4d0BH8Fbx4UwIDjj0c=;
        b=gfzKp+Jfn9HGkFwZoxtkVcqi981cZV4VqtEWhYSXm2NmynKbW6dKPR3a8/uUURLl3R
         vI9yz435S7jU4KQiqljr3ZwskHWkkF13uJcpLJVER1WSrG9P8U8ig6w3yDiIuUP+jHfO
         oL3+ic7Trpf05BRLN4lJ861emswggMn3PXinsni5/T2RGhHmvDCiZSDqkpeNMxYkUQpF
         NSpIfWQdi5/agxBX9Is4/5s1mwYAvyy0J/t35aETrsEDr1nNpY5USkXyYW+HkqhUyza4
         GbUtDbYdCuOjga8YW9VFuP+srgb7925VYCsk8F/Zq0N0U06Euk0RMrrLi2slNppjlkDd
         Duaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792580077; x=1793184877;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ocwe/ua5bx6fTunJTjbDvG/Rp4d0BH8Fbx4UwIDjj0c=;
        b=2n21J3xj6vB6DNxtYzISYIIfbRdNOyBXA01B4CaMHqwhl/WVUr0NYh02hMbo3CPU4u
         YVdSybQwvqLZdOHWiMJ81VWI9vMAj473pd3qjlCWgFq/5jsG14S1tZqD83MrwSBNjsru
         WZIld+sAsqOXfJuk7gqIy2lY4VCinnATN7rzyHUB8vWX9naHc9DimdjNMChOxq3FnAXm
         WOu1mXRvGyEnJw3maDdXAkix41dwRVsdf4oOSl63lGg7IQekR7jcnv5OgA/VKnIg3KRi
         bWz+5sjaVfuN69D3O6JYIX0uYs9/Mm8bROtJqmNvhZwPAhTPLx197k8w9AY2qQ1mSzYV
         IWow==
X-Forwarded-Encrypted: i=1; AKwUvBxEFBJKFkPRVPD/u5UPUkFRU/65N3dhszth+djoeieheA4t8IyT4T5R5BI2YueRkpQ+lETiQBVKxEWh@vger.kernel.org
X-Gm-Message-State: AFq9FYJAmwkNwJNLAOKwWFytZaTz+/r+JIbaxmonOdhBRL44b+Mzb+yG
	94DvaBnx5MNlRhW/IV3V2XLstdjyrR77H4x+ivm9Lo/S5sLNJsG8wQge
X-Gm-Gg: AYBFou1DPqK7oDiMqThmWKKq8FNFiRojPUK7rN7OAfkbARQBhmbIf4ErvBzIwNnxtT5
	8tgwxrv4hz0+DMCKb/bfIWymloAiz42PMQDmdivrGo3Q3GkrgKjUuHQ4u3YwNqu5DNzKtnpeMhw
	0Uk8t8lLGbVvOpgpIRZHP9+YlZ7NXItX4k5A8pogvCkymNsZMdWq90iqxM6RWE+aTDaKiQNXgtd
	2i5+ybcUByV40RV2WZ7tuvX5utpb1BvkUInf562hhc4bHJ04IhiLUDtKklelv9h7WLnQ30Cc6OH
	obdOeip+c9dNupDmqG0PeG9mCrtywhLywNFCiRtzTaX19d/YoTQ/EjxGMuai2PVxO4FIwTnl+Eg
	rSX97qmSQ37q9idv8gzUa7iZMbO7rPoiae4gcc3W5wDHV3w+gTyr4Z/lWDKtRkxOYe5GnxbyqLE
	4l2rFkP3UVizkNRNPTTHpwzrDtNXny13XBOoJqkH6GSjifq3oT92CpAnQvklzS3ddYKAad8qtZP
	HlfK98lVC+TzJzN5xg71lWZn5d4WZ4pWxbtqEdVSv7pMwx66M0=
X-Received: by 2002:a05:600c:3488:b0:4a1:fa33:441a with SMTP id 5b1f17b1804b1-4a1fd8a0560mr37336685e9.2.1792580076920;
        Wed, 21 Oct 2026 03:54:36 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2d6e2dbsm153388305e9.13.2026.10.21.03.54.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 03:54:36 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Val Packett <val@packett.cool>,
	Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Fabien Parent <parent.f@gmail.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v11 9/9] arm64: dts: mediatek: Add MediaTek MT6392 PMIC dtsi
Date: Wed, 21 Oct 2026 12:47:27 +0200
Message-ID: <20261021105109.199886-10-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021105109.199886-1-l.scorcia@gmail.com>
References: <20261021105109.199886-1-l.scorcia@gmail.com>
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

Import the new file in the shared device tree for the Pumpkin boards.

Signed-off-by: Val Packett <val@packett.cool>
Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt6392.dtsi      | 145 ++++++++++++++++++
 .../boot/dts/mediatek/pumpkin-common.dtsi     |   7 +
 2 files changed, 152 insertions(+)
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
index 805fb82138a8..b19d5792bd89 100644
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
-- 
2.43.0

