Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17D2637FF62
	for <linux-gpio@vger.kernel.org>; Fri,  5 Jun 2026 01:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780621301; cv=none; b=dT2tjgtA+0HvDh/IL4P6u6b2Efq9f/VP3zqWu7bcvzqmhlQpRID7uNE6a2LJBOd302dFPVyIGIqCDm2Yhfa/m1QYjMLc8AUTvdAt2BMzlccwaTafJ3Z52A586Htos7OBYh9czvH8jq9/rT6+DimSDVvrlyUux+PM30qvKAybPp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780621301; c=relaxed/simple;
	bh=bNdzZCp4H4EqUayBYK6F7gzfqkb9PzdmXuPOgMv/cjA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K7IZpdEbxeWoQtLfDXoihzQ/D3mx4jLOD9dgVL+LNUqK0k3Hxy3C4r0W8QC1RixdHrW87WAh+Rl+Ga9uFKlzuJ5NoZeObKPdOwbdafgnKVjA+rPTUATcXdNLkJStYO0p56Woev/GO8PTD1g7L7VQCX/U6+xRc9/r14pyw9N98JM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=FbyFCMbr; arc=none smtp.client-ip=209.85.167.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="FbyFCMbr"
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-4863cd278d7so882606b6e.1
        for <linux-gpio@vger.kernel.org>; Thu, 04 Jun 2026 18:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1780621272; x=1781226072; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=47bS3KYOz0HXJEWz/g//BdjKiICUn63lin6d0JHBcp8=;
        b=FbyFCMbrcdE33xYJfmSU0PdE/SwPh+C7CaeDFSXmLHoGc25fvOSL4JI0qHenNYnf+k
         RRnnw+KIZtMIaM3kKgm/ILskMrxxGQGJX0frZo3QxRIsAJndGKv0Ocuurx04t7Ses7ar
         5Qud2JgujPHybNuEWD2VL3yqCFzH/1sn4UGEL+6qygiLMpoRT+AqCpNPFyhtB3Dwqfa1
         eM/NFqVhK59r1l8pFBlscaGBm0IX2TUoPxKbI+tjjmqlfwG1pPGJVeTqya0KOBhffoWn
         wUGvKOfLVEu3FkkQ4pyt8mazPQfXc0FYEDw6PHsOR6l08EF9VFwFznFjsvNyivu4qgVG
         UoOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780621272; x=1781226072;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=47bS3KYOz0HXJEWz/g//BdjKiICUn63lin6d0JHBcp8=;
        b=TtoHsDMdnZLcLecCwQRYwfdBKjBoqna0VSw5Q4Pi4GN9hs5fc6THIHPu9kUloqE3o2
         /YsrF6KgL48EthtA0+kWU+JTg/Gc6b0IcuiEB9KqkNV0j8pAZaSOArWZvRCx7y8GKdw0
         wKbouD61g+8FIA/XKbrWRBeyOR2G5yKa2YHyopC2yp67aBNTlAq+5PoyF3oTobywa/ob
         p/mVAAYzD6FZ9O/Ht0VMHeWUkSLCl/UHqNU6t7SuxO4Hsbf+DoDR7P7biWafABBXnpaW
         t5F0tqdVjM82xE6t3uBVpENLaS7kNOBPhCzFmtDPHStz691Qs05XMuWeqmBXWctAausP
         EBqw==
X-Forwarded-Encrypted: i=1; AFNElJ/J6FV53ZWfKgfoa8+0Rwt+p/sxUQJiDII83Qabq1YyNKxCqTmk+/czfeKbfmrTZKp3IcCkMVnePQNb@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8kHdLDv2TEt8fW3IzCosZohamoO42qZd84OamKkaEzERMM0vV
	ZV2ufsrhU/5aNMfN8d0+eF3nuHKcHT7fFqzkV0kIxw1enBlmN8mwbYAahXPwM8CSAk4=
X-Gm-Gg: Acq92OHeLw9HtABj5B0YjmXGEC00hSPbU4MxtwrQgmu6BHSebfADJaxSKDU7aXW8OGH
	9djq/W6LVObMZQOzWij+R5XmRiMyp+4MESABIJS2Pu1mOtKV5lPX9/uLlKqNfTGYjownCwPv8ET
	IyNrAwqKr9XdOExHSCJM3tzdmIJRxjASTw/S0P0Wlp8dg1aFtZGoJ6yn9jUqEBmay53K6yRLMhE
	4eOg29zQ1PF9s/tDna2GvWmDoKmAxXELm3MGJOquqS1aWYO58GyggMGUzDVDDMJT7ylJERgESNX
	rWvJsuUppoqSc8hy9+c3h4Qrp7RyI4jY7Yo+k6+7wlX9pdYgh0WR3xklOjiIudA+gVkdKC7hYyU
	1klg4TFrn+K97L0vd8/EpM8+K4IJHStR6xOv7ZuJENvrGywRkqElfHae6wWjCqux6LVJ9I3WFDT
	LpZuAI+FGj8UEUd2iCulPPskZwVqd2+hX91fa+JA==
X-Received: by 2002:a05:6808:1804:b0:467:27d2:96a7 with SMTP id 5614622812f47-4868dd0463amr865195b6e.15.1780621271933;
        Thu, 04 Jun 2026 18:01:11 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4865b6ec694sm5544631b6e.5.2026.06.04.18.01.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 18:01:11 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	maxime.chevallier@bootlin.com,
	rmk+kernel@armlinux.org.uk,
	andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linusw@kernel.org,
	brgl@kernel.org,
	arnd@arndb.de,
	gregkh@linuxfoundation.org
Cc: Daniel Thompson <daniel@riscstar.com>,
	elder@riscstar.com,
	mohd.anwar@oss.qualcomm.com,
	a0987203069@gmail.com,
	alexandre.torgue@foss.st.com,
	ast@kernel.org,
	boon.khai.ng@altera.com,
	chenchuangyu@xiaomi.com,
	chenhuacai@kernel.org,
	daniel@iogearbox.net,
	hawk@kernel.org,
	hkallweit1@gmail.com,
	inochiama@gmail.com,
	john.fastabend@gmail.com,
	julianbraha@gmail.com,
	livelycarpet87@gmail.com,
	mcoquelin.stm32@gmail.com,
	me@ziyao.cc,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	richardcochran@gmail.com,
	rohan.g.thomas@altera.com,
	sdf@fomichev.me,
	siyanteng@cqsoftware.com.cn,
	weishangjuan@eswincomputing.com,
	wens@kernel.org,
	netdev@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2 14/14] arm64: dts: qcom: qcs6490-rb3gen2: enable TC9564 with a single QCA8081 phy
Date: Thu,  4 Jun 2026 20:00:21 -0500
Message-ID: <20260605010022.968612-15-elder@riscstar.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260605010022.968612-1-elder@riscstar.com>
References: <20260605010022.968612-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Daniel Thompson <daniel@riscstar.com>

The QCS6490 RB3Gen2 includes a Toshiba TC9564 (a.k.a. Qualcomm QPS615).
TC9564 is an twin Ethernet-AVB/TSN bridge with an integrated PCIe switch.

Downstream PCIe switch port 3 has an embedded PCIe endpoint, which
includes two functions.  The GPIO controller embedded within the
TC9564 is accessed via memory-mapped I/O through the first PCIe
function's BAR4.

Both embedded PCIe functions have an attached Synopsys XGMAC, but
not all RB3gen2 builds include PHYs on both ports.  All versions
include a TC9564 combined with a single QCA8081 attached to eMAC1.

Add properties to the existing PCI nodes to describe how the TC9564 and
QCA8081 are connected to each other (and to the host SoC).

Signed-off-by: Daniel Thompson <daniel@riscstar.com>
Co-developed-by: Alex Elder <elder@riscstar.com>
Signed-off-by: Alex Elder <elder@riscstar.com>
---
Checkpatch notes:
  - pci1179 is not a recognized vendor ID
  - Some lines are longer than recommented

 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 48 ++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index e393ccf1884af..1d83b07360a33 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -308,6 +308,15 @@ vdd_ntn_1p8: regulator-vdd-ntn-1p8 {
 		regulator-enable-ramp-delay = <10000>;
 	};
 
+	qep_1p8: regulator-qep-1p8 {
+		compatible = "regulator-fixed";
+		regulator-name = "qep_1p8";
+		gpio = <&pm7325_gpios 8 GPIO_ACTIVE_HIGH>;
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		enable-active-high;
+	};
+
 	wcn6750-pmu {
 		compatible = "qcom,wcn6750-pmu";
 		pinctrl-0 = <&bt_en>;
@@ -938,19 +947,51 @@ pcie@3,0 {
 			bus-range = <0x5 0xff>;
 
 			pci@0,0 {
+				compatible = "pci1179,0220";
 				reg = <0x50000 0x0 0x0 0x0 0x0>;
 				#address-cells = <3>;
 				#size-cells = <2>;
 				device_type = "pci";
 				ranges;
+
+				tc9564_gpio0: gpio {
+					gpio-controller;
+					#gpio-cells = <2>;
+				};
 			};
 
 			pci@0,1 {
+				compatible = "pci1179,0220";
 				reg = <0x50100 0x0 0x0 0x0 0x0>;
 				#address-cells = <3>;
 				#size-cells = <2>;
 				device_type = "pci";
 				ranges;
+
+				ethernet {
+					phy-mode = "sgmii";
+					phy-handle = <&tc9564_emac1_phy>;
+
+					mdio {
+						compatible = "snps,dwmac-mdio";
+						#address-cells = <1>;
+						#size-cells = <0>;
+
+						tc9564_emac1_phy: ethernet-phy@1c {
+							compatible = "ethernet-phy-id004d.d101";
+							reg = <0x1c>;
+							snps,reset = <&tc9564_gpio0 1 GPIO_ACTIVE_LOW>;
+							reset-assert-us = <11000>;
+							reset-deassert-us = <70000>;
+
+							vdd18-supply = <&qep_1p8>;
+
+							pinctrl-names = "default";
+							pinctrl-0 = <&qep_irq_pin>;
+							interrupts-extended = <&tlmm 101 IRQ_TYPE_LEVEL_LOW>;
+						};
+					};
+				};
 			};
 		};
 	};
@@ -1524,6 +1565,13 @@ usb_hub_reset_state: usb-hub-reset-state {
 		drive-strength = <2>;
 		bias-disable;
 	};
+
+	qep_irq_pin: qep-irq-state {
+		pins = "gpio101";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
 };
 
 &lpass_audiocc {
-- 
2.51.0

