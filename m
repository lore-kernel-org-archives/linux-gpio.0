Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24AB3392807;
	Mon,  3 Aug 2026 16:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785776206; cv=none; b=RUTz/8ssY0cv5j7kQJNf5YyV1ppQM+8qOj6NFB+Oxlkt+owJqSFnFSiFWO0c3HI0DNNEEAZhVhGBiQnWRh59wIfvoxxFq5+PsFbG5ppBbKeIQwo57OkawEZs6iuC7rhPkHf4RtCvwgE/MYIJr50xpDNkIjSInCCi7ynJqfOZfSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785776206; c=relaxed/simple;
	bh=d4M2M70orrgx0wB2m/8b2iSym76cXcoVlWjx1HQ8p+c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FwJbF9x2GrdhU0X1k5eW+ej7uehu503J8JCh6wnXzwfXgLhccERdb13iTF9rW19mLQyXwpojlV+KfC9Fe56Uti/BMtT78MdNRKRnTJKnNZwRR361XQx+vvgRnuu1/oUkiWlTVEC1M0vjaSKpgVW+BGyFIyrfmBYwpYKN+5kP/Yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lVG1jhQt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lVG1jhQt"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D6479C32781;
	Mon,  3 Aug 2026 16:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785776205;
	bh=d4M2M70orrgx0wB2m/8b2iSym76cXcoVlWjx1HQ8p+c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=lVG1jhQt/k4oZ/WkbqT+E1LemSy2DI/3zHnkBOxojm6nTM+nEcecId1lx/re4yN5B
	 DlTALMvX7bpWKmg1Q8cq4vsd2lFHCEktHVJx8IK87zHjjgF0SOF2kIjuQC3mm78Yr5
	 np39eS+vZgii3LapvyG2RjeK2MpTf+AFoV4UBeKpOWBzS/f2znv0Z6WANQCODR4MTc
	 VInriE2UPDB3GQj1FwONZXatS99UuMS8humrSR3LUx0NHaycwmqXQd5qHjow5DGxL5
	 H4CCtZM5z1JsJ8niMFFBNM4d7n8ZHZxfT6qp4UL+nKaDwTqnsBJb4pg7Vmi7hTbXPJ
	 0b2NgpZa8bEkQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C13D9C55838;
	Mon,  3 Aug 2026 16:56:45 +0000 (UTC)
From: Miao Wang via B4 Relay <devnull+shankerwangmiao.gmail.com@kernel.org>
Date: Tue, 04 Aug 2026 00:55:52 +0800
Subject: [PATCH RFC v5 4/7] mfd: ls2kbmc: Cancel the work queue on removal
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-ls2kbmc-mod-v5-4-e6bc5cdd9a93@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1480;
 i=shankerwangmiao@gmail.com; s=20250715; h=from:subject:message-id;
 bh=JfJpObrd5YhUsg0KmTA+Fgw5Trzi5JwERZB1GRhNqG0=;
 b=owEBbQKS/ZANAwAKAbAx48p7/tluAcsmYgBqcMhKuM+IF3Na2gINNmXwdAd99/qiKJDFzpe81
 fBBn4lrj/SJAjMEAAEKAB0WIQREqPWPgPJBxluezBOwMePKe/7ZbgUCanDISgAKCRCwMePKe/7Z
 bkCMD/0d9TDXHqudXnVDofETx3w2WKdtK4V5hw6PTRf5VCAhGd9fl5txALHVjZWr0loSsNbYCPJ
 0Smgh7HSul9o+2nAQum4J/36M1UfBgKoWy8soL7cyMFRJo/YNCpYXpI5jqLPQKsgAXihyACzEfi
 NSw8KssTl1CdWgmotQrY5MI/b6W3JVRSFCqvbfGg6pNPv2EG406wnrkncsxwUSsKtEuxAs050ds
 9GLsHJ2CPTgVH1tEFmPCS3S6NQhfM6kUctroJeCQ3w1dJqunAWVRcYtOcUwE6sydTj5xuUFfRvO
 fxhFl2eG8Yw4nq+bIrQGh31zdfVP5g4PMdhOKTxjJC8g1QEx0akXY/9DxcCWeoaZnL7Hk/urp+O
 QDig1UomR27DjBIGS1N1oQmEwOaOaPdneAllfEBwC/bOxtvJWAoiuCNaFlROYvkPrgZxKCjPs99
 0y0VBKuwG0Bx4X3HsdATKhjQr7k4cLttZ2tP4AENMBzGuPIoThI+XB+WYCnV60e+FgAfHzRdLLG
 hUqMkO00OsqFbR5j4o1fvmZyvandW+e046DeB9/kswHzHwPlWptvYlL+m7+YZNdhrAT3b/y6tzz
 xh3dtFuJBiAuAqXSivkPfXa5uRWHPhwBdkYGTL2ms21rSLGC2JuzV1F+eKRCI1zQadnfob0/cLR
 ETSKrLnoi1nb+/w==
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


