Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78B013002B3;
	Fri, 26 Jun 2026 01:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782438299; cv=none; b=NuPM9zg39Gwo3Z1b493BrdXrqceLacmq91psmEJ4DMusZ1OS9jVMlUWlm2ZqqAOMY+Xm2u3GnVTmPlihdSeHElaOyUQMlGCsmkdZ4DvCbxcp3Mns9ZzpNX7Qd55UE83n2RDA/wxgEGOaWMkCrTidCsL8QV7rtYbVpcsy16dNc9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782438299; c=relaxed/simple;
	bh=rf/o4RGJor7PfT38r/pw7wcV8Yb3LQfKfFL21EE9cb0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sQzlc2DCkQN1yKRgKLJzE4At9DmbMAgGyAKYpheLvtD0MhTkHkIbTbu5zJDPc5Lqe+G2T12t08W3bwOsX8r7qs14fupnyxEkPsvKR8k00mCG3QceErbiws5RvG5i3FT2FyXxYY5mWJ6PnfXjIBPPM49euozbzZHQcqaFsXlOy3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=kWHi1Kmd; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="kWHi1Kmd"
X-UUID: 9e95522e710011f18dc8c9802ae25ab1-20260626
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=ZXPPYuDqrpEix9948r4BXB/eaFdUWRMZZvgPqOeWUMc=;
	b=kWHi1Kmdfq+irmMF0odLeJubYK+H5KjvitvelebBIIIuETt6rV46MxSDb0fbEGfiPgeozwaJuCTiSKmIU8TJegFkcWt2tnWen3X2GvOw5h0oT0BPnUqQD43l1iX9/Bv3KO1bZCmAOb9c3XKwjhOMlj3z1DZjseUkrwZ0jvjdEoY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.17,REQID:551ecec2-107d-4b45-aa9b-22b209e1d7ed,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:d497b38,CLOUDID:f925baf7-0b89-48e7-aff3-7b92a9556644,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|136|836|865|888|898,TC:-5,Content:0|
	15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 9e95522e710011f18dc8c9802ae25ab1-20260626
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <justin.yeh@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1562439126; Fri, 26 Jun 2026 09:44:49 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 26 Jun 2026 09:44:49 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 26 Jun 2026 09:44:49 +0800
From: Justin Yeh <justin.yeh@mediatek.com>
To: Sean Wang <sean.wang@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	Justin Yeh <justin.yeh@mediatek.com>
Subject: [PATCH v3 26/32] pinctrl: mediatek: rt2880: Enable module build support
Date: Fri, 26 Jun 2026 09:44:25 +0800
Message-ID: <20260626014442.2378513-27-justin.yeh@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260626014442.2378513-1-justin.yeh@mediatek.com>
References: <20260626014442.2378513-1-justin.yeh@mediatek.com>
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

Fixes: dc6ae2057c9c ("pinctrl: ralink: move to mediatek as mtmips")
Signed-off-by: Justin Yeh <justin.yeh@mediatek.com>
---
 drivers/pinctrl/mediatek/Kconfig          | 2 +-
 drivers/pinctrl/mediatek/pinctrl-rt2880.c | 3 +++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/mediatek/Kconfig b/drivers/pinctrl/mediatek/Kconfig
index 19593279109d..d596d7c742dc 100644
--- a/drivers/pinctrl/mediatek/Kconfig
+++ b/drivers/pinctrl/mediatek/Kconfig
@@ -69,7 +69,7 @@ config PINCTRL_MT76X8
 	select PINCTRL_MTK_MTMIPS
 
 config PINCTRL_RT2880
-	bool "Ralink RT2880 pin control"
+	tristate "Ralink RT2880 pin control"
 	depends on SOC_RT288X || COMPILE_TEST
 	depends on RALINK
 	default SOC_RT288X
diff --git a/drivers/pinctrl/mediatek/pinctrl-rt2880.c b/drivers/pinctrl/mediatek/pinctrl-rt2880.c
index e0366721a515..147bcd810d9e 100644
--- a/drivers/pinctrl/mediatek/pinctrl-rt2880.c
+++ b/drivers/pinctrl/mediatek/pinctrl-rt2880.c
@@ -59,3 +59,6 @@ static int __init rt2880_pinctrl_init(void)
 	return platform_driver_register(&rt2880_pinctrl_driver);
 }
 core_initcall_sync(rt2880_pinctrl_init);
+
+MODULE_DESCRIPTION("MediaTek RT2880 Pinctrl Driver");
+MODULE_LICENSE("GPL");
-- 
2.45.2

