Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1A2B3A5E71;
	Fri, 26 Jun 2026 04:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782446490; cv=none; b=NaQgsHV1I/UPOjPHIYdBSJ7PDthz/XNtwsI7wJUZOOlwp0PRA4RGb6nTPqTTPoT3ZBPCXNPR0K+wQgIqxGVvyh3s905oW1P6Q1D0lZtSdIX2wTpj1vr1mHEla7OLP91MWEgrGWiAXbXTjqVQ5e+PGQP10+sdPoA7B0xW5HEGNbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782446490; c=relaxed/simple;
	bh=ddNqQ4Hz01Obk5OLldxnLg4jMpsEUQloj/k9nC/mxhY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SjydtFHRy5qCqF4g+9QUsfxvLug1jgPsQYvPm+r56WcxpMKKPo5FEu+nrJTUJwIfK7XmJ1nyKBjky0YLEaIeFkI+JnG2rdNkALU6kNl1UpKclCnMaUlaTThmL3QOGShdg8tRx7UQ0U6qswlOQ4QmcWzbR23lFsvroGd54MSeYZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=YAQN3rAE; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="YAQN3rAE"
X-UUID: af78f272711311f1b1788b6acf885367-20260626
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=+nMNDyWiaEwWNZA9Myz0r4QN/C2IrKgDy54wDaGziwY=;
	b=YAQN3rAEw6q/USmYnNkGNSnkZymd0dFaf20puDVRa6N3v3DnkrPBja/P/ZJ/4rD5agsukDkcX2XoiT4rhVEDbW9lfeYwO3iqWSck5QaR+Zbt6RMkD9OzW8Bf/pcuueHGtO3s8zFuy4fzgcv3tZQmn8CZI6oIE2abCoEfXo2M1NM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.17,REQID:535aa193-5227-409e-be11-0878db1204e2,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:d497b38,CLOUDID:d4dd476c-fcbe-4ae1-b366-24fa403b735d,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|136|836|865|888|898,TC:-5,Content:0|
	15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: af78f272711311f1b1788b6acf885367-20260626
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <justin.yeh@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1164058908; Fri, 26 Jun 2026 12:01:18 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
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
Subject: [PATCH v4 20/32] pinctrl: mediatek: mt7629: Enable module build support
Date: Fri, 26 Jun 2026 12:00:49 +0800
Message-ID: <20260626040112.2436185-21-justin.yeh@mediatek.com>
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

Fixes: b44677375fee ("pinctrl: mediatek: add pinctrl support for MT7629 SoC")
Signed-off-by: Justin Yeh <justin.yeh@mediatek.com>
---
 drivers/pinctrl/mediatek/Kconfig          | 2 +-
 drivers/pinctrl/mediatek/pinctrl-mt7629.c | 3 +++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/mediatek/Kconfig b/drivers/pinctrl/mediatek/Kconfig
index a733ba63b9a7..54e44dced287 100644
--- a/drivers/pinctrl/mediatek/Kconfig
+++ b/drivers/pinctrl/mediatek/Kconfig
@@ -105,7 +105,7 @@ config PINCTRL_MT7623
 	select PINCTRL_MTK_MOORE
 
 config PINCTRL_MT7629
-	bool "MediaTek MT7629 pin control"
+	tristate "MediaTek MT7629 pin control"
 	depends on MACH_MT7629 || COMPILE_TEST
 	depends on OF
 	default MACH_MT7629
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt7629.c b/drivers/pinctrl/mediatek/pinctrl-mt7629.c
index cc0694881ac9..d765e4382629 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt7629.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt7629.c
@@ -449,3 +449,6 @@ static int __init mt7629_pinctrl_init(void)
 	return platform_driver_register(&mt7629_pinctrl_driver);
 }
 arch_initcall(mt7629_pinctrl_init);
+
+MODULE_DESCRIPTION("MediaTek MT7629 Pinctrl Driver");
+MODULE_LICENSE("GPL v2");
-- 
2.45.2

