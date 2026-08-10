Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E96B83E0C67;
	Mon, 10 Aug 2026 13:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786367079; cv=none; b=Dt/qun0KGoDs5UXSRGS2JanIaUyb1pAmOrk4UwWyRiCz0u3kwFW5nXIym29yozm5nigxuFiDfBJJEnzE6R0uTXLERjo4dKZJvDUq3R4/lZ5spMn03clP3y+YBDaEQ8TpsJ7Tip+XeDC97bYrHtTEBjEVc5/rNJEs2tbIooZJ5dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786367079; c=relaxed/simple;
	bh=lQ97HBSAYhAOD4IPcZzjORKwbgRckHRjegeZhwOb/TQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XkWZ6R1WHoj7qDvOf4s9s517mdAI8tEI4EDqOYtcPEZMYCoa7jSvS7rcF7137B76YGr+K1W9dsaqPfpTUkszqwBblCQdFYX9nHVly0YIU9vv5hat088YUkblsqOtnBZeRXW5WmykWhPpngT/89N2l4ZQ1wnVTJy7oKspGNzXcxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ARfcyZJS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ARfcyZJS"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 36803C2BCF4;
	Mon, 10 Aug 2026 13:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786367078;
	bh=lQ97HBSAYhAOD4IPcZzjORKwbgRckHRjegeZhwOb/TQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ARfcyZJS6lHuXvwUBl/sclQfm3+i8S3LHR/jVeLMcL8oppsB/X3QotkvKxzvgy99D
	 vn+P2hMkl8EBm6rtVyDx+oJbU1X7oACbwtu/Vzy/aPSNSfnt5mECXnCVW2GFgUF0jp
	 C0uleKYURgK7WgkfxAvDVW18dmfKMPxS/HIyTLXaeJujRQfng40WCSvJRctP7JlL2s
	 6kKcHXUaeVg668jUfaPecbGJC+XmYCVkch7wzVW4ifXfZ1cdlvMhcDqkL+mD35WPGc
	 WAwbio+ui8EgPiKFBZclegtvc2LGyJEIJMSpIuViPKn1Io3pJPcreMygVk5/IfL17d
	 qN9jpRihnwe4Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 165F3C5AD55;
	Mon, 10 Aug 2026 13:04:38 +0000 (UTC)
From: Miao Wang via B4 Relay <devnull+shankerwangmiao.gmail.com@kernel.org>
Date: Mon, 10 Aug 2026 21:04:24 +0800
Subject: [PATCH RFC v8 1/8] mfd: ls2kbmc: Make a copy when parsing mode
 string
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260810-ls2kbmc-mod-v8-1-16e44f7322f4@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2931;
 i=shankerwangmiao@gmail.com; s=20250715; h=from:subject:message-id;
 bh=JAJhKtMfhB8SZK77fsh9uMLhohDQu5vL9aOCwD3CkNk=;
 b=owEBbQKS/ZANAwAKAbAx48p7/tluAcsmYgBqecxj9QIdpLWoE9Z9Dsl9hN35hVCY/OI7XaOBM
 2+8En4V4LSJAjMEAAEKAB0WIQREqPWPgPJBxluezBOwMePKe/7ZbgUCannMYwAKCRCwMePKe/7Z
 btUPD/4/VDwT7IGvUEmL8w5a403ijm8OAp+jZgirdP6TSJ9AYOH5Zap4sF3K4wZvmgAijkbqLIs
 xQwDE8amSiVdiB0XiSm+/5rlTPT14zGPL7TSUt6inJ3wqbnKsUXq0O8bzFcGJ5wowxHFKmPf1Jj
 WbWMVfntMv0NIiIVHjvjNW9A5hesIvo3zOBi2TfAOEXyxWBNZPIMknclwgbu9+TXysOZKcHo1Nr
 ukbBSO7W34WLg9E9Ny8ZzyW1xaIdc9yzzzEs7yx4XyVdonM34x9rom2K9DfzpCDclGU30cVeP6n
 DpgLcue5UVQ4LUqjiksAnR8dJ2haFAqQDtxUxv4O0AUI7dZxBe0b9RnxR4jjS1htaV+O1nlUFzm
 5oOEzTcHJXfpOUObXuQaZOcCRLCLbQCOmXOZzX+KCfFZqRr9Gd2ELM5jk3lUYxG9ea8UC9TbisR
 AylDGkA+SHVaFJzn7/cJAPoKCrryOMwQPtWzTJKDcyuaOdfbFcnXuo3jS7XnJd03kuvPAl3SAoL
 bUSx2dUpZg/50NyU1GrDEa1mK3XGKyqsj0qLfTbBsFRsdCTTKz3V+obdHpzPSq+Fen7P0/ptNYe
 NjLs7uQBBJgq4NcwUJdZ6UM2He33D9zn7NGkf0T5+BnyLFG6UqvQS7hkjdoSoCkVo8zbW4iZPFk
 FgBnAFmFMpZVVyA==
X-Developer-Key: i=shankerwangmiao@gmail.com; a=openpgp;
 fpr=6FAEFF06B7D212A774C60BFDFA0D166D6632EF4A
X-Endpoint-Received: by B4 Relay for shankerwangmiao@gmail.com/20250715
 with auth_id=462
X-Original-From: Miao Wang <shankerwangmiao@gmail.com>
Reply-To: shankerwangmiao@gmail.com

From: Miao Wang <shankerwangmiao@gmail.com>

When parsing the mode string from BMC, the string is manipulated
in-place with strsep(), preventing from parsing it again. Make a copy of
the original string and manipulate the copy instead to fix this.

Fixes: 0d64f6d1ffe9 ("mfd: ls2kbmc: Introduce Loongson-2K BMC core driver")
Signed-off-by: Miao Wang <shankerwangmiao@gmail.com>
---
 drivers/mfd/ls2k-bmc-core.c | 51 +++++++++++++++++++++++++++++++++++++--------
 1 file changed, 42 insertions(+), 9 deletions(-)

diff --git a/drivers/mfd/ls2k-bmc-core.c b/drivers/mfd/ls2k-bmc-core.c
index 408056bfb2fe757a5bde43775a483a48352e706d..335590392240ba1e13a2bdf6f9f4efddec045f40 100644
--- a/drivers/mfd/ls2k-bmc-core.c
+++ b/drivers/mfd/ls2k-bmc-core.c
@@ -427,34 +427,67 @@ static int ls2k_bmc_init(struct ls2k_bmc_ddata *ddata)
  */
 static int ls2k_bmc_parse_mode(struct pci_dev *pdev, struct simplefb_platform_data *pd)
 {
-	char *mode;
+	/* Assume 64 bytes is enough for the resolution string */
+	char mode_buf[64], mode_buf_orig[64];
+	char *mode = mode_buf;
+	const void __iomem *mode_base;
 	int depth, ret;
 
 	/* The last 16M of PCI BAR0 is used to store the resolution string. */
-	mode = devm_ioremap(&pdev->dev, pci_resource_start(pdev, 0) + SZ_16M, SZ_16M);
-	if (!mode)
+	mode_base = ioremap(pci_resource_start(pdev, 0) + SZ_16M,
+			    sizeof(mode_buf));
+	if (!mode_base)
 		return -ENOMEM;
+	memcpy_fromio(mode_buf, mode_base, sizeof(mode_buf) - 1);
+	mode_buf[sizeof(mode_buf) - 1] = '\0';
+	iounmap((void __iomem *)mode_base);
+	memcpy(mode_buf_orig, mode_buf, sizeof(mode_buf_orig));
 
-	/* The resolution field starts with the flag "video=". */
+	/* The resolution field is required to start with "video=". */
 	if (!strncmp(mode, "video=", 6))
 		mode = mode + 6;
+	else {
+		ret = -EINVAL;
+		goto invalid_mode;
+	}
 
-	ret = kstrtoint(strsep(&mode, "x"), 10, &pd->width);
+	ret = kstrtouint(strsep(&mode, "x"), 10, &pd->width);
 	if (ret)
-		return ret;
+		goto invalid_mode;
 
-	ret = kstrtoint(strsep(&mode, "-"), 10, &pd->height);
+	if (mode == NULL) {
+		ret = -EINVAL;
+		goto invalid_mode;
+	}
+	ret = kstrtouint(strsep(&mode, "-"), 10, &pd->height);
 	if (ret)
-		return ret;
+		goto invalid_mode;
 
+	if (mode == NULL) {
+		ret = -EINVAL;
+		goto invalid_mode;
+	}
 	ret = kstrtoint(strsep(&mode, "@"), 10, &depth);
 	if (ret)
-		return ret;
+		goto invalid_mode;
+	if (depth <= 0) {
+		ret = -EINVAL;
+		goto invalid_mode;
+	}
+	if (pd->width > U32_MAX / depth) {
+		ret = -EOVERFLOW;
+		goto invalid_mode;
+	}
 
 	pd->stride = pd->width * depth / 8;
 	pd->format = depth == 32 ? "a8r8g8b8" : "r5g6b5";
 
 	return 0;
+
+invalid_mode:
+	dev_err(&pdev->dev, "Invalid resolution string: %*pE\n",
+		(int)strlen(mode_buf_orig), mode_buf_orig);
+	return ret;
 }
 
 static int ls2k_bmc_probe(struct pci_dev *dev, const struct pci_device_id *id)

-- 
2.49.0


