Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5A66400990;
	Wed, 15 Jul 2026 18:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784141491; cv=none; b=NHcJXvCJAge6YWA4rtC2JeJu7V80id4SnM3e6HHE5QqFfRyepP2sNWI/5GFg2iT6mXiU//Gy8vw/kRvOKSZgW1n9BrG0f81lYvr4+4CzqHbJ5Qcd8txhpq07nZvq9gAr/qi70Ln+dXtIvbnREY1CbWdyiokgUsm5QseyBh4+iCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784141491; c=relaxed/simple;
	bh=c6hpNb2JXzDFRlDVnT3j7w6ZUzrfVzvezdxIsX1aXGo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=edQqYbHEcoP8V4rkzTHNrPtyTRVcKtrUaD0roJzPoYEW2bzoxC77NWhR9oSAKI3OqTh7WfCSaQIq+pHKZPosM9UpVo2yDgIH75fAiiSivLWd/SMyuyRq2VA8pbYTbbynIgqUXz5l8tNXzw7NyTFZteAhcchIoLwwFXmfV6qVAmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cTWaAcwc; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cTWaAcwc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784141488; x=1815677488;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=c6hpNb2JXzDFRlDVnT3j7w6ZUzrfVzvezdxIsX1aXGo=;
  b=cTWaAcwc07qqDXBshm5F546ngnFEDILpKmwLiri1zoOy6PTo8Vva8vjf
   8ZUoAiWV4y1UPrLcgCx2NFwGvmYYOlCh3jBeXHE0GsC7kU6undS15tZ+/
   YHDUc5+9LJqyXHoQ9iiaD5iMaOkplz6w60gbVf2VF2VcvFR4+KFtMnrXy
   ReGU+wkbuHA38P1Kp7KIbnHq0d0Tw53s+hJdp0Hcigh8sGycfflFpyylc
   wHQoYBa0s9tl3vBuUIcxv3yk8bMj2vBDVz7KlKfXu2QCjL8Gv7AFJC5dY
   qKvJrshl5N+2zRLp/W7bxKgLKfi+DoRHJb/8doQDeb1w0wbJQN34LJANo
   g==;
X-CSE-ConnectionGUID: 78bUg6S4RfO6eT+/Z4n4pw==
X-CSE-MsgGUID: EseFElmiTfm9+SwwYaVLfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="96308587"
X-IronPort-AV: E=Sophos;i="6.25,166,1779174000"; 
   d="scan'208";a="96308587"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 11:51:26 -0700
X-CSE-ConnectionGUID: IBaGDHu7QKeuyExlv8l9Uw==
X-CSE-MsgGUID: 9Rn3eEowS7mtmEOv0en++Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,166,1779174000"; 
   d="scan'208";a="294491681"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa001.jf.intel.com with ESMTP; 15 Jul 2026 11:51:21 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 1125CA2; Wed, 15 Jul 2026 20:51:16 +0200 (CEST)
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
Subject: [PATCH v1 7/7] gpiolib: Get rid of not used anymore gpio_request_one()
Date: Wed, 15 Jul 2026 20:46:47 +0200
Message-ID: <20260715185112.1323510-8-andriy.shevchenko@linux.intel.com>
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

No more users.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 Documentation/driver-api/gpio/consumer.rst |  2 +-
 drivers/gpio/gpiolib-legacy.c              | 31 ----------------------
 include/linux/gpio/legacy.h                |  8 ------
 3 files changed, 1 insertion(+), 40 deletions(-)

diff --git a/Documentation/driver-api/gpio/consumer.rst b/Documentation/driver-api/gpio/consumer.rst
index bb3366047fad..03edd9472f07 100644
--- a/Documentation/driver-api/gpio/consumer.rst
+++ b/Documentation/driver-api/gpio/consumer.rst
@@ -463,7 +463,7 @@ and vice-versa::
 The GPIO number returned by desc_to_gpio() can safely be used as a parameter of
 the gpio\_*() functions for as long as the GPIO descriptor `desc` is not freed.
 All the same, a GPIO number passed to gpio_to_desc() must first be properly
-acquired using e.g. gpio_request_one(), and the returned GPIO descriptor is only
+acquired using e.g. gpio_request(), and the returned GPIO descriptor is only
 considered valid until that GPIO number is released using gpio_free().
 
 Freeing a GPIO obtained by one API with the other API is forbidden and an
diff --git a/drivers/gpio/gpiolib-legacy.c b/drivers/gpio/gpiolib-legacy.c
index ef3f2ef30cf2..c2b04605b203 100644
--- a/drivers/gpio/gpiolib-legacy.c
+++ b/drivers/gpio/gpiolib-legacy.c
@@ -21,37 +21,6 @@ void gpio_free(unsigned gpio)
 }
 EXPORT_SYMBOL_GPL(gpio_free);
 
-/**
- * gpio_request_one - request a single GPIO with initial configuration
- * @gpio:	the GPIO number
- * @flags:	GPIO configuration as specified by GPIOF_*
- * @label:	a literal description string of this GPIO
- *
- * **DEPRECATED** This function is deprecated and must not be used in new code.
- *
- * Returns:
- * 0 on success, or negative errno on failure.
- */
-int gpio_request_one(unsigned gpio, unsigned long flags, const char *label)
-{
-	int err;
-
-	err = gpio_request(gpio, label);
-	if (err)
-		return err;
-
-	if (flags & GPIOF_IN)
-		err = gpio_direction_input(gpio);
-	else
-		err = gpio_direction_output(gpio, !!(flags & GPIOF_OUT_INIT_HIGH));
-
-	if (err)
-		gpio_free(gpio);
-
-	return err;
-}
-EXPORT_SYMBOL_GPL(gpio_request_one);
-
 /*
  * **DEPRECATED** This function is deprecated and must not be used in new code.
  */
diff --git a/include/linux/gpio/legacy.h b/include/linux/gpio/legacy.h
index 557ef635935e..d4273162ed13 100644
--- a/include/linux/gpio/legacy.h
+++ b/include/linux/gpio/legacy.h
@@ -82,8 +82,6 @@ static inline int gpio_to_irq(unsigned gpio)
 	return gpiod_to_irq(gpio_to_desc(gpio));
 }
 
-int gpio_request_one(unsigned gpio, unsigned long flags, const char *label);
-
 int devm_gpio_request_one(struct device *dev, unsigned gpio,
 			  unsigned long flags, const char *label);
 
@@ -104,12 +102,6 @@ static inline int gpio_request(unsigned gpio, const char *label)
 	return -ENOSYS;
 }
 
-static inline int gpio_request_one(unsigned gpio,
-					unsigned long flags, const char *label)
-{
-	return -ENOSYS;
-}
-
 static inline void gpio_free(unsigned gpio)
 {
 	might_sleep();
-- 
2.50.1

