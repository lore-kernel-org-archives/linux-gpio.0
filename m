Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F25518859B;
	Tue, 11 Aug 2026 08:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786435663; cv=none; b=fA2vyJiN0BMSVD+AssBixu1K1j7qYHuXlxFLSBR22pWU0zmrHngmrlTp7ncbCsHPsofkw/0i8l6Y8x5SX3OTY9nvx4Zc65aTktcM14zCcyqLb5sk2gIJIvkc+Vw1U5LbZjVTe7MuP9GpnCkamoP2l6Nj/9XprBj0qNzA5UkL9ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786435663; c=relaxed/simple;
	bh=Oi4GTcVKmmi1iIXH/BvW+DBC2WkWyHc65XEe4SG8f+4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ku9c6NnKAMoueSwG81k63PZqx6+iMPZUdnNx9A9HLQQ/zXBtZXZtzAIzuMs5s3/cOrJKMnRP8QTOmIZbRictyTPZo1b3rXPEVMukUGelj48SQgx2NQz7cp6Kzy9N0ibxAVd8IrkEI97m2yZhYeYg+1mhYjhzW59wdgALeK/gI+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HWiHZ6YR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HWiHZ6YR"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 150BDC2BCF7;
	Tue, 11 Aug 2026 08:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786435663;
	bh=Oi4GTcVKmmi1iIXH/BvW+DBC2WkWyHc65XEe4SG8f+4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=HWiHZ6YRBEg2Boo99MK29Uhr+enH4M+n95yvhgxzG4BmjGKSipDtURpuVrWSC6yBW
	 x0FGVJukw5TEjCoPvC8hXdw+KtSKDRD5O+ZTZTQdj5nByGCNwofbERIW4bdczcPcqe
	 1lsbkBP5evM+0eKumHKQ75D0C+lO3eow9/TXzm/jaFbTV6twW+kO6LtCnOJ330AL9T
	 c3hmtAhk/dsF7hh1UaGdzac+9REsMz7rdNoZYZ9EqBgwBUwgKMlCyK83U04rX7CRIa
	 uU+0lR+kItVcUN3eTY2ElPe2OtCA7T0Sq2Iy/yKuMvhCrFdPkK5uj5z4BV0vmh7HCP
	 eQgKwuZQYxUkQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB1A2C5CFC1;
	Tue, 11 Aug 2026 08:07:42 +0000 (UTC)
From: Miao Wang via B4 Relay <devnull+shankerwangmiao.gmail.com@kernel.org>
Date: Tue, 11 Aug 2026 16:07:26 +0800
Subject: [PATCH RFC v9 2/8] mfd: ls2kbmc: Sanity check for the connected
 pci port
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260811-ls2kbmc-mod-v9-2-4fa9a5584406@gmail.com>
References: <20260811-ls2kbmc-mod-v9-0-4fa9a5584406@gmail.com>
In-Reply-To: <20260811-ls2kbmc-mod-v9-0-4fa9a5584406@gmail.com>
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
 b=owEBbQKS/ZANAwAKAbAx48p7/tluAcsmYgBqethMrLetKWc+hI+jW2W4gaxQxe+iPmriybijC
 ckxl/EcdkWJAjMEAAEKAB0WIQREqPWPgPJBxluezBOwMePKe/7ZbgUCanrYTAAKCRCwMePKe/7Z
 bnjIEAC1np4Vas5SQMLYsBHeL2Aimch2zm0Vocu5NerJwFGtXOdo3JgdzSfFwAIasGInKZ2GsZa
 Y4qs7oF7b4XQ4Ic/nlhcePH4yOtNSHFX5hEZkBAAAzvqG5qSZoADFB/tp0zpPn9l4VZ6kDQLpXi
 dlSExUKS8hGbYNBhWvQyr6IPFamiNb4knG6ZH8WyoY84GuYBZ1iH9JayXWNaNlqlT/jTUhsnVOd
 bVM4BRFCjd+nQqGFSp00jd/DlwdZ4lETiMwPYIXHxYnfQl3jv14b3liyfYosuLXOsutk++cr/K+
 7lr8rdHuUoesh2b58jf4EyaRUKmVHw8Mb+Xccl4HPQnOZ4vbChRMbcMA8+74iDqoRKIWxGicEJm
 JKeCRhS7mfiMVJVrjye8WW4GiLc5H6zO/ln/TiwIqCLfBJExMcwwTBOpNhYgyHvD2VImsFxCW3o
 0FxNygZudaM4GMzSO43mSM0gOv4agFsRwH/cjeyEPr+oLYFyK014UGmpEyh2h2nWoB/iw3R3gkh
 U/xGatLXBKwnb8KQW5XnbEvbeB2BqDitfaHTxJt2YBoDJC9WUjk3LYFzGT+PoJhkqpYlO8WbB3Z
 tC8CIihVMwiEnl3aSNTSegGra8VdyE7dabQh6zg6g10Oo1xCYQFl1Cjy1basUt366jtbwUm5psg
 SHBfNub0XTTuf6Q==
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


