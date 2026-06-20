Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B440E394464;
	Sat, 20 Jun 2026 13:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781963472; cv=none; b=ahhgzNXeP7m8476n/WX/ka/KYOHlBNv3xQViSYxSsyqcmC7kCyAqUadtgpld71CCVoC13BnXBwZe2EEusgW8oLxfQmlXmLY1AVyTRZlKlyX4a2Axvkf/BF4NyX7SdNUryLtveIFoLyUKDYP/pdgq0xVtdrh6usU9s6Fy1F2SqfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781963472; c=relaxed/simple;
	bh=DPqATaI18HFkcFiUsa9K01otCxHAFMKWGVMOaOREY9U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qRKKE3G5MKJRtQO9gq8DQyTnb3+8acaHbM4HNmYGcJaof2w1jm6xtKpaAvT895zOFLiivXyZSwziX2Zowro8/xKMCzKNhoPUxmlxaSuNsFNRo5hZ15j7vJ51oVRZU9YfCHtzJZXOPC6I5bps8wyX37GhiN8h7iXqJTrtb52mrM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=BOzkNT0J; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="BOzkNT0J"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 34E97C63A0E;
	Sat, 20 Jun 2026 13:51:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DAF14601B7;
	Sat, 20 Jun 2026 13:51:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 493CF106C8914;
	Sat, 20 Jun 2026 15:51:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1781963462; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Xfsmo6PiCavI8stl/2hjj1vilvlmofUOfbnJ0djbbiU=;
	b=BOzkNT0JeUViEech6D5ad6+ieK9ppBRSye3anacWwyPzpj72dITkgQHzq880Kw3Q4SiE+L
	VKmcY5uoBp1xb9k4z8adUmetjtxjOFJFvoI522Mzn1pAOSXKwxYf+IkNQQ7Bob/wSSSLiX
	fMLu+fco+b6+rAUWwoAmXhPXzrHL29CStZSQev4fEHkdGHZx2kZS7qbE3/CxfYvkcM551o
	rlb4QTp5SFbba2fa7exxVcwmOeyV6C4D2/tMxm/PxpwNdJMbRi8RnTVRDEtWB0GpIZcT19
	UbZHLJGlBctEBFx+dppv+Np5ObGMpkeXBHbO4PdnQL66taxia+Giw0NCdXJi+w==
From: Diogo Ivo <diogo.ivo@bootlin.com>
Date: Sat, 20 Jun 2026 15:50:58 +0200
Subject: [PATCH 1/2] ASoC: rt5677: Add GPIO .get_direction() callback
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260620-smaug-audio-v1-1-e318acdf5abd@bootlin.com>
References: <20260620-smaug-audio-v1-0-e318acdf5abd@bootlin.com>
In-Reply-To: <20260620-smaug-audio-v1-0-e318acdf5abd@bootlin.com>
To: Oder Chiou <oder_chiou@realtek.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Diogo Ivo <diogo.ivo@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1729; i=diogo.ivo@bootlin.com;
 h=from:subject:message-id; bh=DPqATaI18HFkcFiUsa9K01otCxHAFMKWGVMOaOREY9U=;
 b=owEBbQKS/ZANAwAKAQa+fFtWXslFAcsmYgBqNprN5v+y7u6XY1o4/eeA8lxXhrx4MqnQwoTKW
 lCKhvwPD/eJAjMEAAEKAB0WIQTma35o1i1081e8B2UGvnxbVl7JRQUCajaazQAKCRAGvnxbVl7J
 RVMvD/9IKuRqP6sTN6aY2xxAv7tQtDvzX0m8bh1T7BdVBhjw7bn7fKN2Hp+oiqfEbY6udS3qHzD
 gBe0t5mazc0UOTEawf5atGin9BZaRGyi6OVIJJFd+2o3PUz5i2TiyBeayS9sXvVS+6V6iE2K7lv
 vIPkv4/b6c8G3xU1nlEApHP0uX59EKk5qhBtAl+SAiGkqZ8KxFmzUKi0O4X6VGXzd49ORSNkjTH
 tWf3DS/AGtjwhlVBySkjgPv/TuOwESB+OlTG3Lb+Nut/mscP/pNxL+Idww9Q6afBJt9oZq9aP0A
 hayC/DnlIQdjwNRTePDlh2YTtNvJpL1gQjcsMAMqx7xBqQr+pCQEodtdxoTaXBiK68yjn7VuPFJ
 xeBK75CdtpusBswDxXO5U+yyPRmtA30/ah13qdBLUS9CzVh/Lkzizpo4v1WzNC0ofJt/j0wfn3v
 5dTVMZqu19iBTsKEFmGRyR6LGwWHlAZD1gVOBqumonh5n2OvQPZYH2vdGK8aAtjjGnDwIh5EoLt
 jVGkByNbZDEuT6xhZnVIZRPyNIqEybTaYgDXyG5up9TV1xpcdKhJ9C5KnMxHKdQ9r+Vyi5X6QQ6
 pG52tEfu7EmRR/mLFFwoDwPS9YVHGsRP9ZS0hJcQB1Ot+WRV5J+FU/yqvwv6XwH1HX9cLgZJaPR
 2Xe/mrr6s5eokQg==
X-Developer-Key: i=diogo.ivo@bootlin.com; a=openpgp;
 fpr=E66B7E68D62D74F357BC076506BE7C5B565EC945
X-Last-TLS-Session-Version: TLSv1.3

Implement the get_direction callback for the GPIO controller to allow
consumers to query the direction of GPIO pins.

Signed-off-by: Diogo Ivo <diogo.ivo@bootlin.com>
---
 sound/soc/codecs/rt5677.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/sound/soc/codecs/rt5677.c b/sound/soc/codecs/rt5677.c
index ac084ca008f3..73fc008d558a 100644
--- a/sound/soc/codecs/rt5677.c
+++ b/sound/soc/codecs/rt5677.c
@@ -6,6 +6,7 @@
  * Author: Oder Chiou <oder_chiou@realtek.com>
  */
 
+#include <linux/bits.h>
 #include <linux/delay.h>
 #include <linux/firmware.h>
 #include <linux/fs.h>
@@ -4767,6 +4768,21 @@ static int rt5677_gpio_direction_in(struct gpio_chip *chip, unsigned offset)
 	return rt5677_update_gpio_bits(rt5677, offset, m, v);
 }
 
+static int rt5677_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
+{
+	struct rt5677_priv *rt5677 = gpiochip_get_data(chip);
+	unsigned int shift = RT5677_GPIOx_DIR_SFT + (offset % 5) * 3;
+	unsigned int bank = offset / 5;
+	unsigned int reg = bank ? RT5677_GPIO_CTRL3 : RT5677_GPIO_CTRL2;
+	int ret;
+
+	ret = regmap_test_bits(rt5677->regmap, reg, BIT(shift));
+	if (ret < 0)
+		return ret;
+
+	return ret ? GPIO_LINE_DIRECTION_OUT : GPIO_LINE_DIRECTION_IN;
+}
+
 /*
  * Configures the GPIO as
  *   0 - floating
@@ -4834,6 +4850,7 @@ static int rt5677_to_irq(struct gpio_chip *chip, unsigned offset)
 static const struct gpio_chip rt5677_template_chip = {
 	.label			= RT5677_DRV_NAME,
 	.owner			= THIS_MODULE,
+	.get_direction		= rt5677_gpio_get_direction,
 	.direction_output	= rt5677_gpio_direction_out,
 	.set			= rt5677_gpio_set,
 	.direction_input	= rt5677_gpio_direction_in,

-- 
2.54.0

