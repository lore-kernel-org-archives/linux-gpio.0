Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B93939F174;
	Thu, 30 Jul 2026 17:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785431015; cv=none; b=SkaBqlITgQz7VOzzlVofwRoQzK/mYDVGNZK8Ukl2tPt1b6BscMAYRQu/BVBJJthvDRXcOg9GvicLm4Q/sUJ1Sw+ZAoDMN563P94WY3L7qxDEHqKhTWHe5E7Gi14p1Brr32uXGzBX0rVJ33vhWH9Vt4CjiNNXX3ezw5yE6hSaxOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785431015; c=relaxed/simple;
	bh=oqo324D+x08yTMlxbQ9JZAmvzprnFd+aGHg0th0+FuU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QMlWUydd8TUPNOwpJM143tiVttgPnHZDS3UY3USR8orpHI2KPixghUT8U5VglN5d6c8W+botWVgW/Aeqzlqd8O4rrq1GvDwtToyWbY6m3DwoNKy5XLYm7gT0wbgENTIY1KxSLJ59XiZwGedQVTEMXmWL92miaxn2JWemHSI0XDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kAIaDVJw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kAIaDVJw"
Received: by smtp.kernel.org (Postfix) with ESMTPS id AC48BC2BCF7;
	Thu, 30 Jul 2026 17:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785431014;
	bh=oqo324D+x08yTMlxbQ9JZAmvzprnFd+aGHg0th0+FuU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=kAIaDVJww7GFlW+zB8lJp4x6y0pm80kxuOSwr3C6hUnhlZUfPedWSxk5JADzhVip5
	 yPihWTQ3y9P0rTW7HAhDSfjdt59GyGIRb0H4TofCqngGfNqGbF5O03GhY1pZp1zDUQ
	 61g23CiVa53lLVesa6lQmgQ9l7dxl8NeROjG4D/Pzwn61cZxt01Pvtxe4HB2emT0w+
	 lTyRzSZzNM02sWfETUfIx4kx/SyAS07BQr/y+2GkucQNiGCYvIh+NEbL2JAv+iRjxq
	 Kfhp/dvZ//sO0tEgNCyoWHKMCqNcQrnvPMedc/qDO/baqyHyd3mWy2ZYAD6tKL6HJw
	 +EO+nhY/tNZCQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D250C55162;
	Thu, 30 Jul 2026 17:03:34 +0000 (UTC)
From: Miao Wang via B4 Relay <devnull+shankerwangmiao.gmail.com@kernel.org>
Date: Fri, 31 Jul 2026 01:03:22 +0800
Subject: [PATCH RFC v4 1/7] mfd: ls2kbmc: Make a copy when parsing mode
 string
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-ls2kbmc-mod-v4-1-d201502ba239@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2561;
 i=shankerwangmiao@gmail.com; s=20250715; h=from:subject:message-id;
 bh=6DIyNM6vk8kNUgYv2UMACNnAgWrwjVEMmwrMrjQaG1w=;
 b=owEBbQKS/ZANAwAKAbAx48p7/tluAcsmYgBqa4PjUaqGYl/WVatdOZe/SdbX8EQIZBwhvmvr7
 ghslqSIRCaJAjMEAAEKAB0WIQREqPWPgPJBxluezBOwMePKe/7ZbgUCamuD4wAKCRCwMePKe/7Z
 bo/MD/9o/aNJDVHGcU0YThjfIZvV1S2VMeBKP5l9hkppTDd2H3BcMO+YT6xszLIkKFP2QV0JSR8
 ZtuC4rW7HCSjTU8kcXKQTO9pJLTmZ/WCbt9j9ys8skuSPQ9M4hoXLrnmcobl+bqOku9zpomb1Fh
 lGYZaK1KucymrGEvP4LauL+tmA5K5nHtzcOGm74cUyY3EVRNx+FPeA4FP06z3dh+5oLPEv7SBAN
 of9OZ/u8yMzuUOGuJ+OTidRkHDEWC7mu2JjNIbiXdrJsh7rQqxyO/aN0qiVLFR61TkHTAF95IrI
 fdiivfLJji4xy0gLDNTH5Ig88qXD9mzYzL1s/kLNW99bzE1YBTbYRvPWl8KC73yP6ne2KE0jqK6
 OEV/tRyvXbItC3eUPm7XznaEOKKnzoVAf+Nn/UA4UCAsmLS/fIu9M5+GQIL/bw8Af4OnOjLsCqD
 8tj5TYYq+vfg25tB+nnzIItQX9B4Fe3weeBa/nqYj+bX5r20MxCGnnS6A3o7QjErJU8zTbWAdRj
 0KoN2Ew7z/zxYVYpHJXpF3BefEL7NECF550oJG41xtLurErBlmpW9JeK9bDoPNlq+LgvMq1EYfO
 fuEG3o4GxXUcSk88tZMO9C7mtBcJjwglPFBYkFreQ6m79CGDROnRSTzhIXLaHATFJwSwTCSave8
 cY4YL7ns4s1KtNg==
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
 drivers/mfd/ls2k-bmc-core.c | 30 +++++++++++++++++++++++++-----
 1 file changed, 25 insertions(+), 5 deletions(-)

diff --git a/drivers/mfd/ls2k-bmc-core.c b/drivers/mfd/ls2k-bmc-core.c
index 408056bfb2fe757a5bde43775a483a48352e706d..27f6e096404d67459038a0607378057ec7ef69ab 100644
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
+	else
+		goto invalid_mode;
 
-	ret = kstrtoint(strsep(&mode, "x"), 10, &pd->width);
+	ret = kstrtouint(strsep(&mode, "x"), 10, &pd->width);
 	if (ret)
 		return ret;
+	if (mode == NULL)
+		goto invalid_mode;
 
-	ret = kstrtoint(strsep(&mode, "-"), 10, &pd->height);
+	ret = kstrtouint(strsep(&mode, "-"), 10, &pd->height);
 	if (ret)
 		return ret;
+	if (mode == NULL)
+		goto invalid_mode;
 
 	ret = kstrtoint(strsep(&mode, "@"), 10, &depth);
 	if (ret)
 		return ret;
+	if (mode == NULL)
+		goto invalid_mode;
 
 	pd->stride = pd->width * depth / 8;
 	pd->format = depth == 32 ? "a8r8g8b8" : "r5g6b5";
 
 	return 0;
+
+invalid_mode:
+	dev_err(&pdev->dev, "Invalid resolution string: %s\n", mode_buf_orig);
+	return -EINVAL;
 }
 
 static int ls2k_bmc_probe(struct pci_dev *dev, const struct pci_device_id *id)

-- 
2.49.0


