Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57BC43D3CE2;
	Thu,  9 Jul 2026 06:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783578906; cv=none; b=PHu+W5GSC5xtShfzi22XpmKiHylFHt1inOrZu5gHSBm+kcfjAnJaMaL1LFu5bJGxzAcfpVycHrvwbnrtTQazz9PZSpw9NAXkxCvu/z96pNdvLeOYacxjCp9rXCawg334HXodWdyWYfFQDaGkwfDdLvaS0qFE/nT8nma4eS8CXAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783578906; c=relaxed/simple;
	bh=VaF73BRK8yFmbIt4r0OavjxZHo9bBA/JIIKKOWfjL0c=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jxdEuCvxrZw2JXhzJRZxLtu9UkUkwcSrxNuw1vgFgE4I6JPb5hy8ORDnDoUsTOQObqvTYcDqZ0dDIuSa69bddNF9vHV8erGZAA3JyrQIDkqO6cRW1iVtEDnxm+TxIS08uLuSocylgpZuUv1PtXELGK/2a9H1lZJp1TSoiL6xf+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=kSkOMtZA; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="kSkOMtZA"
X-UUID: 4e9672167b6011f1b1788b6acf885367-20260709
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=lDykNvXLA1BKy9kn6LHhkusEVdd4zEA8zctKSoB6T54=;
	b=kSkOMtZAzGPAbUdYixpvmKMlq0IRQl+YoZFBGYTWBLA21b45rGxcgfVuH/NIT9E1WHY7g6ai8af5wuZDkm5UE8OAtB5QBmuPEXUmULllZChzozqtgOn8+00SvaCyED/XIcSJLy8xk6J2tsFa52DEWT8rbYMLECvUJSe3ChS/Uew=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.17,REQID:96bee9e9-90e9-4aee-90e1-c44395933950,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:d497b38,CLOUDID:cc8fe818-ab14-4403-9336-76696324c5a8,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,
	OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 4e9672167b6011f1b1788b6acf885367-20260709
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
	(envelope-from <justin.yeh@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1719929460; Thu, 09 Jul 2026 14:34:59 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 9 Jul 2026 14:34:57 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 9 Jul 2026 14:34:57 +0800
From: Justin Yeh <justin.yeh@mediatek.com>
To: Sean Wang <sean.wang@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	Justin Yeh <justin.yeh@mediatek.com>
Subject: [PATCH v5 3/4] pinctrl: mediatek: mt7986: register both platform drivers from a single initcall
Date: Thu, 9 Jul 2026 14:33:48 +0800
Message-ID: <20260709063450.1615041-4-justin.yeh@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260709063450.1615041-1-justin.yeh@mediatek.com>
References: <20260709063450.1615041-1-justin.yeh@mediatek.com>
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
---
 drivers/pinctrl/mediatek/pinctrl-mt7986.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mt7986.c b/drivers/pinctrl/mediatek/pinctrl-mt7986.c
index 5dda4b7467fd..8dae91530d9b 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt7986.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt7986.c
@@ -997,15 +997,14 @@ static struct platform_driver mt7986b_pinctrl_driver = {
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
-- 
2.45.2

