Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793399839;
	b=34OF6Y84OQOpzJLAy5hQe+r4hBE4IXyKETWRBiG/TW50qV11Yzxi893JaFCE6yElMGOA
	 SkhjcvWFkDbqdNkSZLmNpSJ/wumShgRchChNJl40ZvvrBKuFX4gN6QBRCP9VKmBdg5hFB
	 CBZz/IJ/GBqs72q6lursdBvmZI0DxEkRBfneyfm8sfWZB/1nLmiNTpHKH+XITWs5zoofT
	 ObNkDCNrP2NH0mFqWwRIzwyFpR+XNzfsIV83D4eF70huh71BAp6leLm56GWYvWaEFQ2jR
	 td9ywQL9QCudfAKo4p6EFkT6tOeqZbK++ZWwd3FF1BWGY+eS1Te3nJgrEnZZeZEKn6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793399839;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=pNehLARC7qvOa4dOkHR5b0YmY6kYtso4GzuHZMjqnQY=;
	b=gHk8joj6iOLzt13FIPZqP70ea8rIZKqy7KL+QLMm4KplGL0aQx0aCA4U0y6heXqtcbNF
	 bcgVPDFpS5yrYbU83SxomRbApxjuCQKSvq1Mlh2tBnEv2822DzgBz14rFcJOzilIcZ/td
	 yKXJ7DMScZzGZI6/1y337ENtU1EbqhanFrtdWcQQyk9Cvku/h90mzCzxtv//Z5HMWetCR
	 zRmz2QerQXX8LGX450rUPfFuRc6z2U+9NE/qREbSV2iNZEO5RZRdlwCXuhEPaG7DDpXmR
	 JO279t5Qv9ub641pIoiRtHog0g1SU/7AIyup/4M9A/4yB228BcTmDLY3gi/tIMtV4EA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Lj8XtCWp;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36A1160A2626
	for <linux-gpio@vger.kernel.org>; Fri, 30 Oct 2026 22:37:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36A1160A2626
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Lj8XtCWp
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so10531225e9.2
        for <linux-gpio@vger.kernel.org>; Fri, 30 Oct 2026 15:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793399837; x=1794004637; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pNehLARC7qvOa4dOkHR5b0YmY6kYtso4GzuHZMjqnQY=;
        b=Lj8XtCWpgrhdkkc1l0JBl7kexeOB2LGOh6ikC1MoEHtPGNa+QPgwcnBzjEluqZPFFs
         FdMV0s81vmkKar/h4lhnyGuNDfIdzW5XLbl8TjMtQ2rhTp/n8SNfDhbA6GOBxXr7fuhv
         QnNszvB0Xzl6eoQXd+uT7fzvkYnSC95SAxDLzIzfsVkYzvzCnOj6ffL7KgyVwYbCk8tn
         sITMf2BA+k+TKjy538d5NZSqj4PqD8kmAFIlc2zEqOIMzPfYS39PN7Asv/UCQIRfgseG
         E6gME8Cl+dXKqn2+ugabSg7oi1yRj2+E4IeZyH+1F0WeAdhXArd/KGorhYr2XZEfAJTA
         qbYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793399837; x=1794004637;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pNehLARC7qvOa4dOkHR5b0YmY6kYtso4GzuHZMjqnQY=;
        b=ztCO4Iwch2TJOif7MH5prXz8vN7RGe6lPxmFJiFKEDwbQExNVXibqTkFvKxkw1LlbR
         /C1H7J5445F1JsL834I0SISLzaHoNlssbQaSMMkXEJSsu5/w/jiZZ0zK8GkaV5C7Mipb
         sIPSvtukMpD5RmeHWEVkjIFlw7OzmUdZiGgMSmRZ35edSaEj1MeXq+SbQXqdt08i8kq6
         uR/nYDiBcWFe8scpNP+mZ2m1ApSnp0dsIn/7HyTnEKHo0jRI4xRo+mICkRFyGWB2A0En
         gqFwcUG1ktcU40FvOm9VldAJ2/tHXoNyDDlcxfSGJ94JXhriFRe4IKrehpA1VjSuKwmY
         mD0w==
X-Forwarded-Encrypted: i=1; AKwUvBxisrutZNPIevzOVOnxq/zqOwkiJQ1kgxe1wRRS4x1FpRFjfm7OlnmFlVTdsedxjxbbBKq/VwcFUA+p@vger.kernel.org
X-Gm-Message-State: AFq9FYKGqbWFLvL3UuQN5PADsDK/svTAijgpbBqhe/y08RZBFiFiYXv6
	+GzcCdqs26ugQO89/xp6XF94FWNO7fn0YxQMEuahLK8ma+V7ScLawnFD
X-Gm-Gg: AYBFou0n9Z+EmVDbeZCNhHCs9apGrnslgO7J93248xhr/V/CN8C0hOv68tVVRnLErMq
	B/RW3RFzWo2HCbVvEdjQY23mrk7j/+psNvZJf6t9/OvG1+Uj/7pRH6s8+dH7IzpmxsjtubvecHN
	BcyOmBUbUi4ANRdmIXA4/i2ay8K/4pASsqLEorDFEv6FrImJUgc7ddFdwvFsmAWbOpsk2CaKkpF
	uNsIuKMvXq5J5OkPSnF+hJBG4fs3dUwkUWFGs5RW3r5f9IoMF5SC3Z2sZ7Ufe+NV89+tzx6tj1/
	N20l9S20vjvWDG6lIrSXzRPVKozPav258FR05JFgAD4X7i4Wcv93PSdB/KFyT7KmOxwEROovdFC
	VQGLtQXnApnxFVmysRQ7yJFF1TgqTdtkDFVlRDDxr0+JrgV7Z9hYhcg9TMCuAazIffMfyREwbyh
	MNgeGgXi9YRr0gP9DGZDrlCHzi17O1oyCYGr7WNmmU/mfireemAG2QnQOTSzJL0MAAhmWQVJTqF
	n9zd4cLBIhL/X73DvDEjDUolyvn9IORiBcuUeCG8jHh4rXX+P2LvaO12Sud2IxvElzNDXt50/88
	1YGsTLanRmG6peP5HZeizXvQTRkc2FyRdCjCKo8DYOfQfowOtQ==
X-Received: by 2002:a05:6000:4021:b0:48e:4300:c70e with SMTP id ffacd0b85a97d-48e6e304059mr8145616f8f.46.1793399836599;
        Fri, 30 Oct 2026 15:37:16 -0700 (PDT)
Received: from m2.. ([37.142.145.227])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e71b959c1sm5457300f8f.45.2026.10.30.15.37.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 15:37:16 -0700 (PDT)
From: Michael Zaidman <michael.zaidman@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Raman Varabets <kernel-linux-20260610-80b7ab08@raman.v1.sg>,
	Germain Hebert <germain.hebert@ca.abb.com>,
	Christina Quast <contact@christina-quast.de>,
	Rio Liu <rio@r26.me>,
	Bruno Giacomazzi <brunoceg1@gmail.com>,
	linux-input@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Zaidman <michael.zaidman@gmail.com>
Subject: [PATCH v2 09/15] HID: ft260: group sysfs attrs per HID interface
Date: Sat, 31 Oct 2026 00:36:31 +0200
Message-ID: <20261030223637.86907-10-michael.zaidman@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261030223637.86907-1-michael.zaidman@gmail.com>
References: <20261030223637.86907-1-michael.zaidman@gmail.com>
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

Split the single sysfs attribute group into per-interface groups based
on chip mode (DCNF0/DCNF1):

- I2C-only (mode 1): I2C and GPIO attributes on the I2C HID interface
- Dual mode (0/3): hid_over_i2c_en, i2c_reset and clock on the I2C
  interface; GPIO and UART attrs on the UART interface
- UART-only (mode 2): GPIO and UART attrs on the UART interface

Put i2c_enable on the UART group. In modes 0 and 3 ft260_gpio_init()
runs from the UART probe, so that interface registers the gpiochip. A
write to i2c_enable updates dev->gpio_en of the interface that owns
the attribute. On the I2C interface the write would re-mux GPIO0 and
GPIO1 on the chip and leave the gpiochip's mask unchanged, so the two
lines would stay unavailable.

Do not expose i2c_reset on the UART group (reported by Sashiko).

Signed-off-by: Michael Zaidman <michael.zaidman@gmail.com>

---
v2: i2c_enable moves to the UART group, which owns the gpiochip; UART
group drops i2c_reset (reported by Sashiko).
---
 drivers/hid/hid-ft260.c | 60 ++++++++++++++++++++++++++++++++++-------
 1 file changed, 51 insertions(+), 9 deletions(-)

diff --git a/drivers/hid/hid-ft260.c b/drivers/hid/hid-ft260.c
index 4106066b6a89..dca0250f2c25 100644
--- a/drivers/hid/hid-ft260.c
+++ b/drivers/hid/hid-ft260.c
@@ -1630,7 +1630,7 @@ static ssize_t i2c_reset_store(struct device *kdev,
 }
 static DEVICE_ATTR_WO(i2c_reset);
 
-static const struct attribute_group ft260_attr_group = {
+static const struct attribute_group ft260_i2c_chip_mode_1_attr_group = {
 	.attrs = (struct attribute *[]) {
 		  &dev_attr_chip_mode.attr,
 		  &dev_attr_pwren_status.attr,
@@ -1641,8 +1641,6 @@ static const struct attribute_group ft260_attr_group = {
 		  &dev_attr_gpio2_func.attr,
 		  &dev_attr_gpioa_func.attr,
 		  &dev_attr_gpiog_func.attr,
-		  &dev_attr_uart_mode.attr,
-		  &dev_attr_uart_dcd_ri.attr,
 		  &dev_attr_clock_ctl.attr,
 		  &dev_attr_i2c_reset.attr,
 		  &dev_attr_clock.attr,
@@ -1650,6 +1648,32 @@ static const struct attribute_group ft260_attr_group = {
 	}
 };
 
+static const struct attribute_group ft260_i2c_chip_mode_0_3_attr_group = {
+	.attrs = (struct attribute *[]) {
+		  &dev_attr_hid_over_i2c_en.attr,
+		  &dev_attr_i2c_reset.attr,
+		  &dev_attr_clock.attr,
+		  NULL
+	}
+};
+
+static const struct attribute_group ft260_uart_chip_mode_0_2_3_attr_group = {
+	.attrs = (struct attribute *[]) {
+		  &dev_attr_chip_mode.attr,
+		  &dev_attr_pwren_status.attr,
+		  &dev_attr_suspend_status.attr,
+		  &dev_attr_power_saving_en.attr,
+		  &dev_attr_i2c_enable.attr,
+		  &dev_attr_gpio2_func.attr,
+		  &dev_attr_gpioa_func.attr,
+		  &dev_attr_gpiog_func.attr,
+		  &dev_attr_uart_mode.attr,
+		  &dev_attr_uart_dcd_ri.attr,
+		  &dev_attr_clock_ctl.attr,
+		  NULL
+	}
+};
+
 static DEFINE_MUTEX(ft260_uart_list_lock);
 static LIST_HEAD(ft260_uart_device_list);
 
@@ -2275,7 +2299,16 @@ static int ft260_i2c_probe(struct ft260_device *dev,
 		if (ret)
 			goto err_i2c_free;
 
-		ret = sysfs_create_group(&hdev->dev.kobj, &ft260_attr_group);
+		ret = sysfs_create_group(&hdev->dev.kobj,
+					 &ft260_i2c_chip_mode_1_attr_group);
+		if (ret < 0) {
+			hid_err(hdev, "failed to create sysfs attrs\n");
+			goto err_i2c_free;
+		}
+	} else if (cfg->chip_mode == FT260_MODE_ALL ||
+		   cfg->chip_mode == FT260_MODE_BOTH) {
+		ret = sysfs_create_group(&hdev->dev.kobj,
+					 &ft260_i2c_chip_mode_0_3_attr_group);
 		if (ret < 0) {
 			hid_err(hdev, "failed to create sysfs attrs\n");
 			goto err_i2c_free;
@@ -2341,12 +2374,14 @@ static int ft260_uart_probe(struct ft260_device *dev,
 	cfg->uart_mode = FT260_UART_CFG_FLOW_CTRL_NONE;
 
 	if (dev->chip_mode & FT260_MODE_UART ||
-	    dev->chip_mode == FT260_MODE_ALL) {
+	    dev->chip_mode == FT260_MODE_ALL ||
+	    dev->chip_mode == FT260_MODE_BOTH) {
 		ret = ft260_gpio_init(dev, cfg);
 		if (ret)
 			goto err_hid_report;
 
-		ret = sysfs_create_group(&hdev->dev.kobj, &ft260_attr_group);
+		ret = sysfs_create_group(&hdev->dev.kobj,
+					 &ft260_uart_chip_mode_0_2_3_attr_group);
 		if (ret < 0) {
 			hid_err(hdev, "failed to create sysfs attrs\n");
 			goto err_hid_report;
@@ -2464,11 +2499,18 @@ static void ft260_remove(struct hid_device *hdev)
 					   dev->index);
 		ft260_uart_port_remove(dev);
 		if (dev->chip_mode & FT260_MODE_UART ||
-		    dev->chip_mode == FT260_MODE_ALL)
-			sysfs_remove_group(&hdev->dev.kobj, &ft260_attr_group);
+		    dev->chip_mode == FT260_MODE_ALL ||
+		    dev->chip_mode == FT260_MODE_BOTH)
+			sysfs_remove_group(&hdev->dev.kobj,
+					   &ft260_uart_chip_mode_0_2_3_attr_group);
 	} else {
 		if (dev->chip_mode == FT260_MODE_I2C)
-			sysfs_remove_group(&hdev->dev.kobj, &ft260_attr_group);
+			sysfs_remove_group(&hdev->dev.kobj,
+					   &ft260_i2c_chip_mode_1_attr_group);
+		else if (dev->chip_mode == FT260_MODE_ALL ||
+			 dev->chip_mode == FT260_MODE_BOTH)
+			sysfs_remove_group(&hdev->dev.kobj,
+					   &ft260_i2c_chip_mode_0_3_attr_group);
 		i2c_del_adapter(&dev->adap);
 	}
 
-- 
2.43.0

