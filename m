Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793676868;
	b=r8bPDwITyv8YUOxsuJxBIZ+9K1tZ9R/JWAod3CaWS7kaKLunRPAACMhinNnSH3+JjgRO
	 pRaLGOL7SmiNMnD4l1XBfyzkGEZS8R3b0lzD3CF1xaAUqWTkWtJGJsqdH2EwtdPrB+j9d
	 8xmj8egvNpqRAyNNuGrp9xRtAojKicAMXvyXYTCADHrhL5Qj3IWdxLcmJs2/hoRKWr5fS
	 8Dd51A8wDMJEEfoqOWUNqO45NdzGeE1S/LzcaIt9RNZEXs/5qLB8QGA3WZTSm/otega6Z
	 iVcPCSR55+Wpf/po6dxlIuptTFChp89xRgxqsjLWXwxUlJltCEzq8sexLyUsJ8VtKHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793676868;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=13EGJjruJLP4hRxeg5Zs7XI3rKWGtad3Ql0J3Te1tx0=;
	b=ieaT36GH/vfXEsOAfsdyMaqm7t8OaGuJEhO20mQUAGSFjAjjOhkopxzM3NJAtv1Q1MTV
	 nni3bPXjdIH1FVsQEeyNIaHRGvDQQuV26kzpKljTKtR77PWfF0XQtVrs1GAUm1vgVocbh
	 jfMLEwosNNirISZWBhFk2HdcbXYJwcsB+lHJlBMOM3Ksam4hYpng87z0953rkg60EE4FJ
	 N66b1Yft6xMCkobtYKZT0tVYWnvf45PgeuazX/YKFtS4VzNTgu2KPd0NG/dg0tQ7pTI/C
	 lBEh925httayvGL3s6ne1lTVXTyyoEMq05zwgcsjqAFXwj1vlTnIoaiwZNoW3DMnN2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jclark.com;
	spf=pass smtp.mailfrom=jclark.com;
	dkim=pass header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=quTlDtbz;
	arc=none smtp.remote-ip=209.85.215.172
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 343BB606D80F
	for <linux-gpio@vger.kernel.org>; Tue,  3 Nov 2026 03:34:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 343BB606D80F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jclark.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jclark.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=quTlDtbz
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cc4c02ddd62so1863016a12.0
        for <linux-gpio@vger.kernel.org>; Mon, 02 Nov 2026 19:34:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jclark-com.20260707.gappssmtp.com; s=20260707; t=1793676867; x=1794281667; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=13EGJjruJLP4hRxeg5Zs7XI3rKWGtad3Ql0J3Te1tx0=;
        b=quTlDtbzm4q1iOIfO+djbcYiWJZwil2quq8TB3rgkUV95KuhPqM+uKvH5v4ENeZYVu
         UNMIQfpiCSsT9qiWArEXuXj/QcbYPs3EqaHt9NIzY1pOwjXLd5Kox+G8cT/R2iJ3qMHv
         F7gaoz/5D5Wn5Rxzf9IyBUcdu6lCwOyC2OQrBUrjK/s9fQusmO5tS7x9claHrDjlKQgE
         W5C7s62JMOAkQA8Vc06a2Nki/6NJaNpyi66Awx/0hORadx3g65266pGnoSuxTIOh+ej7
         o1JPXzL23jAFKiErof0AECbD24H6DaqiKf2mmOUPJFsrOccUd4KrdKpJQq3y1PwdvnpP
         XYIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793676867; x=1794281667;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=13EGJjruJLP4hRxeg5Zs7XI3rKWGtad3Ql0J3Te1tx0=;
        b=AzDP/iMyHer8mPvZYE+RIhuCHnqHAEyu+41uVXQkTTAeO/pYPVK9rbbgwHv97jYcqT
         2h2t8k/uTJp7aOGpn2dreRhNBYxBtgRgvAFWWSYWTvnKeNKnQIPGCMMWfbiFP3q4Qc0A
         swWd0V7KCL/vX4fSAFna7+tZqO1q4KJSfg5ojR9lm4EkErx2rU/VoxFEyq60qFvbjztf
         5g3hSdPe5s9ykrr2WJFBj/vKfkZz740VBOgo/5agd0mlXekD9MOFS+KPWjx/WbvT/Mkp
         DSwnjlVvL76zonlFWtQbQgXtRj99lHaEtbjmWi1c87a4jorNw06LunXICool/XxgHMKU
         x/cQ==
X-Forwarded-Encrypted: i=1; AKwUvBxV2n+jV/JPCbblRiNcTVSPOSiNSZWWN4cMkMWguK81JqoMbePvJ9XkSXeL2GUPfpFYOGMUQxii68vM@vger.kernel.org
X-Gm-Message-State: APuU4Z9fkdigc4Pc9WKeW1Jrh2l6Of86+uBFmhY9cPDLmpN09tGLEcVh
	J+TEwJZPXRRVLzrpFgFkRpmTrXjPPgR5pAGkvWRJ/Sc2zOWB9UHwD/rxog7s7nWIwg==
X-Gm-Gg: AYBFou0/9gRT6lYqUJD01E283I15AAPyhvPvpflUCFRFf1GhULd4hj7/FUF7vjViSAo
	VBxM3p0RxTLqXU1MIIzhqovVPxF31ONQVJ5o/fc6CeHeHRzTq4aH4LSpFROFkkb7oxQWMsWFkA3
	dzxCeTXeuZiOfaOWNpxr7cFDiWpje2soZXKE7pP07inh/BKGpcJ89FTDOjSkC5ixAk3os2xdImq
	uDOaeS6znqaVepM2Id+++b9gA1eVOIfHRna+/Bre7LnfsC3tpQgbkC6/AiLmuS6c6uYZDdUHECG
	+jyn2OZNFd0brQHDAJb+MzhPbwE+74++guNhA0Rpo3dwS+xCsUl/5HiTxPCbcEBeHWx8bVjqG6I
	xmSxREhVK3PWj8z8l4UtmelLSrpbFMFYM0XK5NQTKsk9nKrx46D2c1ydGJOlSe1TdRVi/lfdxYg
	GqOe9EANNFLMkYO0/gjXNhFtDBf3M6qNw5ZbP7OJJJcSXq2EXSBqxRDNvuWw4XkBFPEL22oxCqg
	Mi4sxtrBBUbGHs+0rsk/JhmfXRLiujZBcEHMsEa5xE8E4Mu+/XYaFzODHYHzeF/vkE7dLtGj32N
	68EQV1bm3tEU8blAeEeRcX1S1Rkjj08vU/y1ow7Pi1c9Y6Xoq8GsnHxUShgemJKFm2qbUsannZx
	uIjcpNWR6hSsowRsDBnmbzAv020GubxAGUNZDaBx+
X-Received: by 2002:a17:90b:1b08:b0:3ab:884b:65ab with SMTP id 98e67ed59e1d1-3ae89857dadmr9823238a91.55.1793676867490;
        Mon, 02 Nov 2026 19:34:27 -0800 (PST)
Received: from cantal.lan ([58.136.77.237])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c29e619sm1965566a91.0.2026.11.02.19.34.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 19:34:27 -0800 (PST)
From: James Clark <jjc@jclark.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alan Stern <stern@rowland.harvard.edu>
Cc: Johan Hovold <johan@kernel.org>,
	Bastien Nocera <hadess@hadess.net>,
	Matthias Kaehlcke <mka@chromium.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Douglas Anderson <dianders@chromium.org>,
	Robert Nelson <robertcnelson@gmail.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	regressions@lists.linux.dev
Subject: [PATCH v3 2/2] usb: core: add a pre_probe callback for device drivers that may defer
Date: Tue,  3 Nov 2026 10:34:13 +0700
Message-ID: <e96b91c85945237ca455869bf4d5a1e177358b54.1793669297.git.jjc@jclark.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <cover.1793669297.git.jjc@jclark.com>
References: <cover.1793669297.git.jjc@jclark.com>
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

On a BeagleY-AI with BeagleBoard's device tree, kernels since commit
f918e3804498 ("arm64: enable HAVE_SHARED_GPIOS for all ARM64 platforms")
no longer boot to a usable system. The log repeats "hub 1-1:1.0: USB hub
found" for the on-board TUSB8041 hub every few milliseconds, with no USB
disconnect in between. The flood of uevents stalls udev and the boot ends
in emergency mode. Reverting that commit makes the board boot normally
again.

Both peer hub nodes in this device tree carry the same reset-gpios, so
the GPIO is now a shared one, and with CONFIG_GPIO_SHARED_PROXY=m (the
default) the hub's platform probe is legitimately deferred until udev has
loaded that module. The bootloader leaves the hub running, so the USB
core enumerates it long before, and the USB device probe finds the
platform device without driver data.

At that point, onboard_dev_usbdev_probe() returns -EPROBE_DEFER. This is
what causes the problem. The driver has generic_subclass set, so
usb_probe_device() has already run the generic probe, which configured
the device and bound the interface drivers. Each binding is a
deferred-probe trigger, and the driver core re-triggers when a trigger
happened during a probe that then deferred. So the device is re-probed
straight away, reconfigured, its interfaces bound again, and so on for
as long as the platform device remains unbound. A probe must not defer
after it has registered child devices, and with generic_subclass the
driver's probe has no way to defer before that. This is not specific to
shared GPIOs: it happens whenever the platform probe is deferred, and
briefly whenever onboard_usb_dev is a module.

Add a pre_probe callback to struct usb_device_driver, called before the
generic probe, so that a driver that may have to defer can do so before
the device is configured. -EPROBE_DEFER from it ends the probe with
nothing done. Any other error is handled as if probe() had returned it,
once the generic probe has run, so the -ENODEV fallback to the generic
driver works as before. Make onboard_usb_dev's USB device probe a
pre_probe; it does not need the device to be configured.

A device whose driver defers from pre_probe stays unconfigured until the
probe succeeds, and for good if it never does, e.g. an onboard hub whose
platform driver fails to probe. Before, such a device worked while being
re-probed. On the BeagleY-AI the hub is unconfigured for the few seconds
until gpio-shared-proxy has loaded and the platform driver has probed,
which resets it anyway; the board then boots normally with that commit
in place.

Fixes: 8bc063641ceb ("usb: misc: Add onboard_usb_hub driver")
Suggested-by: Johan Hovold <johan@kernel.org>
Signed-off-by: James Clark <jjc@jclark.com>
---
 drivers/usb/core/driver.c          | 38 ++++++++++++++++++++++++++----
 drivers/usb/misc/onboard_usb_dev.c | 15 ++++++------
 include/linux/usb.h                | 14 +++++++++++
 3 files changed, 55 insertions(+), 12 deletions(-)

diff --git a/drivers/usb/core/driver.c b/drivers/usb/core/driver.c
index 9b8cd0e4219e..137b53beb236 100644
--- a/drivers/usb/core/driver.c
+++ b/drivers/usb/core/driver.c
@@ -249,24 +249,41 @@ static int usb_probe_device(struct device *dev)
 {
 	struct usb_device_driver *udriver = to_usb_device_driver(dev->driver);
 	struct usb_device *udev = to_usb_device(dev);
-	int error = 0;
+	int error = 0, pre_error = 0;
 
 	dev_dbg(dev, "%s\n", __func__);
 
 	/* TODO: Add real matching code */
 
+	/*
+	 * Give the driver a chance to defer before anything is done to the
+	 * device. The generic probe below binds the interface drivers, and
+	 * each binding triggers deferred probing, so a probe that deferred
+	 * after it would be retried straight away and the device re-probed
+	 * in a loop.
+	 *
+	 * Any other error from pre_probe() is not acted on until the generic
+	 * probe has run, so that the -ENODEV fallback below works as it does
+	 * for probe().
+	 */
+	if (udriver->pre_probe) {
+		pre_error = udriver->pre_probe(udev);
+		if (pre_error == -EPROBE_DEFER)
+			return pre_error;
+	}
+
 	/* The device should always appear to be in use
 	 * unless the driver supports autosuspend.
 	 */
 	if (!udriver->supports_autosuspend)
 		error = usb_autoresume_device(udev);
 	if (error)
-		return error;
+		goto err_pre_probe;
 
 	if (udriver->generic_subclass)
 		error = usb_generic_driver_probe(udev);
 	if (error)
-		return error;
+		goto err_pre_probe;
 
 	/* Probe the USB device with the driver in hand, but only
 	 * defer to a generic driver in case the current USB
@@ -289,7 +306,9 @@ static int usb_probe_device(struct device *dev)
 	 * specialised device drivers prior to setting the
 	 * use_generic_driver bit.
 	 */
-	if (udriver->probe)
+	if (pre_error)
+		error = pre_error;
+	else if (udriver->probe)
 		error = udriver->probe(udev);
 	else if (!udriver->generic_subclass)
 		error = -EINVAL;
@@ -300,8 +319,17 @@ static int usb_probe_device(struct device *dev)
 		if (!udriver->supports_autosuspend)
 			usb_autosuspend_device(udev);
 		udev->use_generic_driver = 1;
-		return -EPROBE_DEFER;
+		error = -EPROBE_DEFER;
 	}
+	if (error)
+		goto err_pre_probe;
+
+	return 0;
+
+err_pre_probe:
+	/* The driver core doesn't call disconnect() for a failed probe. */
+	if (udriver->pre_probe && !pre_error && udriver->disconnect)
+		udriver->disconnect(udev);
 	return error;
 }
 
diff --git a/drivers/usb/misc/onboard_usb_dev.c b/drivers/usb/misc/onboard_usb_dev.c
index c60406240416..33653d8f76d7 100644
--- a/drivers/usb/misc/onboard_usb_dev.c
+++ b/drivers/usb/misc/onboard_usb_dev.c
@@ -606,13 +606,14 @@ static struct onboard_dev *_find_onboard_dev(struct device *dev)
 
 	/*
 	 * The presence of drvdata indicates that the platform driver finished
-	 * probing. This handles the case where (conceivably) we could be
-	 * running at the exact same time as the platform driver's probe. If
-	 * we detect the race we request probe deferral and we'll come back and
-	 * try again.
+	 * probing. Without it, e.g. because the platform driver's probe was
+	 * deferred or is running right now, request probe deferral and we'll
+	 * come back and try again. This is allowed because we run from
+	 * pre_probe(), before the USB core has configured the device.
 	 */
 	if (!onboard_dev)
-		return ERR_PTR(-EPROBE_DEFER);
+		return ERR_PTR(dev_err_probe(dev, -EPROBE_DEFER,
+					     "platform device not bound\n"));
 
 	return onboard_dev;
 }
@@ -623,7 +624,7 @@ static bool onboard_dev_usbdev_match(struct usb_device *udev)
 	return !!udev->dev.of_node;
 }
 
-static int onboard_dev_usbdev_probe(struct usb_device *udev)
+static int onboard_dev_usbdev_pre_probe(struct usb_device *udev)
 {
 	struct device *dev = &udev->dev;
 	struct onboard_dev *onboard_dev;
@@ -695,7 +696,7 @@ MODULE_DEVICE_TABLE(usb, onboard_dev_id_table);
 static struct usb_device_driver onboard_dev_usbdev_driver = {
 	.name = "onboard-usb-dev",
 	.match = onboard_dev_usbdev_match,
-	.probe = onboard_dev_usbdev_probe,
+	.pre_probe = onboard_dev_usbdev_pre_probe,
 	.disconnect = onboard_dev_usbdev_disconnect,
 	.generic_subclass = 1,
 	.supports_autosuspend =	1,
diff --git a/include/linux/usb.h b/include/linux/usb.h
index 825f03b29067..6e07d485d49a 100644
--- a/include/linux/usb.h
+++ b/include/linux/usb.h
@@ -1280,6 +1280,19 @@ struct usb_driver {
  * @name: The driver name should be unique among USB drivers,
  *	and should normally be the same as the module name.
  * @match: If set, used for better device/driver matching.
+ * @pre_probe: If set, called first, before the device is resumed or
+ *	configured (the generic USB driver's probe runs after it when
+ *	@generic_subclass is set, then @probe), so it must not access the
+ *	device. A driver that may have to defer probing must do so from here
+ *	by returning -EPROBE_DEFER, not from @probe: by then the generic probe
+ *	has bound the interface drivers, and each binding triggers deferred
+ *	probing, so the device would be re-probed in a loop. Returning
+ *	-EPROBE_DEFER ends the probe with the device left as it was, so the
+ *	device stays unconfigured until the probe succeeds. Any other error is
+ *	handled as if @probe had returned it, once the generic probe has run,
+ *	and @probe is then not called. If @pre_probe succeeds and a later step
+ *	of the probe fails, @disconnect is called to undo it, so a driver with
+ *	both callbacks must make @disconnect cope with a failed @probe.
  * @probe: Called to see if the driver is willing to manage a particular
  *	device.  If it is, probe returns zero and uses dev_set_drvdata()
  *	to associate driver-specific data with the device.  If unwilling
@@ -1309,6 +1322,7 @@ struct usb_device_driver {
 	const char *name;
 
 	bool (*match) (struct usb_device *udev);
+	int (*pre_probe) (struct usb_device *udev);
 	int (*probe) (struct usb_device *udev);
 	void (*disconnect) (struct usb_device *udev);
 
-- 
2.56.0

