Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA1072D594F;
	Sat, 15 Aug 2026 09:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786787133; cv=none; b=VFUbLMHeqrUXCrk0Sefmrtx5CrfUY8ZnyBfGIItR50O93UIRtEP6YvgKHUizwEGV9rVs5ohVlcstgVaFMyxSyK6O2RArRra65d6+GWcdUvwG2GRzJga0TmuepLCcGXQHPFVkfOZk44WvVx65+6mFYE8OwQizPWt3A0d2uifgZY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786787133; c=relaxed/simple;
	bh=GqNseVANk3TNRwPc/14VjBhTl29gg9e9ev+oIaAD92o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mkErAjdzBzl+XQtGVXvTh49PdCbZSttFHD+gPS5RZp59TJ7wrsonxp9QIaYZdaHEdEdTL4Pe0GuJe6fnKVy/iP9of0w3j+qeTDYq7LwZXvc3BhWkaUiOq/XKxDolk3nTHPN7S70CUpQt1MEFmqviZ9bAXVoSqNz5X1luS9bl3Cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=Q0fmO2Cx; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="Q0fmO2Cx"
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 59F5487E4A;
	Sat, 15 Aug 2026 11:45:30 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8uSvJLIwzw0s; Sat, 15 Aug 2026 11:45:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1786787129; bh=GqNseVANk3TNRwPc/14VjBhTl29gg9e9ev+oIaAD92o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Q0fmO2CxiCgDk7l0HM3eN8n5l9UTG/ISXsJvvRWB0W7eVJOq5PwrHLezziSLrS2F8
	 FtN6j1rEXpF+JUAS/jSJeccH0FjzWBAzGA8XoRIKKpwno3XIBZ6PxenKw9tVqzfzoU
	 Wo+LRNPnuUha+YsHu46vNIHNN8lAOCccy/1LFtMxOBVMfbbtrItSM1O+AIwaZWU+kk
	 KP6Ev2k1wEG31o2rDpl/iWMahC/2KD6tVzY/Vqgo4owc1tuJWKMwpOYs2i3hPamRTd
	 iFteugnfrkM6LC3x89Pb38PL8E7LrZShFGE0NDm5MxaFNIVJYEkG3TKzF4EF5rrjfW
	 Oa5tEFlwNbjpg==
From: Rustam Adilov <adilov@disroot.org>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Sander Vanheule <sander@svanheule.net>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Rustam Adilov <adilov@disroot.org>
Subject: [PATCH v2 2/2] gpio: realtek-otto: make bank_read/write overridable by endian property
Date: Sat, 15 Aug 2026 14:44:51 +0500
Message-ID: <20260815094451.31792-3-adilov@disroot.org>
In-Reply-To: <20260815094451.31792-1-adilov@disroot.org>
References: <20260815094451.31792-1-adilov@disroot.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In order to have a working gpio controller with SWAP_IO_SPACE,
the bank_read/bank_write functions and the gen_gc_flag used for
gpio_generic_chip_config must be able to be changed to their
respective counterparts.

To do that, introduce checks for the presence of endian property
under the device tree node and if so, override what has been
set by GPIO_PORTS_REVERSED quirk flag. This way, existing device
trees are kept working as they were originally.

Both big-endian and little-endian properties must be checked
because there are devices that have GPIO_PORTS_REVERSED flag
and the others that don't.

Signed-off-by: Rustam Adilov <adilov@disroot.org>
---
 drivers/gpio/gpio-realtek-otto.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpio/gpio-realtek-otto.c b/drivers/gpio/gpio-realtek-otto.c
index 491fde846d46..e079b5180760 100644
--- a/drivers/gpio/gpio-realtek-otto.c
+++ b/drivers/gpio/gpio-realtek-otto.c
@@ -405,6 +405,16 @@ static int realtek_gpio_probe(struct platform_device *pdev)
 		ctrl->line_imr_pos = realtek_gpio_line_imr_pos_swapped;
 	}
 
+	if (device_property_read_bool(dev, "little-endian")) {
+		gen_gc_flags = 0;
+		ctrl->bank_read = realtek_gpio_bank_read;
+		ctrl->bank_write = realtek_gpio_bank_write;
+	} else if (device_is_big_endian(dev)) {
+		gen_gc_flags = GPIO_GENERIC_BIG_ENDIAN_BYTE_ORDER;
+		ctrl->bank_read = realtek_gpio_bank_read_swapped;
+		ctrl->bank_write = realtek_gpio_bank_write_swapped;
+	}
+
 	config = (struct gpio_generic_chip_config) {
 		.dev = dev,
 		.sz = 4,
-- 
2.55.0

