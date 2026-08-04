Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BB923B27F5;
	Tue,  4 Aug 2026 19:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785870874; cv=none; b=JIpJLNndOZH15Z8+1sWtK+l2LA3wPFwczx78ausaVPD7nEfUwXiFcO+eTuvi7Jt5h3RJrD1fueEvDxPXdCcVoEsOhuZOj5cS5hNIdy7TWZKdr5evBmKX7ziwjbPuFUeg+JVT3rVptbzuEz8z3fPpkkd5IUWLvdU2sXr4oo2wW4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785870874; c=relaxed/simple;
	bh=0gStX5aswa2Oy8OyS3h4jCJzOiKQDmU95lX8+cL9t00=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X3ZQg7WSuAjTNxzvuXt45WHPkpmobN2CLQIzwoAeGJ3FXtxRYPVREbS41tEwakR/CubvkB03Rm5lnPryARAUsJpcpiBoQzrCvN8HAbS7kXw6EB/FX5+9ZdNMz0+bHg28LMhfC5kyYARCxLBKwBwdtR097KVRLZ3LN76O9Sqf4Mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cFtZwXij; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cFtZwXij"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2FB69C2BCF5;
	Tue,  4 Aug 2026 19:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785870874;
	bh=0gStX5aswa2Oy8OyS3h4jCJzOiKQDmU95lX8+cL9t00=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=cFtZwXijD/rxOvSPQaKZXKOleYwt01INfZGEd57dikH+N8a3SjkuACJTRWFDwOOJ0
	 fZwsOe/TcQR9UXeoT78jA0QL6Y5h3cdxWk1HS0+HC+0d6bh+j42Wp6jYlzO3qO0yL+
	 flIhGOb6S9JtPbMTuuGXPYIw/kbM+maS2hPD0rysdBpCmpUoXkNGeyDAb0UxIK30qy
	 +l/isswjRWDqZbj+1FwLa/GYIfTUOc2YAGZ6LrYlC4/e02GZBv1KXSsKD0zXyPPe9/
	 qPhIqeO8CMgyK2Rb22TPcTe4cgh7kKLPHvS+tSlCsV/anPhlDL0yyTyss7qfF0WW3Z
	 aaCQB92hExJmg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11BEEC55822;
	Tue,  4 Aug 2026 19:14:34 +0000 (UTC)
From: Miao Wang via B4 Relay <devnull+shankerwangmiao.gmail.com@kernel.org>
Date: Wed, 05 Aug 2026 03:14:19 +0800
Subject: [PATCH RFC v6 1/7] mfd: ls2kbmc: Make a copy when parsing mode
 string
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260805-ls2kbmc-mod-v6-1-16ccde412d86@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2609;
 i=shankerwangmiao@gmail.com; s=20250715; h=from:subject:message-id;
 bh=U6cr9tgtHDx0WKodEY4FvK4JRMLlLLDCHMpw0TehXDs=;
 b=owEBbQKS/ZANAwAKAbAx48p7/tluAcsmYgBqcjoXAIlTsV17FkSwaO5PMin8sRqt+4AxAmMxr
 1OH2mR3rvOJAjMEAAEKAB0WIQREqPWPgPJBxluezBOwMePKe/7ZbgUCanI6FwAKCRCwMePKe/7Z
 btadD/9hTe+oj0gZl4mLlDWhZuHUg+ikGyXw9m3mhvedwqYJVckl9CUNObixytNroc3WPQ5Mpo6
 eeF+NrmkkP42tWaZhZ6gfjTONHR5hD+g5gizI9UlyFbVtYphasiiTmuEDTlw73UJwYYogdEZkKJ
 l6RY+RkxMWXvRQqXJfHIvf7t+gfXYdyhqiNUhb65MztO5JjBM5rI/Xnf7AqBWHU2yOnUZ7gfX90
 3UO71KsAR5mLR7TEQb0fG7Wl/A3soaPGFTfQhZWP3KQH0Bof+2de9StC2N7pNmPUV/DkGyRfKWE
 ouLKSppp9N7C6pZ7tU4w1nsojo/BXizakMnExfW/A/ecH4GwUhb18n/7hD11Glwr45EVBWOliEh
 ijG0K6Qtwwfo2tpg1qP2Jz/Ua5J50BnKTInaMR+/40fCy7eap+LS4Fv3S3SJaJzgvx25I39AU+B
 B9bdhpOjd7PrHXVciCkkebCgYr0UAKGOkh64bOLAiinrf0PrztR1o3UgKP7rpSA4wO9PYsbOmkA
 AG9fI8aMSkNS74lNZuIzb80apVN8uU/NPMqns3qvhVp7lPYa2OVM7oNPpTwESH+vXEqLEZwvz7z
 5YZ72ylgl+ttGw7cgWkmY5KH2o2bNX84QCRhJrCkVE2x7qI1UebPR8WcPUoElWIDG6tRlr6o7Zr
 qZFdoPUY//rxCqg==
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
 drivers/mfd/ls2k-bmc-core.c | 36 ++++++++++++++++++++++++++++--------
 1 file changed, 28 insertions(+), 8 deletions(-)

diff --git a/drivers/mfd/ls2k-bmc-core.c b/drivers/mfd/ls2k-bmc-core.c
index 408056bfb2fe757a5bde43775a483a48352e706d..fc9695eedd3662ac92ff116811bb07bff1c994ea 100644
--- a/drivers/mfd/ls2k-bmc-core.c
+++ b/drivers/mfd/ls2k-bmc-core.c
@@ -427,34 +427,54 @@ static int ls2k_bmc_init(struct ls2k_bmc_ddata *ddata)
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
 
 	/* The resolution field starts with the flag "video=". */
 	if (!strncmp(mode, "video=", 6))
 		mode = mode + 6;
 
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
 
 	pd->stride = pd->width * depth / 8;
 	pd->format = depth == 32 ? "a8r8g8b8" : "r5g6b5";
 
 	return 0;
+
+invalid_mode:
+	dev_err(&pdev->dev, "Invalid resolution string: %s\n", mode_buf_orig);
+	return ret;
 }
 
 static int ls2k_bmc_probe(struct pci_dev *dev, const struct pci_device_id *id)

-- 
2.49.0


