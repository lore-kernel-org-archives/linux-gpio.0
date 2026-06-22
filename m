Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF492FBE1F;
	Mon, 22 Jun 2026 15:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782142331; cv=none; b=FLH/JfI9F4GstQoCudkoT5S1uU1T/kzCrWPhPW9XDeeSIWh9bslY5FZ9z8WemXLAKoxY7OUo6QSrTCdHmSQYhxyrFQ+s4kk2rQN9AAImb1l46izsKVEhJ2sJUpAJ5a4RMCKBvy7oablykPdb96IXsqsD67hm/IocLgNF088HsMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782142331; c=relaxed/simple;
	bh=Ieu1iimoY94xI4dMflraDhRZbBklcAzRW07CGtPdvmE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WpKznlPyOvYhCXk4vvLTUrhmcs+/kfvbKLqCkDlyNwYhrhRHbd5rNikROK82uCq0JEuHJuIfbjM0ldvAisfy99iPGfpaAEw0O3Z9gUor5CFvNvHpDBplWzyfxEDx0I7jjWLTwvclFwSPu8p5+AL71fJxEBE5WN5z3n7uA5yVdMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-01 (Coremail) with SMTP id qwCowACnQMl2VTlqILzBAg--.32362S2;
	Mon, 22 Jun 2026 23:32:06 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	pengpeng@iscas.ac.cn
Subject: [PATCH v2] gpio: htc-egpio: use managed gpiochip registration
Date: Mon, 22 Jun 2026 23:32:04 +0800
Message-ID: <20260622153204.72071-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowACnQMl2VTlqILzBAg--.32362S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Aw45ArW8ur15uFy8tw18Zrb_yoW8Wr4xpa
	ykW3yrKrWjgw42q3yUAFs5Ca4F9a42qr47trykKw48Zr15K34ktF4rAayUXryUJrWkCa13
	tF40vrW8CF4kZF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkm14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v26r12
	6r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI
	0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y
	0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
	WUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1l
	IxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjfU5oGQDUUUU
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

egpio_probe() registers each nested gpio_chip with gpiochip_add_data()
but ignores the return value.  If one registration fails, probe still
returns success even though one of the chips was not published to gpiolib.

Use devm_gpiochip_add_data() and fail probe if any chip registration
fails.  This lets devres unwind already registered chips and prevents the
driver from publishing a partially initialized device.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
Changes since v1:
- Use dev_err_probe() for the gpiochip registration failure as requested by
  Bartosz Golaszewski.

 drivers/gpio/gpio-htc-egpio.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-htc-egpio.c b/drivers/gpio/gpio-htc-egpio.c
index 6b54474dc81c..17ca04b389cf 100644
--- a/drivers/gpio/gpio-htc-egpio.c
+++ b/drivers/gpio/gpio-htc-egpio.c
@@ -263,6 +263,7 @@ static int __init egpio_probe(struct platform_device *pdev)
 	struct gpio_chip  *chip;
 	unsigned int      irq, irq_end;
 	int               i;
+	int               ret;
 
 	/* Initialize ei data structure. */
 	ei = devm_kzalloc(&pdev->dev, sizeof(*ei), GFP_KERNEL);
@@ -340,7 +341,10 @@ static int __init egpio_probe(struct platform_device *pdev)
 		chip->base            = pdata->chip[i].gpio_base;
 		chip->ngpio           = pdata->chip[i].num_gpios;
 
-		gpiochip_add_data(chip, &ei->chip[i]);
+		ret = devm_gpiochip_add_data(&pdev->dev, chip, &ei->chip[i]);
+		if (ret)
+			return dev_err_probe(&pdev->dev, ret,
+					     "failed to register gpiochip %d\n", i);
 	}
 
 	/* Set initial pin values */
-- 
2.50.1

