Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E955737A847;
	Mon, 10 Aug 2026 13:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786367079; cv=none; b=GZZo0okZEwn7UWi29hRZNE62ce3ipeo0A6wHz4oHjFdm/gutQr5bMIVn6TXtXKPRnHSUezfNtWjpmWtxvMpPQkJZs1qcIPrkm84xK2kPVzknC3tDOIN5azfBkPikjCqzDFvnzi4KLcDIzL2RweouhG8sTw+XrDwxfiMadidOetU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786367079; c=relaxed/simple;
	bh=Oi4GTcVKmmi1iIXH/BvW+DBC2WkWyHc65XEe4SG8f+4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tj4MbhWgBN3OrXENXzEbWwJ+WBybLzLD8ifmlWiaDwDRx5OnNf+/xCS5H00oLQPZP9RGVM61Cck5ztJLk/6eFnuVhcGHUSMwux5ipsHp6K8gqynD4ShhikSHZ8gXKAja01GQiZvuiC2vxB+k/P+oDH6RiKMrttYV7rgbx7NK+Q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n68z9EBS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n68z9EBS"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4682DC2BCF7;
	Mon, 10 Aug 2026 13:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786367078;
	bh=Oi4GTcVKmmi1iIXH/BvW+DBC2WkWyHc65XEe4SG8f+4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=n68z9EBSpPJxiMbNZlgS4Krjl6rZ5o49wzo+P54A0mgbRF8aL9sg6fSiT2C7fJEGk
	 lXrG4bZ1HXta5zUwlaODR7WcLlqmMSyRDEv+r4H0fmX2lAyF1Sno5YBf15blCh054T
	 fvyfWwvHFdJ15+JfuXCxqCHaCuCg5RcJYt8ZjaF9qHH5CakWW28PGtkoVPc4hwKlMW
	 8jNXBBeu/8DgEz8t0gyYgqprOrfmTxFDWpC/RyETCH4X89MkXl6c+BlymI9oS0M0gj
	 RgIX0jjxnLxPp1bbWgrntEeqVbaTIU1WJ3lgIotAT07DS1/QOoE1IMXSNhL6eQGYGN
	 f2ld1r3eApS1A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25DC9C5B56A;
	Mon, 10 Aug 2026 13:04:38 +0000 (UTC)
From: Miao Wang via B4 Relay <devnull+shankerwangmiao.gmail.com@kernel.org>
Date: Mon, 10 Aug 2026 21:04:25 +0800
Subject: [PATCH RFC v8 2/8] mfd: ls2kbmc: Sanity check for the connected
 pci port
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260810-ls2kbmc-mod-v8-2-16e44f7322f4@gmail.com>
References: <20260810-ls2kbmc-mod-v8-0-16e44f7322f4@gmail.com>
In-Reply-To: <20260810-ls2kbmc-mod-v8-0-16e44f7322f4@gmail.com>
To: Binbin Zhou <zhoubinbin@loongson.cn>, 
 Chong Qiao <qiaochong@loongson.cn>, Lee Jones <lee@kernel.org>, 
 Huacai Chen <chenhuacai@kernel.org>, Corey Minyard <corey@minyard.net>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: Xi Ruoyao <xry111@xry111.site>, WANG Xuerui <kernel@xen0n.name>, 
 Yinbo Zhu <zhuyinbo@loongson.cn>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 mfd@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, openipmi-developer@lists.sourceforge.net, 
 Miao Wang <shankerwangmiao@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2625;
 i=shankerwangmiao@gmail.com; s=20250715; h=from:subject:message-id;
 bh=/Lr4vPc1caTNdLxJjHXD0ez/C7ATtTCBQ8ReLhje6Eg=;
 b=owEBbQKS/ZANAwAKAbAx48p7/tluAcsmYgBqecxjWTKnhUVNbEpdlZXhBpWJvFtlOYOE4tBqB
 rxNqfLbxSKJAjMEAAEKAB0WIQREqPWPgPJBxluezBOwMePKe/7ZbgUCannMYwAKCRCwMePKe/7Z
 bigaD/sEJogHOgHPhc0+ZbcC2O7wX8G6LgQM1YBmOZo3OrHy9Z+dUZDT9UrnljmmcrVzMJvw9s0
 2/HL3ZdUy6aSFG1ver0zmZemXLR/HpNSOIerPdPZ17xL7yvtF313LNwGqdQnLn0evbF7kYHGAVQ
 mHH7lLDz7bk2WgryxlVUKUeAXfln/J+LhthN3QIQogEq5WzgJtjgmNbtnqobI1EIZ6RxxnA+Kgv
 7+HpvtgWAm+6xoWzkFans7l9HDQmFbwZmqbpdruuw9bJUd6wXorActjt1LqWxB7H+Ell5/SnPCk
 euMVq6i4q8//ZEep6tMWu6Q2LgjvScP04FoOYvtVEjv3leb6pOeHGngHe0oeIh4Fg6hgZ3CtjFm
 M8jBrJ0yZJ2Ho6yd73r4B1OimhEsc7nvc133qasorBewshqRoAlp9SqhF6hyqzfGrkiAQ3I0Q6Z
 H4cV1fXyBWPo7uDOGhTjilk/CmHyqasQT0oTzu/5CJPEBn1t9ScWaRD8Yky6tYraaCnBCkRWo4B
 RBobfCUo77uL/UqW2CZnSEHJa7J2qQzyDAScLLwid5VwUgEMSMtbnoa2r3vGbajf9bgKAAdHhhb
 pVxv2ywUGjOGGkJVhOx9d46VkMLxgtrQdSsy4mhb2jIzJHTECLp0FXt18SOIShrI6s5tDSWQKrR
 iLT8zOpIkxmdMHQ==
X-Developer-Key: i=shankerwangmiao@gmail.com; a=openpgp;
 fpr=6FAEFF06B7D212A774C60BFDFA0D166D6632EF4A
X-Endpoint-Received: by B4 Relay for shankerwangmiao@gmail.com/20250715
 with auth_id=462
X-Original-From: Miao Wang <shankerwangmiao@gmail.com>
Reply-To: shankerwangmiao@gmail.com

From: Miao Wang <shankerwangmiao@gmail.com>

When the bmc resets, the recovery procedure require to reconfigure the
parent device. The driver assumes that the parent device should be LS7A.
Add a sanity check on initialization to ensure this and prevent from
accidentally operating on non-LS7A ports.

Fixes: d952bba3fbb5 ("mfd: ls2kbmc: Add Loongson-2K BMC reset function support")
Signed-off-by: Miao Wang <shankerwangmiao@gmail.com>
---
 drivers/mfd/ls2k-bmc-core.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/mfd/ls2k-bmc-core.c b/drivers/mfd/ls2k-bmc-core.c
index 335590392240ba1e13a2bdf6f9f4efddec045f40..434db99ee501be8e18de7258af0f465fc16c0709 100644
--- a/drivers/mfd/ls2k-bmc-core.c
+++ b/drivers/mfd/ls2k-bmc-core.c
@@ -35,6 +35,15 @@
 #define LS2K_IPMI3_RES_START		(LS2K_IPMI2_RES_START + LS2K_IPMI_RES_SIZE)
 #define LS2K_IPMI4_RES_START		(LS2K_IPMI3_RES_START + LS2K_IPMI_RES_SIZE)
 
+/* LS7A port Device IDs */
+#define DEV_LS7A1K_PCIE_PORT0	0x7a09
+#define DEV_LS7A1K_PCIE_PORT1	0x7a19
+#define DEV_LS7A1K_PCIE_PORT2	0x7a29
+#define DEV_LS7A2K_PCIE_PORT0	0x7a39
+#define DEV_LS7A2K_PCIE_PORT1	0x7a49
+#define DEV_LS7A2K_PCIE_PORT2	0x7a59
+#define DEV_LS7A2K_PCIE_PORT3	0x7a69
+
 #define LS7A_PCI_CFG_SIZE		0x100
 
 /* LS7A bridge registers */
@@ -490,6 +499,24 @@ static int ls2k_bmc_parse_mode(struct pci_dev *pdev, struct simplefb_platform_da
 	return ret;
 }
 
+static const struct pci_device_id ls7a_ports[] = {
+	{ PCI_DEVICE(PCI_VENDOR_ID_LOONGSON, DEV_LS7A1K_PCIE_PORT0) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_LOONGSON, DEV_LS7A1K_PCIE_PORT1) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_LOONGSON, DEV_LS7A1K_PCIE_PORT2) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_LOONGSON, DEV_LS7A2K_PCIE_PORT0) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_LOONGSON, DEV_LS7A2K_PCIE_PORT1) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_LOONGSON, DEV_LS7A2K_PCIE_PORT2) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_LOONGSON, DEV_LS7A2K_PCIE_PORT3) },
+	{ }
+};
+
+static bool ls2k_check_parent(struct pci_dev *dev)
+{
+	struct pci_dev *parent = dev->bus->self;
+
+	return parent && pci_match_id(ls7a_ports, parent) != NULL;
+}
+
 static int ls2k_bmc_probe(struct pci_dev *dev, const struct pci_device_id *id)
 {
 	struct simplefb_platform_data pd;
@@ -501,6 +528,11 @@ static int ls2k_bmc_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	if (ret)
 		return ret;
 
+	if (!ls2k_check_parent(dev)) {
+		dev_err(&dev->dev, "Expected to be connected to LS7A PCI-E port\n");
+		return -ENODEV;
+	}
+
 	ddata = devm_kzalloc(&dev->dev, sizeof(*ddata), GFP_KERNEL);
 	if (!ddata)
 		return -ENOMEM;

-- 
2.49.0


