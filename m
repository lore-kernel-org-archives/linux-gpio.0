Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794019015;
	b=eUxlAD0V+LF+2efNR0w8T6KzrIOxPnCfdyDmiW1Frn3wpddp+/DwTtgD8qg+VOB3Cz2r
	 WzKkTvU4GgZd+Z3HoLgOfxGxa3NNYrWpyWWepmlO1EcJrBIHYQltWP3TjygFSJHGfMZUV
	 OrueLJE3vyWtMQaWg4rIyOtaSakg0hxyPa6LcotGK0FJn028Tb3XfPXHa9W1xV8zXhBjR
	 EaI50mQmffl+o89EIOF42BJRsXMLUV0D2XGTI+grvYVvVzPZTiyu4ol8AbSa5NuoAA4sY
	 fglQ+Iy7MB9MNcJ4KXOH8LJGy6zkCf9l4yRwsEj4FjhodaXn3hHeLJmOcv/wzNFGP5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794019015;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Dn3AqjSXpF37B635ypQSZqFBFcyclLjzRAmOQAMpPOk=;
	b=RQSIFs9QPcI8k43mWwXnBAsgmifWuVM+w+QXZVRzJd0NVE/oZ7B7ibtlwBBxk1fTSsBs
	 6SR0suvyqc4A8q7CLpzaa16XfRzBnQO3DEH+c3ESWJtNonATOPzVVvV8IiXZCrpwPaYh6
	 uslOB8EwY2mf+5mJ36VWRNxBkGQcP/CJpMdmI965PiRmFytxfyeI7FJgNDTnnzeceGlCH
	 sFH0FAXy8dVtXw3YDerUBJdHnSjncbvcZfEV4AFyIt3p4ABSmVM3sXNnrHdoFODjZ30SX
	 j1H69ORAqvav9IiqZ6D47qz8b+/nZTmdcFlzdRY/TUa8tffnJnus1JeDEeaVNGO2DIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jclark.com;
	spf=pass smtp.mailfrom=jclark.com;
	dkim=pass header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=X2ZOw9fw;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36ADC606A32D
	for <linux-gpio@vger.kernel.org>; Sat,  7 Nov 2026 02:36:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36ADC606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jclark.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jclark.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=X2ZOw9fw
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-35829219da8so282899eec.0
        for <linux-gpio@vger.kernel.org>; Fri, 06 Nov 2026 18:36:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jclark-com.20260707.gappssmtp.com; s=20260707; t=1794019014; x=1794623814; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Dn3AqjSXpF37B635ypQSZqFBFcyclLjzRAmOQAMpPOk=;
        b=X2ZOw9fwHFA67uVlTAvdTMcF+/zT+VJIax05tROfyWOSitFsIK+FsOQw4b6faKCN6V
         ztW8RE2vLYPdcvL36TJCsKOqAcsuUkOCje3DVJ+WqvkJeqqkM5Un1lzqpyO95ydJbTDi
         Jmc3iuRofw20g0sv3UYRTx+lZw9OwDWn4U3+Q3LYp9kHBhSNZl31pyqrYGlz51BPy1gt
         ll+guHl71pSg3Ov0jP587mEjwTmtipAJiqt+AVImZxAR85f0XYcFAqqkTrBDGtDeWQyh
         4dXSujgANu7bGp63e3cvSU8BCI0BjNUqECQaVJ4Nd+ouo69htu+9O9T16C0e9z1rJjm2
         pgCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794019014; x=1794623814;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Dn3AqjSXpF37B635ypQSZqFBFcyclLjzRAmOQAMpPOk=;
        b=Ed+5R7geFnZGLTtMTaX35/9Bl10De3NU6dq3s8s6wGLdlDIn4TKxmDVjPRBY2LRR/n
         T5YhtoCZYAb8zZM5hqYNHokdraZv4TdTbO8ZRXnPKkk6yK35jXHvSjdDHE9zA5UFBOFp
         Bu+rnity+pzH1GeVJQr660DR9myutnMdyDsIJCVA7nfdB1TaZYHIXsu+nj5TQJTSvGve
         pelIjcTEaaDQ73Syw6dLoYkIVAxxu42sn3TVmB8dcaqcGwcYupI8+oRRlzQPiIrw9MZF
         YsWRh/nuTCyowMWKa1bMu4WKY353KYxEcT52nE2LVcVn3r4LBt5kXZ7L5EQzANnnIAlY
         vphw==
X-Forwarded-Encrypted: i=1; AL+hErGH986YTv5FxLS/49FWV7ZbiSBOwDSgdWaAykHFm7wmGPPPdaLkA6zGQinALqYVqdO6IDJB0vtUvUZT@vger.kernel.org
X-Gm-Message-State: APuU4Z+/M4KyyMMlKJzRc5lwzVJtmkNyVadE83IiU2WjV6ezq5KjeoR/
	uFQZ1YebuXfwYIqHsatVk3OY6REWTntmNx7gGXBjFFY/MUFuNyomLurV3FoxN6BBgw==
X-Gm-Gg: AYBFou1eKkV2s3diE2ZkJIjqDqnkJP4uaV1XGthAZ0MHU44kbxlBvbWBwo3euz8eOim
	0JTCPOg+4PvVHv1BQXIuuseR5R9ZqYwVxxJq6Wn56WBgI2xRJt1pPjr9UTaCe0CdZKJxokEBe/L
	JIkRWzgTRvInsBB1FdlYIeaoUnPXV03umIwI1lmjdo7e4Zvgy73nOc/aZqDWzlWXNXrOqLdErgO
	c/buYWQlJn2Csk248UGG76T4mArNek4fltD45ewgczY4DidmarjJvM0/vUg3q+viWv5wx5u8cp1
	pbOok1gOZzFSy7DUyvZVsABUDjsv9KxDGuR6//qahcHPw9lTK6cnJYrsB7TL2POXjJRHQm6vZTK
	sdfvdM5OMfsn+P2EhePVQbhTM4ja1igLN9T3337twGfZEeF0TixvB29NgDPckSIJPVPwOs0PRgj
	rh4voZ12NcwlNI5UqPUYqe3TnEhZL7+D9pf8hP0qk2imzKgVK4HJF05iUfU6l3p61HBFc1uglDG
	2kkliHmTM3k6y+wZY+LoBby6wpyCLV/NLt5wf0NcmLr+645/pXyofrevNS/yd9jcdtVYWIiuoG4
	fP19TxbKwbzJu9nmGeJKAgH5PdfdZE6ivSmltsjjqVjlAEWiG86a0/Qm2jS76ZtjJV06vbXVTHM
	xOAodvP7ltKm2HDIdjg==
X-Received: by 2002:a05:693c:69c8:b0:35e:af84:bf1e with SMTP id 5a478bee46e88-370f4c6234bmr1091383eec.7.1794019014061;
        Fri, 06 Nov 2026 18:36:54 -0800 (PST)
Received: from cantal.lan ([58.136.77.237])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36faa4b4680sm10421618eec.20.2026.11.06.18.36.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 18:36:53 -0800 (PST)
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
Subject: [PATCH v5 2/2] usb: misc: onboard_usb_dev: don't defer probing after the device is configured
Date: Sat,  7 Nov 2026 09:36:38 +0700
Message-ID: <e0e60a57c500ffbdb6addc268d41b7dcc4cf6c4a.1794018128.git.jjc@jclark.com>
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

onboard_usb_dev breaks the rule that a driver must not return
-EPROBE_DEFER from its probe after it has registered child devices (see
commit fbc35b45f9f6 ("Add documentation on meaning of -EPROBE_DEFER")).
Its USB device driver sets generic_subclass, so the generic probe runs
first and registers the device's interfaces. onboard_dev_usbdev_probe()
then returns -EPROBE_DEFER until the platform device for the onboard
device has probed. On the BeagleY-AI, this results in a probe loop,
which has broken booting since commit f918e3804498 ("arm64: enable
HAVE_SHARED_GPIOS for all ARM64 platforms").

Call the generic driver's operations from the driver itself instead of
relying on generic_subclass, so that the probe is deferred before the
device is configured. The device now stays unconfigured while the probe
is deferred, including when the platform device never probes. Before, it
was configured and unconfigured repeatedly until the platform device
probed.

Make onboard_dev_usbdev_match() not match a device when neither its
node nor its peer hub's node has a platform device, so that the generic
driver binds it instead. If the platform device goes away between match
and probe, return -ENODEV instead of -EINVAL, so that usb_probe_device()
falls back to the generic driver.

Fixes: 8bc063641ceb ("usb: misc: Add onboard_usb_hub driver")
Suggested-by: Johan Hovold <johan@kernel.org>
Signed-off-by: James Clark <jjc@jclark.com>
---
Changes in v5:
- Stopped matching a device when neither its node nor its peer hub's
  node has a platform device, so that the generic driver binds it
  (Sashiko)
- Split the platform device lookup out of _find_onboard_dev() into
  onboard_dev_find_pdev(), and dropped the "failed to find device node
  for peer hub" error
- Commit message: explained the -ENODEV

Changes in v4:
- Switched to calling the generic driver's operations instead of
  setting generic_subclass, replacing pre_probe in the USB core

 drivers/usb/misc/onboard_usb_dev.c | 67 +++++++++++++++++++++---------
 1 file changed, 48 insertions(+), 19 deletions(-)

diff --git a/drivers/usb/misc/onboard_usb_dev.c b/drivers/usb/misc/onboard_usb_dev.c
index c60406240416..299e39b55e73 100644
--- a/drivers/usb/misc/onboard_usb_dev.c
+++ b/drivers/usb/misc/onboard_usb_dev.c
@@ -576,6 +576,25 @@ static struct platform_driver onboard_dev_driver = {
 #define VENDOR_ID_VIA		0x2109
 #define VENDOR_ID_XMOS		0x20B1
 
+static struct platform_device *onboard_dev_find_pdev(struct device *dev)
+{
+	struct platform_device *pdev;
+	struct device_node *np;
+
+	pdev = of_find_device_by_node(dev->of_node);
+	if (pdev)
+		return pdev;
+
+	np = of_parse_phandle(dev->of_node, "peer-hub", 0);
+	if (!np)
+		return NULL;
+
+	pdev = of_find_device_by_node(np);
+	of_node_put(np);
+
+	return pdev;
+}
+
 /*
  * Returns the onboard_dev platform device that is associated with the USB
  * device passed as parameter.
@@ -583,23 +602,11 @@ static struct platform_driver onboard_dev_driver = {
 static struct onboard_dev *_find_onboard_dev(struct device *dev)
 {
 	struct platform_device *pdev;
-	struct device_node *np;
 	struct onboard_dev *onboard_dev;
 
-	pdev = of_find_device_by_node(dev->of_node);
-	if (!pdev) {
-		np = of_parse_phandle(dev->of_node, "peer-hub", 0);
-		if (!np) {
-			dev_err(dev, "failed to find device node for peer hub\n");
-			return ERR_PTR(-EINVAL);
-		}
-
-		pdev = of_find_device_by_node(np);
-		of_node_put(np);
-
-		if (!pdev)
-			return ERR_PTR(-ENODEV);
-	}
+	pdev = onboard_dev_find_pdev(dev);
+	if (!pdev)
+		return ERR_PTR(-ENODEV);
 
 	onboard_dev = dev_get_drvdata(&pdev->dev);
 	put_device(&pdev->dev);
@@ -619,8 +626,22 @@ static struct onboard_dev *_find_onboard_dev(struct device *dev)
 
 static bool onboard_dev_usbdev_match(struct usb_device *udev)
 {
-	/* Onboard devices using this driver must have a device tree node */
-	return !!udev->dev.of_node;
+	struct platform_device *pdev;
+
+	/*
+	 * Onboard devices using this driver must have a device tree node with
+	 * a platform device, its own or its peer hub's. Leave any other device
+	 * to the generic driver.
+	 */
+	if (!udev->dev.of_node)
+		return false;
+
+	pdev = onboard_dev_find_pdev(&udev->dev);
+	if (!pdev)
+		return false;
+
+	put_device(&pdev->dev);
+	return true;
 }
 
 static int onboard_dev_usbdev_probe(struct usb_device *udev)
@@ -639,7 +660,11 @@ static int onboard_dev_usbdev_probe(struct usb_device *udev)
 	if (err)
 		return err;
 
-	return 0;
+	err = usb_generic_driver_probe(udev);
+	if (err)
+		onboard_dev_remove_usbdev(onboard_dev, udev);
+
+	return err;
 }
 
 static void onboard_dev_usbdev_disconnect(struct usb_device *udev)
@@ -647,6 +672,7 @@ static void onboard_dev_usbdev_disconnect(struct usb_device *udev)
 	struct onboard_dev *onboard_dev = dev_get_drvdata(&udev->dev);
 
 	onboard_dev_remove_usbdev(onboard_dev, udev);
+	usb_generic_driver_disconnect(udev);
 }
 
 static const struct usb_device_id onboard_dev_id_table[] = {
@@ -697,7 +723,10 @@ static struct usb_device_driver onboard_dev_usbdev_driver = {
 	.match = onboard_dev_usbdev_match,
 	.probe = onboard_dev_usbdev_probe,
 	.disconnect = onboard_dev_usbdev_disconnect,
-	.generic_subclass = 1,
+#ifdef CONFIG_PM
+	.suspend = usb_generic_driver_suspend,
+	.resume = usb_generic_driver_resume,
+#endif
 	.supports_autosuspend =	1,
 	.id_table = onboard_dev_id_table,
 };
-- 
2.56.0

