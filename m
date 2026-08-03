Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21A4A3921E4;
	Mon,  3 Aug 2026 16:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785776206; cv=none; b=MyoNCE2MvMwNHJjJBQTSX/xbHcoxWsMFtJOpLZ3WT6gPZF2l7PF167n31cyVREnLmShVMxlD5POuZA9hYc8UKLzXRABwzDAQj5EvupFBuidPyVZlmVJV/u//zcPecfbPzvHScfQiXoOsQV2lfB59zg1mrxKGyMZ4e1tbSTB5Ea0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785776206; c=relaxed/simple;
	bh=0gStX5aswa2Oy8OyS3h4jCJzOiKQDmU95lX8+cL9t00=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mCQSnWudBsm5fIRBSCRUCWu6Yn3E2hWGNfMQIZnbHq3HGOq4GylfeuKkJ0VJb8gc6gcoz75cDNFPeV9c2b+L1z0cHzsxeZBcnemLFKZrlyfgmlwh0+GwAOlgfvkJNgchcm7Yw2rQKEENF7Q/9j/ZIDcRtdoq2MEQQHbQ4DY2dpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nv/3fHsd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nv/3fHsd"
Received: by smtp.kernel.org (Postfix) with ESMTPS id ABCA4C2BCF7;
	Mon,  3 Aug 2026 16:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785776205;
	bh=0gStX5aswa2Oy8OyS3h4jCJzOiKQDmU95lX8+cL9t00=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Nv/3fHsdBVCwWMXrcseSpbfRq14lM3CcpkMhSZv4x8azXwxofbpA/fQ75v/RKbziv
	 MO1Hsod0DxsRX2dH8uSSO6wRd7fILMMeNdG44S+ts3NyHHTVvxNxgkEZJMVbtod5fb
	 Vg92/MhHViNaQoSO/ZWfy2nEmZaZnnT6t8DzjgsN4L2kFck4ugAg2SlAMChGnPixqY
	 Opd9GGLTnxCA08VtDPuOxl2mXHXMIKSO6r7mlRZQ/PvAGOgh8lQis1E2qpCc8GUlev
	 fZ1+gGFnEVpWdJW/qnngKeAmV3XavrIjH7XR4LrF2X4uRzaQDMJnbcs/UDyDAASVQx
	 yNQohJ+0zt+ug==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A8C9C55184;
	Mon,  3 Aug 2026 16:56:45 +0000 (UTC)
From: Miao Wang via B4 Relay <devnull+shankerwangmiao.gmail.com@kernel.org>
Date: Tue, 04 Aug 2026 00:55:49 +0800
Subject: [PATCH RFC v5 1/7] mfd: ls2kbmc: Make a copy when parsing mode
 string
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-ls2kbmc-mod-v5-1-e6bc5cdd9a93@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2609;
 i=shankerwangmiao@gmail.com; s=20250715; h=from:subject:message-id;
 bh=U6cr9tgtHDx0WKodEY4FvK4JRMLlLLDCHMpw0TehXDs=;
 b=owEBbQKS/ZANAwAKAbAx48p7/tluAcsmYgBqcMhKI8yWfAOidTLPqzOGA8PA9CkgvMDA2n2Rl
 1cfvBzkERGJAjMEAAEKAB0WIQREqPWPgPJBxluezBOwMePKe/7ZbgUCanDISgAKCRCwMePKe/7Z
 bt9mEAC7giJ3sZf0D0yS6L8QLrl7uWy1J7eCaPg92jdlM22hi7UfbXJYQxa8EK1fzHypR1piiOo
 fH5KIjmEhIJJ4bPdXt894GfCFWWygal9PlH9Yn89V1utIX9c8GLlYXpq1I5Ih3846w63yfbx9nB
 vuWN1HEs97eWQbwAc8qXjr+xvbNz/dVcKo+CuW1AKbYh+VCA6A1ZC5oI23Y96rlCdyYLiADDzp/
 4a3Z44GJvBkfhXy2eMw7Azq006rs+KuI2DcuoEV7449s7WIbBkm+CV8E+IkwBziyO9MszjcoM46
 vxwAApZvLx/gTxI5+r9hZHck8rqFRABJb2wzH/mCdGbaW42eF03J7rcktAQHfQ8B3V7B4sUSxDF
 8fDoc9l1Vsb9BHu0C7QXiFl4a29bx2XYy7JgzdQp8AxzfhBR3cjfPIla3ZbJiwTyY4OnBp8/nuy
 RxYVvGipb3RamdX30kIMxgxFCDU8iyYKvkycMSZHa0ycNktwzIUKIwfpVQcvFNOIedEtpsG5GZq
 L5YsFs/F4D68cuOKuOsI57zawn/x+QV6/WYyKocykK/glxiec4/ViiJVWwNtnAgCNFhuoEwWWkV
 wKYzeJjycWCuFdA4FRMb0MwIwAkoLHVsNYi9qxX/QbiQ1ywRxYaeMpRfGlWNYHoHGR8RcBzOI9d
 Xw2GRhJp/x5LMNw==
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


