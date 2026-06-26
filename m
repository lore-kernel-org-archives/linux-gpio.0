Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9901392C2E;
	Fri, 26 Jun 2026 04:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782446485; cv=none; b=le7SwQyi13Ozl1odYEiNHqTlXHiDiQGgPpPX2+c4ayDDgzlLJeeGBAPI5CAR4ARPGAe0KSaOYnge4JMKGCSuAX9J47ciuAKhbnbMyqgKPpANH/gyNSxQz2MavPfPzy3gLe/nYrl1MZkDE0B0Q1hfjdV1G9oW4gFP89FJhM+J0RE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782446485; c=relaxed/simple;
	bh=VS0huu3qLyncxL5rw6bqhaNY0kXV5kcFt5XrjBFKQV0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JCqB85XMbX7BnXsiiR78NDHIWMo2gDYFa1vpUUl0cxwvNo881htl2OstM7Q1FTd5jzr6RPCLUZpkuzEh0fX0/GKIHe9ROLN9oX+LppKyXndCO4R+qVWARE19FLqITfH5BYLos5/FlCCecahhrUuj1jHyYevzh2j8O4o5kwDknf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=RJNqwkpz; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="RJNqwkpz"
X-UUID: af0938d8711311f18dc8c9802ae25ab1-20260626
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=d7KzAH/SxiVGfC720iPhg1haqLWf7NAKihIlO+P2078=;
	b=RJNqwkpzfLWZHRkp8b5O2ULhTrtY/YuQ+Ip1kxw0YeD07YuqvuUd7qOsCtFnsDPha2Xcb7DV0TyABdh8JJd/Fg4HrCwgB4ePm2W+zlNybQLHCsKis89xtprI5AQP6uBcwO8GPQUZge74AmHPJeBgcvpWpA0/Zt1t2bBlhiL6oiQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.17,REQID:1428c6b7-aad2-498c-9d32-0a72dc117017,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:d497b38,CLOUDID:053e21ee-45e6-4692-a476-3f71842ee83b,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|136|836|865|888|898,TC:-5,Content:0|
	15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: af0938d8711311f18dc8c9802ae25ab1-20260626
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <justin.yeh@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1332572839; Fri, 26 Jun 2026 12:01:18 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 26 Jun 2026 12:01:16 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 26 Jun 2026 12:01:16 +0800
From: Justin Yeh <justin.yeh@mediatek.com>
To: Sean Wang <sean.wang@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	Justin Yeh <justin.yeh@mediatek.com>
Subject: [PATCH v4 14/32] pinctrl: mediatek: mt8195: Enable module build support
Date: Fri, 26 Jun 2026 12:00:43 +0800
Message-ID: <20260626040112.2436185-15-justin.yeh@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260626040112.2436185-1-justin.yeh@mediatek.com>
References: <20260626040112.2436185-1-justin.yeh@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

Add MODULE_LICENSE("GPL v2") macro and change Kconfig option from
bool to tristate to allow building as a loadable kernel module.

This is required for Android GKI + vendor_dlkm deployments where
vendor-specific drivers must be kept separate from the GKI vmlinux.

Fixes: 6cf5e9ef362a ("pinctrl: add pinctrl driver on mt8195")
Signed-off-by: Justin Yeh <justin.yeh@mediatek.com>
---
 drivers/pinctrl/mediatek/Kconfig          | 2 +-
 drivers/pinctrl/mediatek/pinctrl-mt8195.c | 3 +++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/mediatek/Kconfig b/drivers/pinctrl/mediatek/Kconfig
index 10727eb24512..1f02ec79be0e 100644
--- a/drivers/pinctrl/mediatek/Kconfig
+++ b/drivers/pinctrl/mediatek/Kconfig
@@ -274,7 +274,7 @@ config PINCTRL_MT8192
 	select PINCTRL_MTK_PARIS
 
 config PINCTRL_MT8195
-	bool "MediaTek MT8195 pin control"
+	tristate "MediaTek MT8195 pin control"
 	depends on OF
 	depends on ARM64 || COMPILE_TEST
 	default ARM64 && ARCH_MEDIATEK
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8195.c b/drivers/pinctrl/mediatek/pinctrl-mt8195.c
index 83345c52b2fa..8d893d57f14f 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt8195.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt8195.c
@@ -978,3 +978,6 @@ static int __init mt8195_pinctrl_init(void)
 	return platform_driver_register(&mt8195_pinctrl_driver);
 }
 arch_initcall(mt8195_pinctrl_init);
+
+MODULE_DESCRIPTION("MediaTek MT8195 Pinctrl Driver");
+MODULE_LICENSE("GPL v2");
-- 
2.45.2

