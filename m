Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=60.244.123.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794303845;
	b=iAcmcev9t0fw7aF7kJ7vZK19czXe5OdjHl1Ar1Mp16sZuo26i2qk9iEpTNjEGkHcvoye
	 7qxP2qDtAGtSUIE8fZba9HCF8XhoCYEjO9+lWyFSxzK7lkq+DfAXxIwMfUq80YZnUdcJr
	 67aPUMv1pzRLPSKaJIQYvl6lWn5erXqUDzszfHx+hdioodbBpuA1cIr5dNxtiYtzLSpmI
	 DnXZQVBQ/Q48DQcXtrbybSSASFF8LJxQZYe+HkRW83mHCFMY0++w/4yLtzJ9S/7sN5fWK
	 TPkq6A3oWjgJyh6B2a3/MlKl5BKZmxxjzSnCl2p7zZE1URP5VQSWr3b8zHyxjBBu07w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794303845;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-MTK;
	bh=8CFw8pG2i0/lPMAAzFWDQ4v+K0ug8N4/BQf9jB1xhyg=;
	b=ZHRBF5BD4XrHub+EbWvJdEpMDQORQo7Ty6DP904LDyT5RB2rTgLiN4eI4Axvu0pDAJPC
	 exA9q54N6jwZtaExS8gfBIui8dimnkieSxaAsrvO3pp+GeRLbdX6UT6+rDxhCjzT6iMjL
	 a8XyYyBeydCaTQgl23YnFHF+uhS2xEP6BJCPnJwtDu621Nm8Mrbpa52dyZbCdLePZLUrL
	 Qrl5D4uM6c4l/ps4xLTdITUAXjsP/AGI7TDzeNg2+K6gY0yRiwwcTNFcuPseS5A8OEw5f
	 5szp48Dd/XQr3MKt9lBwX8uTmHIE6E2Htux6ChaVs41bpWif8QR6dhCXDJTYrJ1npbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=airoha.com;
	spf=pass smtp.mailfrom=airoha.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=Pmpul+xO;
	arc=none smtp.remote-ip=60.244.123.138
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B9D76076132;
	Tue, 10 Nov 2026 09:44:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B9D76076132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=airoha.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airoha.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=Pmpul+xO
X-UUID: 3bf157a6dceb11f1b1788b6acf885367-20261110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=8CFw8pG2i0/lPMAAzFWDQ4v+K0ug8N4/BQf9jB1xhyg=;
	b=Pmpul+xOEOjFXBdVy/DfDMALn88oz/etzWwx2zZY3ELyX1F5qSOSCjoBDyzye7AiTqLkn/3DosCTIIaK69zv/O8Ow7Tg1dUCnBKxsxdkSeTGQtOSIMAP5uUcFiPsEjL7XpCVALaKJ/GZql71qGt0vN5v7+tYl6WIu78TKAcv+YA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:0e7197d6-718e-4238-bd11-740307b059af,IP:0,U
	RL:0,TC:0,Content:50,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:50
X-CID-META: VersionHash:b0318ac,CLOUDID:544392eb-7d0c-4db4-a7e5-d44f18b7500b,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:4|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 3bf157a6dceb11f1b1788b6acf885367-20261110
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <zhengping.zhang@airoha.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 165845128; Tue, 10 Nov 2026 17:43:50 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 10 Nov 2026 17:43:49 +0800
Received: from mediatek.com (172.18.153.129) by mtkmbs13n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.2562.29 via Frontend
 Transport; Tue, 10 Nov 2026 17:43:49 +0800
From: Zhengping Zhang <zhengping.zhang@airoha.com>
To: <linusw@kernel.org>, <lorenzo@kernel.org>
CC: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<brgl@kernel.org>, <mikhail.kshevetskiy@iopsys.eu>, <naseefkm@gmail.com>,
	<benjamin.larsson@genexis.eu>, <linux-gpio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <lei.dong@airoha.com>,
	<ansuelsmth@gmail.com>, Zhengping Zhang <zhengping.zhang@airoha.com>
Subject: [PATCH 04/12] pinctrl: airoha: an7581: fix PHY LED GPIO group assignments
Date: Tue, 10 Nov 2026 17:43:31 +0800
Message-ID: <20261110094339.749110-5-zhengping.zhang@airoha.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261110094339.749110-1-zhengping.zhang@airoha.com>
References: <20261110094339.749110-1-zhengping.zhang@airoha.com>
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
Content-Type: text/plain
X-MTK: N

The PHY LED function tables associate LED0 mux bits with the GPIO pads
used by LED1, and vice versa. Selecting an LED function therefore
programs the mux bit for a different pad from the requested group.

The LED mux bits in SCU register 0x214 correspond to these GPIO pads:

                  LAN0    LAN1    LAN2    LAN3
  LED0 mux bit       3       5       7       9
  LED0 GPIO         43      44      45      46
  LED1 mux bit       4       6       8      10
  LED1 GPIO         33      34      35      42

Correct both the advertised groups and the function-group entries to
match these assignments. This ensures that the pin claimed by pinctrl
matches the pad controlled by the selected LED mux bit.

Keep the existing mux masks and PHY source selections in the LED0/1
mapping registers unchanged.

Signed-off-by: Zhengping Zhang <zhengping.zhang@airoha.com>
---
 drivers/pinctrl/airoha/pinctrl-an7581.c | 80 ++++++++++++-------------
 1 file changed, 40 insertions(+), 40 deletions(-)

diff --git a/drivers/pinctrl/airoha/pinctrl-an7581.c b/drivers/pinctrl/airoha/pinctrl-an7581.c
index bfb777594811b..3cbdfc31e97e5 100644
--- a/drivers/pinctrl/airoha/pinctrl-an7581.c
+++ b/drivers/pinctrl/airoha/pinctrl-an7581.c
@@ -594,28 +594,28 @@ static const char *const pwm_groups[] = {
 	"gpio46", "gpio47", "gpio48", "gpio49"
 };
 static const char *const phy1_led0_groups[] = {
-	"gpio33", "gpio34", "gpio35", "gpio42"
+	"gpio43", "gpio44", "gpio45", "gpio46"
 };
 static const char *const phy2_led0_groups[] = {
-	"gpio33", "gpio34", "gpio35", "gpio42"
+	"gpio43", "gpio44", "gpio45", "gpio46"
 };
 static const char *const phy3_led0_groups[] = {
-	"gpio33", "gpio34", "gpio35", "gpio42"
+	"gpio43", "gpio44", "gpio45", "gpio46"
 };
 static const char *const phy4_led0_groups[] = {
-	"gpio33", "gpio34", "gpio35", "gpio42"
+	"gpio43", "gpio44", "gpio45", "gpio46"
 };
 static const char *const phy1_led1_groups[] = {
-	"gpio43", "gpio44", "gpio45", "gpio46"
+	"gpio33", "gpio34", "gpio35", "gpio42"
 };
 static const char *const phy2_led1_groups[] = {
-	"gpio43", "gpio44", "gpio45", "gpio46"
+	"gpio33", "gpio34", "gpio35", "gpio42"
 };
 static const char *const phy3_led1_groups[] = {
-	"gpio43", "gpio44", "gpio45", "gpio46"
+	"gpio33", "gpio34", "gpio35", "gpio42"
 };
 static const char *const phy4_led1_groups[] = {
-	"gpio43", "gpio44", "gpio45", "gpio46"
+	"gpio33", "gpio34", "gpio35", "gpio42"
 };
 
 static const struct airoha_pinctrl_func_group pon_func_group[] = {
@@ -1067,90 +1067,90 @@ static const struct airoha_pinctrl_func_group pwm_func_group[] = {
 };
 
 static const struct airoha_pinctrl_func_group phy1_led0_func_group[] = {
-	AIROHA_PINCTRL_PHY_LED0("gpio33", GPIO_LAN0_LED0_MODE_MASK,
+	AIROHA_PINCTRL_PHY_LED0("gpio43", GPIO_LAN0_LED0_MODE_MASK,
 				LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(0)),
-	AIROHA_PINCTRL_PHY_LED0("gpio34", GPIO_LAN1_LED0_MODE_MASK,
+	AIROHA_PINCTRL_PHY_LED0("gpio44", GPIO_LAN1_LED0_MODE_MASK,
 				LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(0)),
-	AIROHA_PINCTRL_PHY_LED0("gpio35", GPIO_LAN2_LED0_MODE_MASK,
+	AIROHA_PINCTRL_PHY_LED0("gpio45", GPIO_LAN2_LED0_MODE_MASK,
 				LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(0)),
-	AIROHA_PINCTRL_PHY_LED0("gpio42", GPIO_LAN3_LED0_MODE_MASK,
+	AIROHA_PINCTRL_PHY_LED0("gpio46", GPIO_LAN3_LED0_MODE_MASK,
 				LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(0)),
 };
 
 static const struct airoha_pinctrl_func_group phy2_led0_func_group[] = {
-	AIROHA_PINCTRL_PHY_LED0("gpio33", GPIO_LAN0_LED0_MODE_MASK,
+	AIROHA_PINCTRL_PHY_LED0("gpio43", GPIO_LAN0_LED0_MODE_MASK,
 				LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(1)),
-	AIROHA_PINCTRL_PHY_LED0("gpio34", GPIO_LAN1_LED0_MODE_MASK,
+	AIROHA_PINCTRL_PHY_LED0("gpio44", GPIO_LAN1_LED0_MODE_MASK,
 				LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(1)),
-	AIROHA_PINCTRL_PHY_LED0("gpio35", GPIO_LAN2_LED0_MODE_MASK,
+	AIROHA_PINCTRL_PHY_LED0("gpio45", GPIO_LAN2_LED0_MODE_MASK,
 				LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(1)),
-	AIROHA_PINCTRL_PHY_LED0("gpio42", GPIO_LAN3_LED0_MODE_MASK,
+	AIROHA_PINCTRL_PHY_LED0("gpio46", GPIO_LAN3_LED0_MODE_MASK,
 				LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(1)),
 };
 
 static const struct airoha_pinctrl_func_group phy3_led0_func_group[] = {
-	AIROHA_PINCTRL_PHY_LED0("gpio33", GPIO_LAN0_LED0_MODE_MASK,
+	AIROHA_PINCTRL_PHY_LED0("gpio43", GPIO_LAN0_LED0_MODE_MASK,
 				LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(2)),
-	AIROHA_PINCTRL_PHY_LED0("gpio34", GPIO_LAN1_LED0_MODE_MASK,
+	AIROHA_PINCTRL_PHY_LED0("gpio44", GPIO_LAN1_LED0_MODE_MASK,
 				LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(2)),
-	AIROHA_PINCTRL_PHY_LED0("gpio35", GPIO_LAN2_LED0_MODE_MASK,
+	AIROHA_PINCTRL_PHY_LED0("gpio45", GPIO_LAN2_LED0_MODE_MASK,
 				LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(2)),
-	AIROHA_PINCTRL_PHY_LED0("gpio42", GPIO_LAN3_LED0_MODE_MASK,
+	AIROHA_PINCTRL_PHY_LED0("gpio46", GPIO_LAN3_LED0_MODE_MASK,
 				LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(2)),
 };
 
 static const struct airoha_pinctrl_func_group phy4_led0_func_group[] = {
-	AIROHA_PINCTRL_PHY_LED0("gpio33", GPIO_LAN0_LED0_MODE_MASK,
+	AIROHA_PINCTRL_PHY_LED0("gpio43", GPIO_LAN0_LED0_MODE_MASK,
 				LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(3)),
-	AIROHA_PINCTRL_PHY_LED0("gpio34", GPIO_LAN1_LED0_MODE_MASK,
+	AIROHA_PINCTRL_PHY_LED0("gpio44", GPIO_LAN1_LED0_MODE_MASK,
 				LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(3)),
-	AIROHA_PINCTRL_PHY_LED0("gpio35", GPIO_LAN2_LED0_MODE_MASK,
+	AIROHA_PINCTRL_PHY_LED0("gpio45", GPIO_LAN2_LED0_MODE_MASK,
 				LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(3)),
-	AIROHA_PINCTRL_PHY_LED0("gpio42", GPIO_LAN3_LED0_MODE_MASK,
+	AIROHA_PINCTRL_PHY_LED0("gpio46", GPIO_LAN3_LED0_MODE_MASK,
 				LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(3)),
 };
 
 static const struct airoha_pinctrl_func_group phy1_led1_func_group[] = {
-	AIROHA_PINCTRL_PHY_LED1("gpio43", GPIO_LAN0_LED1_MODE_MASK,
+	AIROHA_PINCTRL_PHY_LED1("gpio33", GPIO_LAN0_LED1_MODE_MASK,
 				LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(0)),
-	AIROHA_PINCTRL_PHY_LED1("gpio44", GPIO_LAN1_LED1_MODE_MASK,
+	AIROHA_PINCTRL_PHY_LED1("gpio34", GPIO_LAN1_LED1_MODE_MASK,
 				LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(0)),
-	AIROHA_PINCTRL_PHY_LED1("gpio45", GPIO_LAN2_LED1_MODE_MASK,
+	AIROHA_PINCTRL_PHY_LED1("gpio35", GPIO_LAN2_LED1_MODE_MASK,
 				LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(0)),
-	AIROHA_PINCTRL_PHY_LED1("gpio46", GPIO_LAN3_LED1_MODE_MASK,
+	AIROHA_PINCTRL_PHY_LED1("gpio42", GPIO_LAN3_LED1_MODE_MASK,
 				LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(0)),
 };
 
 static const struct airoha_pinctrl_func_group phy2_led1_func_group[] = {
-	AIROHA_PINCTRL_PHY_LED1("gpio43", GPIO_LAN0_LED1_MODE_MASK,
+	AIROHA_PINCTRL_PHY_LED1("gpio33", GPIO_LAN0_LED1_MODE_MASK,
 				LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(1)),
-	AIROHA_PINCTRL_PHY_LED1("gpio44", GPIO_LAN1_LED1_MODE_MASK,
+	AIROHA_PINCTRL_PHY_LED1("gpio34", GPIO_LAN1_LED1_MODE_MASK,
 				LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(1)),
-	AIROHA_PINCTRL_PHY_LED1("gpio45", GPIO_LAN2_LED1_MODE_MASK,
+	AIROHA_PINCTRL_PHY_LED1("gpio35", GPIO_LAN2_LED1_MODE_MASK,
 				LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(1)),
-	AIROHA_PINCTRL_PHY_LED1("gpio46", GPIO_LAN3_LED1_MODE_MASK,
+	AIROHA_PINCTRL_PHY_LED1("gpio42", GPIO_LAN3_LED1_MODE_MASK,
 				LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(1)),
 };
 
 static const struct airoha_pinctrl_func_group phy3_led1_func_group[] = {
-	AIROHA_PINCTRL_PHY_LED1("gpio43", GPIO_LAN0_LED1_MODE_MASK,
+	AIROHA_PINCTRL_PHY_LED1("gpio33", GPIO_LAN0_LED1_MODE_MASK,
 				LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(2)),
-	AIROHA_PINCTRL_PHY_LED1("gpio44", GPIO_LAN1_LED1_MODE_MASK,
+	AIROHA_PINCTRL_PHY_LED1("gpio34", GPIO_LAN1_LED1_MODE_MASK,
 				LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(2)),
-	AIROHA_PINCTRL_PHY_LED1("gpio45", GPIO_LAN2_LED1_MODE_MASK,
+	AIROHA_PINCTRL_PHY_LED1("gpio35", GPIO_LAN2_LED1_MODE_MASK,
 				LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(2)),
-	AIROHA_PINCTRL_PHY_LED1("gpio46", GPIO_LAN3_LED1_MODE_MASK,
+	AIROHA_PINCTRL_PHY_LED1("gpio42", GPIO_LAN3_LED1_MODE_MASK,
 				LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(2)),
 };
 
 static const struct airoha_pinctrl_func_group phy4_led1_func_group[] = {
-	AIROHA_PINCTRL_PHY_LED1("gpio43", GPIO_LAN0_LED1_MODE_MASK,
+	AIROHA_PINCTRL_PHY_LED1("gpio33", GPIO_LAN0_LED1_MODE_MASK,
 				LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(3)),
-	AIROHA_PINCTRL_PHY_LED1("gpio44", GPIO_LAN1_LED1_MODE_MASK,
+	AIROHA_PINCTRL_PHY_LED1("gpio34", GPIO_LAN1_LED1_MODE_MASK,
 				LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(3)),
-	AIROHA_PINCTRL_PHY_LED1("gpio45", GPIO_LAN2_LED1_MODE_MASK,
+	AIROHA_PINCTRL_PHY_LED1("gpio35", GPIO_LAN2_LED1_MODE_MASK,
 				LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(3)),
-	AIROHA_PINCTRL_PHY_LED1("gpio46", GPIO_LAN3_LED1_MODE_MASK,
+	AIROHA_PINCTRL_PHY_LED1("gpio42", GPIO_LAN3_LED1_MODE_MASK,
 				LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(3)),
 };
 
-- 
2.43.0

