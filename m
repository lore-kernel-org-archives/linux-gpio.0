Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59CDE30567F
	for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2026 07:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781508049; cv=none; b=PbU0s3CakGA0HZEEGOau1jrp1EnGqwu7bft6xPG69iraN7g1zKxpW6oQrmdqmGxmhYFHvPsEe1/+7MMFata+lAROMJvL3wpKyX8FQ312HKJCfx6eM6Y8b+lCVaG9bBYnXr+LrMCZbqziVxK18a8XxsZ1qSF+Zd0Nl7hOmbtkpAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781508049; c=relaxed/simple;
	bh=kGmpVfTZ832WuX3ZqwMNMjsCMUl5EXCJ/u5hwQq9Xe0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IjxPH1wOy3LBowhHAm7WRGfzFx8gKBpLTQ40HzQQ99pA5XYOxFtlj67p8iv2dHYi2J6mOGrcK72M9pu7wqyvEiTWI/j/gQC8hqYzPv/zjQKoJgcg1QZxLoMUBt4SUKqpjzDnSwoHayyJ1HzNdoyruGvpQaSGuWexX+OBmQVbMOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F20N/0hE; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F20N/0hE"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-490b1bbcf3aso22007445e9.1
        for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2026 00:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781508047; x=1782112847; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XxNDmIjOo02FnryXUeGSfIeICYAKAZhZUNgYnH1QQ5E=;
        b=F20N/0hEdBTpEiOYTkOOfZiDiJchVwr7kHHw8JB1VM5/Zo9tbonake9uZAWDFbWG0E
         8ksnaFM8Nyc1jrmwL+2HvGSBPxb1+jM9s2s7nUUMWSv3qOroCRqdJ64XPeUxM985tCV5
         cIH08uZX492/9jZo2XS5OSAzDV+VJ1HeM5K08aWKAbyIUL3YffHNCXga5KVN/95aU0vt
         W+yHltUtEUk8syozPWpkFWrbJsznwSWSyQ3utpfOVMU/87tqfR88+ckWuCtQYhcYRdfc
         ZS/YeQ6Dse+XWfZPlptJT/dOrbs5d/h8xppgE+wbaNYiEXErlQabiw7qQgbVj3Pz/ev7
         DwBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781508047; x=1782112847;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XxNDmIjOo02FnryXUeGSfIeICYAKAZhZUNgYnH1QQ5E=;
        b=CLhpFK8Hav/9NnzsYpVyaqF9D/w4Pvvyed8GrbU+vuxebOUYQx2g0OAXc9DGDW2ING
         jv8+alg4Mve/Cxf3DQmM7oxGhTwuLbksqTKr+hZ3rs9qED/RvCvyPbYpvbL7Bkf7SvSO
         tCwDRSHZzwXJ7OcpJ/yW7LPHaEemleazm408AqjxJchggVAtQNEpYuxajhNeFz36LBag
         yWrfeOxHEPjRi15/jEEgGsjysu8wy8GJymFZrZyM5sJ549J+qAnVSvyuXHdG96u6mbYk
         /Cubj9xmtHfoFZrgautBtd+wPimm6KQ0Rmv4IN2d1Jzl29fOKKgC1nDuNS2Jf5mGkbmA
         CVjw==
X-Forwarded-Encrypted: i=1; AFNElJ88xHqVTYAtpdQgsd9FWko2hHdYIqRmZBS1EnEQa6Na+hm295klxHbTJZ+bk+ILxx9KSEcpoVy8X2qT@vger.kernel.org
X-Gm-Message-State: AOJu0YzUnKd5+n8yC3ow6ZxBbJ5Ev2DCZr704Uq0ztrWV3AD26rC/HfG
	7VlEMf7m48Iy21CQphm42rZJHJBPdjmDMhxldMa5ohheYxsKmNRabR+E
X-Gm-Gg: Acq92OEAfbtX7pZHPmT3pni8i6SfSPqzYIb3RZtlpD9cd3Ub6IBX0h6VBByUwHGxZEM
	TmMKhEP88DMRbX73grBv15kSiIElgiBvflXqrQFaU3t7+rQ7ooICNGkigMheiuZ3bjpH1RTbKsl
	PAP6MmnFS7vyl4Hn0P+Mp43zDUP4DPrqLY7I7yMf5fIvNACsRFLqTppKrlJ/kIzE82etaYdZjUP
	xVYoHBGZs0eH2puKkI/Y+rNputv6DWdBoPsIFG0X6YOP1f+VEUdfeqsWSx4/HGQh0+StS+smPa4
	enybnF2QLF1M9OKwgF0Lz/iz8is27qvnrGDDnigh/RPeRrEI2r+6X57o4KtrH5c5UdOuL73B7+g
	yl7SqfdBlscsTKEqHV0BkJ/ygNnSPP+bRk55fZjRBR8JTZpWEajNINht0dizEkE8i7Z2b05N0al
	r4fBBYcPne5LQXXirP
X-Received: by 2002:a05:600c:138e:b0:490:d354:bd00 with SMTP id 5b1f17b1804b1-490ec507db7mr173245075e9.25.1781508046667;
        Mon, 15 Jun 2026 00:20:46 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492203c0801sm200181015e9.10.2026.06.15.00.20.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 00:20:46 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Val Packett <val@packett.cool>,
	Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Julien Massot <julien.massot@collabora.com>,
	Fabien Parent <parent.f@gmail.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v7 9/9] arm64: dts: mediatek: Add MediaTek MT6392 PMIC dtsi
Date: Mon, 15 Jun 2026 09:16:15 +0200
Message-ID: <20260615071836.362883-10-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260615071836.362883-1-l.scorcia@gmail.com>
References: <20260615071836.362883-1-l.scorcia@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Val Packett <val@packett.cool>

Add the dts to be included by all boards using the MT6392 PMIC,
providing support for regulator, keys, pinctrl and RTC.

Signed-off-by: Val Packett <val@packett.cool>
Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 arch/arm64/boot/dts/mediatek/mt6392.dtsi | 75 ++++++++++++++++++++++++
 1 file changed, 75 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt6392.dtsi

diff --git a/arch/arm64/boot/dts/mediatek/mt6392.dtsi b/arch/arm64/boot/dts/mediatek/mt6392.dtsi
new file mode 100644
index 000000000000..81f15d76a05a
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt6392.dtsi
@@ -0,0 +1,75 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2019 MediaTek Inc.
+ * Copyright (c) 2024 Val Packett <val@packett.cool>
+ * Copyright (c) 2026 Luca Leonardo Scorcia <l.scorcia@gmail.com>
+ */
+
+#include <dt-bindings/input/input.h>
+
+&pwrap {
+	pmic: pmic {
+		compatible = "mediatek,mt6392", "mediatek,mt6323";
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
+		mt6392rtc: rtc {
+			compatible = "mediatek,mt6392-rtc", "mediatek,mt6323-rtc";
+		};
+
+		mt6392regulators: regulators {
+			compatible = "mediatek,mt6392-regulator";
+
+			/* Fixed supply defined in the data sheet */
+			avddldo-supply = <&mt6392_vsys_reg>;
+
+			mt6392_vcore_reg: vcore { };
+			mt6392_vproc_reg: vproc { };
+			mt6392_vsys_reg: vsys { };
+			mt6392_vaud28_reg: vaud28 { };
+			mt6392_vxo22_reg: vxo22 { };
+			mt6392_vaud22_reg: vaud22 { };
+			mt6392_vadc18_reg: vadc18 { };
+			mt6392_vcama_reg: vcama { };
+			mt6392_vcn35_reg: vcn35 { };
+			mt6392_vio28_reg: vio28 { };
+			mt6392_vusb_reg: vusb { };
+			mt6392_vmc_reg: vmc { };
+			mt6392_vmch_reg: vmch { };
+			mt6392_vemc3v3_reg: vemc3v3 { };
+			mt6392_vcamaf_reg: vcamaf { };
+			mt6392_vgp1_reg: vgp1 { };
+			mt6392_vgp2_reg: vgp2 { };
+			mt6392_vefuse_reg: vefuse { };
+			mt6392_vm25_reg: vm25 { };
+			mt6392_vdig18_reg: vdig18 { };
+			mt6392_vm_reg: vm { };
+			mt6392_vio18_reg: vio18 { };
+			mt6392_vcn18_reg: vcn18 { };
+			mt6392_vcamd_reg: vcamd { };
+			mt6392_vcamio_reg: vcamio { };
+			mt6392_vrtc_reg: vrtc {	};
+		};
+	};
+};
-- 
2.43.0

