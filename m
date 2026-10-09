Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40A343DA7E3;
	Fri,  9 Oct 2026 05:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791522372; cv=none; b=S4AgfsNXNnP1yx6bwL3klAk+vqq8aMVPhrofUzRSJxzo69CJQD9NfEAzEQy4OeV0K7IgOict6YDeTVRA21OBRSkDamS6dCLMo+cQerIcocJ13yBHVEAEx1UwGtHNASWEx3MGO9z/Nb3R2vcjtLA3TzZZ4SdhkMvBh1u47ZUVgOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791522372; c=relaxed/simple;
	bh=UiL79diLt3F+62aSobxfKE+LD7dc5OA2dS9y5/uMj4U=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=E6mr/uOeMdOdY/uMQS8IG6E/blNp2SD/WKQMNGEUfDT1RVVcjXGoYULJQ/YQ0jLfeZwjD72krwCKSmnDkqAMGv6x2513/WKNm1XUpsoROVIWeoyIJlfC2/FsYMXRutzekg6luElQfZ1EWoeTnkZBs8jtg4cd6DIgEfHzFbj/hCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from fc87d0ffb700.home.arpa (unknown [36.110.52.2])
	by APP-03 (Coremail) with SMTP id rQCowACnpTM5dshqr5UcCg--.23579S2;
	Fri, 09 Oct 2026 13:06:02 +0800 (CST)
From: Haotian Zhang <vulab@iscas.ac.cn>
To: Robert Jarzmik <robert.jarzmik@free.fr>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] gpio: pxa: propagate pxa_gpio_probe_dt() error code
Date: Fri,  9 Oct 2026 13:06:04 +0800
Message-Id: <20261009050604.3128124-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowACnpTM5dshqr5UcCg--.23579S2
X-Coremail-Antispam: 1UD129KBjvdXoWrtFyxJw1kXw4Dtw1xGryxGrg_yoWDJFb_Gw
	1kJrWIvw1kAF1qvF13Aa1Ivr9FyFs8uF48CFn2qa13GrWDXFnIgry7uFZ8XryDXw4UKryD
	KFyDAr1avr43CjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbc8YjsxI4VWkCwAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I
	6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
	8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0
	cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z2
	80aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAK
	zVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Cr0_Gr1UMc
	vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY1x0262kKe7AKxVWUAVWUtwCF
	04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r
	18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vI
	r41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr
	1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvE
	x4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjxU2DGYDUUUU
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBwUPA2rIaDUcewABsX

pxa_gpio_probe_dt() returns the negative errno produced by
devm_irq_alloc_descs(), which may be -ENOMEM, -EINVAL or -EEXIST. The
caller in pxa_gpio_probe() overwrites that value with a fixed -EINVAL, so
the actual reason for the failure is lost.

Return irq_base so that the original error code is propagated.

Fixes: 384ca3c6a28d ("gpio: pxa: change the interrupt management")
Assisted-by: DeepSeek-V4.1-Flash
Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
---
 drivers/gpio/gpio-pxa.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-pxa.c b/drivers/gpio/gpio-pxa.c
index 2b5da973f51f..ef3f21723b09 100644
--- a/drivers/gpio/gpio-pxa.c
+++ b/drivers/gpio/gpio-pxa.c
@@ -632,7 +632,7 @@ static int pxa_gpio_probe(struct platform_device *pdev)
 	} else {
 		irq_base = pxa_gpio_probe_dt(pdev, pchip);
 		if (irq_base < 0)
-			return -EINVAL;
+			return irq_base;
 	}
 
 	if (!pxa_last_gpio)
-- 
2.25.1

