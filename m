Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793226499;
	b=Xf1fLynCLu1WBL75pWd7WeBeS71Ytn08JGuKoe7WF/qAm9wp/4/eHrpj81mL6DcxFEmQ
	 9UvxHO+1UiCN8A08BA8L9bNIS8YqlhFrDYILKkmJrg+EaEl9rrCPkeLZXUm4US9chNy2z
	 R2BD7huKwwjUoPsrKzioUjVNJZUnWoEPXHNCazTWzz6Ags373NRIetd6wgezWaolQAMdx
	 j78RVTymrO/g+6hjgZRvOHQ6xxZulWbNSWG2SCgBMwWN6bfQziEgToAvSLSQ31R7+NCT2
	 P+omITvyG2uXlyI5b/QJdn2dRF/JDBwGImQoHuse+Lo4CJANGQymCM9swjZhoK7Iy4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793226499;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-CMS-MailID:X-Msg-Generator:Content-Type:
	 X-RootMTR:X-EPHeader:X-CMS-RootMailID:References;
	bh=7Ef1q42TRzlcTeL1DfxibRPhW740xksRzeHCgCPGsmw=;
	b=1GEOgaenP5NPV4jltWxDEIL1+sr8188snsZhMr7OpGQpgGi2LTEhK5JhbNn/JJqssaNp
	 O7fdHTXp4vM1CWgRXx7ddTlgmU6YW2Wy8wK5s9gyw3+vOq/gyZSxRdEyoJIuxOSMb3AYI
	 JG11CVcvkfG29oCWxm7I+22tRnTAFdFNa9ddIzDye/9rf/h00TelIl1L02TqFL9MTnVIg
	 pJA4ybVAbpJPiNARSZ88jvSR1KbzUxpW7aO9aOGjVRytd+HBmTNTEoLMv+QdWr7U5GQUQ
	 mFjqhWQDZ2DYePXvL4uxQk4qcRZji46LKyL7ogAPpbnmSwGrgi0SUx4SQ1yOR6mzwxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=p2xBUlor;
	arc=none smtp.remote-ip=210.118.77.12
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 038FF606A31A
	for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 22:28:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 038FF606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=p2xBUlor
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20261028222815euoutp02046887833b6dd30dfe33d00f5b681bb4~i0f8-5Z5C1331013310euoutp021
	for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 22:28:15 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20261028222815euoutp02046887833b6dd30dfe33d00f5b681bb4~i0f8-5Z5C1331013310euoutp021
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1793226495;
	bh=7Ef1q42TRzlcTeL1DfxibRPhW740xksRzeHCgCPGsmw=;
	h=From:To:Cc:Subject:Date:References:From;
	b=p2xBUlordpM+8/Lr2uyUhO7JSwE1bi9UadxpQ3IGHkLQlmON2/pQv4HNnUNARmQPV
	 QZHQnJGdPvI3CKAYNqi2P8zN7QLhXxQhFFC+hByrKSIgzBld8DDZKryjdkwjmQWNFL
	 rVjNMSfrFo/dTHIeKddWVJq7ZztKtjOX/t7GISM4=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20261028222815eucas1p12f4ceb1dca96576cb395430cc2544420~i0f8SrZoY1844818448eucas1p1O;
	Wed, 28 Oct 2026 22:28:15 +0000 (GMT)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261028222814eusmtip23a29c9ecfb1cf573b8b036dc0b85ee08~i0f8ED_vV0682106821eusmtip2E;
	Wed, 28 Oct 2026 22:28:14 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: linux-gpio@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Linus Walleij
	<linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Subject: [PATCH] gpio: shared-proxy: don't refuse the first direction
 setting
Date: Wed, 28 Oct 2026 23:28:02 +0100
Message-ID: <20261028222803.2682808-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.43.0
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
X-CMS-MailID: 20261028222815eucas1p12f4ceb1dca96576cb395430cc2544420
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261028222815eucas1p12f4ceb1dca96576cb395430cc2544420
X-EPHeader: CA
X-CMS-RootMailID: 20261028222815eucas1p12f4ceb1dca96576cb395430cc2544420
References: <CGME20261028222815eucas1p12f4ceb1dca96576cb395430cc2544420@eucas1p1.samsung.com>

When more than one consumer has requested a shared GPIO, the proxy
refuses to change the direction, based on the current hardware direction
of the line. However the hardware direction is not necessarily set by
any of the consumers - it may be just the power-on or bootloader default.

This makes the result racy when the consumers probe asynchronously. On
RubikPi3 two fixed regulators (vreg_es8316_1v8 and vreg_es8316_3v3) share
TLMM GPIO 117. When both proxies get requested before either of them
configures the line, usecnt is already 2, the line still reads as input,
so gpiod_configure_flags() of both regulators fails with -EPERM:

  reg-fixed-voltage regulator-es8316-1v8: setup of GPIO (default) failed: -1
  reg-fixed-voltage regulator-es8316-3v3: setup of GPIO (default) failed: -1

and the audio codec and the sound card stay deferred forever. When the
regulators probe one after the other, the first one configures the line
while usecnt is still 1 and the second one succeeds.

Track whether the direction has been set by any of the users of the
shared GPIO and allow the first user to configure it, regardless of how
many consumers have already requested the line. Reset this state once
the last user releases the GPIO.

Fixes: e992d54c6f97 ("gpio: shared-proxy: implement the shared GPIO proxy driver")
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
The patch was prepared with LLM assistance and tested on the real
Thundercomm RubikPi3 board.

Best regards
Marek Szyprowski, PhD
Samsung R&D Institute Poland
---
 drivers/gpio/gpio-shared-proxy.c | 21 +++++++++++++++------
 drivers/gpio/gpiolib-shared.h    |  1 +
 2 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-shared-proxy.c b/drivers/gpio/gpio-shared-proxy.c
index bc69b8729d19..30ea988ee691 100644
--- a/drivers/gpio/gpio-shared-proxy.c
+++ b/drivers/gpio/gpio-shared-proxy.c
@@ -116,6 +116,8 @@ static void gpio_shared_proxy_free(struct gpio_chip *gc, unsigned int offset)
 	}
 
 	proxy->shared_desc->usecnt--;
+	if (!proxy->shared_desc->usecnt)
+		proxy->shared_desc->dir_set = false;
 
 	dev_dbg(proxy->dev, "Shared GPIO freed, number of users: %u\n",
 		proxy->shared_desc->usecnt);
@@ -155,15 +157,21 @@ static int gpio_shared_proxy_direction_input(struct gpio_chip *gc,
 	struct gpio_shared_proxy_data *proxy = gpiochip_get_data(gc);
 	struct gpio_shared_desc *shared_desc = proxy->shared_desc;
 	struct gpio_desc *desc = shared_desc->desc;
-	int dir;
+	int ret, dir;
 
 	guard(mutex)(&shared_desc->mutex);
 
-	if (shared_desc->usecnt == 1) {
+	if (shared_desc->usecnt == 1 || !shared_desc->dir_set) {
 		dev_dbg(proxy->dev,
-			"Only one user of this shared GPIO, allowing to set direction to input\n");
+			"Only one user of this shared GPIO or direction not set yet, allowing to set direction to input\n");
+
+		ret = gpiod_direction_input(desc);
+		if (ret)
+			return ret;
+
+		shared_desc->dir_set = true;
 
-		return gpiod_direction_input(desc);
+		return 0;
 	}
 
 	dir = gpiod_get_direction(desc);
@@ -189,15 +197,16 @@ static int gpio_shared_proxy_direction_output(struct gpio_chip *gc,
 
 	guard(mutex)(&shared_desc->mutex);
 
-	if (shared_desc->usecnt == 1) {
+	if (shared_desc->usecnt == 1 || !shared_desc->dir_set) {
 		dev_dbg(proxy->dev,
-			"Only one user of this shared GPIO, allowing to set direction to output with value '%s'\n",
+			"Only one user of this shared GPIO or direction not set yet, allowing to set direction to output with value '%s'\n",
 			str_high_low(value));
 
 		ret = gpiod_direction_output(desc, value);
 		if (ret)
 			return ret;
 
+		shared_desc->dir_set = true;
 		shared_desc->def_val = value;
 		shared_desc->votecnt = 0;
 		proxy->voted_change = false;
diff --git a/drivers/gpio/gpiolib-shared.h b/drivers/gpio/gpiolib-shared.h
index 618756f6c6aa..9c2dd4049d1a 100644
--- a/drivers/gpio/gpiolib-shared.h
+++ b/drivers/gpio/gpiolib-shared.h
@@ -43,6 +43,7 @@ struct gpio_shared_desc {
 	unsigned int usecnt;
 	unsigned int votecnt;
 	int def_val;
+	bool dir_set;
 	struct mutex mutex; /* serializes all proxy operations on this descriptor */
 };
 
-- 
2.43.0

