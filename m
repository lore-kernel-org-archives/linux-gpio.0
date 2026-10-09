Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 133062D7D47;
	Fri,  9 Oct 2026 20:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791578741; cv=none; b=gR5n7M3Ym1vVcvovyBIgIl7SC/17hYdoFuVouou60l2tFxzOIq3/yfQe2T9z+/rFKiC+bQKd4tb0vzKKm0DhE70TJhgDfc/u26E3LhFeX+gv06SzMz9ipOPJK03I94HqN33En30sGmPlBwS2BiEwf4/G/zz2Tckll7I8z+yWXXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791578741; c=relaxed/simple;
	bh=8Dh3/kTrrUzopsVDi24w70drLr5YK5nQYk6yCKgYsfU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K4HGqCRkjloNFXIgAPiMygGbjC1TC1/33LItHc+JUGY+dVZWsNGNPMEh8pwIvwtcAGzqYo5hsUC//crPeMsAZBQPNg/l5g0UYsiCgcmhbmPZupiIlzE+2xwbz782LLetXViLB6pgbY3OiOkfAq0sHIGR2H2aHxGr32roMEWkwzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BCN84LD4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BCN84LD4"
Received: by smtp.kernel.org (Postfix) with ESMTPS id BB838C2BCF5;
	Fri,  9 Oct 2026 20:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791578740;
	bh=8Dh3/kTrrUzopsVDi24w70drLr5YK5nQYk6yCKgYsfU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=BCN84LD4RVj0r5m99SObb1+WkeSuEGZdqnyaUvbgXbsN8ZqxxO6pGDqI38JcmfB5Y
	 d8FOOZleAja8EpKiJelsOmyYsVFjVcqwHtVul32XSjxBpsjkH6+PlNnPNiPAqqwz9Y
	 Ghh5m2f/EsAPhme8GhRmQgUL1NBRSbqDAmAH5683JxudOT5kkltap9h3DS45yKDDLk
	 xcQ1hjqWcPiJtuFB4mJFbU2/wiZkL65ZWeIAgJ/KfvINu0TUF61HuXX6/YkwvuV5T5
	 qIFrGFtaoX3KwEHxkXdSqS7c962LGJHfPCGel+rm7sar+WLdX8jUaPpbRO5azDGg5g
	 HV3Hu/hn6OUmA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B40FCA9EBE;
	Fri,  9 Oct 2026 20:45:40 +0000 (UTC)
From: Igor Velkov via B4 Relay <devnull+iav.iav.lv@kernel.org>
Date: Fri, 09 Oct 2026 20:45:37 +0000
Subject: [PATCH 2/2] arm64: dts: rockchip: Add the GPIO expander to Kobol
 Helios64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-helios64-pca9655-v1-2-673ee4432650@iav.lv>
References: <20261009-helios64-pca9655-v1-0-673ee4432650@iav.lv>
In-Reply-To: <20261009-helios64-pca9655-v1-0-673ee4432650@iav.lv>
To: Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Rosen Penev <rosenp@gmail.com>, 
 Gregory Clement <gregory.clement@bootlin.com>, Andrew Lunn <andrew@lunn.ch>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Igor Velkov <iav@iav.lv>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1651; i=iav@iav.lv;
 h=from:subject:message-id;
 bh=yiECMN73jBgrYRCL1OT9sV1tguqxvNtakL0UezggRNg=;
 b=owGbwMvMwCVmNH1q96v4SmbG02pJDFkng4rNuqN2vtj0ip27NpNHZpv0rKlJs64mMa2QvXl+q
 dAE7qMGHaUsDGJcDLJiiiwTDmncylhy9a+/h/kDmDmsTCBDGLg4BWAibSaMDB8UfsZ80Ghxj1V3
 j0l50nfjx1yJtQv5Z2qIfu7MsqoKr2JkOBLnInwscmvL1C2p98trnmfur1ZdE6xwMf91R1Xtm2d
 u/AA=
X-Developer-Key: i=iav@iav.lv; a=openpgp;
 fpr=90C228DA68A4D5FD4F4837E03297958BEA5F7903
X-Endpoint-Received: by B4 Relay for iav@iav.lv/default with auth_id=1060
X-Original-From: Igor Velkov <iav@iav.lv>
Reply-To: iav@iav.lv

From: Igor Velkov <iav@iav.lv>

Helios64 has an ON Semiconductor PCA9655E 16-bit GPIO expander at 0x20
on I2C2, powered from VCC3V3_SYS_S3, with its lines on the P5 GPIO
header. Its INT# output goes to GPIO0_B1 with an external pull-up (R59
to 1V8_S3), so the pin has no internal bias. Schematic, sheet 34:
https://wiki.kobol.io/helios64/files/schematics/Helios64_Schematics_Rev1.2.pdf

Assisted-by: LLM
Signed-off-by: Igor Velkov <iav@iav.lv>
---
 .../boot/dts/rockchip/rk3399-kobol-helios64.dts      | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts b/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts
index d146e5075b4f..a860bd2b3afc 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts
@@ -453,6 +453,20 @@ &i2c2 {
 	i2c-scl-falling-time-ns = <30>;
 	status = "okay";
 
+	gpio@20 {
+		compatible = "onnn,pca9655", "nxp,pca9555";
+		reg = <0x20>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&gpio0>;
+		interrupts = <RK_PB1 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&exp16_int_l>;
+		vcc-supply = <&vcc3v3_sys_s3>;
+	};
+
 	temp@4c {
 		compatible = "national,lm75";
 		reg = <0x4c>;
@@ -493,6 +507,12 @@ user1_btn: user1-btn {
 		};
 	};
 
+	expander {
+		exp16_int_l: exp16-int-l {
+			rockchip,pins = <0 RK_PB1 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	gmac {
 		gphy_reset: gphy-reset {
 			rockchip,pins = <3 RK_PB7 RK_FUNC_GPIO &pcfg_output_low>;

-- 
2.43.0


