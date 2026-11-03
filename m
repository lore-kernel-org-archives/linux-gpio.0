Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793704282;
	b=l/14+PJQ0cpp2Lk4q4Ol96XwytLMdb5Wi5biPIZRayFtTl79xIToCtGHLkus80u4OPPW
	 3/d+NOP+BeJ95+t1/nwhmGRlj+qkiBJxgxLyiNN1btoLC89mFCAGQtAZS2gySbwrV60W4
	 VBCkLrl7RjYW6Lk/LDHPIOPa7zBtokHsjYDguJbL3KIgs51BJN/xUA2l+M3UUqiwn/i44
	 mt5hMsCwrXgdsNUxDw8MwNswWZrmgpYjj8LE2OsJEplhCLmy3aSPCG9y5UTUK9N5vc5MR
	 j0T4lkzKcfnXGGo6NZMwDIx2a/3FowiG2tOXKnICLG0ACm86Kgh4E1qQ1NXRJ/YaDQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793704282;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Last-TLS-Session-Version;
	bh=zsziOItZCdSqr6GfPwNxi2VUo0k/TNVIqc41ldRAkTY=;
	b=InAKuBgx3C4ATljnfwLwdwgHxkTj+0wLfkte3lIBgMLOGfBvItocIEl9T+RP7R0BPcNY
	 7f1bq7dObVc/YaO4hHiwnPXtU6btWhwxu3V7PI8pTrbTp7Jw3X0OdOicfRVl6Mpn1AjUO
	 HM9Tuy9ZtNRivjcFj1fOHZ9tN3YrcNKYG4TlprO/fDmzpSF1SyhZwEGIWCM4sQpUiq9ma
	 l/D34K2HlIvIOyOOTfpyUOuZ+Bl/24F6JfTV5RgVFl6reTEavN/kr0Z/GBWQu/aEwkgB6
	 0l5CYw4srRUxP62xDLvV3CpMqJPPaUjqMp/YC24AJcNdVNUnCgZJFtuqbxwRwVideHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=c6QbJhhB;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EFD560A6F76
	for <linux-gpio@vger.kernel.org>; Tue,  3 Nov 2026 11:11:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6EFD560A6F76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=c6QbJhhB
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id D60FDC8F458;
	Tue,  3 Nov 2026 11:12:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 45F946046C;
	Tue,  3 Nov 2026 11:11:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1D5BD103291E2;
	Tue,  3 Nov 2026 12:11:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793704272; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=zsziOItZCdSqr6GfPwNxi2VUo0k/TNVIqc41ldRAkTY=;
	b=c6QbJhhB/17tzhguxUqsFLfsfw40KcAv6lH5rx6NQ2CQhwMBL8cubmbt11eaK5uGgj0AEm
	7Qy7mqgujE50XjsiLMuVh4/Z6srFzzj4PZrrIZTsHzovhNPNXQMVqwH0UrBn+NqDlQMBG5
	/HYfFg79zW07+iNKPS4+Htbq2kEJocaSJhXRkX9BkqQqMeudyohdnGKJlSvL6jINzX3BT9
	/n/V9tOnpUgmDH030lxPWxrNe2NjCJ4rda0GYkrgXLiJovEzM0r/QnGbIKspPCbh+CuKgn
	yz+Xtuntby1D5aOygkdnHYwGjKjfpPdXTkrjv1/DudQ8wtdvLYcOWB0PPI5SHg==
From: "Miguel Gazquez (Schneider Electric)" <miguel.gazquez@bootlin.com>
Date: Tue, 03 Nov 2026 12:10:57 +0100
Subject: [PATCH 5.10.y v2] gpio: dwapb: mask/unmask IRQ when disable/enale
 it
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-dwapb-fix-v2-1-9bd3785d1365@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22NwQ6CMBAFf4Xs2ZK2pCV48j8MB1q2skYpaStKC
 P9uwavHeZnMWyFiIIxwLlYIOFMkP2aQpwLs0I03ZNRnBsmlFoJXrH93k2GOPqwzqq61UrXTFrI
 /Bczz0bqCKgUvF2h/e3yZO9q0h3ZzoJh8WI7TWRz+n/4smGC2qdBJJ7lu1MV4nx40ltY/od227
 QvQFFGgvgAAAA==
X-Change-ID: 20261103-dwapb-fix-ab5776557f6c
To: stable@vger.kernel.org, Hoan Tran <hoan@os.amperecomputing.com>, 
 Serge Semin <fancer.lancer@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Alan Tull <atull@altera.com>, Jamie Iles <jamie@jamieiles.com>
Cc: Benjamin Robin <benjamin.robin@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ralph Siemsen <ralph.siemsen@linaro.org>, 
 xiongxin <xiongxin@kylinos.cn>, stable@kernel.org, 
 Riwen Lu <luriwen@kylinos.cn>, Andy Shevchenko <andy@kernel.org>, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Miguel Gazquez (Schneider Electric)" <miguel.gazquez@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793704263; l=3409;
 i=miguel.gazquez@bootlin.com; s=20250708; h=from:subject:message-id;
 bh=IjodPtO+QNDMqV9Kndo+ZMbI8L2EGx8jZcDCaQ9m4nA=;
 b=//LghERc+BKoG7dfzTpz8B3hwV0YVfJyUhLSSmUSNlUU7A4kIF3f6SttLSpQyhh6SrINhMUNt
 dRoWjIxjxyxCAP25x5gC5DsMpGuq+0WQeNuDHudP3zrnBRC8JelGogu
X-Developer-Key: i=miguel.gazquez@bootlin.com; a=ed25519;
 pk=k/2KI9jkmayaF0ghZ8QYUH9Wm/kFHDhl8QoZ0RHbr4w=
X-Last-TLS-Session-Version: TLSv1.3

From: xiongxin <xiongxin@kylinos.cn>

commit 1cc3542c76acb5f59001e3e562eba672f1983355 upstream.

In the hardware implementation of the I2C HID driver based on DesignWare
GPIO IRQ chip, when the user continues to use the I2C HID device in the
suspend process, the I2C HID interrupt will be masked after the resume
process is finished.

This is because the disable_irq()/enable_irq() of the DesignWare GPIO
driver does not synchronize the IRQ mask register state. In normal use
of the I2C HID procedure, the GPIO IRQ irq_mask()/irq_unmask() functions
are called in pairs. In case of an exception, i2c_hid_core_suspend()
calls disable_irq() to disable the GPIO IRQ. With low probability, this
causes irq_unmask() to not be called, which causes the GPIO IRQ to be
masked and not unmasked in enable_irq(), raising an exception.

Add synchronization to the masked register state in the
dwapb_irq_enable()/dwapb_irq_disable() function. mask the GPIO IRQ
before disabling it. After enabling the GPIO IRQ, unmask the IRQ.

Fixes: 7779b3455697 ("gpio: add a driver for the Synopsys DesignWare APB GPIO block")
Cc: stable@kernel.org
Co-developed-by: Riwen Lu <luriwen@kylinos.cn>
Signed-off-by: Riwen Lu <luriwen@kylinos.cn>
Signed-off-by: xiongxin <xiongxin@kylinos.cn>
Acked-by: Serge Semin <fancer.lancer@gmail.com>
Reviewed-by: Andy Shevchenko <andy@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Miguel Gazquez (Schneider Electric) <miguel.gazquez@bootlin.com>
---
Changes in v2:
- Fix typo
- Link to v1: https://patch.msgid.link/20261103-dwapb-fix-v1-1-c93ef2f20695@bootlin.com
---
 drivers/gpio/gpio-dwapb.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
index d6240ae0f87ca..51bed3adafc1f 100644
--- a/drivers/gpio/gpio-dwapb.c
+++ b/drivers/gpio/gpio-dwapb.c
@@ -282,13 +282,15 @@ static void dwapb_irq_enable(struct irq_data *d)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 	struct dwapb_gpio *gpio = to_dwapb_gpio(gc);
+	irq_hw_number_t hwirq = irqd_to_hwirq(d);
 	unsigned long flags;
 	u32 val;
 
 	spin_lock_irqsave(&gc->bgpio_lock, flags);
-	val = dwapb_read(gpio, GPIO_INTEN);
-	val |= BIT(irqd_to_hwirq(d));
+	val = dwapb_read(gpio, GPIO_INTEN) | BIT(hwirq);
 	dwapb_write(gpio, GPIO_INTEN, val);
+	val = dwapb_read(gpio, GPIO_INTMASK) & ~BIT(hwirq);
+	dwapb_write(gpio, GPIO_INTMASK, val);
 	spin_unlock_irqrestore(&gc->bgpio_lock, flags);
 }
 
@@ -296,12 +298,14 @@ static void dwapb_irq_disable(struct irq_data *d)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 	struct dwapb_gpio *gpio = to_dwapb_gpio(gc);
+	irq_hw_number_t hwirq = irqd_to_hwirq(d);
 	unsigned long flags;
 	u32 val;
 
 	spin_lock_irqsave(&gc->bgpio_lock, flags);
-	val = dwapb_read(gpio, GPIO_INTEN);
-	val &= ~BIT(irqd_to_hwirq(d));
+	val = dwapb_read(gpio, GPIO_INTMASK) | BIT(hwirq);
+	dwapb_write(gpio, GPIO_INTMASK, val);
+	val = dwapb_read(gpio, GPIO_INTEN) & ~BIT(hwirq);
 	dwapb_write(gpio, GPIO_INTEN, val);
 	spin_unlock_irqrestore(&gc->bgpio_lock, flags);
 }

---
base-commit: f23b568f7597f98a241454018a34361ce2523c05
change-id: 20261103-dwapb-fix-ab5776557f6c

Best regards,
--  
Miguel Gazquez (Schneider Electric) <miguel.gazquez@bootlin.com>

