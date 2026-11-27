Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.254.49.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795779215;
	b=JKdU9+wXLKeCoWozd/+b7DMEidiHn16uC0q9bcqjXM6bDB3qUMP/3ORIfkygUX4vkx/d
	 NGvn054KxKgN6ylyqeTZCSet8tugDr4TNgRCN8Yjd2F/vBMtFct2HhnP0jEQBfkJpG0V+
	 uyUAUnNPUhE9CqTns16C/wwb5jyZBoSytyWc8oqd0On+S2+mXs6VKrM7Oh04T/nFDfO+0
	 m1IqCuZ221QtB74nZb+PdELnmnGbLjEax0bLIVFbTRqJ06yc0KFDhR5DGiXAT5AaexHMR
	 aLBxMc5hWm7xA/Pg6J5BaKWuAKVUbrcN9NBITTKH86fmzoRKodoHnoVc6nEGVM0CSjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795779215;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-HM-Tid:X-HM-MType:
	 X-HM-Spam-Status:DKIM-Signature;
	bh=nceqd0TOBeVuB+r1NM/sieYkJrmVjiu9YO8R74BAOow=;
	b=UGIL5Er4S6x9LrUFFsGnVyoE3BJ01pMUAjnsJ/YBB6UQHVPBOrbDwSeY+ScXs8Vuo3jT
	 uUMXbMvVFyQJ07F5v/tc4jkXATzASHb6SjErZh/TquW7dmAciAyNPQMVd4Ex2u0fBeaia
	 x30YszTVLzcO+mVUeelSoIvau6DtQf4zFbfJafyeG/V7B3JLazmhnCTLCaTpSQMDbaP5u
	 yuLK7JpgOvqkKXjn/UAV6XA4Xg07JskUItx2IAbj6Pdbh6zMRBXyTp4EkM/mI0jMgdMUC
	 5WhFma8yedd6sPiVy5oEeeoH7Is8H+jd5NPJmk50R/obQtzlIrmJd8C70/Nds7ADnHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.sdu.edu.cn;
	spf=pass smtp.mailfrom=mail.sdu.edu.cn;
	dkim=pass header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=cehcGGpt;
	arc=none smtp.remote-ip=45.254.49.197
Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3A63606A32E
	for <linux-gpio@vger.kernel.org>; Fri, 27 Nov 2026 11:33:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3A63606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=cehcGGpt
Received: from user.localdomain (unknown [223.80.110.101])
	by smtp.qiye.163.com (Hmail) with ESMTP id 564299832;
	Fri, 27 Nov 2026 19:33:31 +0800 (GMT+08:00)
From: Tian Xuechen <202300460064@mail.sdu.edu.cn>
To: linusw@kernel.org,
	brgl@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	anson.huang@nxp.com
Cc: kernel@pengutronix.de,
	festevam@gmail.com,
	linux-gpio@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] gpio: mxc: Register syscore callbacks after the platform driver
Date: Fri, 27 Nov 2026 19:33:31 +0800
Message-Id: <20261127113331.390479-1-202300460064@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa21cc8323703a2kunm52c51fe4395df4
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaHksZVkoaHR8eSU4eQxgaGVYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUhVQ0tVSkpLVUpLSllXWRYaDxIVHRRZQVlPS0hVSktJQk
	NDTFVKS0tVS1kG
DKIM-Signature: a=rsa-sha256;
	b=cehcGGptb2b5SNz7ywjGGKHtrOzKN6+BFSYiauFNCgmlCDoBZqIN+QNOZXLwXAWYrvGXX16xstqS77Aa1fooncCn0NgK7B3Hz3Cov7VcdZG7ISvH4TCLjc7QEt6IB+HpSF+N0qRoEgvNvN1DsG1vN/ggXaVutB3cO6MguatQv2s=; s=default; c=relaxed/relaxed; d=mail.sdu.edu.cn; v=1;
	bh=nceqd0TOBeVuB+r1NM/sieYkJrmVjiu9YO8R74BAOow=;
	h=date:mime-version:subject:message-id:from;

From: Tian Xuechen <202300460064@mail.sdu.edu.cn>

If platform driver registration fails, module initialization returns an
error with the syscore callbacks still registered. Register the
callbacks only after the driver has been registered successfully.

This issue was found by our static analysis tool under development.

Fixes: 1a5287a3dbc3 ("gpio: mxc: move gpio noirq suspend/resume to syscore phase")
Signed-off-by: Tian Xuechen <202300460064@mail.sdu.edu.cn>
---
 drivers/gpio/gpio-mxc.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index 7dabe8073dc6..ed79ce76dcf3 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -738,9 +738,14 @@ static struct platform_driver mxc_gpio_driver = {
 
 static int __init gpio_mxc_init(void)
 {
-	register_syscore(&mxc_gpio_syscore);
+	int ret;
 
-	return platform_driver_register(&mxc_gpio_driver);
+	ret = platform_driver_register(&mxc_gpio_driver);
+	if (ret)
+		return ret;
+
+	register_syscore(&mxc_gpio_syscore);
+	return 0;
 }
 subsys_initcall(gpio_mxc_init);
 

base-commit: 4dce97c6c265544342e716e62fd24bbb232590c5
-- 
2.43.0

