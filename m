Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FC5B494A0B;
	Wed, 15 Jul 2026 18:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784141493; cv=none; b=Er3hSLNAvXCj2+SVSNmFaqaYRTb4FUWZrKl8frokkW270m9MHHi3AVqT1yC7UzdM95JfLosATArakdSrE0aFs6Z8CbPYDjc0dLQSmb/sydueIFmBmTiqco7oC8Loczsxnq8xNo9wbXu0bA4It6H9sz27OmWtuTPNwVMcrApwKO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784141493; c=relaxed/simple;
	bh=vlg6EucuLTzH2ahkQ9RKGxIHegwV5NfcPMCjCKbBPYU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ltX3SpuPlGQ9kK58pFKJY6hqzz5yQQrykVIDqYQ0q9MI7OnY1An73ptDZKSvu7MMyUGHh1NBnLhlFRRYmP2zjnOlb7NfGv+qyWoqS1uNYYIqZePFCOdVtlbOHrdIHmmBbpV/0t5Juqtnr5JTGtFxu7A+VG46G+F/iohZzj4o4Ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i3akTg5i; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i3akTg5i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784141491; x=1815677491;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vlg6EucuLTzH2ahkQ9RKGxIHegwV5NfcPMCjCKbBPYU=;
  b=i3akTg5iu18JmF/UKPZIOD1FUEptmrkOjaRUbmEi8+/Uc02P3XixJJEK
   rE/yvKMef12Y73uN2apIll2h6wYFnVVNgE/6p5ChWsMwYNHprhvQcJljy
   7ZmDyPcUkBqwa/47v8SII6Zt+Xfy/trVcmg9w+xBX8hdoBFZ8xQjEQj9m
   H3zeNK4Uo1FWsvjyD5+aQSEbkfc/SpHNJAz5Rlr/pZwcPUCrQ/m/Qq9eK
   zkuw0TLfb5fyPfpz4VOhjKpFh4CeVHzo3XxSSY73lIRgpbJ1Q20Zu4i4t
   3AtEu0O73/yaiiCr348FOZoHjw5tgjUD1paazpPCA7GL9yZp0+D9i691o
   A==;
X-CSE-ConnectionGUID: Z3EigVsITTKbvdqmJJydfg==
X-CSE-MsgGUID: 3W5MlCG6SJCAnr4MpGj3dw==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="84887515"
X-IronPort-AV: E=Sophos;i="6.25,166,1779174000"; 
   d="scan'208";a="84887515"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 11:51:22 -0700
X-CSE-ConnectionGUID: A6RZI7cwTZeYovAgsogMaw==
X-CSE-MsgGUID: k8B/RJ8pQo6fhlh4cldqlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,166,1779174000"; 
   d="scan'208";a="280700294"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa001.fm.intel.com with ESMTP; 15 Jul 2026 11:51:17 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id EEFE199; Wed, 15 Jul 2026 20:51:15 +0200 (CEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bradford Love <brad@nextdimension.cc>,
	linux-gpio@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linux-media@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Russell King <linux@armlinux.org.uk>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH v1 2/7] media: em28xx: Split em28xx_pctv_290e_set_lna_gpio() helper
Date: Wed, 15 Jul 2026 20:46:42 +0200
Message-ID: <20260715185112.1323510-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260715185112.1323510-1-andriy.shevchenko@linux.intel.com>
References: <20260715185112.1323510-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Split em28xx_pctv_290e_set_lna_gpio() helper in order to deduplicate
the GPIO request and setting.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/media/usb/em28xx/em28xx-dvb.c | 31 ++++++++++++---------------
 1 file changed, 14 insertions(+), 17 deletions(-)

diff --git a/drivers/media/usb/em28xx/em28xx-dvb.c b/drivers/media/usb/em28xx/em28xx-dvb.c
index 8482fc4045ea..ef148a27c94d 100644
--- a/drivers/media/usb/em28xx/em28xx-dvb.c
+++ b/drivers/media/usb/em28xx/em28xx-dvb.c
@@ -737,17 +737,14 @@ static void pctv_520e_init(struct em28xx *dev)
 				regs[i].r, regs[i].len);
 };
 
-static int em28xx_pctv_290e_set_lna(struct dvb_frontend *fe)
+static int em28xx_pctv_290e_set_lna_gpio(struct em28xx *dev, u32 lna)
 {
-	struct dtv_frontend_properties *c = &fe->dtv_property_cache;
-	struct em28xx_i2c_bus *i2c_bus = fe->dvb->priv;
-	struct em28xx *dev = i2c_bus->dev;
 #ifdef CONFIG_GPIOLIB_LEGACY
 	struct em28xx_dvb *dvb = dev->dvb;
 	int ret;
 	unsigned long flags;
 
-	if (c->lna == 1)
+	if (lna == 1)
 		flags = GPIOF_OUT_INIT_HIGH; /* enable LNA */
 	else
 		flags = GPIOF_OUT_INIT_LOW; /* disable LNA */
@@ -761,11 +758,20 @@ static int em28xx_pctv_290e_set_lna(struct dvb_frontend *fe)
 	return ret;
 #else
 	dev_warn(&dev->intf->dev, "%s: LNA control is disabled (lna=%u)\n",
-		 KBUILD_MODNAME, c->lna);
+		 KBUILD_MODNAME, lna);
 	return 0;
 #endif
 }
 
+static int em28xx_pctv_290e_set_lna(struct dvb_frontend *fe)
+{
+	struct dtv_frontend_properties *c = &fe->dtv_property_cache;
+	struct em28xx_i2c_bus *i2c_bus = fe->dvb->priv;
+	struct em28xx *dev = i2c_bus->dev;
+
+	return em28xx_pctv_290e_set_lna_gpio(dev, c->lna);
+}
+
 static int em28xx_pctv_292e_set_lna(struct dvb_frontend *fe)
 {
 	struct dtv_frontend_properties *c = &fe->dtv_property_cache;
@@ -1920,19 +1926,10 @@ static int em28xx_dvb_init(struct em28xx *dev)
 				goto out_free;
 			}
 
-#ifdef CONFIG_GPIOLIB_LEGACY
 			/* enable LNA for DVB-T, DVB-T2 and DVB-C */
-			result = gpio_request_one(dvb->lna_gpio,
-						  GPIOF_OUT_INIT_LOW, NULL);
-			if (result)
-				dev_err(&dev->intf->dev,
-					"gpio request failed %d\n",
-					result);
-			else
-				gpio_free(dvb->lna_gpio);
+			em28xx_pctv_290e_set_lna_gpio(dev, 0);
 
-			result = 0; /* continue even set LNA fails */
-#endif
+			/* continue even set LNA fails */
 			dvb->fe[0]->ops.set_lna = em28xx_pctv_290e_set_lna;
 		}
 
-- 
2.50.1

