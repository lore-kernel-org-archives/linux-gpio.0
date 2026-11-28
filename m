Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.254.49.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795863754;
	b=iSI8JBCX/nMdDo5/yKBdepXhpgIQGevIdzuDcwZ7NMBR2Rmdy1K/hjj0DXk61OwPw44U
	 rhmyaa4n9dJ81YFOZlLWDPaT8X+LM74pu0cxMAxlue5oSYyEH7pBTj+MaSpo6a7apbkha
	 vxfCNq1jmNw4/clcGkJPI1sLAcVHRLaAzwxQ69RXpBMqG9pXLTIvnndx/3VFowAJACf9E
	 T2f31HgUt/tjnLlAL4hHCq52vHtBW58Af6ig03cbSXEmdr91SXL+qYQnXX1k00/4FlBuq
	 zdobleqMSavyteFXaFeQ4dwM7k3GwGfS/qwNig732pHxveFfD/AnLu9xeJCrA4LWrYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795863754;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 X-HM-Tid:X-HM-MType:X-HM-Spam-Status:DKIM-Signature;
	bh=ZCyDGRfcmo9PdGUN+7JceMhkCbaL+HLAdpxWqFH4KIA=;
	b=30IY+LHeP2PE+NP2DIJ01MX1eVPb0zXfdVAtl9sa/imDl/DFq5j5ngK41v2op4jkPHQg
	 3BY7A0nWLYyNJIPM4+srxwNuxNqTLRzx8iuVi0/gSGI3dUnm0eppiS47BLFZbub+acCE7
	 65cYqlU1UwYeZOlVkGbaCVjGyOwvY4Xv9H/D4Txoz0arTaZhZTVcdKybZm40Isd3uEg3g
	 fAzBrnnBJiM+BWWtSLtVp4Pwzyz5pSdgA+x6khm3TVdiCYzdAHRwyOQ6kb42y6sYDAR+P
	 f71U0cbk/ae5zH0frPk4BIaELPjSA3vbhTTYdzFxL/N0eRl5nHSMmaYSbD/2d+uqVUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.sdu.edu.cn;
	spf=pass smtp.mailfrom=mail.sdu.edu.cn;
	dkim=pass header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=VdV9We+B;
	arc=none smtp.remote-ip=45.254.49.197
Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AEC1606A321
	for <linux-gpio@vger.kernel.org>; Sat, 28 Nov 2026 11:02:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0AEC1606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=VdV9We+B
Received: from user.localdomain (unknown [223.80.110.101])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5656652af;
	Sat, 28 Nov 2026 19:02:30 +0800 (GMT+08:00)
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
Subject: [PATCH 1/2] gpio: sifive: Unregister the GPIO chip on unbind
Date: Sat, 28 Nov 2026 19:02:28 +0800
Message-Id: <20261128110229.875394-2-202300460064@mail.sdu.edu.cn>
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
X-HM-Tid: 0aa221d2286303a2kunmfbc41f2a3cbc7d
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCGEhKVh9LS0lOHx1KQxoeH1YeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUhVQ0tVSkpLVUpLSllXWRYaDxIVHRRZQVlLVUtVS1VLWQ
	Y+
DKIM-Signature: a=rsa-sha256;
	b=VdV9We+BtkH0hb2m61mnfXA1rXmL0GwBfvl23bMVpZyAQ2ULBLgGOuX7j8aaV3X6A8wSGewA5KkI/LdugzjFF4Esk9QuLRvYGFdLfOi5Tk6ACWtEOqYnsXuUNW2gWW5zCrSnuNobeKdZohvYDOOmC/r08dBaxHi6Fi15JKoT/9o=; s=default; c=relaxed/relaxed; d=mail.sdu.edu.cn; v=1;
	bh=ZCyDGRfcmo9PdGUN+7JceMhkCbaL+HLAdpxWqFH4KIA=;
	h=date:mime-version:subject:message-id:from;

From: Tian Xuechen <202300460064@mail.sdu.edu.cn>

The SiFive driver registers a GPIO chip embedded in managed storage.
The chip remains registered when the driver unbinds and that storage
is released.

Use devm_gpiochip_add_data() to unregister the chip on unbind.

This issue was found by our static analysis tool under development.

Fixes: 96868dce644d ("gpio/sifive: Add GPIO driver for SiFive SoCs")
Signed-off-by: Tian Xuechen <202300460064@mail.sdu.edu.cn>
---
 drivers/gpio/gpio-sifive.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-sifive.c b/drivers/gpio/gpio-sifive.c
index 0b52b20e5136..f7564bcce9db 100644
--- a/drivers/gpio/gpio-sifive.c
+++ b/drivers/gpio/gpio-sifive.c
@@ -252,7 +252,7 @@ static int sifive_gpio_probe(struct platform_device *pdev)
 	girq->handler = handle_bad_irq;
 	girq->default_type = IRQ_TYPE_NONE;
 
-	return gpiochip_add_data(&chip->gen_gc.gc, chip);
+	return devm_gpiochip_add_data(dev, &chip->gen_gc.gc, chip);
 }
 
 static const struct of_device_id sifive_gpio_match[] = {
-- 
2.43.0

