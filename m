Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=60.244.123.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794303843;
	b=3fP5F3O9+FKt2/P8B43mtgR2s9DmP21sy4HuLp3UkPBNVeszoXUIu6OwwVXKRIWE9qeo
	 KGm5DXw7h7rZKHU8p/zmm7errJJDWhDekW2J6XBM1Du1JpN1G9Rv0WHmX/H1J26ACK6Sx
	 2stTNb5vy24OpPA2X5aBqq4kNrlEIRfhp0luGqtaP2+DZ8NcCcvTiz9KT6TkBcQYEMLaD
	 emZ7YaLOQcMurLLN4SQewnH3mKmAZnZ+mkVLd65ACsbUJQgOQxme1K+qrkUZNlhHDyUeZ
	 gNt+LX+FNnK0cNkDz/bElcGxv+FET4QiHqwL8nOoNpejUqN56Z/O8yZRW4RVXw2Me7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794303843;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-MTK;
	bh=WpZjllCHcDQphGMq4daj/RT9B9Xyv5S6DoQe0TrOBD8=;
	b=3oJ+xgY2SK5PrqfVZecfGvkvv6ccjFOWOHtvKI+tpJ8uAWAoZfF/MHgMzvzkInlIHrt7
	 w8leVy+SMNzgGvxds41PGqY5wjD77r1OoiR9MnhZDRcUqlRUEJmtu9M20bov+oxmecnSJ
	 WwK17hst4HyNqvyljZe+f2z+5wcfTFQOrzMRFs0AsUwtL1lZRSWgRXALWyPCm/QrwzGs0
	 oE5h6LpkVczdu7KCOfzM+UBb7XA3Lo1v/BBeyMoaiuVN4re0SWOsfgCdJlDinzAl26thU
	 OiWiLwKmfuMJGQKUSpM+9UCwv9UBn2f6QB9tgDKFi88MQrWQeB6ny2+xrYg9L3HVOsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=airoha.com;
	spf=pass smtp.mailfrom=airoha.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=queeEvOY;
	arc=none smtp.remote-ip=60.244.123.138
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22AAE607266D;
	Tue, 10 Nov 2026 09:44:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22AAE607266D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=airoha.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airoha.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=queeEvOY
X-UUID: 3c06165adceb11f1b1788b6acf885367-20261110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=WpZjllCHcDQphGMq4daj/RT9B9Xyv5S6DoQe0TrOBD8=;
	b=queeEvOY5W/b7mdkIRNM/excArk7kjOyhxCA0THVHFlvhcsfB2t2r23pC9xGE8SzbutddYb0azFM953dJiQgLDrsw5phYO9lgRL7361/+YA+UEx8UP3WtKrpuzFw8AKdIEWhLZC64eCsuxAUUN3PA+uMDHFq/v+vpjWAU4Ajdzg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:c15c80bb-88cd-4687-b7da-0f45cc494895,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:b0318ac,CLOUDID:6be61766-4b51-4c95-bb1b-80ac6aad9c96,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 3c06165adceb11f1b1788b6acf885367-20261110
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <zhengping.zhang@airoha.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1045887544; Tue, 10 Nov 2026 17:43:50 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
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
Subject: [PATCH 06/12] dt-bindings: pinctrl: airoha: describe all AN7583 GPIO mux groups
Date: Tue, 10 Nov 2026 17:43:33 +0800
Message-ID: <20261110094339.749110-7-zhengping.zhang@airoha.com>
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

Expand the GPIO mux groups from GPIO39-52 to GPIO0-52 to describe
explicit GPIO mode selection across the controller's GPIO range.
Allow multiple GPIO groups in a single mux state.

Add spi to the supported SPI groups alongside spi_quad and spi_cs1,
and increase maxItems to allow all three groups in a single mux
state.

The corresponding driver support is added in subsequent patches.

Signed-off-by: Zhengping Zhang <zhengping.zhang@airoha.com>
---
 .../pinctrl/airoha,an7583-pinctrl.yaml         | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml
index aad2e9880ec6c..1a24c01eb4102 100644
--- a/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml
@@ -157,8 +157,8 @@ patternProperties:
               properties:
                 groups:
                   items:
-                    enum: [spi_quad, spi_cs1]
-                  maxItems: 2
+                    enum: [spi, spi_quad, spi_cs1]
+                  maxItems: 3
           - if:
               properties:
                 function:
@@ -192,9 +192,17 @@ patternProperties:
             then:
               properties:
                 groups:
-                  enum: [gpio39, gpio40, gpio41, gpio42, gpio43, gpio44,
-                         gpio45, gpio46, gpio47, gpio48, gpio49, gpio50,
-                         gpio51, gpio52]
+                  items:
+                    enum: [gpio0, gpio1, gpio2, gpio3, gpio4, gpio5, gpio6,
+                           gpio7, gpio8, gpio9, gpio10, gpio11, gpio12, gpio13,
+                           gpio14, gpio15, gpio16, gpio17, gpio18, gpio19, gpio20,
+                           gpio21, gpio22, gpio23, gpio24, gpio25, gpio26, gpio27,
+                           gpio28, gpio29, gpio30, gpio31, gpio32, gpio33, gpio34,
+                           gpio35, gpio36, gpio37, gpio38, gpio39, gpio40, gpio41,
+                           gpio42, gpio43, gpio44, gpio45, gpio46, gpio47, gpio48,
+                           gpio49, gpio50, gpio51, gpio52]
+                  minItems: 1
+                  maxItems: 53
           - if:
               properties:
                 function:
-- 
2.43.0

