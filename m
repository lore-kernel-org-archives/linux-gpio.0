Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.254.49.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795779214;
	b=Q3vkVLtLFBLFnoX7HIopC4S0J6s+19Ir/2+KXxsxyDMzJ1+lClvLulyGwTDJY2XO8dpn
	 cA0NEjVtOhpAEC/Dsgkz08SoJA4tLeu8KqTuZ0i6rheryu2NbOcgXSNomY4s2KoJVo4fI
	 p6tUcbGanzalPxWJlpvfx3trtYCzDl+T5UlpubfVhztGDhOABu2U/19zkIM171zp22HDQ
	 85L5w0LMqiYTER6Vqaq8mOk6w91F5I8CSVtvs4AfG9E1v2hJgYPPc0EpivJkajsNyyHAc
	 JA3VG+UpdA9uw+pPBD3hZGghxf90QQFWAWfKI1c0d5UAVPB3K5DpESWvOPX+8ghhlIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795779214;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-HM-Tid:X-HM-MType:
	 X-HM-Spam-Status:DKIM-Signature;
	bh=gCtGhq9P7tW1GiFE7NIYAi8YyT5YW4iM+dluafv6q8Q=;
	b=bzCM57/B9Io8etcda3OGyw2IZeCW5MU49gt6uNrvCMsWNVlYbw0Nt5tMzDsyVrGRCm3j
	 5+jrAz4Sotk9XgcL0nA3/5lwpR7kFqMnfUiUppaqUsIwYSfHpS1gGtkC+0T629KtvhNq0
	 xHJrk9KoXqKxNojlKWvfoWTTZH3USiYuvwTkedt3xIP1zTaOXCNsCsWY4qcOe9opSVxCn
	 YAXScLORj1tcpUzkWmDUqSETrwFSNusaci5Cc4WsTCRb4SZGRbu5UUJ1kHoy3jCP3EpQP
	 q1Cnj+QMRqHpsNsuJuYfGAMQnLE/BaNBFd0y31EVvGLQsZASa5rf/hvZHG1wjHxsApA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.sdu.edu.cn;
	spf=pass smtp.mailfrom=mail.sdu.edu.cn;
	dkim=pass header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=ABj34+wJ;
	arc=none smtp.remote-ip=45.254.49.198
Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com [45.254.49.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E10A9606A31E
	for <linux-gpio@vger.kernel.org>; Fri, 27 Nov 2026 11:33:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E10A9606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=ABj34+wJ
Received: from user.localdomain (unknown [223.80.110.101])
	by smtp.qiye.163.com (Hmail) with ESMTP id 564299830;
	Fri, 27 Nov 2026 19:33:30 +0800 (GMT+08:00)
From: Tian Xuechen <202300460064@mail.sdu.edu.cn>
To: linusw@kernel.org,
	florian.fainelli@broadcom.com,
	rjui@broadcom.com,
	sbranden@broadcom.com,
	nsaenz@kernel.org
Cc: bcm-kernel-feedback-list@broadcom.com,
	linux-gpio@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] pinctrl: bcm2835: Use managed GPIO chip registration
Date: Fri, 27 Nov 2026 19:33:29 +0800
Message-Id: <20261127113329.390439-1-202300460064@mail.sdu.edu.cn>
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
X-HM-Tid: 0aa21cc82c0c03a2kunmad7a1b5e395de6
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDHk1KVklDGR1DT05JGk9NQlYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUhVQ0tVSkpLVUpLSllXWRYaDxIVHRRZQVlPS0hVSktJQk
	NDTFVKS0tVS1kG
DKIM-Signature: a=rsa-sha256;
	b=ABj34+wJctM5FpWjdxVRnlE/k9QYOxcmdzwqbz87tYy9g47vBBeV/ELQme4np/Az5dR8tK5o/jzIBdH2YjH/ynb1bxzQsqyeEn4hhoZP4YwgS3m8HGrhHaY9Ys5ygQr/qb6nLsvHYbQzbM2+A26aA3m/CBkqpJTdbkw/4apDUrQ=; s=default; c=relaxed/relaxed; d=mail.sdu.edu.cn; v=1;
	bh=gCtGhq9P7tW1GiFE7NIYAi8YyT5YW4iM+dluafv6q8Q=;
	h=date:mime-version:subject:message-id:from;

From: Tian Xuechen <202300460064@mail.sdu.edu.cn>

Module removal releases the managed pinctrl context but leaves its
GPIO chip registered. The chip and its IRQ callbacks can then reference
freed storage.

Manage GPIO registration so the chip is removed before its resources
are released.

This issue was found by our static analysis tool under development.

Fixes: 4434f4c50345 ("pinctrl: bcm2835: Allow building driver as a module")
Signed-off-by: Tian Xuechen <202300460064@mail.sdu.edu.cn>
---
 drivers/pinctrl/bcm/pinctrl-bcm2835.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-bcm2835.c b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
index c155af38ab81..9184ef13038d 100644
--- a/drivers/pinctrl/bcm/pinctrl-bcm2835.c
+++ b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
@@ -1421,7 +1421,7 @@ static int bcm2835_pinctrl_probe(struct platform_device *pdev)
 	girq->default_type = IRQ_TYPE_NONE;
 	girq->handler = handle_level_irq;
 
-	err = gpiochip_add_data(&pc->gpio_chip, pc);
+	err = devm_gpiochip_add_data(dev, &pc->gpio_chip, pc);
 	if (err) {
 		dev_err(dev, "could not add GPIO chip\n");
 		goto out_remove;

base-commit: 4dce97c6c265544342e716e62fd24bbb232590c5
-- 
2.43.0

