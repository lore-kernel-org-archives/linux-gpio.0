Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=60.244.123.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795193983;
	b=mhdiNrw2QlDW0NUJro5ifTi8ZBet8T5rBgW6Vg6cP50Vlrcp2klJ1xKOivf7mNpc/ExO
	 sYCY0MWRJjtKdNRSoA0npmClqhwoXHQqfocYz/Ng2xaOMZPizkoRKwBYex5UQMnjaHCvh
	 lQ2X1LOKB3vqM4/5mEToMX8HCUk9ewoDLbXRCjy59lGD5NHK/xdlJ8tuzSS2bEZ5V8uci
	 IJarXHuXoHClpLShjBs3aBl204D/0bfL3JaC3wg0NrD/x+uLHVje/z/ITcJCFbHP4aMlv
	 v5Bs1Vl9d0QkBAUwHkFpnVy6K9eFjKnvqB55wZ0GYhg0QLokQN+WvXH6Qjcy36lUnIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795193983;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-MTK;
	bh=WPz9ZJgzuBEKAb5zeoxlqov20rYNodQR3Ms4u1ebahc=;
	b=JAfK0XoUhffz7+9Ip4XQO28RANyfQRs+pw+AHwS8vFGCkTG6edWrsBbg9NoujPinmyYi
	 NFvR6faYkhx0iB7+Gg2Bu4J454PTPd+5RljrEm4ErVDAyHjtZrhErU7kTdDLv1uqDSe9e
	 jSz8B2MLDczwTkl1eUDQcK20gfEN6cHsFqb6n3g0D3APO7SjBwp1D37zRS1PqNag7JZXi
	 RvNzBadEQZT255j3vhaKStuNvO2ZPwp6yOFlO/+RMH7wm2jPTCOFDrVLVUvwlHvuIYhQd
	 a1gw1vXXzz/pVX6UI/KQGIAAj18ee9+E9N9YI+O63o5EnFXSj+eQ3rpGRodVW7bSWaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b="stzhKg/l";
	arc=none smtp.remote-ip=60.244.123.138
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC91060A260D;
	Fri, 20 Nov 2026 16:59:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC91060A260D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=stzhKg/l
X-UUID: c1ec084ae50311f1b1788b6acf885367-20261121
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=WPz9ZJgzuBEKAb5zeoxlqov20rYNodQR3Ms4u1ebahc=;
	b=stzhKg/lXJuWIyXK2ULsXiAQAYbZaBut71had5pah6Px331bnnH71ukNHEfNQA3hLbXzeaTXSddpz2RXM2rYON33uNidNTnT0P0x7AUcZ8nMVx3Y1+nVbfd999TTzBf7uBkGT9H52I4P5JyLeUw504p9L6UEithVnVoi9Fomgt8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:00b10ba6-2583-4e64-b451-04c1943f3935,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:62dc2131-f289-4656-bb36-27baf4489f11,B
	ulkID:nil,BulkQuantity:0,SF:102|836|865|888|898,TC:-5,Content:0|15|50|99,E
	DM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: c1ec084ae50311f1b1788b6acf885367-20261121
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <shubham.paralikar@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1021402342; Sat, 21 Nov 2026 00:59:32 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.53; Sat, 21 Nov 2026 00:59:16 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Sat, 21 Nov 2026 00:59:16 +0800
From: Shubham Paralikar <shubham.paralikar@mediatek.com>
To: Sean Wang <sean.wang@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Bartosz Golaszewski
	<brgl@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<linux-gpio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<Arnab.Layek@mediatek.com>, <Fred-WY.Chen@mediatek.com>, Shubham Paralikar
	<shubham.paralikar@mediatek.com>
Subject: [PATCH v4 0/1] pinctrl: mediatek: Add MT8901/MT8971 ACPI driver
Date: Sat, 21 Nov 2026 00:58:31 +0800
Message-ID: <20261120165908.3204369-1-shubham.paralikar@mediatek.com>
X-Mailer: git-send-email 2.45.2
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

MT8901 and MT8971 boot with ACPI firmware and both describe their
GPIO/pinctrl controller with the same _HID, NVDA9221. The existing
MediaTek Paris pinctrl drivers only probe from devicetree, so neither
SoC gets pin control, GPIOs or EINT interrupts.

This patch adds pinctrl-mtk-acpi, a small ACPI probe helper for Paris
pin controllers, and two SoC drivers on top of it, pinctrl-mt8901 and
pinctrl-mt8971. Each driver matches NVDA9221 and passes its own SoC
data to the helper, which reads the "ChipId" from the controller's
vendor _DSD and returns -ENODEV when the device belongs to the other
SoC, so the matching driver binds.

It also extends the shared Paris, common-v2 and EINT code for ACPI and
for these SoCs: resources mapped by index, ACPI _AEI event interrupts,
fixed-stride pin register layouts (MT8971), skip-listed EINTs (MT8971
PROCHOT), wake-event EINTs, EINT-only virtual GPIOs and bus-hold bias.

v4 reworks the driver structure following AngeloGioacchino's review of
v3 and fixes the problems reported by the Sashiko AI review of v3. The
full changelog is in the patch.

Known issue: MT8971 suspend behaviour of EINT215 (PROCHOT, owned by
firmware) is still under investigation.

Build tested on arm64 with both drivers as modules and built-in, with
W=1 for drivers/pinctrl/mediatek/.

Shubham Paralikar (1):
  pinctrl: mediatek: Add MT8901/MT8971 ACPI driver

 drivers/pinctrl/mediatek/Kconfig              |   33 +-
 drivers/pinctrl/mediatek/Makefile             |    3 +
 drivers/pinctrl/mediatek/mtk-eint.c           |  217 +-
 drivers/pinctrl/mediatek/mtk-eint.h           |   16 +-
 drivers/pinctrl/mediatek/pinctrl-mt8901.c     | 1471 +++++++++++
 drivers/pinctrl/mediatek/pinctrl-mt8971.c     |   91 +
 drivers/pinctrl/mediatek/pinctrl-mtk-acpi.c   |  153 ++
 drivers/pinctrl/mediatek/pinctrl-mtk-acpi.h   |   17 +
 .../pinctrl/mediatek/pinctrl-mtk-common-v2.c  |  124 +-
 .../pinctrl/mediatek/pinctrl-mtk-common-v2.h  |   31 +
 drivers/pinctrl/mediatek/pinctrl-mtk-mt8901.h | 2296 +++++++++++++++++
 drivers/pinctrl/mediatek/pinctrl-mtk-mt8971.h | 1646 ++++++++++++
 drivers/pinctrl/mediatek/pinctrl-paris.c      |   95 +-
 drivers/pinctrl/mediatek/pinctrl-paris.h      |    2 +
 include/linux/gpio/driver.h                   |    5 +
 15 files changed, 6162 insertions(+), 38 deletions(-)
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mt8901.c
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mt8971.c
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mtk-acpi.c
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mtk-acpi.h
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mtk-mt8901.h
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mtk-mt8971.h


base-commit: adcad7f4e6332cff3d6d7165f41584899f598534
-- 
2.45.2

