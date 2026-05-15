Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCF233FBB4D
	for <linux-gpio@vger.kernel.org>; Fri, 15 May 2026 16:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778861766; cv=none; b=X1laG8Lqylz9CpfAGyIQldxat4PFdH2rbIeLkaiEGfKJAyAu2NwyHJMU/hwxkNZZ6RHJDw8osIFqdvB67WSS226+Jedm75FKzLTG4LYcfkpNUv1VPyqK21p8nbiPJQbPt7+faE34rnNwOW+Kr53+11dDiOIrgnSR5lHMD5uURII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778861766; c=relaxed/simple;
	bh=egpSBSiiVF81IZfyLqS6u/B6Mtzw5dC3K/sD5zzWGsA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mFV4eNRzKWoX3NBpAIagULv4mBKVv5Rc64FXI/wLV3lO1eq6Myl7+vsWHU67jNehHf1uzFIJwX9J/W8vGlaUvhmI1r/4IGVMsCXP2zwG3g1DEdHT3gD/Ce4+VPHoYq+RvS6pLYKZ7sgRwo2quvz7NmeS8ZUj+D7pD/lozX/wNDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gPGtH9oI; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gPGtH9oI"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c8173b2af32so6933130a12.0
        for <linux-gpio@vger.kernel.org>; Fri, 15 May 2026 09:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778861764; x=1779466564; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K9Ygl8nWXtwJ478R08EPxLQYgb2RjIx4YLds39Mkiug=;
        b=gPGtH9oIfAbLgkTaMwBrrbpeZh/EQ0zN7U1PwungUYTPwUTLkEI20sWVepTA4Crvox
         RRnEpEA1M2xuCKMMjtdIgNtG6d9/ChgaNVq348G5IPL6rl/j4/wY8VFdWyMOnAdu9QqJ
         d4nOSWzyP47LKuRVXTZ16jss/BzbPNBJpR4sBlQMPJsGbIHGOKb1RzU4UL29SKBb0mnM
         xe4E7MicIaKT77eW+6C+HYqR5icA8ux/in3HzrAe7JFV5+rCLklmMa+q7Re+dCBM1k/d
         sEH1HXkU8fjuMSPYh2QjihufUVWzST3gqskoeBcfM7h2U5zk9j5TVZzkUu6aHRMCzelm
         j6iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778861764; x=1779466564;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=K9Ygl8nWXtwJ478R08EPxLQYgb2RjIx4YLds39Mkiug=;
        b=Vqj+0pUFf601iwEfp0LKUOD8in8Lp+44dunXJQCqPRN64rc/TlLckRxO5jL/lTmCPH
         qfhJ5yCELyqZmkYOeksd/UmxxlYPZyhka9dR93LYL36U1uxIlTgUg4mid68jOqOQ4Pp0
         5TuV2lHgYsVZrfpLXw2bwfLPLUIsNmh2ateZJufF+5kQkY+DFTBcAwZYwHpn18APOfHv
         d9vh8gXfUO+vw+hJAFJZ5YHmhB475/wIXxVTqfkCkiFwdEkjOom4WmyBaZN1rXO7kOs3
         WeMojQcT2nbYfoL0SdI1DfWFGVQIZyqLdsxJFf2IsfnMhwFiPcDwiKFrQ1VIs/0/oqYp
         041g==
X-Gm-Message-State: AOJu0YwC7BJtCX6wHiDyguSutXAdcDj6ILSWyDPcDfN555CX80UxVVEG
	gWizhzUDoSHiAyDzUz62Dij7fGO/G19JnJs2m0zvAK/6k18oKHMrwhVr
X-Gm-Gg: Acq92OFS6DIocf0h20qJQ6Aio0FD90LbwLj4BW4Si1wWk2TTKI/23MEbzNT9ilMcvvV
	gTUOgVIVeA2B8u0r8MVxSQJ/I6Kk+jWK6622JF9UiSpQ/uCdLL1pmHqdTudmPeGx+i9nosZmopT
	VEb/7nfyCmItQx0htp5GfDlw9SIgGJ49HvronG5qfB25m7CiUB42NDBhSGlqgPMgHiM5EOa0aeS
	IMVImzRrl9Kubmw3/quDprct8w5qcJxcynotBbhbyOfKixiOocAO7L0nbmMIS93f/jvj8GWBA81
	f68Iv0MZHb7wpZ/pMm0zPkzitP2sm2IGPuSU0OwSrInHNpobQeBPG1AC81eRqB2Qx/vCjSa2AFB
	pseDVI1kqb3nu5PsPvhke1DeLNY88naaHdI8Xo2/8/CNWIrjG7CWVXo4Nph8j/KAvtBaCbQfAII
	ld+CSYmDKqgM6sm/q3Z9DIdbkMEhRcXrpm+qDsVMmuMs5w6gu5xSS6D0018NO6VhiFdrThYhUJI
	GDZZk6xdaRMLDlmU9KKPYgJIoCRpqOL5HB7X62Qrum79KKji6BmlsvucVu4N1GY
X-Received: by 2002:a05:6a20:7d9f:b0:398:7792:3882 with SMTP id adf61e73a8af0-3b22e823125mr5509269637.16.1778861763631;
        Fri, 15 May 2026 09:16:03 -0700 (PDT)
Received: from hardik-yoga ([2401:4900:1c64:ff18:3fa8:7855:804e:9f49])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb062a2bsm7699036a12.7.2026.05.15.09.15.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 09:16:03 -0700 (PDT)
From: Hardik Prakash <hardikprakash.official@gmail.com>
To: linux-i2c@vger.kernel.org
Cc: linux-gpio@vger.kernel.org,
	wsa@kernel.org,
	andriy.shevchenko@intel.com,
	mario.limonciello@amd.com,
	brgl@bgdev.pl,
	basavaraj.natikar@amd.com,
	linus.walleij@linaro.org,
	Hardik Prakash <hardikprakash.official@gmail.com>
Subject: [PATCH v3 2/2] i2c: designware: fix probe ordering for AMD GPIO on Lenovo Yoga 7 14AGP11
Date: Fri, 15 May 2026 21:45:16 +0530
Message-ID: <20260515161516.10474-2-hardikprakash.official@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260515161516.10474-1-hardikprakash.official@gmail.com>
References: <20260515161516.10474-1-hardikprakash.official@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Lenovo Yoga 7 14AGP11 (83TD), the WACF2200 touchscreen fails with
lost arbitration errors on AMDI0010:02 at boot. The root cause is a
probe ordering issue: i2c_designware probes AMDI0010:02 before
pinctrl-amd has finished initialising, so the GPIO 157 interrupt
needed by the touchscreen is not yet enabled.

Add a DMI-matched deferral in dw_i2c_plat_probe() that uses
device_is_bound() under device_lock() to correctly wait until
pinctrl-amd's probe has fully completed. Use acpi_dev_get_first_match_dev()
for robust HID/UID-based GPIO controller lookup instead of string
name matching.

Signed-off-by: Hardik Prakash <hardikprakash.official@gmail.com>
Assisted-by: Claude:claude-sonnet-4-6
Assisted-by: GPT-Codex:gpt-5.2-codex
BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=221494
---
 drivers/i2c/busses/i2c-designware-platdrv.c | 77 +++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index 3351c4a9ef118..3ffc3d757fbd1 100644
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -8,6 +8,7 @@
  * Copyright (C) 2007 MontaVista Software Inc.
  * Copyright (C) 2009 Provigent Ltd.
  */
+#include <linux/acpi.h>
 #include <linux/clk-provider.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
@@ -86,6 +87,78 @@ static const struct dmi_system_id dw_i2c_hwmon_class_dmi[] = {
 	{ } /* terminate list */
 };
 
+static const struct dmi_system_id dw_i2c_amd_gpio_defer_dmi[] = {
+	{
+		.ident = "Lenovo Yoga 7 14AGP11",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "83TD"),
+			DMI_MATCH(DMI_BOARD_NAME, "LNVNB161216"),
+		},
+	},
+	{ } /* terminate list */
+};
+
+static bool dw_i2c_needs_amd_gpio_dep(struct device *device)
+{
+	struct acpi_device *adev;
+
+	if (!dmi_check_system(dw_i2c_amd_gpio_defer_dmi))
+		return false;
+
+	adev = ACPI_COMPANION(device);
+	if (!adev)
+		return false;
+
+	return acpi_dev_hid_uid_match(adev, "AMDI0010", "2");
+}
+
+static int dw_i2c_defer_for_amd_gpio(struct device *device)
+{
+	struct acpi_device *gpio_adev;
+	struct device *gpio_dev;
+
+	if (!dw_i2c_needs_amd_gpio_dep(device))
+		return 0;
+
+	/*
+	 * Find the AMD GPIO controller by HID/UID and get its physical
+	 * platform device. We need the platform device (not the ACPI device)
+	 * because that is what gets bound by the amd_gpio driver.
+	 */
+	gpio_adev = acpi_dev_get_first_match_dev("AMDI0030", "0", -1);
+	if (!gpio_adev)
+		return -EPROBE_DEFER;
+
+	gpio_dev = acpi_get_first_physical_node(gpio_adev);
+	acpi_dev_put(gpio_adev);
+	if (!gpio_dev)
+		return -EPROBE_DEFER;
+
+	/*
+	 * Check that amd_gpio probe has fully completed, not just that the
+	 * driver pointer is set. The driver pointer is assigned before probe
+	 * finishes, so checking it would allow i2c_designware to probe before
+	 * the GPIO IRQ quirk in amd_gpio_probe() has run.
+	 */
+	device_lock(gpio_dev);
+	if (!device_is_bound(gpio_dev)) {
+		device_unlock(gpio_dev);
+		return -EPROBE_DEFER;
+	}
+	device_unlock(gpio_dev);
+
+	/*
+	 * Create a device link so the driver core enforces probe/remove
+	 * ordering between this I2C controller and the GPIO controller.
+	 */
+	if (!device_link_add(device, gpio_dev, DL_FLAG_AUTOREMOVE_CONSUMER))
+		dev_warn(device, "failed to add device link to %s\n",
+			 dev_name(gpio_dev));
+
+	return 0;
+}
+
 static const struct i2c_dw_semaphore_callbacks i2c_dw_semaphore_cb_table[] = {
 #ifdef CONFIG_I2C_DESIGNWARE_BAYTRAIL
 	{
@@ -138,6 +211,10 @@ static int dw_i2c_plat_probe(struct platform_device *pdev)
 	struct dw_i2c_dev *dev;
 	int irq, ret;
 
+	ret = dw_i2c_defer_for_amd_gpio(device);
+	if (ret)
+		return ret;
+
 	irq = platform_get_irq_optional(pdev, 0);
 	if (irq == -ENXIO)
 		flags |= ACCESS_POLLING;
-- 
2.54.0

