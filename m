Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21990391E59;
	Mon,  3 Aug 2026 16:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785776206; cv=none; b=bomoppyoAVeAl6dNmEEePhAG5eskANlLMXgwgg5KLhsqX2gtYODIEP1/QinzguIe6MGTmdJzezAbxqNWGKKdxb4hPkAbBgt2V5r3cm1b0HdVG/WjDt7OOkGlwYErkSIW3fCCXMi3jXrjUZI6hZF/24UrCugXxfYA5MmRCLxqReU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785776206; c=relaxed/simple;
	bh=ehRRwOjr5rvL9ll38epbp5w7dw7xqUR8OpqKs2J2CGI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s/t5sSBmwlpXswddiX6kioUf41Mac9z8QyrU6RigD32Q/Y78yA+4aPD+8o9Bbv2WC+YXCArIRqpmAPOy1zpfacEU4gH3mqM5E9VZh72hSWLKiNcPYwX4LZN2149vuY0TPxHPD3xfkldWF9/gY0/r5fDoJDJ0lg5537vrvDoo6DA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bj4WOK8c; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bj4WOK8c"
Received: by smtp.kernel.org (Postfix) with ESMTPS id BDE6AC2BCB9;
	Mon,  3 Aug 2026 16:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785776205;
	bh=ehRRwOjr5rvL9ll38epbp5w7dw7xqUR8OpqKs2J2CGI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=bj4WOK8cqlvt7cWb4OdL29GcRdxmrRGS+u+TQv7jcxSwjG5Cf1mJiLi5lgba4ziq4
	 +UTxKlgxvXVfSPqiyE1jtaPW44enoTwZHVR/NtGAnbto22sOo3Fg71JVPdh2IVuDML
	 TNYfW9MHTYHeDWbN+LcxFO+adJH7dTDS/iTq2reIBFVEbDB16N091bafRPQEzcDWyp
	 3smp0GEgQsdd269AB8D2ZEjVVg+6CGNTgF3A9WkPN3F2SxKcFC37CNJBBoElbk15dC
	 pyE47NQkvKKcqM7fcdtpPNB85QEd5F9u26z4Qd4ucdLhKYxoXR11O4NHMyqiKyNa6s
	 CWtI9b+0EQJ7g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D552C55182;
	Mon,  3 Aug 2026 16:56:45 +0000 (UTC)
From: Miao Wang via B4 Relay <devnull+shankerwangmiao.gmail.com@kernel.org>
Date: Tue, 04 Aug 2026 00:55:50 +0800
Subject: [PATCH RFC v5 2/7] mfd: ls2kbmc: Sanity check for the connected
 pci port
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-ls2kbmc-mod-v5-2-e6bc5cdd9a93@gmail.com>
References: <20260804-ls2kbmc-mod-v5-0-e6bc5cdd9a93@gmail.com>
In-Reply-To: <20260804-ls2kbmc-mod-v5-0-e6bc5cdd9a93@gmail.com>
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
 b=owEBbQKS/ZANAwAKAbAx48p7/tluAcsmYgBqcMhK3mEKJMSNy6ygC/cKXxOk0Ld4Yfs5KObut
 tpA0Ml72FyJAjMEAAEKAB0WIQREqPWPgPJBxluezBOwMePKe/7ZbgUCanDISgAKCRCwMePKe/7Z
 bnEKD/9d0zx+gsQ6lkhnLW5Ck2EefOX7a7ytscd1t7azzRxo0lOx+BF+FRsF6lROQiYzMY+cYWt
 1flfx1+x07ULr6+36n6k2zeEJVBMLgsAMiiKHZRov4PTYZpoMd0nYGoD5C0yWJvFKRYnItr1jLJ
 pgIOhe5JcaX1cYHDMiUwXMPD4htTt1j/vX3OfcX6EVStKwSeSaozcCpkapVximnU9ATHHwONlwA
 zg6+HDhpXFX0VjHX3NQlPHlAm957In16t/1Ze6Ni9doX4XVmB4X6Eu4mF7R+LllhtyyRUFwOFC6
 827p+yCbYd3CxDGXE+mHIo8OFOfeuXqQ1QZIPLy+VL3DrWs9uFN2cPkXaS5TSJmzMYQO7+jEgtE
 T0ysSfQ0UzkM7xFSXiRoRkXam+4VZptuT1XsH3EgLFcN/NpEiIjbUsNabfNgkHlTKSXD6sI52tD
 0moVWRZYWZBy1yAIOlHwlEPRk+jpKPNTPKAbZB2ZsLJXQmNA7lpZS4882wFd1XVLDS0aB0dxUXU
 rtuRd3hr8hkBEmqCulOF/ZRdzzJgHq/NfsEViSqkDh16pcmLB8X3U0AV3s9RKoBUOvPXeeYBaUr
 /iGPdax3fGejV1sSSSlTQVQnN6dHZs36yZ5l4FcfT3hdMzWOEseeF4qr+KhvQby1T/yR6GbjCeN
 TQnanMTErxJJMPg==
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


