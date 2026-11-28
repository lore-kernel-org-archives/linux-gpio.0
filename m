Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.254.49.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795863756;
	b=KsGWxSVNNkEL3MQCnEMToypJEAZ7wOn/OjtcxeHVrxutJfulwCXlG03/p1HUFcYglFAn
	 QK+FTXDeVUzxBTPwQdy6xIXKmen0Vb6bm++dM2wwMXvrFbUJcJ2IpZvov66THQs8NCIWq
	 AtlLAAObV5M+NPPnqS6qSoGqoGyBXHBoA/JF4O0r6aQkp2+0Nj5rnEYZLWJUq5oBrA35w
	 AtXG041m9whhoT5ToN19Ewkt9uIdX04v0lSrd3Qu2WzEP2wuXgzjb24QwxtHL7R6tenj4
	 Pzo/VIYJOLVHG79YPhpa+APU6Ph/1eyGh5wbotQKgKUKd0zwSjyLwfDzh0jvI9xQ33A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795863756;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 X-HM-Tid:X-HM-MType:X-HM-Spam-Status:DKIM-Signature;
	bh=bvsCi811ICl989Zhp9gIItL7LZeR3KrMd+e1Qib+C28=;
	b=vxBQOf6L0xOrnLE2HE/s3LFB3uYjYYFDCTtFoyFhfR+i9d8xJxCXo+IPAFJ7xLOP4o9V
	 89vOVya911QlsGgbJ0cCA4rbiQqZnDM6xZIMOgeVAt3tbwXjYBrW84SuhRe8LNF9/gs2e
	 jSmNOP0rPkm7/uVfwfGalIngFaY2+W/OnnUDhk/eoSi0174/8EEr1mZqNtI9qSdVjx4Gp
	 lxqSJFFAxbTqO3PtQEJpFTPC5VtCowxV+fl7KEGpEOvbJO66EnGqQ4GdQQuM6YY9oNphV
	 P6nqmvzgdIwq3rteN8VmFfCHVnz7wnkABw/I+YuPeG+Qz0O/dZtbf4OVybKVEpeWD1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.sdu.edu.cn;
	spf=pass smtp.mailfrom=mail.sdu.edu.cn;
	dkim=pass header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=GO+tAk1w;
	arc=none smtp.remote-ip=45.254.49.198
Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com [45.254.49.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71D41606A324
	for <linux-gpio@vger.kernel.org>; Sat, 28 Nov 2026 11:02:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71D41606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=GO+tAk1w
Received: from user.localdomain (unknown [223.80.110.101])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5656652b1;
	Sat, 28 Nov 2026 19:02:31 +0800 (GMT+08:00)
From: Tian Xuechen <202300460064@mail.sdu.edu.cn>
To: linusw@kernel.org,
	brgl@kernel.org,
	pjw@kernel.org,
	samuel.holland@sifive.com,
	maz@kernel.org,
	atish.patra@linux.dev,
	wesley@sifive.com,
	yash.shah@sifive.com,
	kamlakant.patel@broadcom.com
Cc: linux-gpio@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	liguangshuo@mail.sdu.edu.cn
Subject: [PATCH 2/2] gpio: xlp: Unregister the GPIO chip on unbind
Date: Sat, 28 Nov 2026 19:02:29 +0800
Message-Id: <20261128110229.875394-3-202300460064@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261128110229.875394-1-202300460064@mail.sdu.edu.cn>
References: <20261128110229.875394-1-202300460064@mail.sdu.edu.cn>
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
X-HM-Tid: 0aa221d22c4503a2kunmfbc41f2a3cbc87
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDTUwaVhpMGR1JH0lNSklJHVYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUhVQ0tVSkpLVUpLSllXWRYaDxIVHRRZQVlPS0hVSktJQk
	NDTFVKS0tVS1kG
DKIM-Signature: a=rsa-sha256;
	b=GO+tAk1weVKYr8bx1pxZ5eTAGkxbZ1Esx1w9X3ZH4sfGSerk5jLFn4U7/K0jFqBv3q7Jf0qYnw7u3H/xJWCgbdCg0brXfYEfXQSjzV9PgiQB3N8Laz1St5wRwqrrch5i8d6F0in03WT+2SRA0sATflvIOe8FfSbB3XaVXkdwT1M=; s=default; c=relaxed/relaxed; d=mail.sdu.edu.cn; v=1;
	bh=bvsCi811ICl989Zhp9gIItL7LZeR3KrMd+e1Qib+C28=;
	h=date:mime-version:subject:message-id:from;

From: Tian Xuechen <202300460064@mail.sdu.edu.cn>

The XLP driver registers its GPIO chip without removing it on unbind.
The GPIO chip and its IRQ parent array are both managed allocations.

Use managed GPIO registration so the chip is removed before its
backing storage is freed.

This issue was found by our static analysis tool under development.

Fixes: ff7188000679 ("gpio: xlp: GPIO controller for Netlogic XLP SoCs")
Signed-off-by: Tian Xuechen <202300460064@mail.sdu.edu.cn>
---
 drivers/gpio/gpio-xlp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-xlp.c b/drivers/gpio/gpio-xlp.c
index e9618608f2a0..89aab2663d62 100644
--- a/drivers/gpio/gpio-xlp.c
+++ b/drivers/gpio/gpio-xlp.c
@@ -291,7 +291,7 @@ static int xlp_gpio_probe(struct platform_device *pdev)
 	girq->default_type = IRQ_TYPE_NONE;
 	girq->handler = handle_level_irq;
 
-	err = gpiochip_add_data(gc, priv);
+	err = devm_gpiochip_add_data(&pdev->dev, gc, priv);
 	if (err < 0)
 		return err;
 
-- 
2.43.0

