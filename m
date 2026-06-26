Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 462EF319852;
	Fri, 26 Jun 2026 01:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782437577; cv=none; b=DcswHqnzjPNIrrkDFiHDln30FH0KZUGsbalw9XBjqFiErYIKUZrS5alhGa3TNYaVMphMQvC6fMkuGeNLqCJqs49VFOYCJiaglL4cL8rhm+lIoXnVHxBRQhUpW/Uy384RMcL80tp9CuzhJvvHCKbTQUbIe4A76nwGBOaFoY1j6d8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782437577; c=relaxed/simple;
	bh=Qm2+LQsl63kY/EAe7xXeIGXvjH1ypeHpQ7PgeT/Ymz4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mcPTFHP+QqME3DFL/pSnAiKDXDLBzohclB9ve6qtVve9Lgd153z+W4O00LZ8GtVeuX/iEutOxPyX2utEv64hG9Jj0jZ3UzBg2vMyaiOeN5e+R6PAL6pDo72yBpNV0E+wuf2dKh0KQr65eeCO3F+5+UJIl1DN5jyj6dr14GBINGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=hMcRbYBq; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="hMcRbYBq"
X-UUID: eb9709ac70fe11f18dc8c9802ae25ab1-20260626
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=dslET+hto4up1v2xLyYS/z650G/wO1ARd3McFDJ2JRM=;
	b=hMcRbYBq7Ia126oxEXE/ehdzgSX8+3jUOWGSVH6gd5pe3+TadLwdR0VdbDz4hTkXVwa3OkycPGnwOhgOszOTCEuZzFsE/IruH/4bJwwLkLBJz5ogVW+YlCzzjHcS15GH8rRKkPSdhr950NPLoWWy+aQHwfZ1PfUUt9P3M2ScrGI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.17,REQID:cef227b6-3f14-4cb8-8571-cfedeb2eb249,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:d497b38,CLOUDID:7d09baf7-0b89-48e7-aff3-7b92a9556644,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|136|836|865|888|898,TC:-5,Content:0|
	15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: eb9709ac70fe11f18dc8c9802ae25ab1-20260626
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <justin.yeh@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1795930809; Fri, 26 Jun 2026 09:32:40 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 26 Jun 2026 09:32:39 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 26 Jun 2026 09:32:38 +0800
From: Justin Yeh <justin.yeh@mediatek.com>
To: Sean Wang <sean.wang@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	Justin Yeh <justin.yeh@mediatek.com>
Subject: [PATCH v2 03/32] pinctrl: mediatek: mt6893: Enable module build support
Date: Fri, 26 Jun 2026 09:31:29 +0800
Message-ID: <20260626013217.2373808-4-justin.yeh@mediatek.com>
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

Fixes: 8004507179c8 ("pinctrl: mediatek: Add pinctrl driver for MT6893 Dimensity 1200")

Signed-off-by: Justin Yeh <justin.yeh@mediatek.com>
---
 drivers/pinctrl/mediatek/Kconfig          | 2 +-
 drivers/pinctrl/mediatek/pinctrl-mt6893.c | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/mediatek/Kconfig b/drivers/pinctrl/mediatek/Kconfig
index 2859ac27dbfd..3e4002a6ce78 100644
--- a/drivers/pinctrl/mediatek/Kconfig
+++ b/drivers/pinctrl/mediatek/Kconfig
@@ -192,7 +192,7 @@ config PINCTRL_MT6878
 	  on the MediaTek MT6878 SoC.
 
 config PINCTRL_MT6893
-	bool "MediaTek Dimensity MT6893 pin control"
+	tristate "MediaTek Dimensity MT6893 pin control"
 	depends on OF
 	depends on ARM64 || COMPILE_TEST
 	default ARM64 && ARCH_MEDIATEK
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt6893.c b/drivers/pinctrl/mediatek/pinctrl-mt6893.c
index 468ce0109b07..b4d8bec8a481 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt6893.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt6893.c
@@ -877,3 +877,4 @@ static int __init mt6893_pinctrl_init(void)
 arch_initcall(mt6893_pinctrl_init);
 
 MODULE_DESCRIPTION("MediaTek MT6893 Pinctrl Driver");
+MODULE_LICENSE("GPL");
-- 
2.45.2

