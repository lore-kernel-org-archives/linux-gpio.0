Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 862E742669E;
	Thu,  9 Jul 2026 17:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783617885; cv=none; b=P+CVdPVDxd5qb08ZN1QkeEoWb6wjgISuMnwpObY25wkVWyVPzb/8iBphn4pXljPeJYawwq4+QLgPxcxNmHzzzLe31/HaqAOgpDwVgQ+d2Ztg2eLdHGC6wBC3NYZyBnq3tKfB+198PACuyXF1HAckHfyKiWXggrkLkpwRgcBrYd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783617885; c=relaxed/simple;
	bh=eWYs8ArN3BgCXHvDn3pG5mwVx4+aWWujqeQU5EaY0zw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=odiKqPXenjjAKPQ91E2Bm91DiaqHpTwNGjminWUg5vMVybEv7TPotWuaoNjZr34qujhjiMN0x8BJbucSmPL8woWhzJJntuYcTZcyX2a/+NdSw7rMhRic1Tew9vkLtMIsvRpsEx/i8WD/F8dEFspKgvY41jDkhaH68+6bwB/E2os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aD90MvHz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aD90MvHz"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2B45FC2BCC7;
	Thu,  9 Jul 2026 17:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783617885;
	bh=eWYs8ArN3BgCXHvDn3pG5mwVx4+aWWujqeQU5EaY0zw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=aD90MvHzlD5EO/xnd6Q3UAtoNGa/5EO8BwE9/eJ0FNCTsM0DWDtr8hLjm8rTdbdTG
	 /qesht+/CDazCTsnCUrIM6Hly3ytMdPFMqbNFzqrbsvjGfoEQdmDTCeIaYAbiyUECE
	 SAVVgKccudTIKvdZA/+H+mjWWTV68cIxsGmIQ+wx2Q0jZRM2iUXSYh9jfaF9XqRZIA
	 Ht0e8R90pXou2Pqdt0ZcpxZA7eKS0QcTe6jJjm7571KLyCDGzDt98UnCvWFC8pImD5
	 7Q0C52GIRT/lu2muG0LXWEx/S7amUh8ri8hsSa310ISsmiWdnO1Pq3B9cMD4wcHlUX
	 z7HobgKkSUC9w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AC60C44507;
	Thu,  9 Jul 2026 17:24:45 +0000 (UTC)
From: Miao Wang via B4 Relay <devnull+shankerwangmiao.gmail.com@kernel.org>
Date: Fri, 10 Jul 2026 01:24:18 +0800
Subject: [PATCH RFC v3 2/7] mfd: ls2kbmc: Sanity check for the connected
 pci port
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-ls2kbmc-mod-v3-2-ef718636e78e@gmail.com>
References: <20260710-ls2kbmc-mod-v3-0-ef718636e78e@gmail.com>
In-Reply-To: <20260710-ls2kbmc-mod-v3-0-ef718636e78e@gmail.com>
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
 b=owEBbQKS/ZANAwAKAbAx48p7/tluAcsmYgBqT9laGySTMXTc/aNOkcP0IjD5esHoWaEKeulK1
 wyDFgjfDBuJAjMEAAEKAB0WIQREqPWPgPJBxluezBOwMePKe/7ZbgUCak/ZWgAKCRCwMePKe/7Z
 bhPfEAC90IBdBEXUf5ZguyzkKCCqDLOArEwqV3O5M4k95REjlpjQOq78RxHpJ6SJ+gJ9efVchD4
 ghyiqvxFHvV4oEMOCURxC/o54Ufz2UoyWiPmCphv70227bBTW98rD3M5KGbVwm5CWjE291yWO1/
 4STettJ3v7q+ZRnQYjTXJYngPYs87FH5GnV1sWQmn8f7OBEf/bKR7Mrbuw0m1twcTsJMIMaK6ZL
 m+tHD99mW7dvuRzk1dUhrWohpcaXJfQMlL/t2TWxPlYll8mN3OxwBCvXrQvHEzX+xf3zR7oZK2i
 g4jcZOAmSpzL7rIwQQXivx6WEBjcdmdTPU8bVrPXHP+GkDVOyRDcR7yhfwhqAjeeYYx/TxJ7skp
 mRxObv0t5pjiCosMNljOCdXvfUeQl+T2YTCwx9RhtxhXkUYYs8CyJy+hSimPaJjLHULJ8HgbWe2
 3oTdpcUS5n6ueFRXjXmtRgCHy2jcROMfnXFD1oMedrmK3cvFfxgKPd1FMcrcXIULESC5Q/2IBNi
 VdwShz13M6UHA3YZeuQeopnnfxgmjVLAWjmCvALAHXzugWn0J/7kBc+N99FfHQFe7myxs+7lnqi
 av13nM5A1BtJN61JN2PBRotYPpixBD7n3DQAD6JYErAOQt91T+WMFik70EeWQ/63g5rZ8ne+Gfl
 eErAxLMkMaSaWpQ==
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


