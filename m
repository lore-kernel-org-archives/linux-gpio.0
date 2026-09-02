Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2574A386C3E
	for <linux-gpio@vger.kernel.org>; Wed,  2 Sep 2026 06:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788330239; cv=none; b=eZsAKcCuY55XW/VKMrOr9x/Z0GRTkSsAUnbfT7MSwrPaw6vWjYP5rAp+2pqG/0LFVRtIcXW/EW/4lsov4AK7+c5YvpGdqWRYlE1SYuWUntv6ah2nXi983d5Tu8aSut9MTMdSd61V8A/onsZDjLwIOGmPFqE8LuyMnKOzES+8nuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788330239; c=relaxed/simple;
	bh=HMnn5aVJ48OtNSiTS+brlOGFOOU4wR55y7WucMsEbHY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NjLuYe8YgkMzp2VZyGHt3OIDV6Cbl8d3H8Zd5GoRqRUBHRJrNE7VO+X+pT4uISrAqSQsYsTo2WayyGub7nB0VHGRLBc9ACT14SW8KwkKjNessAfJNZWqh+AdGhPKvtGkKEVl0RRXiX28LZw5OhpkVqHRtOsIbUKjT3+MOQm6nVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=md5v9B9/; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="md5v9B9/"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-499b2981a7bso6338305e9.3
        for <linux-gpio@vger.kernel.org>; Tue, 01 Sep 2026 23:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788330236; x=1788935036; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uHOxVIY41WkMlz245AOFHdi0BnFepDxV94FL1AiaZ/8=;
        b=md5v9B9/6rxyypeKiKXThJpR7D7n7GPHt6OpKP9wGHl1axadAoBRIkHWXj5JJra+uu
         gFeDhgfLzd9fute7JT+Go2+k20s6l4hYMg/E3izdh9QKIWwcVKY2EmTWAgagq6zXqKfH
         AT7VkSOhWVrmCPTxLkQlwZ8xY8WTnziO5l4p06yws8+7pxlGMxwxR7iqxINciyyRjU9Y
         uF7MrXSkkWHA0p+MuyZbivjYRsBTNNz9o8sjFuCrrDipPvzLNchQn1a6zDTEyAhDzIr4
         sLK6YrmgdTHFrxMs7t+radMq7YptjBnjjTFC+5ODBRTljWzU2BEqnXkKPD0OpvsGu1IJ
         AHIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788330236; x=1788935036;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uHOxVIY41WkMlz245AOFHdi0BnFepDxV94FL1AiaZ/8=;
        b=QAi0EPBPqUxAX89/C6p1Lnwo+NKLRTgqu5lVYi3zZAiFawZxdR86stGxSMi22H1Zyq
         ++nPha6C62RTk0l3g7wqkYn13OSZOKCUcwMSquAXkOEK0x1CgFear7AqQxB6piodWmwG
         NQeR1y+FXcNaPHACFlikP3mhH72fbh7w1FiCe7ouOJmogghTHk5gnImmtD3+rFvhX/1e
         Fuz5AoLCwJpUl/WlrAKRG/pdYlGovu8oujwmUiH5Xo4dVlKQiNSjXQ4KT2oZZGjWWvWE
         ln2ixN3LvaTLmfJIbZI/rVSN3qUAhQN8aqIGrVnxegJc8LhCo7U+FSrefaEG/GcAgQ0A
         /Rpw==
X-Forwarded-Encrypted: i=1; AHgh+RqYDH5W+zP6SZY6larpUkvOXGqNlKxMsqKhi4MCBS2dteFJfL0/FKenkO8fCOh1cTudkYqePYLC5rJF@vger.kernel.org
X-Gm-Message-State: AFuF++lDsBAdquqDMKzThF01uBcyJHx3pY05MLolVBnEiboLz7GR8r4j
	OLQDoUppbVORzHt+5/8OCxHwZWMGrZ8fOkj0OwO43lEkScE1dFtrMReR
X-Gm-Gg: AR+sD11isksIkonbVOQstdbgY8ill0GZEojoeVD4pPrT1RBDryVzkBKJdGJq78gYLFK
	ErEY4f72bA/1moxQmhmqZfh8rMHnojfiMY85SahhElk7zQaGhsGbeFoHJ4KvGhP9obA2UGueRYu
	F6AAinf+0BHPuBkqWOCDY6H50TEho3Jx9MU+kOlj/vwrz52JYVHgR621JFwS9QpyXL7fXMVkcUG
	BTrY6Pn15GHiT07YOJKUN9qBgvlT78xoEFnlbO9A6vQW3HVhgpqn9YyOePkJvE5Pgi4uetio9I6
	BoOKpprM5dzIa4JfaxQXK8YIaDApfk9bCxGoR2lDt//wUjH3TZZ1VKfzq1RczyyxG26gYDOYtb4
	agzuuac5j3Nu9xBsVLvCTvECRYhygEEy9Svtua3Hd66zlN/AzKe/A/6/Ybq8Edq2jOisYlKcukX
	iuqTnibTK/+9RrEsHaO8eRH5IKntjugaYXRHN+4r9fukpcpSMblevZ5ozCN5ebqsEt6w==
X-Received: by 2002:a05:600c:1d14:b0:499:b65e:49c9 with SMTP id 5b1f17b1804b1-49ce583e94cmr33712895e9.10.1788330236108;
        Tue, 01 Sep 2026 23:23:56 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce4776131sm49735335e9.11.2026.09.01.23.23.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 23:23:55 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Cc: Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mehmet Fide <mehmet.fide@screeningeagle.com>
Subject: [PATCH 2/2] gpio: mmio: get the direction from pinctrl when there are no direction registers
Date: Wed,  2 Sep 2026 08:23:52 +0200
Message-ID: <20260902062352.3600368-3-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260902062352.3600368-1-mehmet.fide@gmail.com>
References: <20260902062352.3600368-1-mehmet.fide@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

A generic chip with GPIO_GENERIC_PINCTRL_BACKEND and no direction
registers already sets the direction through pinctrl, but leaves
gc->get_direction unset, so every gpiod_get_direction() call trips the
WARN in gpiolib and the initial line state is guessed. On a Vybrid
Colibri module that is 21 backtraces per boot.

Install a get_direction callback for that combination which asks the
pinctrl backend for PIN_CONFIG_OUTPUT_ENABLE, the same way
gpio-by-pinctrl does it and mirroring how the direction setters are
forwarded. Pins the pin controller cannot answer for report -ENOTSUPP;
gpiolib ignores that when requesting a line and in the debugfs dump, and
such pins cannot change direction through this chip either, as the
setters fail for them too. The one caller that does not ignore it is
gpiochip_lock_as_irq(), which now refuses such a pin as an interrupt
where it previously had nothing to check against.

Suggested-by: Bartosz Golaszewski <brgl@kernel.org>
Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---
 drivers/gpio/gpio-mmio.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/gpio/gpio-mmio.c b/drivers/gpio/gpio-mmio.c
index 7e4b3e8d609f..b2aa74a734e4 100644
--- a/drivers/gpio/gpio-mmio.c
+++ b/drivers/gpio/gpio-mmio.c
@@ -49,6 +49,7 @@ o        `                     ~~~~\___/~~~~    ` controller in FPGA is ,.`
 #include <linux/log2.h>
 #include <linux/module.h>
 #include <linux/pinctrl/consumer.h>
+#include <linux/pinctrl/pinconf-generic.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
 #include <linux/spinlock.h>
@@ -365,6 +366,28 @@ static int gpio_mmio_dir_return(struct gpio_chip *gc, unsigned int gpio,
 		return pinctrl_gpio_direction_input(gc, gpio);
 }
 
+/*
+ * Without direction registers the direction lives in the pin controller
+ * (Vybrid: the OBE bit in the iomuxc pad), so ask pinctrl.
+ */
+static int gpio_mmio_pinctrl_get_dir(struct gpio_chip *gc, unsigned int gpio)
+{
+	unsigned long config;
+	int ret;
+
+#ifdef CONFIG_PINCTRL
+	if (list_empty(&gc->gpiodev->pin_ranges))
+		return -EOPNOTSUPP;
+#endif
+
+	config = pinconf_to_config_packed(PIN_CONFIG_OUTPUT_ENABLE, 0);
+	ret = pinctrl_gpio_get_config(gc, gpio, &config);
+	if (ret)
+		return ret;
+
+	return config ? GPIO_LINE_DIRECTION_OUT : GPIO_LINE_DIRECTION_IN;
+}
+
 static int gpio_mmio_dir_in_err(struct gpio_chip *gc, unsigned int gpio)
 {
 	return -EINVAL;
@@ -601,6 +624,10 @@ static int gpio_mmio_setup_direction(struct gpio_generic_chip *chip,
 			gc->direction_input = gpio_mmio_dir_in_err;
 		else
 			gc->direction_input = gpio_mmio_simple_dir_in;
+
+		if (IS_ENABLED(CONFIG_PINCTRL) &&
+		    cfg->flags & GPIO_GENERIC_PINCTRL_BACKEND)
+			gc->get_direction = gpio_mmio_pinctrl_get_dir;
 	}
 
 	return 0;
-- 
2.54.0

