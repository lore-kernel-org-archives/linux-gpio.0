Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79A4C2DCF45;
	Fri, 26 Jun 2026 01:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782437568; cv=none; b=EtZixNhxsh8DufWb9Y7f+yxtExhlGe+Tzn9Z3u35K2kbpc7+g9ku6DRT/9hQyujNdgCvXIpnW6/h+qOBNy759EpMpShiE8YWT3nOfck0XNR5ZtxjWcPOYzrEcysnayGWa24Q1PJogyqjqaSCLYgzljJXM9TahYO7tl75luign4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782437568; c=relaxed/simple;
	bh=KwDnQW6BlbHD77gSh76Tpyh7niXr1E2eSbTKUXFtwxA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oawcG+8A5/SlO6JBNKVEiAbwfCuHYpRMLJDhXFX6f4+KgnkU4746RkroaTN1ZLJLWiLSsXtYJxMEv1Yhl+14NP3j4GnUqDB66IPvk1D4WOsr1o9rjl1neclj8wrdW1/V5Ca2PBA5xYnAHrQuDMz464+5dGkPaKMBaxvOQqccOVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=faDxAk9X; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="faDxAk9X"
X-UUID: ed5cacb070fe11f1b1788b6acf885367-20260626
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=7TOAeozvnzYX3dVX6IBIGYnwcDC37B1FTztbOo2dXQg=;
	b=faDxAk9XMI2Q5Oh1plbuUmSthW15LofDKD9kPpxrQkTu2lQ0yXsbwSF975hR7M9sykn8Rd/8zrx/2xVMyHzUm7L5rdDLVqW0YFmIJ+GpmR+wd5Pcxd81ALlabmphp3+qbPAFD6jZqKZwg/06QxncCBs27iWAJSf0TmGO1stClIY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.17,REQID:336b62d3-9528-4c20-8631-e0f765d09bd6,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:d497b38,CLOUDID:9409baf7-0b89-48e7-aff3-7b92a9556644,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|136|836|865|888|898,TC:-5,Content:0|
	15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: ed5cacb070fe11f1b1788b6acf885367-20260626
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <justin.yeh@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1128084576; Fri, 26 Jun 2026 09:32:43 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 26 Jun 2026 09:32:42 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 26 Jun 2026 09:32:42 +0800
From: Justin Yeh <justin.yeh@mediatek.com>
To: Sean Wang <sean.wang@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	Justin Yeh <justin.yeh@mediatek.com>
Subject: [PATCH v2 29/32] pinctrl: mediatek: mt6397: Enable module build support
Date: Fri, 26 Jun 2026 09:31:55 +0800
Message-ID: <20260626013217.2373808-30-justin.yeh@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260626013217.2373808-1-justin.yeh@mediatek.com>
References: <20260626013217.2373808-1-justin.yeh@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

Add MODULE_LICENSE("GPL") macro and change Kconfig option from
bool to tristate to allow building as a loadable kernel module.

This is required for Android GKI + vendor_dlkm deployments where
vendor-specific drivers must be kept separate from the GKI vmlinux.

Fixes: fc59e66c4284 ("pinctrl: mediatek: Add Pinctrl/GPIO driver for mt6397.")
Signed-off-by: Justin Yeh <justin.yeh@mediatek.com>
---
 drivers/pinctrl/mediatek/Kconfig          | 2 +-
 drivers/pinctrl/mediatek/pinctrl-mt6397.c | 3 +++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/mediatek/Kconfig b/drivers/pinctrl/mediatek/Kconfig
index 753828bec3a2..6def2f2da6b3 100644
--- a/drivers/pinctrl/mediatek/Kconfig
+++ b/drivers/pinctrl/mediatek/Kconfig
@@ -323,7 +323,7 @@ config PINCTRL_MT8516
 
 # For PMIC
 config PINCTRL_MT6397
-	bool "MediaTek MT6397 pin control"
+	tristate "MediaTek MT6397 pin control"
 	depends on MFD_MT6397 || COMPILE_TEST
 	depends on OF
 	default MFD_MT6397
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt6397.c b/drivers/pinctrl/mediatek/pinctrl-mt6397.c
index 03d0f65d7bcc..6b1eae4937e6 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt6397.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt6397.c
@@ -59,3 +59,6 @@ static struct platform_driver mtk_pinctrl_driver = {
 };
 
 builtin_platform_driver(mtk_pinctrl_driver);
+
+MODULE_DESCRIPTION("MediaTek MT6397 Pinctrl Driver");
+MODULE_LICENSE("GPL");
-- 
2.45.2

