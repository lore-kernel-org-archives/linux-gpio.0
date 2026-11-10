Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.61.82.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794303839;
	b=jz+F2pwXg4ytfY725qhSYbQxlJIcrGcnZy8MMpqlUynkt8CO+ggZ8ys6myM1681a6H92
	 HVpUySPdTOK/Wlr0GH5b1wXuxTpYYsIASiFK77CvWtim7JjN19euu/nMmkY+HAXgl+aqm
	 F86LT4bkYkqVsb8/ZhCG3FtvxuohnAxJYvue/78604K1bi8yzJYgG5GIf90jXnsXeyE0w
	 K29CaaAcAvT+yFzBGM+YXhXKTvW5ZiTF3xY8j23ng0rVR2e/eEzgAtbulq6WuuZFIQq+C
	 /t5im2ExM3zOwzT29M7bigIeDlBOtoFHz/pq3Y1lMc160AU6nEC4lST+14kwa13rtjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794303839;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-MTK;
	bh=kVg+gpGYrwDRmuav1eKjcZD2FYpE/e02RG++bvbvwM4=;
	b=ZtdHuoe0W9DvC0LhB30V0wX7hwLzi0C8kl7/HkRFJ/80b4KhrAAlfhWQbf/yg2tgFrfx
	 eZr/coDfddkPnwl+URH2atE7bD0nPecV6P2fHmwaXARI6dIZ7E5qHFJsVU7iGzMbEJXdR
	 n2mjVCAk/FPoYxVF88iX9Fi9uCggHcMTFSFqYflri5Usv5YCS+ELK60QLQaIawVNIGYKC
	 pkQNizklBNS5iP/d1ZX5zW8HNgCncBcRdfVwB4H32vXWkf0PeKz+SHev+Cr6IiSzMYSm2
	 gqLnkTO1Xv1ZG9SlEexm9ri/UjoMVkI2H1UPQ+A4wgKTg6lLN61yIz2vlIGFckeDdDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=airoha.com;
	spf=pass smtp.mailfrom=airoha.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=ZmRGRUMy;
	arc=none smtp.remote-ip=210.61.82.184
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C519606BF2B;
	Tue, 10 Nov 2026 09:43:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C519606BF2B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=airoha.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airoha.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=ZmRGRUMy
X-UUID: 3c13f9f0dceb11f18dc8c9802ae25ab1-20261110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=kVg+gpGYrwDRmuav1eKjcZD2FYpE/e02RG++bvbvwM4=;
	b=ZmRGRUMynB1ADAyKgrSCyiPEDDyCpR/WblyDS6BVKOzOfcElV6CxMqoteq6DkBOcpC0/vddswF6ji39ZrcgXH0FbpPyJAlYTypEWskQWTPpCTXy59z6gxu7wqdwaCRJHIehOyqqm4qQSepJg4MSBfCS+48QzEZK1MMFOd/Pf5ng=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:95099534-c233-441d-9a02-d58ff06fd7af,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:147d1357-a87d-42b7-8ffd-9e23ca174329,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 3c13f9f0dceb11f18dc8c9802ae25ab1-20261110
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <zhengping.zhang@airoha.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 518144137; Tue, 10 Nov 2026 17:43:50 +0800
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
Subject: [PATCH 12/12] MAINTAINERS: add myself as Airoha pinctrl co-maintainer
Date: Tue, 10 Nov 2026 17:43:39 +0800
Message-ID: <20261110094339.749110-13-zhengping.zhang@airoha.com>
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

Add myself as a co-maintainer of the Airoha pinctrl drivers alongside
Lorenzo, providing support from Airoha for patch review,
hardware-specific issues and ongoing driver maintenance.

Expand the file patterns to cover the entire Airoha pinctrl driver
directory and all corresponding Device Tree bindings.

Signed-off-by: Zhengping Zhang <zhengping.zhang@airoha.com>
---
 MAINTAINERS | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 93abbb315065d..15599bca4d125 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21990,10 +21990,11 @@ F:	include/linux/pinctrl/
 
 PIN CONTROLLER - AIROHA
 M:	Lorenzo Bianconi <lorenzo@kernel.org>
+M:	Zhengping Zhang <zhengping.zhang@airoha.com>
 L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
-F:	Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml
-F:	drivers/pinctrl/airoha/pinctrl-airoha.c
+F:	Documentation/devicetree/bindings/pinctrl/airoha,*pinctrl.yaml
+F:	drivers/pinctrl/airoha/
 
 PIN CONTROLLER - AMD
 M:	Basavaraj Natikar <Basavaraj.Natikar@amd.com>
-- 
2.43.0

