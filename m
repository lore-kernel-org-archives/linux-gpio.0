Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBEDE3E1701;
	Mon, 10 Aug 2026 13:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786367079; cv=none; b=PkX4UgIdRG7D2cadMVQJ0HIYK/5NIVYzilAJOYSTGsWlZhHh58NcmuHL+du5i9cy53NQpvx8hQs39mcWkKdF/YRXr/qi/EcbQEXOehZKPyWegSX5mxnOmVhztR8YhFiqv9ologLDuSNTT5vVEy9i9EIWhuHppe8mURg8fpGoPFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786367079; c=relaxed/simple;
	bh=YEphmDzGGrkz1uD24ugQVTF/EK5vpaLTme0OyaAw7Fg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f8blTKlqvNRlzCrParxJ1QVZxVmxuir1GC0Ol370tunOG3HbPtGhPnEoZlHwcXBIpF9QP8edSVRrK0PrfOr77m/m9VTW4XYUg9E2Hm44cvnWYZMR4cnEOrfKBtnZ/NK1+9wbiBgfH75YhzBSUfao4zu/6tQZ/qrsW6FWIDGwoyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gyrxrkEe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gyrxrkEe"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 588D9C2BCFA;
	Mon, 10 Aug 2026 13:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786367078;
	bh=YEphmDzGGrkz1uD24ugQVTF/EK5vpaLTme0OyaAw7Fg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=gyrxrkEeQMgGzC4xD5fAI74EYa80ZqT8s7ziVKdJL1fz7YfwpclL1DAWcXjE4jWYm
	 YemlchSWxDC9j2kD73i85EdfoohIXXKPXvIM5MXXks1zM8IAhzZ6chJY6us4CDOgIA
	 T3m5PTVY/EcQzinMMiCku3/C0oGsfpASS5GWE8nH3hmKRNmrYkoE/USWbJfHyLVK/Q
	 SYvQF+IPtcIbeFGrfqbpZpaOPLR12ogh65Ur0QZmH5pqwYrnlXN0CdOsUSaV3zTaWa
	 KblwpbqQiqM8WccS0NxrHSWVAZdZ0uIpCKDo6vqBjPv4a9a0s2F44d4AMlsoL+sGBF
	 h3CGRv5VNXqgw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44627C5B56D;
	Mon, 10 Aug 2026 13:04:38 +0000 (UTC)
From: Miao Wang via B4 Relay <devnull+shankerwangmiao.gmail.com@kernel.org>
Date: Mon, 10 Aug 2026 21:04:27 +0800
Subject: [PATCH RFC v8 4/8] mfd: ls2kbmc: Cancel the work queue on removal
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260810-ls2kbmc-mod-v8-4-16e44f7322f4@gmail.com>
References: <20260810-ls2kbmc-mod-v8-0-16e44f7322f4@gmail.com>
In-Reply-To: <20260810-ls2kbmc-mod-v8-0-16e44f7322f4@gmail.com>
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
 b=owEBbQKS/ZANAwAKAbAx48p7/tluAcsmYgBqecxj4OV/0Pm7QIitpGEfowzP6ouB4GgJKDxJQ
 BmJEcz9T6qJAjMEAAEKAB0WIQREqPWPgPJBxluezBOwMePKe/7ZbgUCannMYwAKCRCwMePKe/7Z
 bjwxD/9H7EDofd33osH4klaf/ITH4ZjogoyHubmAZveD+HHRtd8t+vPYhnwkG+A/8ascX5DeidT
 NuBqTW1tZ8dG8eLnotmzT0TeYqEQZuw7hufUVOicUjyB+yx53x5mNPwrrC9XZ3yEJS8W3qSc0GN
 71yTMDlnqB/64s/l9yxCPy5/zJUlf3p/jz46mWbYAFebloI6bVnU1iRJqA2CGSOfNZCDBQ/LcB7
 K2MzmsjI7CcTf+uDVkvC6HXSCWpxirSj4pZSgoWiNPmWs1E0BN78hBiULn7//xzFJFHynrvYFZt
 ncMPFB3k6kSSs9Og/tdcP/ij3qbIwmZln4dcXdtiULl/BvPc6mg2ZRLDCV/FYrB0iZehRWHEPij
 qiPgfKOiD/oyboE0KcioxZ6TB80f8kD/1LYcEzhsJ5iVl9Y+CuQYxFXdWxnULMCB5VR25JQEVzq
 eMQ7B7HWaBDOXHiSCUAZJSuQBDegaoa/R5b3w60hBwcyzIkErN9myUZ9sEewy90ZG6H5mJhIWs3
 +BWbuuApmKXA58m04+4WwjbmUITWK6SL7HFjp16UuVHbgfTYlZHTiUbsfgItGJw6Gj8FANKT2DK
 J1AOaKmzoiuOHJY4ncar3iheMFqPZxxnha8ey5FCcibTAYCfixX5E+kvAIbBktqSQbAXgAqT8Vi
 uYN3uBlkDwm118w==
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


