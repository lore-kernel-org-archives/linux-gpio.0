Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F6E477E33;
	Thu,  2 Jul 2026 09:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782982926; cv=none; b=dLtOpVFHd8oE+gtKcHbogZnyATuhF9HemanYb9UpxrkRMIzz3YzZt9MO7hS4zRMI7BMrUqf+2aSCkMDd1PxXSpTjSL2VuPLqoG3XqsCRoklk4FlHSobQ9HdzkWW5f83qdpgLhXp4aXrZ1f4+Tf3koVx+tj6kjDNGu4CkHaTX7Wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782982926; c=relaxed/simple;
	bh=BQIcBSKLVzYmjAIdt2TMKG87dicoa2mn5W/fMgxsnGw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GKpgQ2zEvT3fFZCx4c+K1+Qfz+MAN9A/WdPWL0mJsgW3ApPd7Yy5e4q3ryG3bhzJcoGUE9p1kuxt6lM44s2FONL1zLY+9rs1T1M4Rt/l/MM+ZVQgm8um4nlto+r3xSFIhU31tpoYIMYpToGtFZLsw+/Y/8RKP1Ezw56Ws65HqpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=fxS/b4IN; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="fxS/b4IN"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 66291H5x81817137, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1782982877; bh=Eds8QyswXTlnDrDvsr5ORmWya8hWpTklhuTq3QsQfaw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=fxS/b4INAH2nnnozIW5X7tzrnaI10a28ehO/n0+GSFPAdUQOCSqbiINIAxGB9fx8L
	 TSjaLEfudTznogRVqd7fCo6ts7PWiJB4yW1PsBVnLJfroxMqI3eSyINluO/xVCFway
	 qokbXY2qD6+gzMXnyFB6tKi/ur55FVQ5vAxLIxCPBI+Th2f6u7cUI1/7KzkpG6cgIb
	 837QgjMj0tDl1vy8negcK2VroeEBgh4SPAkNJ45TWtZKdHu1o4u0Vr3ZbcQh8MHNSX
	 vd9tdBQjNza6ebcOrCZQw78IaW3Y6WsK55/mQ+RNhYP+5zqhe0Z3Emy8WOmbs43QJo
	 duivLdDRbhiwQ==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 66291H5x81817137
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 2 Jul 2026 17:01:17 +0800
Received: from RTKEXHMBS03.realtek.com.tw (10.21.1.53) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 2 Jul 2026 17:01:17 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS03.realtek.com.tw
 (10.21.1.53) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 2 Jul 2026 17:01:17 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <linusw@kernel.org>, <brgl@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <afaerber@suse.com>,
	<mwalle@kernel.org>, <andriy.shevchenko@intel.com>, <tychang@realtek.com>
CC: <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-realtek-soc@lists.infradead.org>, <cy.huang@realtek.com>,
	<stanley_chang@realtek.com>, <eleanor.lin@realtek.com>,
	<james.tai@realtek.com>, Bartosz Golaszewski
	<bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v5 4/4] arm64: dts: realtek: Add GPIO support for RTD1625
Date: Thu, 2 Jul 2026 17:01:15 +0800
Message-ID: <20260702090115.2564318-5-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260702090115.2564318-1-eleanor.lin@realtek.com>
References: <20260702090115.2564318-1-eleanor.lin@realtek.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Add the GPIO node for the Realtek RTD1625 SoC.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
Changes in v5:
- None.
---
 arch/arm64/boot/dts/realtek/kent.dtsi | 39 +++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/arm64/boot/dts/realtek/kent.dtsi b/arch/arm64/boot/dts/realtek/kent.dtsi
index 8d4293cd4c03..228b82dfdb7a 100644
--- a/arch/arm64/boot/dts/realtek/kent.dtsi
+++ b/arch/arm64/boot/dts/realtek/kent.dtsi
@@ -151,6 +151,37 @@ uart0: serial@7800 {
 				status = "disabled";
 			};
 
+			gpio: gpio@31000 {
+				compatible = "realtek,rtd1625-iso-gpio";
+				reg = <0x31000 0x398>;
+				gpio-controller;
+				gpio-ranges = <&isom_pinctrl 0 0 2>,
+					      <&ve4_pinctrl 2 0 6>,
+					      <&iso_pinctrl 8 0 4>,
+					      <&ve4_pinctrl 12 6 2>,
+					      <&main2_pinctrl 14 0 2>,
+					      <&ve4_pinctrl 16 8 4>,
+					      <&main2_pinctrl 20 2 3>,
+					      <&ve4_pinctrl 23 12 3>,
+					      <&iso_pinctrl 26 4 2>,
+					      <&isom_pinctrl 28 2 2>,
+					      <&ve4_pinctrl 30 15 6>,
+					      <&main2_pinctrl 36 5 6>,
+					      <&ve4_pinctrl 42 21 3>,
+					      <&iso_pinctrl 45 6 6>,
+					      <&ve4_pinctrl 51 24 1>,
+					      <&iso_pinctrl 52 12 1>,
+					      <&ve4_pinctrl 53 25 11>,
+					      <&main2_pinctrl 64 11 28>,
+					      <&ve4_pinctrl 92 36 2>,
+					      <&iso_pinctrl 94 13 19>,
+					      <&iso_pinctrl 128 32 4>,
+					      <&ve4_pinctrl 132 38 13>,
+					      <&iso_pinctrl 145 36 19>,
+					      <&ve4_pinctrl 164 51 2>;
+				#gpio-cells = <2>;
+			};
+
 			iso_pinctrl: pinctrl@4e000 {
 				compatible = "realtek,rtd1625-iso-pinctrl";
 				reg = <0x4e000 0x1a4>;
@@ -161,6 +192,14 @@ main2_pinctrl: pinctrl@4f200 {
 				reg = <0x4f200 0x50>;
 			};
 
+			iso_m_gpio: gpio@89100 {
+				compatible = "realtek,rtd1625-isom-gpio";
+				reg = <0x89100 0x30>;
+				gpio-controller;
+				gpio-ranges = <&isom_pinctrl 0 0 4>;
+				#gpio-cells = <2>;
+			};
+
 			isom_pinctrl: pinctrl@146200 {
 				compatible = "realtek,rtd1625-isom-pinctrl";
 				reg = <0x146200 0x34>;
-- 
2.43.0

