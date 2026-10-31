Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.254.49.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793451957;
	b=AIDQnIeFcrFtUApaTzIGQZpBPyGSNqHJFho15kvcOHWT+iyS5GeMHNVhvOlXCTGkV/o2
	 Eu6cyxHPLYsOKgPU2YwaiFsuQn2CFN23f6xgh1fNA0NAbpfqKpcsqOMdBhFxF/Hd64/MT
	 k5am8PYMHUNLECVPD/ZPWCxxd2XJfeP+K2DjhBXifsy3rbtJiYE27Aa0BUFUgP+jdr5D2
	 ZKuLQTM0TRtCiWBoI2qsxPDK/fCZvg6tzTMzCV6Ba97KRJOWaxtGg0Wz0JVkPCNNpa+f0
	 uyJQyIsLNFgBIiIFZXaGaee7/3M76kSwPDO+qfsOaRypMMrAwV26wcUtymOEQw1Md5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793451957;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-HM-Tid:X-HM-MType:
	 X-HM-Spam-Status:DKIM-Signature;
	bh=ah5H3S1MCyN3QYP2sVF8icD/VSjKboAgI3kZivMdIFA=;
	b=FiLjmNYImBfU687Sld5qV6fsrHIYmZQuH3bcXoPZ+Srgzavr0xHVB+hKvs1fgjQGjdh+
	 dfKftAXOkN6BBGrQ0bT6oVeCJG99Hd0ap7ZPtvTfTd4eV44Igc77PXK8KDZ28A33Aklp0
	 nmVOTm7n6YuEmOMZ2JhBIeSBu+MypJMreYLZl6Sn+MP7wGw1+5SlvOMAxN4JPBsxUvW+j
	 F0GWZsgIMP0+wu0GsLIxKLIf9TvzAJc+OFJ+5CeG66IRgNcv9+blXAQucEW6WzGKncZNd
	 ad9EbW8204J0zmR7xkM4QcnBSUlHhGyBo2OF2o4YcuNZVhH+up9PNOyQM1thzkq6bkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.sdu.edu.cn;
	spf=pass smtp.mailfrom=mail.sdu.edu.cn;
	arc=none smtp.remote-ip=45.254.49.198
Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com [45.254.49.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BD72606A31C;
	Sat, 31 Oct 2026 13:05:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6BD72606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.sdu.edu.cn
Received: from lgs.. (unknown [101.76.249.61])
	by smtp.qiye.163.com (Hmail) with ESMTP id 530655122;
	Sat, 31 Oct 2026 21:05:42 +0800 (GMT+08:00)
From: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>,
	Linus Walleij <linusw@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] gpio: mpc8xxx: Fix potential use-after-free of IRQ domain
Date: Sat, 31 Oct 2026 21:05:41 +0800
Message-ID: <a4fec7fe970d6fc9135b488f57ba7e145b809359.1793377433.git.liguangshuo@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.43.0
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
X-HM-Tid: 0aa19210e13203a1kunm3054e7f683bee
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCGEwaVh8aQk0eGR0YHktLQlYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKS0pVTE1VSU9CVU1KWVdZFhoPEhUdFFlBWUtVS1VLVUtZBg
	++
DKIM-Signature: a=rsa-sha256;
	b=MV69eDx5n/wLZlSpvHUYwjC6xbm4ovEkB4bgtUukNr8qLhf3EjJHK5VP9awCI7JrkpXe5UQX4IV20GF5b2Zy2qcIur7C3oQEP1H4FZr26YvEKxrABnjN0jSasD/7LLSnUVbkF/uGgJQK0yqg4e9nwaW7aV2w6UkEfMGS337km2Q=; s=default; c=relaxed/relaxed; d=mail.sdu.edu.cn; v=1;
	bh=ah5H3S1MCyN3QYP2sVF8icD/VSjKboAgI3kZivMdIFA=;
	h=date:mime-version:subject:message-id:from;

GPIO chip cleanup can call the to_irq callback while releasing requested
GPIOs. Removing the IRQ domain first leaves that callback using a freed
domain, both on removal and after an IRQ request failure.

Register domain cleanup before GPIO chip registration so devres removes
the chip before freeing the domain.

This issue was found by our static analysis tool under development.

Fixes: 257e10752c13 ("gpio: mpc8xxx: Use of_mm_gpiochip_remove")
Assisted-by: OpenAI:gpt-6-astra
Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
---
Build-tested the changed object with x86_64 allmodconfig (W=1,
CONFIG_WERROR=n).
No runtime or fault-injection testing was performed.

 drivers/gpio/gpio-mpc8xxx.c | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpio-mpc8xxx.c b/drivers/gpio/gpio-mpc8xxx.c
index a6868f673831..605393d3c992 100644
--- a/drivers/gpio/gpio-mpc8xxx.c
+++ b/drivers/gpio/gpio-mpc8xxx.c
@@ -319,6 +319,14 @@ static const struct of_device_id mpc8xxx_gpio_ids[] = {
 	{}
 };
 
+static void mpc8xxx_irq_domain_remove(void *data)
+{
+	struct mpc8xxx_gpio_chip *mpc8xxx_gc = data;
+
+	if (mpc8xxx_gc->irq)
+		irq_domain_remove(mpc8xxx_gc->irq);
+}
+
 static int mpc8xxx_probe(struct platform_device *pdev)
 {
 	const struct mpc8xxx_gpio_devtype *devtype = NULL;
@@ -405,6 +413,11 @@ static int mpc8xxx_probe(struct platform_device *pdev)
 						       mpc8xxx_gc->regs + GPIO_DIR);
 	}
 
+	/* GPIO chip cleanup still needs the IRQ domain. */
+	ret = devm_add_action_or_reset(dev, mpc8xxx_irq_domain_remove, mpc8xxx_gc);
+	if (ret)
+		return ret;
+
 	ret = devm_gpiochip_add_data(dev, gc, mpc8xxx_gc);
 	if (ret) {
 		dev_err(dev,
@@ -437,7 +450,7 @@ static int mpc8xxx_probe(struct platform_device *pdev)
 	if (ret) {
 		dev_err(dev, "failed to devm_request_irq(%d), ret = %d\n",
 			mpc8xxx_gc->irqn, ret);
-		goto err;
+		return ret;
 	}
 
 	ret = devm_device_init_wakeup(dev);
@@ -445,19 +458,14 @@ static int mpc8xxx_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, ret, "Failed to init wakeup\n");
 
 	return 0;
-err:
-	irq_domain_remove(mpc8xxx_gc->irq);
-	return ret;
 }
 
 static void mpc8xxx_remove(struct platform_device *pdev)
 {
 	struct mpc8xxx_gpio_chip *mpc8xxx_gc = platform_get_drvdata(pdev);
 
-	if (mpc8xxx_gc->irq) {
+	if (mpc8xxx_gc->irq)
 		irq_set_chained_handler_and_data(mpc8xxx_gc->irqn, NULL, NULL);
-		irq_domain_remove(mpc8xxx_gc->irq);
-	}
 }
 
 static int mpc8xxx_suspend(struct device *dev)

base-commit: d89e1d186ec9271bf78e62771779e9fc03bf0fc3
