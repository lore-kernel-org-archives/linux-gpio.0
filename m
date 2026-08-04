Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BCD93F44E2;
	Tue,  4 Aug 2026 19:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785870874; cv=none; b=nBqz5OyYzY7dUWpWDFEVyPwBwkyt5+m5Yqzl2t0XXM8aIgJZZaqxMQaIxB+3ndr7eMUVnGRG4d85PJTbEMV8EUJU0H1RQcG2f0Ccace9jcZjFiO0C+TPyqiSjD5l3lWCPGPlC6a64MuWAkGVPjN8O5c7eBldCh3MidZQUI9J4HY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785870874; c=relaxed/simple;
	bh=ehRRwOjr5rvL9ll38epbp5w7dw7xqUR8OpqKs2J2CGI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WGE0ACZxCwRMio0rfaeQO0jkEhX8EQvzTyOCMMAwuYglGwSEdfQcTvy2sFIdI14Vv4CAVwORaRQRf004wgWqJwj1DLdl8o84NXtbVUD5dfK/VabnE0yYrRLCIdj4phsBvxCzsXNA944uWqJm7/zA+BuyMNER4qUnXhDwE6TSvU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JQQksl5N; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JQQksl5N"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4525AC4AF0C;
	Tue,  4 Aug 2026 19:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785870874;
	bh=ehRRwOjr5rvL9ll38epbp5w7dw7xqUR8OpqKs2J2CGI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=JQQksl5NDVrz+gA2DVY9oE0KpfxjjEZHNiH4G+Dnt60optUTvYVnktTjGmq42axHV
	 gsX3Fsu8Cz0rnvyKlcihzrZnJTFuiiw1KageYsRDR9L9/0GStMMdWKjUJV6aFHT3yc
	 Z16I78wWbXIWEhuLcpFoIS6h3/qRbDY3dw+B444FfCzkHWHmRAmUR6VOhUVZX2aTDp
	 zp5WVLmDvrRopZ+ztIhieQQrGeK0vA5lJn0rIpjKaJqD1MJb3kIt6LIa5b02BCyoxr
	 G3S7rNU2CV0dphrCyCG+8A4yQ4M7yuSA+6rfQQPjyaGgdQSa5RTGN+BlFQzmgjgXym
	 erS4sNpVkgcZQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20FB4C55184;
	Tue,  4 Aug 2026 19:14:34 +0000 (UTC)
From: Miao Wang via B4 Relay <devnull+shankerwangmiao.gmail.com@kernel.org>
Date: Wed, 05 Aug 2026 03:14:20 +0800
Subject: [PATCH RFC v6 2/7] mfd: ls2kbmc: Sanity check for the connected
 pci port
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260805-ls2kbmc-mod-v6-2-16ccde412d86@gmail.com>
References: <20260805-ls2kbmc-mod-v6-0-16ccde412d86@gmail.com>
In-Reply-To: <20260805-ls2kbmc-mod-v6-0-16ccde412d86@gmail.com>
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
 bh=oufFMpAEKeHSvtXxvdMyphQB5j62aoxVcKbqW/18KeU=;
 b=owEBbQKS/ZANAwAKAbAx48p7/tluAcsmYgBqcjoXBrqMsf+3WA//Isvd+tQeSt5gb+cG0aevq
 iF4TPh2YPOJAjMEAAEKAB0WIQREqPWPgPJBxluezBOwMePKe/7ZbgUCanI6FwAKCRCwMePKe/7Z
 bpjqD/45lT6z9eynQ7HELKxgVtQ78gLUcYGDBqrXysKlLXS7kaLbLi9Z7okfAQGULj1c3sHRT64
 MP3FS1WHQ5PUfbie9+onctsBolGSsIpQ9NxWeX6mvYiLSVOGQmqCUhDWAG4P24dRZLhhMhjc+UA
 Kv/WoFzYcuBsc4TouaWzFI1Y9/DFeIagA9Ge3zjAscv+VPcaLcN2IyAtH34zeEiTS7P/LEuN6da
 RqOkQ2RI4T7oO4sZdV7Z4VabU4rUNBdNMZ7Tknuyhnm9M9dy7lsR25mNr8oyOFvXqX2LAOV9GVn
 td3UjSxDAruVAi3yXOLTJUYNqUtOV+0VNs0lLWNShuWJRWhoDeUTV4L5CklqTSKXWXH1HSY2wof
 IAVQVH3b/nqJwLKk7/+drlFtJ0r6MTJmp7HAvCIOUIWrZ8U9Dfscd8M7Tgb5Cug3Ybtlwtt5NwK
 I1N/XDSvN6YlMmYF0tIS0ijoZxXyIsfrqEXVVUGi+EJ0fJx0C/VyJkz/leHp21heozBK1jzkaPt
 UC253l76ZWQSm5sDIkKqIdT3B9I8VTfCwrKtaFWvEaLD2uLTraj9ZZRVBHvrhxsDqOGTy9+ER4T
 be8JHlu3z/rKXsjSd8yOIrK9I7eIpfgJ1wMl+PCm6Z2IVvyVM+TTqt59VSpFIqa7t4gPCX1bRbV
 dhj+qqTX/0X46Ow==
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
index fc9695eedd3662ac92ff116811bb07bff1c994ea..a9a30611dde9e31cd86ff67b1d6e02bf67b34755 100644
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


