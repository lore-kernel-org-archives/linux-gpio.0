Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA783A6B7F;
	Thu, 30 Jul 2026 17:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785431015; cv=none; b=Qx49p/bHDRusfC/I3pFhqhGq4vbWSibLEApEx7dKfg8L0I49HB0KAvSk++giIe85WNksSJtprPNANXMp0wbymZMbPfxZ7nbVJQfIWXakIQWPQWuGOtWJrclC7nXANl7pm/ufd1bn0CtcdKQ3LQtFEJYKa6P/LN2wwVkB4AvYD54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785431015; c=relaxed/simple;
	bh=BCMef9wjPgNYZJy//qkJ2zDqGCZ+SHc7sCThF3XAm/s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h9hoI02W8XKdA+KGGY0bRDMYq9daCB2mxfDvZmEpDlE7ofHMcKQVAtB/4Xn6IC9KT27yYO2C9nzapORfjkhpVHPuj0Qcq2CVts4iR1Y62IGuaA3lnZL31/6qe6KX3KWQ6wpbN5RkP5Tr3NTpl3RmsbaLH2J6VWEetzP1cbmba3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c6jE6T6V; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c6jE6T6V"
Received: by smtp.kernel.org (Postfix) with ESMTPS id E7EEBC2BCFA;
	Thu, 30 Jul 2026 17:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785431015;
	bh=BCMef9wjPgNYZJy//qkJ2zDqGCZ+SHc7sCThF3XAm/s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=c6jE6T6VEUQeFszoozzSFHG9GuJokx8ucEgsqw/rVfm5Y3mk7qgJZs426afmNietU
	 eepop0x5yaZi3S6f0cl48Q/tC1U1txVqSbqmtVERARTjLWu+nUrwkSpP9d4SwC1NG4
	 +MzOmFIjQZ1VcuXr/jyo7iFXoMD7+cq3bGbeivcXPpWz9zt0b4EJVNsf0j8Atc2m1u
	 FoNwKO17esNVADt0NVJivYEwsnCRKnSwz8BrA55W6n5BE8wV7k2YyqNT0dUOjh17t5
	 aD4oZVB9rnUkrSGmDa8BcyDRdI11XKXXpfvgzg84QIcMIZU8mAiigvIkw254R+5oU1
	 Jl71c7IPvt4nw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4FD6C5516F;
	Thu, 30 Jul 2026 17:03:34 +0000 (UTC)
From: Miao Wang via B4 Relay <devnull+shankerwangmiao.gmail.com@kernel.org>
Date: Fri, 31 Jul 2026 01:03:25 +0800
Subject: [PATCH RFC v4 4/7] mfd: ls2kbmc: Cancel the work queue on removal
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-ls2kbmc-mod-v4-4-d201502ba239@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1480;
 i=shankerwangmiao@gmail.com; s=20250715; h=from:subject:message-id;
 bh=/0Zc8SBBqzivjk5dmyl3TFu1CZBMiGpU8UG5gVg9tKE=;
 b=owEBbQKS/ZANAwAKAbAx48p7/tluAcsmYgBqa4PjPzAzEdsdVuiD4bZW/su2PZUzTlyvJc23x
 38ejXJssDiJAjMEAAEKAB0WIQREqPWPgPJBxluezBOwMePKe/7ZbgUCamuD4wAKCRCwMePKe/7Z
 btqSEADTFcu+lLEgR2fLSWruUjxtdazz08ba8knbWiAew0hwVX+sDyeTbYEw9Rh6CabskVztEfu
 wyAocdxBirv5qdmAtM8VeIA5DXhBwFLN4vfRUrywPskUS0VaqmvRP+TPXCdstIwAli4fIU4/qqh
 0uX28JTj9heJ4NmFKoH0y3OELwbA5f1EJ5YDp2679BsJi942zH3+Qg4B8dM7RRuoLq3flmfN4K2
 XifHZ/PV7Ld7Z2WkcIEXD5kj10vb8ZepK+VR9K/d614DuUOH8YlKeHn1ShBOX2MF9lFDLOiaFD4
 NPq/lkkXCCmH9xNuGC9v3WfHt2+xkJifqg8sE3JzZ9JKMwjATgj6qjklsdz+P70cmGUYyAnJiwZ
 EZ2Ak8oI70CTKYltHyDiDS9UaxEUOBizP6ivOhO+6WIzEA37YIyWhDZN4kQne20J3qxmoRs1Y/S
 pcmrV66acE7DXKFiPgnBISLCbOGCNDIdxp7mlepNAmX6RBIXSs0qNIXIdigG1GGKZgt+XMGM6IX
 pZVjjJTZBpJbbKmYeQf4LV0Dno+Li5GY98T+JE7ehmPxsIz9CeEibKyhne880aBItfspPEoh7iO
 nKvuTJ4SlClYHO7wBIK16HPSe3iqfAEb1x/ClnB1zZ41Tj7drboiPg+gvMY2abhfZWp35zbnlJW
 FNmCH4fuJ5pEvlw==
X-Developer-Key: i=shankerwangmiao@gmail.com; a=openpgp;
 fpr=6FAEFF06B7D212A774C60BFDFA0D166D6632EF4A
X-Endpoint-Received: by B4 Relay for shankerwangmiao@gmail.com/20250715
 with auth_id=462
X-Original-From: Miao Wang <shankerwangmiao@gmail.com>
Reply-To: shankerwangmiao@gmail.com

From: Miao Wang <shankerwangmiao@gmail.com>

When the device is being removeed, the work queue should be canceled to
avoid any pending work to be executed after the device is removed.

Fixes: d952bba3fbb5 ("mfd: ls2kbmc: Add Loongson-2K BMC reset function support")
Signed-off-by: Miao Wang <shankerwangmiao@gmail.com>
---
 drivers/mfd/ls2k-bmc-core.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/mfd/ls2k-bmc-core.c b/drivers/mfd/ls2k-bmc-core.c
index a5465c42a77b8b7b81e3ad787d6036679c6ba6df..1466b314fc4e577fe5e31404444648b5b0447ebb 100644
--- a/drivers/mfd/ls2k-bmc-core.c
+++ b/drivers/mfd/ls2k-bmc-core.c
@@ -375,6 +375,12 @@ static void ls2k_bmc_save_pci_data(struct pci_dev *pdev, struct ls2k_bmc_ddata *
 	pci_read_config_dword(pdev, PCI_INTERRUPT_LINE, &ddata->bmc_pci_data.interrupt_line);
 }
 
+static void ls2k_bmc_cancel_wq(void *data)
+{
+	struct ls2k_bmc_ddata *ddata = data;
+	(void) cancel_work_sync(&ddata->bmc_reset_work);
+}
+
 static int ls2k_bmc_init(struct ls2k_bmc_ddata *ddata)
 {
 	struct pci_dev *pdev = to_pci_dev(ddata->dev);
@@ -385,6 +391,10 @@ static int ls2k_bmc_init(struct ls2k_bmc_ddata *ddata)
 
 	INIT_WORK(&ddata->bmc_reset_work, ls2k_bmc_events_fn);
 
+	ret = devm_add_action_or_reset(ddata->dev, ls2k_bmc_cancel_wq, ddata);
+	if (ret)
+		return ret;
+
 	ret = devm_request_irq(&pdev->dev, pdev->irq, ls2k_bmc_interrupt,
 			       IRQF_SHARED | IRQF_TRIGGER_FALLING, "ls2kbmc pcie", ddata);
 	if (ret) {

-- 
2.49.0


