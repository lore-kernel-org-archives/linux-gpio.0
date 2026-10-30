Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793360834;
	b=v7nZU3FnwrPzfOuPHgk4GEJN85vyZISXWPwEsT9CXBKj6tEmkhiUx28byo9BDHGTdtMq
	 MQAUpgvFXEsDKSWZ0Rd9TFyRhp/NntQyfvDuWcodZhvyz/JgmedDTOx2hS8vaVlWg8TVQ
	 S45iyAM/dVfXaGCOCHAYPsAJgd5uvDWwZl1HsJS3M6pWLCszV9NcAIFs+ZyA4DTtN6iwK
	 nvDTCapJO5a9x6N/p4CO5L5ZDd7r5i6E5cTibP5BLmk7oTaaiLfBG2oGoVmU2tZ9TSKSW
	 OXg70p+tUi6iPyuDpj7QpER4dOB4Sn8E7L6CgMFwxAUcx6EBqf43q2klMK6IRXszfQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793360834;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=nbz/Vjri7OOyBPqFDAm2yR3HQ9KSPqNqIywAM0GHwt8=;
	b=TpOHaCR3L1xHRgxxJjD6BWXrgezpsbIO+k+EuATkDQA6OIko7GWGs4s0DqVvq4eNAGIl
	 P6e2lhY4Aa7kw8fe1Ptf/HIzaCcReNSFPolTDKXvEWSkwqHnPLCeOheiUduIghGZyI4Dz
	 ue3ds63AGl7g9j4i2pdFNF49Ku/y8aGr2DlNMv/NnkwIVUqmk/D9pCSLn4BYyZO8JDrsn
	 xU/B6GjFs/UFiO9AM/Gi8Phrag9uz55nd2OAWTSCVpOpFXuaQQTdtJvpEv/G/7YKE6uih
	 C0efERDnUZZ71bUwgv7/GVEZZYGmCqL1y0CDV+Nan0Ch9KE59hlO6F4iyE57wdnKhhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jclark.com;
	spf=pass smtp.mailfrom=jclark.com;
	dkim=pass header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=me6KKni+;
	arc=none smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E13AE606A338
	for <linux-gpio@vger.kernel.org>; Fri, 30 Oct 2026 11:47:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E13AE606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jclark.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jclark.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=me6KKni+
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2e9995ce866so5311905ad.0
        for <linux-gpio@vger.kernel.org>; Fri, 30 Oct 2026 04:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jclark-com.20260707.gappssmtp.com; s=20260707; t=1793360833; x=1793965633; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nbz/Vjri7OOyBPqFDAm2yR3HQ9KSPqNqIywAM0GHwt8=;
        b=me6KKni+y5jQl0eqMOFJYUaWQNTL3kewbOTUsbbEjTCdl5uMB1oDszxhD86U2hYlSK
         z2avVrm6AuD8o3CqmMkj+k1MbFK6t+uwQPJoIpPE9zyi7ZU/vTIoqJoP1PtT2VFOx/VP
         dzG6l8AMKADqVDy3P/whtrlFdLss7qbPXIdYiuzEKG4CNTx33YhUmEdOmL+ICFiy4ato
         Jk1CFrzN9awcUfuezxTU8PTBejtkL7v5r39xmF23Ran7SDUZjKe8BCcW3PQVZUKwxazd
         +4C3ocx+lRSAvAzyxcCBCkS9lWFg8mKwyWMwLnMTV7015P17KI83v8jXFEZ81w6MC/C4
         Kgqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793360833; x=1793965633;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nbz/Vjri7OOyBPqFDAm2yR3HQ9KSPqNqIywAM0GHwt8=;
        b=zwLWXbu4tJBUu6nXFgxrkYWHCRnbsRJEQNnchaTmGXSeDLoew9mVGyiT1uo+hyK0E+
         +OJJpVLwkH8dTRGXdmwka2udCp6RuvK4Yobs1ICjwD1q3S5KQqFPSYT2PshemS5PNsIE
         a+WMeyk9xpGOnCzTyyRyXyMxSa/DJpOgiLDimfZBk5TRT12N3qetEL084riOK1Sl8u9O
         S08L73nY0BPfH8ZLUNiNmYiFgRLVHFGk2ziF7rXKPJH2vN0gqEqF2pVqxOWTX4lvLt6L
         UZ7v4d4G+NpYcBO/OC6iVIxy91hC198VLqS9xawR7lMBkA78io2DaCNjo4qt09LQ7VBN
         8QVw==
X-Forwarded-Encrypted: i=1; AKwUvBwZ+uNvJdGPRYMOwRBwdDzAk+KIQGUVR+PujI/6NizknK4Ne9BFKZVb5ITiHPD3bZ4WycVI97jrFAXT@vger.kernel.org
X-Gm-Message-State: AFq9FYJ241UJsYHG+mkoIcWZHcTlDmhsWQDaRzVC8/2K8OFZxnMh65MB
	wM+Xo6fk4wr3ygq3BEMLdNv+3ynv+bK3juRgbkUwAU/OoqwW4ojfFI/LgvISBjVYXw==
X-Gm-Gg: AYBFou3eCk/00xHvn+krpTSArpjGqDd51tkfiYDFB84BDXp3BVFYhEyJAgKlSboyGjp
	k1QfbySPglrL+jzmp4+0aEG3m4Bi4Lx649r9sKwFV758XCCObCAf5q1Hx5WSj38gW7T0aegN5lq
	ZtKbAQOv5BsXihIrQN8lrlSoPLsPbPkbCx7XlWLNj0XHIBkPZ5r8HXgOkM1lxuWljvXBQx3+PhB
	JKGoeOI34xFSwYKr7Hg/igsUVwRWVtCXq5KAVr/hLu24MDjc+rD9udcGJmO1e2hTWWLh0ke6DnG
	X/WPdffEfAe9m0bGB+GFlGv6GCp4Ol9jRdZvOq6rpEAdh2EZoOmzClroBam4hXTLwlz65uwSvx9
	300op2OI0dyVNj+uNjM+O360mq+jIn1kxBHr6us8U6B4k6Kc9jzordvFJW3O2bK28HOR42GCVq1
	lVxX6AvUi9rxmMwV5eeNRuLTpn9m8v8IjYZTZuC7yr1SLp0SObUpPASCRFyKJocwBCelner0adw
	uXlf7UX115IQGgEw+vCb/LtZz2WWQTB2sRBXcdojNbW+MKAsKcF2wNgmzlGixNi+BBR4Raf1VaB
	kLZcinxgSJ/xNmkVbXGe8EHfUyws1H9KBkC8kYWTpvOFWDPjkGEsoyr4uDy/6fvccTUXnMdgHiB
	Iul4Gg1eXCU4rRvOL
X-Received: by 2002:a17:903:124a:b0:2cc:6018:f030 with SMTP id d9443c01a7336-2eb36495fe9mr21504985ad.14.1793360832911;
        Fri, 30 Oct 2026 04:47:12 -0700 (PDT)
Received: from cantal.lan ([58.136.77.93])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb392ba7d3sm6025725ad.75.2026.10.30.04.47.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 04:47:11 -0700 (PDT)
From: James Clark <jjc@jclark.com>
To: Matthias Kaehlcke <mka@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Ravi Chandra Sadineni <ravisadineni@chromium.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-gpio@vger.kernel.org,
	regressions@lists.linux.dev
Subject: [PATCH] usb: misc: onboard_usb_dev: don't defer the USB device probe
Date: Fri, 30 Oct 2026 18:47:05 +0700
Message-ID: <20261030114705.3159093-1-jjc@jclark.com>
X-Mailer: git-send-email 2.56.0
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

The underlying problem is in onboard_usb_dev. Both peer hub nodes in this
device tree carry the same reset-gpios, so the GPIO is now a shared one,
and with CONFIG_GPIO_SHARED_PROXY=m (the default) the hub's platform
probe is legitimately deferred until udev has loaded that module. The
bootloader leaves the hub running, so the USB core enumerates it long
before, and the USB device probe finds the platform device without
driver data.

At that point, onboard_dev_usbdev_probe() returns -EPROBE_DEFER. This is
what causes the problem. The driver has generic_subclass set, so
usb_probe_device() has already run the generic probe, which configured
the device and bound the interface drivers. Each binding is a
deferred-probe trigger, and the driver core re-triggers when a trigger
happened during a probe that then deferred. So the device is re-probed
straight away, reconfigured, its interfaces bound again, and so on for
as long as the platform device remains unbound. This is not specific to
shared GPIOs: it happens whenever the platform probe is deferred, and
briefly whenever onboard_usb_dev is a module.

Bind to the USB device anyway, with NULL drvdata. When the platform
probe finishes, it already schedules attach_usb_driver_work to
re-attach the USB driver; extend it to also walk the USB devices and
attach the ones that are bound to this driver but have no drvdata. This
ensures the USB device always has a driver.

It doesn't work to return -ENXIO: the driver core takes this as the
driver declining the device, but the device is then left without a
driver, and a device without a driver can't be resumed once it has
autosuspended, which a hub with empty ports does right away. Nor does
it work to return -ENODEV: the USB core then binds the generic driver,
and driver_attach() doesn't rebind a device that already has one.

With this change the BeagleY-AI boots normally with that commit in
place.

Fixes: 8bc063641ceb ("usb: misc: Add onboard_usb_hub driver")
Cc: stable@vger.kernel.org
Signed-off-by: James Clark <jjc@jclark.com>
---
I found this by booting commit 85b4bc79dde7 (net/main during the 7.4
merge window) on a BeagleY-AI with BeagleBoard's device tree. A coding
agent identified the problem, explained it to me and proposed an initial
fix, which was revised multiple times on the basis of local Sashiko
reviews. I verified that the patch fixed the problem on top of commit
d89e1d186ec9.

On this board the platform probe asserts the hub's reset line, so the
hubs re-enumerate and are probed with the platform device already
bound. The path where attach_usb_driver_work adopts a USB device that
was bound with NULL drvdata has therefore not been exercised. It needs a
board whose platform probe does not reset the hub.

#regzbot introduced: f918e3804498

 drivers/usb/misc/onboard_usb_dev.c | 76 ++++++++++++++++++++++++++----
 1 file changed, 67 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/misc/onboard_usb_dev.c b/drivers/usb/misc/onboard_usb_dev.c
index c60406240416..aac4e29c8233 100644
--- a/drivers/usb/misc/onboard_usb_dev.c
+++ b/drivers/usb/misc/onboard_usb_dev.c
@@ -43,6 +43,7 @@
 #define USB5744_CREG_BYPASS_UDC_SUSPEND		BIT(3)
 
 static void onboard_dev_attach_usb_driver(struct work_struct *work);
+static struct onboard_dev *_find_onboard_dev(struct device *dev);
 
 static struct usb_device_driver onboard_dev_usbdev_driver;
 static DECLARE_WORK(attach_usb_driver_work, onboard_dev_attach_usb_driver);
@@ -301,6 +302,47 @@ static const struct attribute_group onboard_dev_group = {
 __ATTRIBUTE_GROUPS(onboard_dev);
 
 
+/*
+ * Attach a USB device that was bound by onboard_dev_usbdev_probe() while its
+ * platform device was still unbound. The device lock serialises this with
+ * the probe and with an unbind. This walks the USB bus, not the driver's
+ * device list: unbinding a device holds its lock while it waits for all
+ * references to its node on the driver's list to be dropped, so an iterator
+ * over that list that takes the device lock would deadlock with it.
+ */
+static int onboard_dev_attach_usbdev(struct usb_device *udev, void *data)
+{
+	struct device *dev = &udev->dev;
+	struct onboard_dev *onboard_dev;
+	int err;
+
+	/* Unlocked pre-check, so as not to wait for every USB device's lock. */
+	if (READ_ONCE(dev->driver) != &onboard_dev_usbdev_driver.driver)
+		return 0;
+
+	device_lock(dev);
+
+	if (dev->driver != &onboard_dev_usbdev_driver.driver ||
+	    dev_get_drvdata(dev))
+		goto out;
+
+	onboard_dev = _find_onboard_dev(dev);
+	if (IS_ERR_OR_NULL(onboard_dev))
+		goto out;
+
+	err = onboard_dev_add_usbdev(onboard_dev, udev);
+	if (err)
+		dev_err(dev, "failed to attach to %s: %pe\n",
+			dev_name(onboard_dev->dev), ERR_PTR(err));
+	else
+		dev_set_drvdata(dev, onboard_dev);
+
+out:
+	device_unlock(dev);
+
+	return 0;
+}
+
 static void onboard_dev_attach_usb_driver(struct work_struct *work)
 {
 	int err;
@@ -308,6 +350,8 @@ static void onboard_dev_attach_usb_driver(struct work_struct *work)
 	err = driver_attach(&onboard_dev_usbdev_driver.driver);
 	if (err)
 		pr_err("Failed to attach USB driver: %pe\n", ERR_PTR(err));
+
+	usb_for_each_dev(NULL, onboard_dev_attach_usbdev);
 }
 
 #if IS_ENABLED(CONFIG_USB_ONBOARD_DEV_USB5744)
@@ -497,7 +541,10 @@ static int onboard_dev_probe(struct platform_device *pdev)
 	/*
 	 * The USB driver might have been detached from the USB devices by
 	 * onboard_dev_remove() (e.g. through an 'unbind' by userspace),
-	 * make sure to re-attach it if needed.
+	 * make sure to re-attach it if needed. The work also attaches USB
+	 * devices that were probed while this platform device was still
+	 * unbound (e.g. because this probe was deferred), see
+	 * onboard_dev_usbdev_probe().
 	 *
 	 * This needs to be done deferred to avoid self-deadlocks on systems
 	 * with nested onboard hubs.
@@ -606,14 +653,9 @@ static struct onboard_dev *_find_onboard_dev(struct device *dev)
 
 	/*
 	 * The presence of drvdata indicates that the platform driver finished
-	 * probing. This handles the case where (conceivably) we could be
-	 * running at the exact same time as the platform driver's probe. If
-	 * we detect the race we request probe deferral and we'll come back and
-	 * try again.
+	 * probing. Without it the USB device can't be attached to the platform
+	 * device yet; return NULL and let the caller decide what to do.
 	 */
-	if (!onboard_dev)
-		return ERR_PTR(-EPROBE_DEFER);
-
 	return onboard_dev;
 }
 
@@ -635,6 +677,21 @@ static int onboard_dev_usbdev_probe(struct usb_device *udev)
 
 	dev_set_drvdata(dev, onboard_dev);
 
+	/*
+	 * The platform device may not be bound yet (e.g. because its probe
+	 * was deferred). Bind to the USB device anyway, with NULL drvdata,
+	 * and let the platform driver attach it once it has probed (see
+	 * attach_usb_driver_work). Requesting probe deferral here wouldn't
+	 * work: the generic probe has already bound the interface drivers,
+	 * which triggers deferred probing, so the device would be re-probed
+	 * in a loop until the platform device is bound. Returning -ENXIO
+	 * doesn't work either: the device is then left without a driver and
+	 * can't be resumed once it has autosuspended. Returning -ENODEV
+	 * hands it to the generic driver for good.
+	 */
+	if (!onboard_dev)
+		return 0;
+
 	err = onboard_dev_add_usbdev(onboard_dev, udev);
 	if (err)
 		return err;
@@ -646,7 +703,8 @@ static void onboard_dev_usbdev_disconnect(struct usb_device *udev)
 {
 	struct onboard_dev *onboard_dev = dev_get_drvdata(&udev->dev);
 
-	onboard_dev_remove_usbdev(onboard_dev, udev);
+	if (onboard_dev)
+		onboard_dev_remove_usbdev(onboard_dev, udev);
 }
 
 static const struct usb_device_id onboard_dev_id_table[] = {
