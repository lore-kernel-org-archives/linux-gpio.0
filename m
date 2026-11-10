Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.61.82.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794303838;
	b=ci1Bisb6Vx+Y8BzUihdH7vgi/CJBImNlWufT8NqLjhvg4UX/SpZ0ldjluu7rgxb2pGY0
	 eoL5TqkAXyQmJoxez5ptsNKDActlt88qsqozBorCscxjVLphmxFEpqxQmBWGYqNCoKRav
	 TQevc0IB1d+uQEuZ5MxqYzJ4FbThX6KONgvbQw5n/8Nj48aImFibA7MkR4f7Oa36AUjTX
	 xTrmGXkzRRB3O9TNRGxWsYB+BJAjlPL7KwMkezzjoW7Et/Ft3NIpyM+fRcvQLkZu92183
	 2K+L6bzzrBhaffBcjbSpipEXbQDKMhJ3TnQTOuLwmlcQcqzknTpxOcjJHyunKQZx5Aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794303838;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-MTK;
	bh=fkGWqrJ70JJ/YxZ0EyhQwOPD14HnDV1vRYSJM51y4Lo=;
	b=tRxm1cNiAhyKoe7O7xyeLBudV9A5EBPd/0mBIh2MwDKwC6TZ5gWsWtRmH7Okyjq5Wz5N
	 Y1rDWr6KaUITjKvkf/9U2wheoccHLWKiNFBYOw5G9kf5TR+M460j2PO/9GBnyH7nd/1K6
	 A0W5w9j8oYKj9fWtLXTPkYWzIWyWr9Cpk3ckz3newfT/QbMQREVPulYQE8juJUy6QC6nL
	 /jQtDn8mGOX073Z/sbRHaIKmRegQ3c2/ts9L0pepCWCBNwYHds4ptN+swbHCQXbHE9CYK
	 GS5yLO8A3Y9amFXJce/hPIKX7MZbC/kmx7Lt8jJ0T0RXKHk7cwXJOfAv7iQqxZiV0dQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=airoha.com;
	spf=pass smtp.mailfrom=airoha.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=EmJ15X5B;
	arc=none smtp.remote-ip=210.61.82.184
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A7EA606BF1C;
	Tue, 10 Nov 2026 09:43:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A7EA606BF1C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=airoha.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airoha.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=EmJ15X5B
X-UUID: 3c108d42dceb11f18dc8c9802ae25ab1-20261110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=fkGWqrJ70JJ/YxZ0EyhQwOPD14HnDV1vRYSJM51y4Lo=;
	b=EmJ15X5BynuDU2mHxWJNGXPObWysZQt9x5GkFP+IP90RZ8aJ+zQz/WGt2ywQEJqvorPlWuQwupaGVfuZRMmlytM3oCiWo1qTU+EIv6FrgG3+sWt3Om8lfqcLvrGP+mpfoa7FL1kdjw4ptVG2NxuuUsdTXZPKiXjxFu9nigbuebo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:9910fb91-fff4-41b9-90d2-34b6a1aff78a,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:137d1357-a87d-42b7-8ffd-9e23ca174329,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 3c108d42dceb11f18dc8c9802ae25ab1-20261110
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <zhengping.zhang@airoha.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1745189036; Tue, 10 Nov 2026 17:43:50 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 10 Nov 2026 17:43:50 +0800
Received: from mediatek.com (172.18.153.129) by mtkmbs13n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.2562.29 via Frontend
 Transport; Tue, 10 Nov 2026 17:43:50 +0800
From: Zhengping Zhang <zhengping.zhang@airoha.com>
To: <linusw@kernel.org>, <lorenzo@kernel.org>
CC: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<brgl@kernel.org>, <mikhail.kshevetskiy@iopsys.eu>, <naseefkm@gmail.com>,
	<benjamin.larsson@genexis.eu>, <linux-gpio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <lei.dong@airoha.com>,
	<ansuelsmth@gmail.com>, Zhengping Zhang <zhengping.zhang@airoha.com>
Subject: [PATCH 10/12] dt-bindings: pinctrl: airoha: describe all EN7523 GPIO mux groups
Date: Tue, 10 Nov 2026 17:43:37 +0800
Message-ID: <20261110094339.749110-11-zhengping.zhang@airoha.com>
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

Expand the GPIO mux groups from GPIO28-29 to GPIO0-29 to describe
explicit GPIO mode selection across the controller's GPIO range.
Allow multiple GPIO groups in a single mux state.

The corresponding driver support is added in a subsequent patch.

Signed-off-by: Zhengping Zhang <zhengping.zhang@airoha.com>
---
 .../bindings/pinctrl/airoha,en7523-pinctrl.yaml          | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/airoha,en7523-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/airoha,en7523-pinctrl.yaml
index 599f80e94432b..d93cf3a3532a2 100644
--- a/Documentation/devicetree/bindings/pinctrl/airoha,en7523-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/airoha,en7523-pinctrl.yaml
@@ -178,7 +178,14 @@ patternProperties:
             then:
               properties:
                 groups:
-                  enum: [gpio28, gpio29]
+                  items:
+                    enum: [gpio0, gpio1, gpio2, gpio3, gpio4, gpio5, gpio6,
+                           gpio7, gpio8, gpio9, gpio10, gpio11, gpio12, gpio13,
+                           gpio14, gpio15, gpio16, gpio17, gpio18, gpio19, gpio20,
+                           gpio21, gpio22, gpio23, gpio24, gpio25, gpio26, gpio27,
+                           gpio28, gpio29]
+                  minItems: 1
+                  maxItems: 30
           - if:
               properties:
                 function:
-- 
2.43.0

