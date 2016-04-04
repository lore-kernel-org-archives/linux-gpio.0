From: "Navin P.S" <navinp1912@gmail.com>
Subject: [ PATCH ] Bug 114711 - ubsan: "shift exponent 32 is too large"
 nouveau/nvkm/subdev/gpio/base.c:167:16
Date: Mon, 4 Apr 2016 16:32:23 +0530
Message-ID: <20160404110222.GA8011@junk-foo>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f54.google.com ([209.85.220.54]:35348 "EHLO
	mail-pa0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753374AbcDDLC2 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Apr 2016 07:02:28 -0400
Received: by mail-pa0-f54.google.com with SMTP id td3so141907889pab.2
        for <linux-gpio@vger.kernel.org>; Mon, 04 Apr 2016 04:02:28 -0700 (PDT)
Received: from junk-foo ([103.227.96.224])
        by smtp.gmail.com with ESMTPSA id dy6sm40840437pab.48.2016.04.04.04.02.26
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 04 Apr 2016 04:02:27 -0700 (PDT)
Content-Disposition: inline
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org

Hi,

Please find the below patch that fixes "Bug 114711 - ubsan: "shift exponent 32 is too large" in drivers/gpu/drm/nouveau/nvkm/subdev/gpio/base.c:167:16"
At runtime we shift 1 by 32 which is not correct since 1 is a signed integer. I make it unsigned and the maximum we shift is 32.


---
 drivers/gpu/drm/nouveau/nvkm/subdev/gpio/base.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gpio/base.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gpio/base.c
index d45ec99..cd28376 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gpio/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gpio/base.c
@@ -164,7 +164,7 @@ static int
 nvkm_gpio_fini(struct nvkm_subdev *subdev, bool suspend)
 {
 	struct nvkm_gpio *gpio = nvkm_gpio(subdev);
-	u32 mask = (1 << gpio->func->lines) - 1;
+	u32 mask = (1U << (min(gpio->func->lines, 32))) - 1;
 
 	gpio->func->intr_mask(gpio, NVKM_GPIO_TOGGLED, mask, 0);
 	gpio->func->intr_stat(gpio, &mask, &mask);
-- 
2.5.0

