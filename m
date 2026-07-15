Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD2E73B14D1;
	Wed, 15 Jul 2026 16:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784133597; cv=none; b=h+FBIYbuL4p2+UQnGi/i/Gm68qCfAy6egsrUoVXUqp/+mbQ3xK9CbWePbHUE/8SPIKzl7bzx/ItR4HMYqSAZKUn34Tfif9JM31c77HLZGAJNq77ooFVtNoI9JD0CzIYGHirkxO8HRniuHrj8Ix92U1mXXHInsqY9gRytuBeQEGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784133597; c=relaxed/simple;
	bh=FJ9AWvT6+1mLCUcM7fIEgPZAGeBn3u03nJFrOR7Fymg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ja/MGnv2Ewl7n9UOrHy27WScQohSps4H+RxBn8vEGDL4tNKEhwXcMAuiONBEiQbe2OHUyKjtbtUCxg9H8LSSiYNL5X7Bc5Ebd+qMMQhfMl0S+dNpVmyf28zNNPJn4rGCzLnc8ka5BcZD+hOva6s3uumNCbqc4zGeEkHevg9o5c0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fZgtZP5t; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fZgtZP5t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784133594; x=1815669594;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=FJ9AWvT6+1mLCUcM7fIEgPZAGeBn3u03nJFrOR7Fymg=;
  b=fZgtZP5tWnC0/IHneGIlCxDbObsGbRHyzFeAvYLjEwRbaaL2cMQ8djQk
   WfKcApljTQ7tigXQ2LEuvmlYrVyhevtReLz2G64eC26/oWs8tHtEdQA1j
   xV8SWuVmqa/DDbwRsFxkaAatMtUEYrDygA5c8M7MMw3eQk/59FUUSv5By
   Bwpkuli+gzJqsSibPTsiSENEqokno2yeh6kExMXc5x4ZunS3NQpmg5FUP
   BzdjeOC/PKpmOIMJA03SBluxQNpWOtoBsOSHjLL4SnzbmBI+k93TxJxvP
   WP4q517FsBoE+2EmjDTKaQWRb61RmAkZivoQEgAggXhEAgn+q3RU9hkXm
   Q==;
X-CSE-ConnectionGUID: s96k7vZ/RIqCpf4NK9iZnw==
X-CSE-MsgGUID: H9p/clj5QRGdNlpalSGsrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="88606351"
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; 
   d="scan'208";a="88606351"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 09:39:50 -0700
X-CSE-ConnectionGUID: opz1vv1GTY6yLNEhc2PJGg==
X-CSE-MsgGUID: vK0+8h4TRTGfAIAliH96HQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; 
   d="scan'208";a="252273713"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa010.fm.intel.com with ESMTP; 15 Jul 2026 09:39:49 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id DA7D998; Wed, 15 Jul 2026 18:39:47 +0200 (CEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] gpio: pcf857x: Use le16_to_cpu() and cpu_to_le16() in IO accessors
Date: Wed, 15 Jul 2026 18:39:44 +0200
Message-ID: <20260715163944.1300616-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

16-bit expander data is an __le16, use le16_to_cpu() to read it.
In the similar way use cpu_to_le16() to write __le16 value.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-pcf857x.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-pcf857x.c b/drivers/gpio/gpio-pcf857x.c
index 4196916c4f94..c1f5e10a3c20 100644
--- a/drivers/gpio/gpio-pcf857x.c
+++ b/drivers/gpio/gpio-pcf857x.c
@@ -18,6 +18,8 @@
 #include <linux/slab.h>
 #include <linux/spinlock.h>
 
+#include <asm/byteorder.h>
+
 static const struct i2c_device_id pcf857x_id[] = {
 	{ .name = "pcf8574", .driver_data = 8 },
 	{ .name = "pcf8574a", .driver_data = 8 },
@@ -96,22 +98,23 @@ static int i2c_read_le8(struct i2c_client *client)
 
 static int i2c_write_le16(struct i2c_client *client, unsigned int word)
 {
-	u8 buf[2] = { word & 0xff, word >> 8, };
+	__le16 buf = cpu_to_le16(word);
 	int status;
 
-	status = i2c_master_send(client, buf, 2);
+	status = i2c_master_send(client, (char *)&buf, sizeof(buf));
 	return (status < 0) ? status : 0;
 }
 
 static int i2c_read_le16(struct i2c_client *client)
 {
-	u8 buf[2];
+	__le16 buf;
 	int status;
 
-	status = i2c_master_recv(client, buf, 2);
+	status = i2c_master_recv(client, (char *)&buf, sizeof(buf));
 	if (status < 0)
 		return status;
-	return (buf[1] << 8) | buf[0];
+
+	return le16_to_cpu(buf);
 }
 
 /*-------------------------------------------------------------------------*/
-- 
2.50.1

