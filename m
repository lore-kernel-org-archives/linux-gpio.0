Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 799113B42F8;
	Mon, 13 Jul 2026 08:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783931906; cv=none; b=fY9G3X9CfjNUdE5Kt0xxnobigOCjVOS40aKT1k5b225DPYxFWMIFqUF8kiCYggC+t243F+VMo6NoaxdypYJrYnhHfy53ebiRMKpixtHmizijt93ow2YdxrJcMYnpecoBUT2LysWCUnHc+BwUC2fYLTrXTyNr7JraRoXpxK4lQ8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783931906; c=relaxed/simple;
	bh=/+UZDeEgCJT8LkE0ipsaNWZCfsAI5TC4kqDuiGFGSds=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ASRO56j2n0WgAXEAwaHyxyteRJVr1FSahPfr0yTu/NBPeUvy8av7ohMJ3yB2Y7PHaI4C27b1+MUjNC/Vk/P3pjLpivThUBABX1KQffZBMrMtDndh0UESIwkrbNK3U0+oqSSOqWycghSP50h6eegwPjuzKmZ7oLETIBiBk7qIS/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=LVC+5JVD; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="LVC+5JVD"
X-UUID: 30d5688e7e9611f18dc8c9802ae25ab1-20260713
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=N1W2wqKCJbOZw8CgB2iZJKooo+2PL+bi2PCu+HXC33g=;
	b=LVC+5JVDCUzA2BQfNfIeWORxxu28em41kZ5DZSIFpi0EkUpwzOItaHN1GLOpeACrpEfPaVFib+yR0r+M/PPBqsXHJEIJb2OtVJZh7Fh8szMnNsIAEtVogsuWjhYvGaUYSawcpANmiCXNLbhrSRj57Srgx29GqPT+fylePiKif6Y=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.17,REQID:74f699fc-1c33-412c-86ee-748c7efe1225,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:d497b38,CLOUDID:815c0f19-ab14-4403-9336-76696324c5a8,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,
	OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 30d5688e7e9611f18dc8c9802ae25ab1-20260713
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <justin.yeh@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1321423544; Mon, 13 Jul 2026 16:38:15 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 13 Jul 2026 16:38:13 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 13 Jul 2026 16:38:14 +0800
From: Justin Yeh <justin.yeh@mediatek.com>
To: Sean Wang <sean.wang@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	Justin Yeh <justin.yeh@mediatek.com>, Chen-Yu Tsai <wenst@chromium.org>
Subject: [PATCH v6 4/5] pinctrl: mediatek: mt7986: register both platform drivers from a single initcall
Date: Mon, 13 Jul 2026 16:37:56 +0800
Message-ID: <20260713083808.168957-5-justin.yeh@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260713083808.168957-1-justin.yeh@mediatek.com>
References: <20260713083808.168957-1-justin.yeh@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

The MT7986 driver registers two separate platform drivers (mt7986a and
mt7986b) and used to call arch_initcall() twice, once for each.

This is fine while the driver is built-in, but a single translation unit
can only provide one module_init(). Since arch_initcall() expands to
module_init() when built as a module, having two of them would break the
module build with a redefinition of init_module()/__inittest().

Fold both platform drivers into a single driver array and register them
from one initcall using platform_register_drivers(), matching the shape of
the other MediaTek pinctrl SoC drivers. platform_register_drivers() also
rolls back the first registration if the second one fails.

No functional change for built-in builds; this is a preparatory cleanup
for enabling module builds.

Signed-off-by: Justin Yeh <justin.yeh@mediatek.com>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/pinctrl/mediatek/pinctrl-mt7986.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mt7986.c b/drivers/pinctrl/mediatek/pinctrl-mt7986.c
index ca468115765b..d7c7591ed231 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt7986.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt7986.c
@@ -997,17 +997,16 @@ static struct platform_driver mt7986b_pinctrl_driver = {
 	.probe = mt7986b_pinctrl_probe,
 };
 
-static int __init mt7986a_pinctrl_init(void)
-{
-	return platform_driver_register(&mt7986a_pinctrl_driver);
-}
+static struct platform_driver * const mt7986_pinctrl_drivers[] = {
+	&mt7986a_pinctrl_driver,
+	&mt7986b_pinctrl_driver,
+};
 
-static int __init mt7986b_pinctrl_init(void)
+static int __init mt7986_pinctrl_init(void)
 {
-	return platform_driver_register(&mt7986b_pinctrl_driver);
+	return platform_register_drivers(mt7986_pinctrl_drivers,
+					 ARRAY_SIZE(mt7986_pinctrl_drivers));
 }
-
-arch_initcall(mt7986a_pinctrl_init);
-arch_initcall(mt7986b_pinctrl_init);
+arch_initcall(mt7986_pinctrl_init);
 
 MODULE_IMPORT_NS("MTK_PINCTRL");
-- 
2.45.2

