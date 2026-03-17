Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F28A3B585A;
	Tue, 17 Mar 2026 11:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773748620; cv=none; b=ccpKDpdjQy9JhP7Rp+Tpr+PuxC9ji6mowGjqyea12INkpWHjmidkuS/JLNKiFedIoevgIKIK4yjVtFsfEpo/VQ6+BL4vYBZSj+dB0ctExKV3PoAUurqkyGd6WeuHkqF/dzfq4ubt0Wg6NO84b/Ts0WbZ3z4VAHk3k8flYpKGUAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773748620; c=relaxed/simple;
	bh=1uYKM8Xjmf8R1K71udNiEN3Dw5jzNBloQ1uPLbeou8E=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eVbxOmdpWqW4/682ENhOfbWVdQjmIsiwnEju6HIatWtZ38N87LBL6iT4YIMTkZxsdYxzYp2HgnZ+RLpZjNIt4PvzJr7pyAgp/NX/GorJ+5DU1VS1Zn1wPPzvJC9T63E6p06pcUa8XP2bx34d6XsxBFEtnSUD6uA+r4/wmLN3fKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=MrwL+E5B; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="MrwL+E5B"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 62HBsBJ813851624, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1773748451; bh=XzDSib8jEoc1vfE4lmbk5v2Wrp3FeCGOBPB/DyAjANY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=MrwL+E5BUBM0leX5F83sh/VYfnQPesuJzh9ZSLW2/lpZH2o2+xFvYqv1tY74PtyuS
	 VthqCm7YhWU7bMreMzEuhgMhqXFSLd3557NvbmcqDE0bTpog8yem9X8fmuci7oop20
	 QQxFFbzibx2xW6eBlTRAe8R9JRPRd6lc8LY6LV8/ElS7GT98cnGFc9ZtBjA/+EN3I3
	 chTlA8vwsZf3un0Dwi0ea/+3BylqkSUypwUPo/WuWhEC9hvc9zqh6eO6Q2NukYN4+B
	 c1Fl+ND2KCmKKfxuyb3AdGTQDX3FPNB2mUSsLFC0Hp/7niRQFYma4RPd5xBd9OoDrk
	 B/5iUTZjhzgKw==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.21/5.94) with ESMTPS id 62HBsBJ813851624
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Mar 2026 19:54:11 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 17 Mar 2026 19:54:11 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS05.realtek.com.tw
 (10.21.1.55) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Tue, 17 Mar 2026 19:54:11 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <linusw@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <afaerber@suse.com>
CC: <bartosz.golaszewski@oss.qualcomm.com>, <james.tai@realtek.com>,
        <cy.huang@realtek.com>, <stanley_chang@realtek.com>,
        <eleanor.lin@realtek.com>, <tychang@realtek.com>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-realtek-soc@lists.infradead.org>
Subject: [PATCH v4 2/8] dt-bindings: pincfg-node: Add input-threshold-voltage-microvolt property
Date: Tue, 17 Mar 2026 19:54:04 +0800
Message-ID: <20260317115411.2154365-3-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260317115411.2154365-1-eleanor.lin@realtek.com>
References: <20260317115411.2154365-1-eleanor.lin@realtek.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Tzuyi Chang <tychang@realtek.com>

Add a generic pin configuration property
"input-threshold-voltage-microvolt" to support hardware designs where the
input logic threshold is decoupled from the power supply voltage.

This property allows the pinctrl driver to configure the correct internal
reference voltage for pins that need to accept input signals at a different
voltage level than their power supply. For example, a pin powered by 3.3V
may need to accept 1.8V logic signals.

This defines the reference for VIH (Input High Voltage) and VIL (Input Low
Voltage) thresholds, enabling proper signal detection across different
voltage domains.

Signed-off-by: Tzuyi Chang <tychang@realtek.com>
Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
Changes in v4:
- Rename the property to input-threshold-voltage-microvolt.
- Add the restriction.
---
 Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml b/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
index fe936ab09104..ecddb415c06f 100644
--- a/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
@@ -162,6 +162,11 @@ properties:
       this affects the expected delay in ps before latching a value to
       an output pin.
 
+  input-threshold-voltage-microvolt:
+    description: Specifies the input voltage level of the pin in microvolts.
+      This defines the reference for  VIH (Input High Voltage) and VIL
+      (Input Low Voltage) thresholds for proper signal detection.
+
 allOf:
   - if:
       required:
@@ -177,6 +182,7 @@ allOf:
     then:
       properties:
         input-enable: false
+        input-threshold-voltage-microvolt: false
 
   - if:
       required:
-- 
2.34.1

