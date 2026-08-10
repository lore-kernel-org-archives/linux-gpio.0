Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9589B3D75BC;
	Mon, 10 Aug 2026 12:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786364749; cv=none; b=sl2Hymd3AtJIDlNcwtv0miPX91TKELLlk4R43zlyn9/0KSBW8KewISdygnwdP6/tJ8XLck4b2zw67CteVJB7dhVuCYabAGBLpPQCILhM2+tkkcMTsvhxKPmu1sk7sy4ywjHfHDxZNfewS1R0F9t1y7eTj87n1NHUK9nrvlGkMhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786364749; c=relaxed/simple;
	bh=Oi4GTcVKmmi1iIXH/BvW+DBC2WkWyHc65XEe4SG8f+4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a/75BBjuQIRU7AF6qpOzEZswySjydxo/e+duDzDDGv3e3LaZYLZJMOzDblVI2DWNEVlVpr/gvq8oj1ZUZ5v9IsNej40mly31W5joGnqA6rRRMaOA33c4zWk1b6RXeZHgy8BXQfQyCUpgEvf/Skx3L5YqllvyJ/WYDVEkn33VzkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CFP8YfrL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CFP8YfrL"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 51E3CC2BCF7;
	Mon, 10 Aug 2026 12:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786364749;
	bh=Oi4GTcVKmmi1iIXH/BvW+DBC2WkWyHc65XEe4SG8f+4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=CFP8YfrLIQAYq7Hs6JWfmAAzDS+n3XRUYf0nV4QZ7PLWdklPrVafBOnOuyo2JCjAD
	 zK6vAg8v8yC+K8Fx8988TwJj968xAOVXsF7ivkBPDR8PYpDyxFrxYJXYccYoxy892t
	 YJkUMkEcREfXIMCMLUSSV3XtGlPSZyQe79TB5sCMoMrpJmiMoqwsfOq692Bwy0/cFr
	 vxPOod/+pZJ4TBquKTKiQ6LHg5fW6ThmrqZj8iuFNO9JOW5YFVWt3fmZ0eAY+jQZUF
	 gZUKrW5lRHns98YaglKhBwI66+qEBd4L2W1fCC1iVM4OVvf6jBvEfq7BM0lJdD3VmY
	 B8flzIc/J9BZw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C04DC5AD55;
	Mon, 10 Aug 2026 12:25:49 +0000 (UTC)
From: Miao Wang via B4 Relay <devnull+shankerwangmiao.gmail.com@kernel.org>
Date: Mon, 10 Aug 2026 20:25:28 +0800
Subject: [PATCH RFC v7 2/8] mfd: ls2kbmc: Sanity check for the connected
 pci port
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260810-ls2kbmc-mod-v7-2-8aa0fb5a5462@gmail.com>
References: <20260810-ls2kbmc-mod-v7-0-8aa0fb5a5462@gmail.com>
In-Reply-To: <20260810-ls2kbmc-mod-v7-0-8aa0fb5a5462@gmail.com>
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
 b=owEBbQKS/ZANAwAKAbAx48p7/tluAcsmYgBqecNKPjZt+xl/yH7BNWJEpbP4glpsA8CokX6TF
 TtCPSUlIICJAjMEAAEKAB0WIQREqPWPgPJBxluezBOwMePKe/7ZbgUCannDSgAKCRCwMePKe/7Z
 bltCD/wNdIOPSxG2eRayUsRItKo/KLpfvJJqwuvnkIhjcFZuDYwVv7t3/tLGG4rgo6IzjLRQLph
 LC9XdVWb+GJzR7VEqXYo0Jo5EEdEdOM+J8Gv36fmiNtHpI4ROxdKDY8IdYSaMocGdpsQNBG/LNT
 q3txJSvPRMqBQD3XprGYYN9qKZnadLj/DSLGI8kTAZtlQvPZPJaEqNtGe0YN7pOV6xKgyiP3cg3
 9IdO0LI331qRk9KuHxt8pJjlZgmpZoTYtwYnCnP4PJFPKUBd/CC9ZJ0TF/jjWQEIPwiFUMZnLid
 ndBhHniSI+leKytuRNViNJ3mqYOKWWyscH1SVIaUyn3lbvQDe2XkSS0SN8IRnd+aslc8ExqQRCM
 liZUXMQJPZzdknEnwlNMWpIumKKZNNPlHfbiSJI+YWMqcgfHDV43j5xV1Ps4uuxLd7i8o+ifhA6
 F94djMvbJuoVbplZI7impfzbPmw2z08Rx7tDTIMt0Uhv0ByZfEPlILaYr9R+GE3YiPAhTActyx3
 6KTW/zyQF8NBD8cnfkBQhAv4YKfvjqibXdM7E4Kn2rhgB27b8NyihfQ11ct6/vht0SYZG8/XYQF
 zgxnp1uNoAY6hfyDrL8a2V8IUOgTKeyCznz0WONXJlmjmtPddusYL4LRcVTOZj+VetfjPG4rGYy
 yXfLyrCxRSGZavQ==
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


