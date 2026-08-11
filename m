Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69F793B3880;
	Tue, 11 Aug 2026 08:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786435663; cv=none; b=o1HljqywJxja2ZXB15eMWMM4L1auNdw6pc0zE29X38F6cR3laBAz7Fe4pWFtP31oRiteeFwdb3v7axP5NuvnrbE3gc86YaZD8380uuxaJOmVZKSKza9D4FxXrAQ/M9aGnZTxPo7Nqr7gznnZqJ9+s3VCAxgjHl4G1xQJQGr6+g8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786435663; c=relaxed/simple;
	bh=YEphmDzGGrkz1uD24ugQVTF/EK5vpaLTme0OyaAw7Fg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FpjPs/38ubcPEQyCQ9432mENiGhR5cBdF6GfLW4dCliGNvOm6ykBhdgmln5I1ygs3UwGG/h8YxIBqj87h+R5ufrGvbzPvbd0SaTHpKYA8YM9M96va70Cr0Un5xJM2Yg+FsE9CBtCp7ggF5FhU+7c0U5OStDwVdkpzrQoKFvPG60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qo4jxACI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qo4jxACI"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 292C1C2BCFB;
	Tue, 11 Aug 2026 08:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786435663;
	bh=YEphmDzGGrkz1uD24ugQVTF/EK5vpaLTme0OyaAw7Fg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=qo4jxACIJhpGbyIctNc2jiu7YsQliAOaNJcirdVNka5YLyIhK0hgGjHSJnz7YNyoU
	 IkaVqTs1q9EufFsSU2np7tqjKIwL+q01aDzAfKAU4z75s50ygOHgrCBPZM4DQlg3MI
	 Fdpd+IdAxLX6BrNFKLHw3UvGzcWBb5J1GmzbCQhN9jZYkP2B/DEv5tWSkOAACZvl+j
	 0n7QFBlQuHZ2sMvW0aY6izh3Tef2Wlfj7OORwgF3hbzpccJqzQuNzgyMpkGHC1jvko
	 sThw8MeCPP/u21UmcgJBQl9oj0O60mDcXMohNISxxofnfrZyABfdnemrkOhRXeU33d
	 jXIrMplsqeNFQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11471C5CFDB;
	Tue, 11 Aug 2026 08:07:43 +0000 (UTC)
From: Miao Wang via B4 Relay <devnull+shankerwangmiao.gmail.com@kernel.org>
Date: Tue, 11 Aug 2026 16:07:28 +0800
Subject: [PATCH RFC v9 4/8] mfd: ls2kbmc: Cancel the work queue on removal
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260811-ls2kbmc-mod-v9-4-4fa9a5584406@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1480;
 i=shankerwangmiao@gmail.com; s=20250715; h=from:subject:message-id;
 bh=+xbRMJCIp18RIJ0wKO3Pv8PASldwSY769xQI4nSINrw=;
 b=owEBbQKS/ZANAwAKAbAx48p7/tluAcsmYgBqethM+BzvU5ftMBcFMrhDlybb4mi8M03yCPJSV
 sq6WlFXfzWJAjMEAAEKAB0WIQREqPWPgPJBxluezBOwMePKe/7ZbgUCanrYTAAKCRCwMePKe/7Z
 bv9hD/9Rr10sVvCPhlyqBEB2dYb2EMS7wB4XjCdwqZ7wbgI1LeLtp6+Fgr20dpVbrOjlJqc71Zo
 AwF2qaYRNSvGNm2E5fZqJbMzucfkM3hf8UMjDJhcLd4+gdDyeLZVHbU2NNPTru6MsJfubuX9cp1
 Q7vjq9dVRilMETmVNTM8F3kl2WIDfSPAYKQzIw04dZahxAySkLjDZrwEz+pVL60/XCW6aZgSmZp
 NchGK5w+8vSu2kdAgHc7jC1+Fqs0t+C2GIndAoxP6CteS8Se9idIPI1dXz4jNNHf0d+Vaa+9Hvc
 Ovm+LrRP/j/+r/L2kLy3RnRH1n04hDkkgV1Gti7JDJESEf12PF4RUDKc15w10qh+75dBwV6s81j
 R6aZ7O/9kDcvpXyv6jlOKVc7hO/Q/uMRzFl0ZfHesyk+6+rJlpRKEjj0bdCwbaxrmo92AG9hW+3
 RkxmKDTBc1SkmWs95QIs8YgNzu/Dn3cLpIs9jAvG1eSyA6XlNw/UaP2Zz3O++a8Qk1aSzv58m7s
 2OvZOvSCed1q3UF1djj92EPLKf2FIzYIAMd5Wgk35ITYKYltL5OpoKgQ6hdcOXAm3N2iV3GvFqQ
 egaG1cgA7ovjriCbWeB/2R950ngmDT2TRj4Of1WqQ1MVnw+XDGmsEQq1dMlonz5J2YD5xJu9IfB
 4wx2VSGKgY/uXkw==
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
index 06ec8143d8cdbe2c8e5a141020d96c21b37fa699..5eea53f134215456e0c14345ae4ebc5b66bd433d 100644
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


