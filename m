Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C76F375F80;
	Mon, 14 Sep 2026 05:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789362951; cv=none; b=OE8IUCpHkAVTuD+ntZy+5Cq0NZi9fSnKVzRxxZXxu/qsVwTS/9DoTuhMhADtrQImqOiZVvcXZLnW5/uk5UWDlLAjjs84Yfln52xtBcRVdk1djm+9HjexsjmDGWS/M0CGneclkqYVvW9X8DrTQQbVMkip84uuvqeLC/eZr9v1mL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789362951; c=relaxed/simple;
	bh=iXQfsBJIJkTYwENA++tcZ1Esa7AHbOeINuOyV1jxrNA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=FxzLhiy0q883JqJTA2qQil6/DStKpfp0mCWvRgN5lJr53MzmfpaFKlSoMhXVlC8ejxICpaSz+bcQNoCKUSc0ZGXcSt2kK06FsV8tHw5lJMQ7Dm8x/TRTXrXGdeWMlz/6XBEV57XY/a2rH83QJkNnGt4r1TD157vGi1ldLZbA80g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn; spf=pass smtp.mailfrom=seu.edu.cn; dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b=O5HLxjXb; arc=none smtp.client-ip=45.254.49.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b="O5HLxjXb"
Received: from PC-202605011814.localdomain (unknown [222.191.246.242])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4da1351f1;
	Mon, 14 Sep 2026 13:15:41 +0800 (GMT+08:00)
From: Runyu Xiao <runyu.xiao@seu.edu.cn>
To: Linus Walleij <linusw@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Runyu Xiao <runyu.xiao@seu.edu.cn>,
	Jianhao Xu <jianhao.xu@seu.edu.cn>
Subject: [PATCH] gpio: virtuser: skip free_irq when no IRQ is installed
Date: Mon, 14 Sep 2026 13:15:37 +0800
Message-Id: <20260914051537.15320-1-runyu.xiao@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa09e57ae8f03a1kunm4486090a2792f2
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDS04fVhkdSxlCSEJPTU9MGVYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUlVSkJKVUlPTVVJT0lZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pPSExVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=O5HLxjXbrqCphPtitxgwzBlDImpTI1gtv9AzLLm1aOyyuFlsY0aCoKmzGZxdjmkG2s34pQ+t5P1r4yEtAe9hEKv+CQzBYAr12tAMDynajaZQEtdFl4xwggO6spzgxBGk5ZLme2XIxIlUs8to1WL599eZldqrkruac1dCMskvZek=; c=relaxed/relaxed; s=default; d=seu.edu.cn; v=1;
	bh=jcXqZq2FjxF+k+84RvL0Rb7ivu7ieeF6I31HK9TGejs=;
	h=date:mime-version:subject:message-id:from;

Disabling interrupt monitoring uses atomic_xchg() to clear the stored IRQ.
When monitoring is already disabled, atomic_xchg() returns 0. It must not
be passed to free_irq().

The bug is reproducible on an x86_64 QEMU guest with
CONFIG_GPIO_VIRTUSER=y and CONFIG_GPIO_SIM=y. Configure a live
gpio-virtuser device through configfs. Its input lookup must refer to a
live gpio-sim bank, such as key gpio-sim-test with offset 0. The
consumer's dev_name attribute is shown as <dev> below; then run:

    echo 0 > /sys/kernel/debug/gpio-virtuser/<dev>/gpiod:input:0/interrupts

On an unpatched kernel, this reaches gpio_virtuser_interrupts_set() with
ld->irq still at its initial value 0, and free_irq() reports:

    Trying to free already-free IRQ 0

The same reproducer completes without the warning on the patched kernel.

Fixes: 91581c4b3f29 ("gpio: virtuser: new virtual testing driver for the GPIO API")
Assisted-by: LLM Codex
Signed-off-by: Runyu Xiao <runyu.xiao@seu.edu.cn>
---
 drivers/gpio/gpio-virtuser.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-virtuser.c b/drivers/gpio/gpio-virtuser.c
index 7d0d366be..d5876c19c 100644
--- a/drivers/gpio/gpio-virtuser.c
+++ b/drivers/gpio/gpio-virtuser.c
@@ -692,7 +692,8 @@ static int gpio_virtuser_interrupts_s et(void *data, u64 val)
 		atomic_set(&ld->irq, irq);
 	} else {
 		irq = atomic_xchg(&ld->irq, 0);
-		free_irq(irq, ld);
+		if (irq)
+			free_irq(irq, ld);
 	}
 
 	return 0;
-- 
2.34.1

