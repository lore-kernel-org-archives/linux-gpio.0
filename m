Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793384154;
	b=ykUeJ32NVni2D/Qos0kmqObVuhmmwob1XlpwESfDZLJwSla13LCepec4s006ywvypzFA
	 /kvae/Icu0I+SFtBQi4FEc5NfUdsOgMM5eYmHi9qUMs+tGgeiuBULAXHH6an8qYuHoGAb
	 t5npBGpj+Vr0VkydFp8aYIkt51pcS71dMYVL38VS/gI6fXRImklA9PsGP1r/p5WcMB6z0
	 uwNCi8Cs5p5SexYeaig9TlVCUVr98H9SvFHTaGJobEWc+v8EDwiQGI03bCnuR/W5oP1oR
	 5o7KTV7/Gv1SFmRrLDk7eK2SxJQMmEV3ZOQidKguFNA+U8VvOU0h6/a286ovr4+/t3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793384154;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=p6XBeS28YdeKR1FrvM+4ypySmOBgmuPeaEe4fr40c/Y=;
	b=mLQR3pqiRLYYIKMjnI67fGJQ9J2wYPir1XMf4sKSt+4VqgiJA0FScz2sO7ruRsoU+Cwj
	 K//FX3mr6SC4KWh+wxHKHVCBRNd6cTCuQT/Rp/udKKbZCSQkrmv4Iot1sHi6GfZYvJxQU
	 uNcjIHgPSFI3zAZAdZjn+nBuyebWFSNn6bwcSrlVWOn86WZMCDZdxUmjeYSF2Ha9aOfhr
	 oatBCpLCLKk8xRHw+08tP4TK2miNDg9tbToTSKhHbi1DykGqJi5hCJKTQvxmwhVc4q4V5
	 qYZHrxtnSSNPng8fHzIwrHMgsgp440ZCh75r52vJ9WD7LWoCX56RQm28KG3pxxK4Nbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eTpNv1es;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13BFE60A260A;
	Fri, 30 Oct 2026 18:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eTpNv1es
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 495E01F00A17;
	Fri, 30 Oct 2026 18:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793384153;
	bh=p6XBeS28YdeKR1FrvM+4ypySmOBgmuPeaEe4fr40c/Y=;
	h=From:To:Cc:Subject:Date;
	b=eTpNv1es5b+ljOxmfoakZGsli9Xn2JnIbLUIyejGvKlPgVxycFZH6IGqIzhd41hbu
	 eC1jvCjpYBnT7aD/5MEvPnkcKR+W3N4yGPgFNXg2Tdou5EnHQBxsG7WDTG+TFBGBvt
	 e07VrI5qFeD5DDHzmOgbwJitvJv7HhX0+GuBZe5Z4t1211Os7y0TI3xXhkaGzNg143
	 h3VPFDB51fwauqkGh4ZQQt2Kxl7Ehahf3oe+R2hv4zyImywT/aV917PRZ53oMqJ6Dl
	 m0O76w9SUPMOTlzn3Y+qj2+o58xofh3f1+MylqAgm6tB/zGm4oCTMjMitgKDG9abAA
	 0JvfCu7BNGjAw==
From: Conor Dooley <conor@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Valentina Fernandez <valentina.fernandezalanis@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	linux-riscv@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] pinctrl: mpfs-mssio: remove unused mutex
Date: Fri, 30 Oct 2026 18:12:14 +0000
Message-ID: <20261030181214.2448140-3-conor@kernel.org>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1905; i=conor.dooley@microchip.com; h=from:subject; bh=Cij3GL7z2OJhW4lZm9udhmYEzhHSkCOKSkfmcKM8MXI=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDFlP7v4TOJc0NWfPD/FD8yOXiQYenj4hRGPidQk9A9Gof j0LqfqKjlIWBjEuBlkxRZbE230tUuv/uOxw7nkLM4eVCWQIAxenAEzk2V1Ghl9P5GUmdTEmGc/7 JH2PY23eaj8+VoWqq3s3HO+cN+vyoTSGv4IT17bfF01YuCNk33L/+StcnQ4Wy/HGLd7gfyOxP6q zhRUA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit

From: Conor Dooley <conor.dooley@microchip.com>

The pinctrl core creates a mutex that is used to protect things like the
generic dt node mapping functions. The (currently) unused mutex was added
when the driver was in RFC state and contained a custom dt node mapping
function, and used the driver's own mutex to protect it. The driver
probably could have borrowed the core's, but this is moot since the merged
version of the driver no longer has a custom dt node mapper. Remove the
unused mutex.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
CC: Conor Dooley <conor.dooley@microchip.com>
CC: Valentina Fernandez <valentina.fernandezalanis@microchip.com>
CC: Daire McNamara <daire.mcnamara@microchip.com>
CC: Linus Walleij <linusw@kernel.org>
CC: linux-riscv@lists.infradead.org
CC: linux-gpio@vger.kernel.org
CC: linux-kernel@vger.kernel.org
---
 drivers/pinctrl/microchip/pinctrl-mpfs-mssio.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/pinctrl/microchip/pinctrl-mpfs-mssio.c b/drivers/pinctrl/microchip/pinctrl-mpfs-mssio.c
index 8da0c5312ce3..17c6d4190053 100644
--- a/drivers/pinctrl/microchip/pinctrl-mpfs-mssio.c
+++ b/drivers/pinctrl/microchip/pinctrl-mpfs-mssio.c
@@ -56,7 +56,6 @@ struct mpfs_pinctrl {
 	struct device *dev;
 	struct regmap *regmap;
 	struct regmap *sysreg_regmap;
-	struct mutex mutex;
 	struct pinctrl_desc desc;
 };
 
@@ -677,7 +676,6 @@ static int mpfs_pinctrl_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct mpfs_pinctrl *pctrl;
-	int ret;
 
 	pctrl = devm_kzalloc(dev, sizeof(*pctrl), GFP_KERNEL);
 	if (!pctrl)
@@ -703,10 +701,6 @@ static int mpfs_pinctrl_probe(struct platform_device *pdev)
 
 	pctrl->dev = dev;
 
-	ret = devm_mutex_init(dev, &pctrl->mutex);
-	if (ret)
-		return ret;
-
 	platform_set_drvdata(pdev, pctrl);
 
 	pctrl->pctrl = devm_pinctrl_register(&pdev->dev, &pctrl->desc, pctrl);
-- 
2.53.0

