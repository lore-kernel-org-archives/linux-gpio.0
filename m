Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6782A37BE8A;
	Fri, 10 Jul 2026 18:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783708527; cv=none; b=G2STDQH1UEz+YC1gV4w0V5SPC4sf82o+6FwZtGoFaL9js1KCwRSu/a9m0D3HCqOPGmJO+rxesOvc5W/FpJQRZ6vy58F3CjEmxBGzXsz6wdgY7Mh3Es5letGL4UiNBcVc1R1Im7fzb4hUTTjmqbMl2Mdk3H7DREDJHPNl0EWEyWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783708527; c=relaxed/simple;
	bh=LSnFkMmnJVATavNQ1RJtAhcHSM2vJrSwfz/wz78HcKg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QfVE/RycMlbfYaMOWs5AFY5j8vK06QywiNq4MtrT2/dApQje7Q6QehY+ZUWt+txZ085/Oetq+emuDPlqdNwjwrMUqG+oYcbvnREl9quPl8dKqHKg+te4lSveSKVwQqSHrj+HKxgSrYAdjamL/I/Nfzoj75oT61mSgHpQZ92rfoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=kqI+XB0z; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="kqI+XB0z"
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 0B09D8430C;
	Fri, 10 Jul 2026 20:35:25 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xkjyqZjBYSTs; Fri, 10 Jul 2026 20:35:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1783708524; bh=LSnFkMmnJVATavNQ1RJtAhcHSM2vJrSwfz/wz78HcKg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=kqI+XB0zOAP5txR0Ql7qK9KZ6ZXzWnqmYrRzLuF1RTnUQBDMqBH6vbwNwCdyoJ+z9
	 LNm60MqcAQ0lsTBUMm2D+Qv51IF/bw31jNeosxpk0xavBqgcNCwBtZIdXHu+dV6n5w
	 k1LwQtyaXvLWMpSkT4PsfQ/eE4f3c1g57mZqjkEpImXfmhcU1vGc4gwR/qWSR45YBP
	 K9+WMWHBq85hnmyyMY0iIJT7aeAYkqD4T7+ZB5/Nx0u14TegkhsEen1Fo/IrJ/8Nwu
	 zVs5E8CcQntuWuwO8CmxJVEil2ZAfay7IxmdnWXdgQsG0c8J/hXrpdlGijuy1+Safh
	 0T8grdWCvnnjA==
From: Rustam Adilov <adilov@disroot.org>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Sander Vanheule <sander@svanheule.net>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Rustam Adilov <adilov@disroot.org>
Subject: [PATCH 2/2] gpio: realtek-otto: decide bank_read/write by device endianness
Date: Fri, 10 Jul 2026 23:34:39 +0500
Message-ID: <20260710183439.996923-3-adilov@disroot.org>
In-Reply-To: <20260710183439.996923-1-adilov@disroot.org>
References: <20260710183439.996923-1-adilov@disroot.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In order to have a working gpio controller with SWAP_IO_SPACE,
the way bank_read and bank_write are defined must be changed and
separated from GPIO_PORTS_REVERSED flag. That also includes the
flags parameter used by gpio_generic_chip_config.

To achieve it, use the device_is_big_endian() to decide the
bank_read/write parameter and the flag.

Signed-off-by: Rustam Adilov <adilov@disroot.org>
---
 drivers/gpio/gpio-realtek-otto.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-realtek-otto.c b/drivers/gpio/gpio-realtek-otto.c
index 491fde846d46..f96072fbce92 100644
--- a/drivers/gpio/gpio-realtek-otto.c
+++ b/drivers/gpio/gpio-realtek-otto.c
@@ -393,16 +393,19 @@ static int realtek_gpio_probe(struct platform_device *pdev)
 
 	raw_spin_lock_init(&ctrl->lock);
 
-	if (dev_flags & GPIO_PORTS_REVERSED) {
-		gen_gc_flags = 0;
-		ctrl->bank_read = realtek_gpio_bank_read;
-		ctrl->bank_write = realtek_gpio_bank_write;
+	if (dev_flags & GPIO_PORTS_REVERSED)
 		ctrl->line_imr_pos = realtek_gpio_line_imr_pos;
-	} else {
+	else
+		ctrl->line_imr_pos = realtek_gpio_line_imr_pos_swapped;
+
+	if (device_is_big_endian(dev)) {
 		gen_gc_flags = GPIO_GENERIC_BIG_ENDIAN_BYTE_ORDER;
 		ctrl->bank_read = realtek_gpio_bank_read_swapped;
 		ctrl->bank_write = realtek_gpio_bank_write_swapped;
-		ctrl->line_imr_pos = realtek_gpio_line_imr_pos_swapped;
+	} else {
+		gen_gc_flags = 0;
+		ctrl->bank_read = realtek_gpio_bank_read;
+		ctrl->bank_write = realtek_gpio_bank_write;
 	}
 
 	config = (struct gpio_generic_chip_config) {
-- 
2.55.0

