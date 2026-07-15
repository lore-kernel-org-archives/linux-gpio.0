Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D455494A04;
	Wed, 15 Jul 2026 18:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784141491; cv=none; b=glpcsbM+xHgYo8X8GXqDnhf6VUyXSFFIh5gDwfq8+6JNS6fl/QFhS4Oo1ZeotjQneKVCI/ywQ1wb/ZjC1y7GMDWWN9W4b0sR4MR1xn4rMXG7TSDycrcR5P9CrB3XbaMkxd4pEmgmvsJWTj5Uv5QmpmvJOsLwh7bNvfkc4vCkD64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784141491; c=relaxed/simple;
	bh=vikGjvYqHQWSfjuEaJ2t/Txz7aeo0TD65SJMynOCRv8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qvAi1fn8hgGiK/mxwa3t0zzPdo9lE9/LikJ82kF/3YkA4iUwqdlwbDZ9bmKQAASp8ndSrzZLO2tteJRKpicBSQ/MdBAKTNPf9aI+9osi6/yZYvvIn8cokVKqNeXZK6Qg2xOD/5TS5wYLUmQDn6zkUWmbMouKk3KwEWomstcDH34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b4RBA2rK; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b4RBA2rK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784141488; x=1815677488;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vikGjvYqHQWSfjuEaJ2t/Txz7aeo0TD65SJMynOCRv8=;
  b=b4RBA2rKP4+0SAVXOdsjacZzgjT8g+mqNur3nR1M53y7OX+apaeEfRY7
   NtJp62ToGduEF/7yrtvF4T8n3C/iM7jNbPga/CczHJbABTfdxR16eha0b
   JbnmN2/vQyLu+BFbw6sSib9J0mtuD2Yg7VeCUnrMsPMWfAF0l3RdngTOc
   yHWIjee1S33YJXCRIyBiERkHYqFHOep2cPJkrLQEgH4EgVQBVzoNS/6hm
   oVlK7nrW+ky2g4aSQKJXWvMYkLg89eEDv9DgLP5cmUve20LyE8XJNTg1k
   hTLIMnXbQqr32CcLii0T2b8KNeU5ZqaF229fHXq6Tn6cZKh/AeGWDWlzo
   w==;
X-CSE-ConnectionGUID: 6FuVQU7qQtey6Ov+qwC1ng==
X-CSE-MsgGUID: N3A9+WJUR3Ss8hqaqjV7uQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="84887512"
X-IronPort-AV: E=Sophos;i="6.25,166,1779174000"; 
   d="scan'208";a="84887512"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 11:51:22 -0700
X-CSE-ConnectionGUID: qVpOBhYWRcKlc5QbkDdKdA==
X-CSE-MsgGUID: hu45xtIQSaqwTUt4K9bhhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,166,1779174000"; 
   d="scan'208";a="280700293"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa001.fm.intel.com with ESMTP; 15 Jul 2026 11:51:17 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id F3A5C9B; Wed, 15 Jul 2026 20:51:15 +0200 (CEST)
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
Subject: [PATCH v1 3/7] media: em28xx: Open code gpio_request_one()
Date: Wed, 15 Jul 2026 20:46:43 +0200
Message-ID: <20260715185112.1323510-4-andriy.shevchenko@linux.intel.com>
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

Open code the gpio_request_one() call to be able to kill that API
in the follow changes.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/media/usb/em28xx/em28xx-dvb.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/media/usb/em28xx/em28xx-dvb.c b/drivers/media/usb/em28xx/em28xx-dvb.c
index ef148a27c94d..d7f8dcf27900 100644
--- a/drivers/media/usb/em28xx/em28xx-dvb.c
+++ b/drivers/media/usb/em28xx/em28xx-dvb.c
@@ -742,18 +742,14 @@ static int em28xx_pctv_290e_set_lna_gpio(struct em28xx *dev, u32 lna)
 #ifdef CONFIG_GPIOLIB_LEGACY
 	struct em28xx_dvb *dvb = dev->dvb;
 	int ret;
-	unsigned long flags;
 
-	if (lna == 1)
-		flags = GPIOF_OUT_INIT_HIGH; /* enable LNA */
-	else
-		flags = GPIOF_OUT_INIT_LOW; /* disable LNA */
-
-	ret = gpio_request_one(dvb->lna_gpio, flags, NULL);
-	if (ret)
+	ret = gpio_request(dvb->lna_gpio, NULL);
+	if (ret) {
 		dev_err(&dev->intf->dev, "gpio request failed %d\n", ret);
-	else
+	} else {
+		gpio_direction_output(dvb->lna_gpio, !!(lna == 1));
 		gpio_free(dvb->lna_gpio);
+	}
 
 	return ret;
 #else
-- 
2.50.1

