Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EC4B411FB8;
	Tue,  4 Aug 2026 19:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785870874; cv=none; b=OUVoFjD3rivyF63VjosRQWojyUbSzBkGWvW3hCjD4yKa06Uso0AyCo/o5cucsCT9iwGAfKN1GQ6jIX6sfe/PmAk65G2nPVRqggbxtb9jjEusXEsvjDn55a4Bv7ePQPxWsR4DrB92KAWU/1BQdnZY8SYkEV5ERqpiWr5TNa1DM2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785870874; c=relaxed/simple;
	bh=d4M2M70orrgx0wB2m/8b2iSym76cXcoVlWjx1HQ8p+c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GgFNV9HZsl3vBJlEe4LlS9y8ovl9jMedS0VG4dTrjP3gyCZAvt66p4JkGFoF9hdf2MOQUG+5vYWLPp1z8d8nwImgQY5hdRy+72jjxgbAMoZ7wKUm6u80aCsept5Y0KoZsw3Qm+gG5LZOWCsdUU6kefOqbU5FvIEatiwZQJ9HGno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l0Qfb5WN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l0Qfb5WN"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5321EC2BCFC;
	Tue,  4 Aug 2026 19:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785870874;
	bh=d4M2M70orrgx0wB2m/8b2iSym76cXcoVlWjx1HQ8p+c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=l0Qfb5WNwPAKx+dHue1pKBZvTRK/89CbYu47LiTcV5svr82XO/nglYWxT137G4Lgt
	 V5n9zKXjA4ppygBpuYxvYrJygIJYPHZGzUgLnBrNwmlNFa+PisnfDnsYzLxt8UfpGX
	 5+pYMF2Fkli4Aq9lCLoanPVAHnqpPgTya0e5zNjsvPRxAEYRDDTbJd5qo42y+m43Xs
	 s99K6ZJVcplzEIaqzItSX7uS2yA4QsVH1mKYQHoazruCu3LJFV8EhkvTgAnBXxfdWb
	 lOCUxjHGASILwO+bOOsj6JxTZ7y48zTFZ+8AaRzTsa//vg2bq2k3/Krn4Eq+1c4Ry/
	 uVpuI56jiGgXg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40861C561E6;
	Tue,  4 Aug 2026 19:14:34 +0000 (UTC)
From: Miao Wang via B4 Relay <devnull+shankerwangmiao.gmail.com@kernel.org>
Date: Wed, 05 Aug 2026 03:14:22 +0800
Subject: [PATCH RFC v6 4/7] mfd: ls2kbmc: Cancel the work queue on removal
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260805-ls2kbmc-mod-v6-4-16ccde412d86@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1480;
 i=shankerwangmiao@gmail.com; s=20250715; h=from:subject:message-id;
 bh=JfJpObrd5YhUsg0KmTA+Fgw5Trzi5JwERZB1GRhNqG0=;
 b=owEBbQKS/ZANAwAKAbAx48p7/tluAcsmYgBqcjoX4PGr3fi2gyACC1u+oTkUNeYJpXcHqn55+
 svT259NZLOJAjMEAAEKAB0WIQREqPWPgPJBxluezBOwMePKe/7ZbgUCanI6FwAKCRCwMePKe/7Z
 bnmgD/91eSK0ImtZVckcCKjN0w7Ib2AYx6+aqsrumocsjTwSGjSA6WXRn6o2Mvm1fCFo96mV//F
 g7ravbOvXqlbld0IAw7rthwCPU+UwGBB8XuW73dUxFGDJ7X6ofNK6EjEh8ruG7AdqZBkxhnDAmt
 1dw5+WBFar21oHwpfwLVu3HOaCu1qFGrXqF5sRVUKrW1C+m+vBPtC09P9yUz74a/q92J58seWiH
 kjthTkX4+wF5ho7TKrMGMsvstfRf2tovpvh9eNTmuo1LvHpozlV3RNG57CY7I+cTJJWCjLlXl6c
 zuKwKCsZz8i6PbVZOQMbirwEUd+/Hb9TPGZU3xt5UDz68gRPAMK7SON+tjWQd1eZTL/GrMV7IBb
 Qjo8GHdlbmSCEUnIy0cT6h18GfpwAq32owcwWw6Xhzsqs0HMKx4vv6u8pRPHKpqR+P3JWVWltCi
 ABplnkhgyfXUgh8AyEj2AcXgVAEuHbrEtwZVK/C15ZrsEm7/8pnnyrxa9pQDjT4XZRs/9YikgOw
 LIdtwrkiVayrU66/Y9MIyxDtnGF6aOoiVzouuAWzC/ShyJIk+znA4jwXiiwc9cFtjU6v3EPqduM
 yQpcQVZc7xpoKt7bDmd9fY6DFKwc8INujqe+7BKl9QeL6oHFIs3f7tHhHrjYhQOyPIBrpctk4Yt
 15UOdUkfUnrAK0A==
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
index e12f2ca2fbef360ceda14ee6fc64f500e4944120..e7bebfe696ac4554eb6283279811a27ed865ab73 100644
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


