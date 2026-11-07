Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794019011;
	b=YLDgC82f/aa/rp6UNbn49o5CPwERT+jC6/kRQUr5qnHU7DXk1dWAtX2Lz0JoO6hEduZ/
	 xR9fFU47D9Hjv1rlYCVJyBsi0ZWypr2cH7BCWdq1GZ3dDvAPsoSSlQpjzGQmyYldyAaTU
	 RW0dXrM0Je0Cx6Q8TVaMGs5qn4RzujRltsfYB6bmAuMy8oteu8rf72aQxni7q9znVMubK
	 POaNOYvtA4ESG6FvVwHyj+uomwEHMN7jklGNKZ+/Yi2nJT2NJkhlaQUmySk5OWTesUmdx
	 8pMccrWl/RdOnKlQ1sRIWnHATsMwJCQrsAsGcGF7smdIgasCitqIVAFQdOQQtWQGnAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794019011;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=rBjP8dw6vCoVwFwaCraoNpMLiLX/JUJlo0UcGjx5GL8=;
	b=qfBM8751t4r3+4xkTV7fnJlZEuKBx5joVt2sn4vKxRHS+p/9BBi4lmvOqhKWY5E2v0Av
	 NGYHdkAoBco7bxfC+1PM74QaVhM5Z/MuUONwDm/ZvaK0fxXR0f6RByaCZTJagBeebfqud
	 rW7P26LVUiK5XZCmt2oguG8wYVTFlRdbDEfvfUkvr/owl9OXIJDDrMx+FD5nGEvXo152B
	 H7x0NVo4RpxQ3nRLYUA5UGjAgyb5EY1TO7xIp65hSity8qHS912hIBOKDQetA7LyKmfHY
	 pitikH/Um+bnAYT/LcUx/Ib9pD1oejhBXgOhICk1zCZINCL3pVn6oiyKz/UoypPNewg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jclark.com;
	spf=pass smtp.mailfrom=jclark.com;
	dkim=pass header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=geuXp3uq;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C58C6606A32D
	for <linux-gpio@vger.kernel.org>; Sat,  7 Nov 2026 02:36:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C58C6606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jclark.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jclark.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=geuXp3uq
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-36dbde64409so1725836eec.0
        for <linux-gpio@vger.kernel.org>; Fri, 06 Nov 2026 18:36:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jclark-com.20260707.gappssmtp.com; s=20260707; t=1794019010; x=1794623810; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rBjP8dw6vCoVwFwaCraoNpMLiLX/JUJlo0UcGjx5GL8=;
        b=geuXp3uqDwn0lB26RWUvZV4w9kfr37d5egVQg2ozIefcODEpsVY7+6EkpbRPV8UHfm
         PPRgU5whQ1VL5Ts5LRnsguQ3IzZlSIF+PxkSV7vKfE7I6Dd0JF07HWn7KuLdMn3C3rMB
         xpHjXOl2zFiu7xMiMNzz4SkiqxGWVJ9V/YBqLNMpWELNRC6bnt5Cw3m6jrz49H86dNt4
         5UeR/xVbXY0kgvJRTarwlrn0YKcYR+CtBkUFcpZaBIGglOErJ+p9Gf3/HECGCxNtsa4U
         q5iH9N2OfmPC/Sn27fwlUz5K9XgSXEb0Sm4FOGiXgqjYJ3N1nTsoHbg9I76P331NM8Z4
         uOGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794019010; x=1794623810;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rBjP8dw6vCoVwFwaCraoNpMLiLX/JUJlo0UcGjx5GL8=;
        b=llYReg+u9iwvwv5I71Y5tbZDKgjK5f7R7ArhLvzIWrex4TqLh+auPJhoXhTWQidBh8
         6v+KaVOYnzPVrAV+0yjL4OSH8zDDXPI8YDt/cI4Tw7qivx6qgxlA3xFZ/NLh0djdTgKz
         iBVyJhDfk8joziAes5QxjaBBXJ+l+2BSjCqoAR2mLNJsN+Rtx4NK+PFCIQG+bfr5oz9m
         IRl4Ea/5XDrhpUz6L2UEnxmWGyYzdDAa+FaaCpch8sF7MMAx2f4J+iu+yAU1z8jtydap
         sZiaN1CmHW0LMIFLYjEFO2y9iacDP5I6yCly6y74Rtlxy0LaHp6twEU1AYGBrfvG9gdp
         bIRw==
X-Forwarded-Encrypted: i=1; AKwUvBx7xtXVDZvDoprAE3K4QP1h7DEtE958R9friKQkx7LFxp9FrH9oGTt+UWsYZWTVzAHGhlLJeYUoTVqN@vger.kernel.org
X-Gm-Message-State: APuU4Z/c7PDJMWNYTb1wKy12rmrtYvKHSczAE7ti9+sPT18h6EQgMTFo
	8vIrHrM9x4URXz4bkZXXxKJ6ExSMBPsFGVSBssEA5nJinijmyE7322BUbhoSEurU/w==
X-Gm-Gg: AYBFou0Yq33ZZjbLq7SBdn36d/AT5s0tkwzZ5QEBo2N5q2/X0yzyP4FrBz67Abm1z30
	O33ZIiaWq3sT1/zhOBiYz/dw1zsSPEkTlH6RyyLKwYNPNTBmAxymXW05BImQKs+GTe//9F3zOJq
	ajfV6dqIcbzrKnxvfXyeG/6LaQPkkhdFjhgWtWQoV5bT9A/oXZvbMVbJQu//Sv1+HGWX07mYq3j
	e+M4rS3dpIUUv4Me35lC0Jir1wJTu4PqW1nrnDW5wAa4NTApLQDS+Ezo20Tbi6v/AblT68oLji3
	HqikI3DhVDL8NQXrH0pN/3wUtloKhqgw8giazEcaBDL+e8D+NO5hzw/1RI2eCr/xEn3V7LJGoLV
	1f3yWhZsv8NJ5MZw5CAvOEtwFvXCDD+AlZClMera4c+MBGiZFR3UKLcPx5uKeEd0alWwZk/yP3A
	0E3hNoCHzAZQkMuHIgbOT0zHWCWqo5yszEu2LIo5x6WMaqyJjTSF4exirGzXyKrmFGIz3s53Wc9
	Lm4kToThB6TIHALbPtZK+znMVg5Y4tb/Cn80CJ/+xeZcaojGcrO3qooaNJNA7AtRTXnVg3XdqXu
	PKGUqgumq+GNp+dtdc2ThXXZNT2huyHdlhakVZaLRJkztA9NFj5A1nnPpA2qWMczWHS4ACifFWK
	YfkHSRQE43aVa5JOG/A==
X-Received: by 2002:a05:7301:fc81:b0:35e:f4ac:5f8e with SMTP id 5a478bee46e88-36f6f2aa43amr5289981eec.0.1794019009707;
        Fri, 06 Nov 2026 18:36:49 -0800 (PST)
Received: from cantal.lan ([58.136.77.237])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36faa4b4680sm10421618eec.20.2026.11.06.18.36.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 18:36:48 -0800 (PST)
From: James Clark <jjc@jclark.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	Matthias Kaehlcke <mka@chromium.org>
Cc: Johan Hovold <johan@kernel.org>,
	Bastien Nocera <hadess@hadess.net>,
	Arnd Bergmann <arnd@arndb.de>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Douglas Anderson <dianders@chromium.org>,
	Robert Nelson <robertcnelson@gmail.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	regressions@lists.linux.dev
Subject: [PATCH v5 1/2] usb: core: export the generic device driver's operations
Date: Sat,  7 Nov 2026 09:36:37 +0700
Message-ID: <50db3bea8dd8bbc09bd8a9c3b38f44d6523442eb.1794018128.git.jjc@jclark.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <cover.1794018128.git.jjc@jclark.com>
References: <cover.1794018128.git.jjc@jclark.com>
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

Export usb_generic_driver_probe(), usb_generic_driver_disconnect(),
usb_generic_driver_suspend() and usb_generic_driver_resume(), and move
their declarations to include/linux/usb.h. This lets a driver whose
probe may return -EPROBE_DEFER leave generic_subclass unset and call
them itself, so that it can defer before the device is configured.

Say in the generic_subclass kerneldoc not to set it in that case.

Signed-off-by: James Clark <jjc@jclark.com>
Acked-by: Alan Stern <stern@rowland.harvard.edu>
---
Changes in v5:
- Added Alan's Acked-by

Changes in v4:
- New patch

 drivers/usb/core/generic.c |  4 ++++
 drivers/usb/core/usb.h     |  6 ------
 include/linux/usb.h        | 10 +++++++++-
 3 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/core/generic.c b/drivers/usb/core/generic.c
index a48994e11ef3..53675d9fdb03 100644
--- a/drivers/usb/core/generic.c
+++ b/drivers/usb/core/generic.c
@@ -261,6 +261,7 @@ int usb_generic_driver_probe(struct usb_device *udev)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(usb_generic_driver_probe);
 
 void usb_generic_driver_disconnect(struct usb_device *udev)
 {
@@ -271,6 +272,7 @@ void usb_generic_driver_disconnect(struct usb_device *udev)
 	if (udev->actconfig)
 		usb_set_configuration(udev, -1);
 }
+EXPORT_SYMBOL_GPL(usb_generic_driver_disconnect);
 
 #ifdef	CONFIG_PM
 
@@ -301,6 +303,7 @@ int usb_generic_driver_suspend(struct usb_device *udev, pm_message_t msg)
 		usbfs_notify_suspend(udev);
 	return rc;
 }
+EXPORT_SYMBOL_GPL(usb_generic_driver_suspend);
 
 int usb_generic_driver_resume(struct usb_device *udev, pm_message_t msg)
 {
@@ -320,6 +323,7 @@ int usb_generic_driver_resume(struct usb_device *udev, pm_message_t msg)
 		usbfs_notify_resume(udev);
 	return rc;
 }
+EXPORT_SYMBOL_GPL(usb_generic_driver_resume);
 
 #endif	/* CONFIG_PM */
 
diff --git a/drivers/usb/core/usb.h b/drivers/usb/core/usb.h
index a9b37aeb515b..9f1e4d197695 100644
--- a/drivers/usb/core/usb.h
+++ b/drivers/usb/core/usb.h
@@ -50,12 +50,6 @@ extern int usb_get_bos_descriptor(struct usb_device *dev);
 extern void usb_release_bos_descriptor(struct usb_device *dev);
 extern int usb_set_configuration(struct usb_device *dev, int configuration);
 extern int usb_choose_configuration(struct usb_device *udev);
-extern int usb_generic_driver_probe(struct usb_device *udev);
-extern void usb_generic_driver_disconnect(struct usb_device *udev);
-extern int usb_generic_driver_suspend(struct usb_device *udev,
-		pm_message_t msg);
-extern int usb_generic_driver_resume(struct usb_device *udev,
-		pm_message_t msg);
 
 static inline unsigned usb_get_max_power(struct usb_device *udev,
 		struct usb_host_config *c)
diff --git a/include/linux/usb.h b/include/linux/usb.h
index 825f03b29067..4844f53e2fa8 100644
--- a/include/linux/usb.h
+++ b/include/linux/usb.h
@@ -1301,7 +1301,8 @@ struct usb_driver {
  *	for devices bound to this driver.
  * @generic_subclass: if set to 1, the generic USB driver's probe, disconnect,
  *	resume and suspend functions will be called in addition to the driver's
- *	own, so this part of the setup does not need to be replicated.
+ *	own, so this part of the setup does not need to be replicated. Do not set
+ *	this if @probe may return -EPROBE_DEFER.
  *
  * USB device drivers must provide a name, other driver fields are optional.
  */
@@ -1375,6 +1376,13 @@ extern int __usb_register_device_driver(struct usb_device_driver *,
 			struct module *, const char *);
 extern void usb_deregister_device_driver(struct usb_device_driver *);
 
+extern int usb_generic_driver_probe(struct usb_device *udev);
+extern void usb_generic_driver_disconnect(struct usb_device *udev);
+extern int usb_generic_driver_suspend(struct usb_device *udev,
+		pm_message_t msg);
+extern int usb_generic_driver_resume(struct usb_device *udev,
+		pm_message_t msg);
+
 extern int usb_register_dev(struct usb_interface *intf,
 			    struct usb_class_driver *class_driver);
 extern void usb_deregister_dev(struct usb_interface *intf,
-- 
2.56.0

