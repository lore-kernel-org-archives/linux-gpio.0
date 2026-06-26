Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A7D73A545E;
	Fri, 26 Jun 2026 04:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782446487; cv=none; b=QSLuFKd6d6T0PkjjfErK0+PFN4mZhwxrS3Q0IroIH1f/DEqUXbh0GXLFcbp0P/sr1acS1G0Y7iGboR1kHUURFvcan9SSLhF1JvV2gXTWNKm/eKynTdh0IV6UFGZVeP3JWrzj089UGSkbbIzrh5p5vuyES4B+cagH9Jujjvp+fOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782446487; c=relaxed/simple;
	bh=YI02LM3VCZ658m2xtkjWDZ8IdWQRK2XswZtmWLpmWvI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=h/j3H1JIoQCl45szK38YAL4TRLlm8aOhLLW8uCfwdl80O8owJiuZFrxx+fBgtWAojygxh4a7455lLFYtDcMuQDKGr5wsQWplqybhPwKL67+BngQ9puC3fXEqPnh+vzsi6bcF67m49/3yy4Rz8bYDvaCgtmy+K6jNrDsJCSA8NZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=i56k5O7a; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="i56k5O7a"
X-UUID: af69b794711311f18dc8c9802ae25ab1-20260626
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=vJB6MJYLkT0053Hx9kntgTDvNVo6MH74yqEpIZczQ+c=;
	b=i56k5O7a22x0l0I5m/o3OdYs7hBE0k2ZShKmDlubj1xacUkLoPcWVz1VvGA+HZ8+wYpfnTWqUNZj8WJr7eeBBZavWU1rRycfTS84Iv4mRKimxxtK2KSkcuQQ17wKs6mTbi0KvcmMBpnFOC1ANWheeh/bT8DB7H9zGZVDXdiP/t0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.17,REQID:083e5f4d-bec0-40de-bbe6-7a79b6a3a061,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:d497b38,CLOUDID:9862ae57-8329-46f3-8be7-5acaf04e0995,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|136|836|865|888|898,TC:-5,Content:0|
	15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: af69b794711311f18dc8c9802ae25ab1-20260626
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <justin.yeh@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 227518664; Fri, 26 Jun 2026 12:01:18 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 26 Jun 2026 12:01:17 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 26 Jun 2026 12:01:17 +0800
From: Justin Yeh <justin.yeh@mediatek.com>
To: Sean Wang <sean.wang@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	Justin Yeh <justin.yeh@mediatek.com>
Subject: [PATCH v4 19/32] pinctrl: mediatek: mt7623: Enable module build support
Date: Fri, 26 Jun 2026 12:00:48 +0800
Message-ID: <20260626040112.2436185-20-justin.yeh@mediatek.com>
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

Fixes: e7507f57a93a ("pinctrl: mediatek: add MT7623 pinctrl driver based on generic pinctrl binding")
Signed-off-by: Justin Yeh <justin.yeh@mediatek.com>
---
 drivers/pinctrl/mediatek/Kconfig          | 2 +-
 drivers/pinctrl/mediatek/pinctrl-mt7623.c | 3 +++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/mediatek/Kconfig b/drivers/pinctrl/mediatek/Kconfig
index 0d2f1872902d..a733ba63b9a7 100644
--- a/drivers/pinctrl/mediatek/Kconfig
+++ b/drivers/pinctrl/mediatek/Kconfig
@@ -98,7 +98,7 @@ config PINCTRL_MT2701
 	select PINCTRL_MTK
 
 config PINCTRL_MT7623
-	bool "MediaTek MT7623 pin control with generic binding"
+	tristate "MediaTek MT7623 pin control with generic binding"
 	depends on MACH_MT7623 || COMPILE_TEST
 	depends on OF
 	default MACH_MT7623
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt7623.c b/drivers/pinctrl/mediatek/pinctrl-mt7623.c
index 69c06c2c0e21..4db7a0ba466d 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt7623.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt7623.c
@@ -1440,3 +1440,6 @@ static int __init mtk_pinctrl_init(void)
 	return platform_driver_register(&mtk_pinctrl_driver);
 }
 arch_initcall(mtk_pinctrl_init);
+
+MODULE_DESCRIPTION("MediaTek MT7623 Pinctrl Driver");
+MODULE_LICENSE("GPL v2");
-- 
2.45.2

