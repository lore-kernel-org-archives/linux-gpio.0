Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BB493A9631;
	Thu, 30 Jul 2026 17:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785431015; cv=none; b=rgwsX5kT2kIMTUVZUpgkiW5rtl+BU+r+eiSkcJ7LZI9QXVog1WL9wDLPY5n+HcOfAMzJIQUfE9nFQoelLpoa7aD8EMrN55JmfLmP6EFGWB9Q3wMs60zhSh/T4gC9yqpeuSOQy3KmgsYVxTv8wdS3c6LNKdu0q4T1YG8GNX/A6r0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785431015; c=relaxed/simple;
	bh=eWYs8ArN3BgCXHvDn3pG5mwVx4+aWWujqeQU5EaY0zw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GPL87qGoLJ8iLA/hCl5lOZX/MAl+B0pak+yLdKudRdvthyGFPF97NwfsQ5ar9qBmZXZ1yTN6gGznKy8u6NrCrHCPznYkUiP0cMmnPUlsoS0eor7Cnv6PACg48pMG9bYF0Rn0FNgBrQhmF0tbY4ZjyJe6unRV4oS1Vynl0MbN7OU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eytdCWYo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eytdCWYo"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D0767C2BD01;
	Thu, 30 Jul 2026 17:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785431014;
	bh=eWYs8ArN3BgCXHvDn3pG5mwVx4+aWWujqeQU5EaY0zw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=eytdCWYoc/XesuHJtl7qMLpb0MniAiyUZdgN+ay5INXnczDZnJHb/PiPRZGvoRxDy
	 9mBWLopiFt2kUWCBgLmwpQ9y5uxAcXuAORs84Z7aRoaynXrF/Y1fhD3LsGt2smr3/9
	 pZG4Kp1Utxg4ulB4q/UY6KhSTY1yMV/Rv3IGxFCIkg7tYYNcquE4ISiSnwR913nZhR
	 Sa9w0pm8DSFyjPhndfcmNJbS3lj8Jwc82xwlcdenay3bQaLeUwko6Ytv1siOwhAnQG
	 hpXEBjoSkVz7Kvy10MuS21EbWH8whQrTSkC4B6mJSgC6BGwhNR7SXk5GlKyjrVmMdT
	 rwYKHkonCdEPA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B79FBC5516D;
	Thu, 30 Jul 2026 17:03:34 +0000 (UTC)
From: Miao Wang via B4 Relay <devnull+shankerwangmiao.gmail.com@kernel.org>
Date: Fri, 31 Jul 2026 01:03:23 +0800
Subject: [PATCH RFC v4 2/7] mfd: ls2kbmc: Sanity check for the connected
 pci port
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-ls2kbmc-mod-v4-2-d201502ba239@gmail.com>
References: <20260731-ls2kbmc-mod-v4-0-d201502ba239@gmail.com>
In-Reply-To: <20260731-ls2kbmc-mod-v4-0-d201502ba239@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2629;
 i=shankerwangmiao@gmail.com; s=20250715; h=from:subject:message-id;
 bh=No2dp/27RmGGcRyar1/5K91t4kgdhfDKTp+IZPk/ZDE=;
 b=owEBbQKS/ZANAwAKAbAx48p7/tluAcsmYgBqa4Pjh0RZ/O/zNu7KTEjCNKZy0pfGQczrz0RBX
 0PoA6R2DiOJAjMEAAEKAB0WIQREqPWPgPJBxluezBOwMePKe/7ZbgUCamuD4wAKCRCwMePKe/7Z
 bnj2EADUmvbjxSM9U83IDawK/9lq/olV3cBJp40QuJA6seYquLmDX1WlfvVMTf17PBf5U62XoST
 wlN3JJDyjLUD8Rfp2MS8sXbu9tIaWQCgCHKPGKq2TxeJeGpa+MaEalzQGeKQd9b2bSgjycHzPdc
 6RkWptJERKbnF3+W9c0DnUqeOUPGDUbpqb9Eq5JSk6Kx9aU7ocZg/zw25QUENtCFuM7OZohrgN1
 8LQQDTKoK6xgBsH9ZMJ0pz4JgLGjwY7tnqfXO2VkAhtVjI47G3kxLcV3aMf7+iMwmln2WFmzGvt
 CiFEHPJKScxxsjs7wa1PqJoELKuMFy8QITt2qdGw7Uzn0XU38EU9eQkpF1Kh6pK5adhNEZGwMDh
 09HCba3F+1n4OgzevL53lDvbfB7jLS6LDt93gCTzmxusdw4AXdaZc3vEe8+s/8zMKfBh/nQhnBv
 RKPhXeukzeROcQaCukC8Qjty+3dbuZnFrPqwHZn0h6pztEmybjjzevpCxcguhGwGJxbF5gT8idC
 l8lPqQJZQWR9ygvxQTpwqhyOvgDCNo6zkWCB2nDffsQ47AKFuRfa4rNZ6n/UWBhUu24BWcEu1qu
 kqzHzlB0ZtkpqGHteTHuNARwKfuF+mhFYrnmFLPS1LbxnJQX2QH0O98o/6e6yTxNAR6ylewnm2w
 Cp+m93HgtyN0QuA==
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
index 27f6e096404d67459038a0607378057ec7ef69ab..b02e4955e9b04f517892a18b2ef103b5e481a238 100644
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
@@ -477,6 +486,24 @@ static int ls2k_bmc_parse_mode(struct pci_dev *pdev, struct simplefb_platform_da
 	return -EINVAL;
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
@@ -488,6 +515,11 @@ static int ls2k_bmc_probe(struct pci_dev *dev, const struct pci_device_id *id)
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


