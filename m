Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.61.82.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794303836;
	b=BU6Ac37ycEG/5w8kTX8iDMZy2t29HEBa+UudmDEJOlB0mfeRIib+hs3GQ8FAirancd1W
	 zTKiBUWXl81RLfFtK1YhBYm3X/w85yYYGEy9GKRXyK3QWslwcr+UmWyxkhu65FkyRLctc
	 m/UNny+E8a+ddEqKrZ1UUajai2ugyNdVtvnyaKsv9BulVQ+24d1iRPEX9WJpXPXOVGmIU
	 gHfAFLxUrzhabiErru/HJRg5RmCyy739nkolyj/ft5i2WUaS6qndavka8B/37uLvCi4Id
	 6xqb52dBn1hP12eIdcj2Tgi9aU2JYns4d2wwphbMtRVzlgmKyC0g8tburiKPkyVrDUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794303836;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-MTK;
	bh=8n98LZOnT/eVXjJpv+jjYxJns6Yez0iBLvcPCYBn6qY=;
	b=KnqTQHBo7pKM8J1Sl44k6WQLi5uIgcREYvgkhVhdn/LyEOFmJc4fXyF4CQfqQxfZTW0O
	 y0ZLmhd+4FhMDcEg1vlnLJIWQ9hEoSh2NBRCnbWh2NSXU22hiL5hgsrX1CuHi4xPn638v
	 xVAelfGifn4bKRPg5yUFXscB9RSAIS0ISFrAxaxyvsv4lZD9WjMQetBtchrIbnXFZzswQ
	 P2qmHJ/AMTMD5Ye4GZ9YgecUSZ9Q/KtVcYdo5PwpaSOiDznxA3IJL9/zvckDqLq7XLzXZ
	 a5WJ6pdvz2As+2oKRHtCR8OWtBM06xf7Nsb1DFJazNkTb4oEeo8qdJof9laKS44bQcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=airoha.com;
	spf=pass smtp.mailfrom=airoha.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=NjfN8Q3o;
	arc=none smtp.remote-ip=210.61.82.184
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60B89606BF09;
	Tue, 10 Nov 2026 09:43:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60B89606BF09
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=airoha.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airoha.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=NjfN8Q3o
X-UUID: 3baf2598dceb11f18dc8c9802ae25ab1-20261110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=8n98LZOnT/eVXjJpv+jjYxJns6Yez0iBLvcPCYBn6qY=;
	b=NjfN8Q3o9G7KCVvXRzgbqCenkjrAXsI9Valbmn3Pn66ybpGCOjOvPG55BWbJlWgAZgIzfYA0uPzQ6sos1JPa+EL/+wfsWPjJqyTjvXpM06P2uBUa/oWJL/gvbgRUqEkxFRFBg54Hi5iwtkCBVDZMrddmLs1iUZHwlM5VVe6hjn4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:7b177a16-00ef-42e9-9b44-28f0dc140c99,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:63e61766-4b51-4c95-bb1b-80ac6aad9c96,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 3baf2598dceb11f18dc8c9802ae25ab1-20261110
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <zhengping.zhang@airoha.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 975642470; Tue, 10 Nov 2026 17:43:50 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
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
Subject: [PATCH 03/12] dt-bindings: pinctrl: airoha: describe all EN7581 GPIO mux groups
Date: Tue, 10 Nov 2026 17:43:30 +0800
Message-ID: <20261110094339.749110-4-zhengping.zhang@airoha.com>
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

Expand the GPIO mux groups from GPIO47-49 to GPIO0-49 to describe
explicit GPIO mode selection across the controller's GPIO range.
Allow multiple GPIO groups in a single mux state.

Correct the PHY LED pin groups to match the EN7581 pad assignments:
LED0 uses GPIO43-46, while LED1 uses GPIO33-35 and GPIO42.

The corresponding driver support is added in subsequent patches.

Signed-off-by: Zhengping Zhang <zhengping.zhang@airoha.com>
---
 .../pinctrl/airoha,en7581-pinctrl.yaml        | 28 +++++++++++++------
 1 file changed, 19 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml
index 0cf1826c691fc..fa7b3dc58a3ea 100644
--- a/Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml
@@ -194,7 +194,17 @@ patternProperties:
             then:
               properties:
                 groups:
-                  enum: [gpio47, gpio48, gpio49]
+                  items:
+                    enum: [gpio0, gpio1, gpio2, gpio3, gpio4, gpio5, gpio6,
+                           gpio7, gpio8, gpio9, gpio10, gpio11, gpio12, gpio13,
+                           gpio14, gpio15, gpio16, gpio17, gpio18, gpio19, gpio20,
+                           gpio21, gpio22, gpio23, gpio24, gpio25, gpio26, gpio27,
+                           gpio28, gpio29, gpio30, gpio31, gpio32, gpio33, gpio34,
+                           gpio35, gpio36, gpio37, gpio38, gpio39, gpio40, gpio41,
+                           gpio42, gpio43, gpio44, gpio45, gpio46, gpio47, gpio48,
+                           gpio49]
+                  minItems: 1
+                  maxItems: 50
           - if:
               properties:
                 function:
@@ -225,7 +235,7 @@ patternProperties:
             then:
               properties:
                 groups:
-                  enum: [gpio33, gpio34, gpio35, gpio42]
+                  enum: [gpio43, gpio44, gpio45, gpio46]
           - if:
               properties:
                 function:
@@ -233,7 +243,7 @@ patternProperties:
             then:
               properties:
                 groups:
-                  enum: [gpio33, gpio34, gpio35, gpio42]
+                  enum: [gpio43, gpio44, gpio45, gpio46]
           - if:
               properties:
                 function:
@@ -241,7 +251,7 @@ patternProperties:
             then:
               properties:
                 groups:
-                  enum: [gpio33, gpio34, gpio35, gpio42]
+                  enum: [gpio43, gpio44, gpio45, gpio46]
           - if:
               properties:
                 function:
@@ -249,7 +259,7 @@ patternProperties:
             then:
               properties:
                 groups:
-                  enum: [gpio33, gpio34, gpio35, gpio42]
+                  enum: [gpio43, gpio44, gpio45, gpio46]
           - if:
               properties:
                 function:
@@ -257,7 +267,7 @@ patternProperties:
             then:
               properties:
                 groups:
-                  enum: [gpio43, gpio44, gpio45, gpio46]
+                  enum: [gpio33, gpio34, gpio35, gpio42]
           - if:
               properties:
                 function:
@@ -265,7 +275,7 @@ patternProperties:
             then:
               properties:
                 groups:
-                  enum: [gpio43, gpio44, gpio45, gpio46]
+                  enum: [gpio33, gpio34, gpio35, gpio42]
           - if:
               properties:
                 function:
@@ -273,7 +283,7 @@ patternProperties:
             then:
               properties:
                 groups:
-                  enum: [gpio43, gpio44, gpio45, gpio46]
+                  enum: [gpio33, gpio34, gpio35, gpio42]
           - if:
               properties:
                 function:
@@ -281,7 +291,7 @@ patternProperties:
             then:
               properties:
                 groups:
-                  enum: [gpio43, gpio44, gpio45, gpio46]
+                  enum: [gpio33, gpio34, gpio35, gpio42]
 
         additionalProperties: false
 
-- 
2.43.0

