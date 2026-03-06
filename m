Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90642378D8B;
	Fri,  6 Mar 2026 07:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772783732; cv=none; b=u+SSbu28fjETLIN97LTC2SeiYahEXUsE6N79DBn8P3bc1bQOiuxs4JDsfBlxtG68Fq81ocKeLEv/aHl2caVCuB2r0Uy3FnpE25QmOJlPgLjGmu0JUE16Oe3t4+BhJ/CGyLKO0cWPCtGEd+T6EmrrTXJz8IBmk2rRXDXMEzL9JEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772783732; c=relaxed/simple;
	bh=fOJ5uzakIs3h+hUG4tt3tStOZoAYmn90iGrSafMTcXY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Hqg/KSFPv474npIubR+gGXVYP+b5BKlwEv3spOMTH/mPLpZLgXECYu3Ped7DGsNdATfeiGUPs7uNhRA0Z+4fA9X1pMr62AdPUeq2+j4K7FMtf8XHa94RrM/K6JFCJvaINJwru9uQKT07AHaEyBtVm6X9Yn13QsNZmce0aibVLds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=VOqvE78s; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="VOqvE78s"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6267qp3gB2977175, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1772783571; bh=UX38X/TMKiyHQPxwjnR2AzsYEQMHir2CvQcMkoM7b+4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=VOqvE78sgvIDcl7zxLGSTJIX48Sfbmv9hLVRu8krchdks9SdiFnwvZU7kin0pHQgp
	 A1gzQYgoDw7QZSl4aiIGBOhzi5GAquC+09ePfLGbxGeT1FNvpQhGHkQn+C5uVHnsLj
	 DtXV1kOFkkmx605opuxDTHlKRjcAda456htFfWsglH7RLP2EV19fwOD9zuln4YFiRa
	 v3ovq7lSIkPtMUD/V/qSezVaOcfU0XNIrSBe9aruBZ9c25mFLNWWE8xPYegdSVnkEA
	 nN/mjCKCQC7cw771soOwhHPkBzobAyDKqIHvInhldvRRGdTq9tV5ebejeKF21mM6EX
	 owXrfpS84NTaw==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.21/5.94) with ESMTPS id 6267qp3gB2977175
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 6 Mar 2026 15:52:51 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Fri, 6 Mar 2026 15:52:50 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS06.realtek.com.tw
 (10.21.1.56) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Fri, 6 Mar 2026 15:52:50 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <linusw@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <bartosz.golaszewski@oss.qualcomm.com>,
        <afaerber@suse.com>
CC: <james.tai@realtek.com>, <cy.huang@realtek.com>,
        <stanley_chang@realtek.com>, <eleanor.lin@realtek.com>,
        <tychang@realtek.com>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-realtek-soc@lists.infradead.org>
Subject: [PATCH v2 14/14] arm64: dts: realtek: Add pinctrl support for RTD1625
Date: Fri, 6 Mar 2026 15:52:44 +0800
Message-ID: <20260306075244.1170399-15-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260306075244.1170399-1-eleanor.lin@realtek.com>
References: <20260306075244.1170399-1-eleanor.lin@realtek.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Tzuyi Chang <tychang@realtek.com>

Add the pinctrl nodes for the Realtek RTD1625 SoC.

Signed-off-by: Tzuyi Chang <tychang@realtek.com>
Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
 arch/arm64/boot/dts/realtek/kent.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/realtek/kent.dtsi b/arch/arm64/boot/dts/realtek/kent.dtsi
index ae006ce24420..8d4293cd4c03 100644
--- a/arch/arm64/boot/dts/realtek/kent.dtsi
+++ b/arch/arm64/boot/dts/realtek/kent.dtsi
@@ -150,6 +150,26 @@ uart0: serial@7800 {
 				reg-shift = <2>;
 				status = "disabled";
 			};
+
+			iso_pinctrl: pinctrl@4e000 {
+				compatible = "realtek,rtd1625-iso-pinctrl";
+				reg = <0x4e000 0x1a4>;
+			};
+
+			main2_pinctrl: pinctrl@4f200 {
+				compatible = "realtek,rtd1625-main2-pinctrl";
+				reg = <0x4f200 0x50>;
+			};
+
+			isom_pinctrl: pinctrl@146200 {
+				compatible = "realtek,rtd1625-isom-pinctrl";
+				reg = <0x146200 0x34>;
+			};
+
+			ve4_pinctrl: pinctrl@14e000 {
+				compatible = "realtek,rtd1625-ve4-pinctrl";
+				reg = <0x14e000 0x84>;
+			};
 		};
 
 		gic: interrupt-controller@ff100000 {
-- 
2.34.1

