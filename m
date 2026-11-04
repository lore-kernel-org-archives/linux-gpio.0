Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.226.251.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793760819;
	b=krGiSQWawfyWNUwddtcQ9HbC5l7IXtmUcd0HVEvZIsSxpqKHYfJhJbMiqCIa+plusVkP
	 /Ozsy/aA+xVGTi2wp/LkMJY1lxzECY+78Rn04J61MjbzZ67C1nJbu1gvfCiTxhAKXJK5w
	 JYUEfEQAvDJ5tpS/KUbqoyCkqIsgaiyfcVXdftUgn9rdCSRqoEYiOQodrDCxxX2CUsCVU
	 dtuZgFv+tHXdsK2brZoCkn1AbCeM5tTQUA9aLvtUWzsbsYulsmkeUvQt0vojrZUuyvaC0
	 XXbtUMN7XKO7Df1Pz9G4EE0/lugbMG9SU6Rz0TrrRBR1mbrOoZyi+53KoAMIbtkAVgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793760819;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=6mfM8WnCNsYVkhH5XGPKPUiRUIpo9DhU381NF81Y5q0=;
	b=VVwAQosdZ1+hXvaEHVYnWoi1WO7iATk3SBQ9bl37H0t8rGJxJSCsBISjcNtjF9ZTNsB/
	 CPRgagTZ0YJjhGgz9oPjLTU5RMRVL4sv5EVPHY/gdORFADoq47sffrP6qN9WoppQZPdvn
	 XYt0ynl/JQn92zL2KhO9Gtgtz3f4nSOXFP5D0kdCv6XkXorazKaR5oZNsWgYGzIJUgjGU
	 cFKvr+eelvrUTjRruTYmJyhSXMDmZNgBZymHXziUbLRHJnz06Vcicq/34yUpHIKnw5qzS
	 OGWbA/Rc7YRXUNfiQJfvu9RjMrvjNFznTHX069CN7fB+3ta03an8bPWuWDQRVFxYEHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iscas.ac.cn;
	spf=pass smtp.mailfrom=iscas.ac.cn;
	arc=none smtp.remote-ip=159.226.251.21
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC9C606A339
	for <linux-gpio@vger.kernel.org>; Wed,  4 Nov 2026 02:53:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6BC9C606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from dfae2b116770.home.arpa (unknown [36.110.52.2])
	by APP-01 (Coremail) with SMTP id qwCowADH8_0wnupqEeU+AA--.9989S2;
	Wed, 04 Nov 2026 10:53:36 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org
Subject: [PATCH] gpio: keep the chip reference when deferred setup fails
Date: Wed,  4 Nov 2026 02:53:45 +0000
Message-Id: <20261104025345.1527526-1-vulab@iscas.ac.cn>
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
X-CM-TRANSID:qwCowADH8_0wnupqEeU+AA--.9989S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Cry7Ar1ktw1UZr17AFW7twb_yoW8trW5pr
	4fWan5GryDGr4xKr47Aan7Za4j9FZ2yFWfCF4fKw109ws5X348trWaqFy8uw4UCrykCayU
	tr43JryUWF1kArJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvEb7Iv0xC_Kw4lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2
	AK021l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v2
	6r4UJVWxJr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14
	v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xf
	McIj6xIIjxv20xvE14v26rWY6Fy7McIj6I8E87Iv67AKxVW8Jr0_Cr1UMcvjeVCFs4IE7x
	kEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACjcxG6xCI17CEII8vrVW3JVW8Jr1l42xK82IY
	c2Ij64vIr41l42xK82IY6x8ErcxFaVAv8VW8GFyrJr1UJwCFx2IqxVCFs4IE7xkEbVWUJV
	W8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF
	1VAFwI0_Jrv_JF1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVW5JVW7JwCI42IY6x
	IIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAI
	cVC2z280aVAFwI0_Gr1j6F4UJwCI42IY6I8E87Iv6xkF7I0E14v26F4UJVW0obIYCTnIWI
	evJa73UjIFyTuYvjxUHqXdDUUUU
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiCRMBA2rqY-nilwAAs3

gpiochip_setup_devs() runs once gpiolib has been initialized and
finishes the registration of the chips that were added before that.
When the registration of such a chip fails, the function drops the
reference taken in gpiochip_add_data_with_key() with
gpio_device_put(), and only then logs the error through &gdev->dev.

For these chips that reference is the last one, so gpiodev_release()
frees gdev: the dev_err() dereferences freed memory, and the chip is
still linked in gpio_devices, so the next lookup walks into the freed
object as well.  Here the registration cannot be undone the way
gpiochip_add_data_with_key() does it, as the driver already got success
from gpiochip_add_data() and will call gpiochip_remove(), which unlinks
the chip and drops the reference.

Keep the reference and only report the failure.

Fixes: 16fdabe143fc ("gpio: Fix resource leaks on errors in gpiochip_add_data_with_key()")
Cc: stable@vger.kernel.org
Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/gpio/gpiolib.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index fbdeda2f2787..5d9ef0f77b1f 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -924,7 +924,8 @@ static const struct device_type gpio_dev_type = {
 
 /*
  * An initial reference count has been held in gpiochip_add_data_with_key().
- * The caller should drop the reference via gpio_device_put() on errors.
+ * A caller that tears the chip down on errors must drop the reference via
+ * gpio_device_put().
  */
 static int gpiochip_setup_dev(struct gpio_chip *gc)
 {
@@ -1099,12 +1100,16 @@ static void gpiochip_setup_devs(void)
 			continue;
 		}
 
+		/*
+		 * The reference taken in gpiochip_add_data_with_key() is
+		 * dropped by gpiochip_remove(): this chip is still registered
+		 * and its driver has not been told about the failure, so the
+		 * reference must be kept here.
+		 */
 		ret = gpiochip_setup_dev(gc);
-		if (ret) {
-			gpio_device_put(gdev);
+		if (ret)
 			dev_err(&gdev->dev,
 				"Failed to initialize gpio device (%d)\n", ret);
-		}
 	}
 }
 
-- 
2.34.1

