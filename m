Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793945586;
	b=TrmecsZRiqQs7u/rvsIi1Qd7Ga5sylKKQShIW95nZJQ8lekuefcox10NuMydKNhlVorw
	 UeHAAXi+fBGXHbrUmVQZc0zqZu5uP45zqMr8g+jkNMrsV1DDEN6F+zQ2iWvuNbvFtT7N8
	 smsnmnNsTorlEKq25qd3f5KlepcKtySCDl8JphUjLCf1M87OmWZ8AeNWESkXlmT1Emv1C
	 Db4W9pe7D2HYMHH+yt2/Gbu/Q01Wl398ZnJ1EWeKuaMKnEt3ZYL9xyL1lK9qTZ+Qe/Se7
	 sllnpN+jmaEYdYrT/n0fMiuCsXqJvrgts4VS2o+KFhL96I0oqQdtfFrDnTxRdB4cNmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793945586;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ydVqyV0aRoJDaWfDPtWBdic6N/4Yozo7V/PmjjVO7QY=;
	b=3sVCUXuC9h0IXrdWhcVWrWtn9EPkdp95v1LuMM2GlkS1Vnxq8KO1k6vwZf6NDls2pUp7
	 LyXg1RgVMyksdqFqVWzA4OahzeOrwfMerwWPd4Q3drM3Rmg3Yu+SYbnkHDunAyX0J2w21
	 s6nBUxo1iQyJ4njiJgCy7b1eWu/9E6Z+I7zQey9LHWwmaAS9H1BTpCvxhiGBYOYQNgyl1
	 QIzRWgFwaspcAkf03D7CLYAiwN+ixiHmjNSrrddJG3iizuPy1isK7RIAXXszvI6TtIGUT
	 bctKsIsVNzbT1m9vZt5KAlBskOyvSZ1YEbktpcnBudnHOygpANddwohuK6i5AFw4FIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jclark.com;
	spf=pass smtp.mailfrom=jclark.com;
	dkim=pass header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=QCLPKEfN;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89B46606A331
	for <linux-gpio@vger.kernel.org>; Fri,  6 Nov 2026 06:13:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89B46606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jclark.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jclark.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=QCLPKEfN
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-3535a54bed9so418332eec.1
        for <linux-gpio@vger.kernel.org>; Thu, 05 Nov 2026 22:13:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jclark-com.20260707.gappssmtp.com; s=20260707; t=1793945586; x=1794550386; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ydVqyV0aRoJDaWfDPtWBdic6N/4Yozo7V/PmjjVO7QY=;
        b=QCLPKEfNFBTyIMCl1dj2v+zqSSbSLitFj4Xi7Nv0VJYbPr59+g6B5LTulPqi0lF+La
         Tj4swyU3Cti/Jt+xOGFYd52pn1ZiUBI2ooWFEu8x42hqm26flSJQczxH8972SA+lXgHA
         +Xgvw6ywBlIJNpNNGftYSzaKamiFQ0YlM7IkawmKRcPCy0HPFFQ+p37NLZEXA8rp7DXk
         YLmmDkS2S98RZE2y58OlrVemb6l+VXAfHHQlQpELuR2EeCdMxmfHINL24ahOk/lfqPeN
         KLixePl2FM42xXWyItpU+ltPQLk/MTX9/GFk0kkF5KJ5zKtyIl1AP2EVjj0m8QK7hd6C
         WEQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793945586; x=1794550386;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ydVqyV0aRoJDaWfDPtWBdic6N/4Yozo7V/PmjjVO7QY=;
        b=QIwxYCoZ7nLYJEvdY89PvsGG1WZtRhdDgBvDooCWkUBnvlptFPPQgbMGcJLHVsIG20
         il6obEdzy00ks8E0FVWbjbfTyYkFZj8abeqeHt66xg/7nuX8MzZ1A1yU73pSsRcPRPme
         xEvxivzagwzJhiiY5o0HeuvaIw9IS1wRnl5DC25ULFNtL6zZcPdJDQFyWniSgmU9C23b
         dvsvTmKbkzN0CJEug/kb4kHNaVRJSswliTQbMfoZRt/nbosgKZ4nspEYgc6qLjnh+1yL
         0d0IlM0nlpOYs0KbpklWPolZhnIl+Cj1g3LeODE/EvMQZxOg2eBlCR8tITfFexyQpd1b
         va5w==
X-Forwarded-Encrypted: i=1; AKwUvBxhl42ahGNXS6VL3E2PMqyWqRMXuAfvYaSzru1w8bSjYvqqJ+53aJLdB0YH8MsvE225sm7guYKmLPmz@vger.kernel.org
X-Gm-Message-State: APuU4Z9xZip5POoUtsEzPD1BxAabJcOPI7JHqWfuEQK6qEUZeXoOpy6a
	6KLHnAilXQD06ueXrnNWdJ3Wb+idOPisdRfP+NSX6J6gDXqP1ZYd6d127oEh/Lt8Yg==
X-Gm-Gg: AYBFou3U1Bz9K/kd9M+um+k5riGdplNO4HBfE1YzKg0aC5w1cwfvJ69rzPyBo97TfY/
	pEanZKECSo/tlHSMbhxVHSt3ZCy/tx+149uuIH6+Uyv6xK6b7nf13Uul910T/Fcnoh6ggt31+2S
	qkn4F3A2eUoybPOoVeQPJQnDjJ6RjvevmvqvhQEbeDLhQjeqvxgQQ2CLgCmY/5Go6nKxWNw+o2/
	0+WdI7esiXepJMADTMJlOVrDoJ0CUzrpK3kQXlCvp0QtR4lMLjkmRzjksBLCzVKYtpdhC94an3s
	ZZVxE2dIzlDG9CHvKNMUEeqw/wBR+b5ca7solMYLsSbEuXxGws2y1E+e61QMV8oDr5LMYBNMxyv
	1QZkpAFV12jkleWSfhnMAwd6Jh8j2SycmdUf+1gntzXMoa5nwK4QxkVxOpgDV63b5xfZGgvzGPo
	dgiCw1gdoNQOynJD7c/grPnKnfoC9ducCaw40QOXn6nihmXUMrCsmXgYrdy7meJlpqKL9TmKFjg
	eoTDOSHtM1kW/K+xxEJZ8SjMaJQgQ9LJJTn2Muq8qAfn9Y+fy1XIK/0R+5kcGWe79GuaC7taVYM
	aBNn1UGWNUdwAqvniQqekLTY9yzZRxok4Ff3p8dLwOwdmDT+hN8k2Ap7wBhMVrzuH7qVABSxHs9
	kCd4VnN9yX3314wxGUw==
X-Received: by 2002:a05:693c:8843:b0:36f:6d81:3fa6 with SMTP id 5a478bee46e88-36f75443270mr2213138eec.6.1793945585471;
        Thu, 05 Nov 2026 22:13:05 -0800 (PST)
Received: from cantal.lan ([58.136.77.237])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa922c6c7sm3755879eec.10.2026.11.05.22.13.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 22:13:05 -0800 (PST)
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
Subject: [PATCH v4 2/2] usb: misc: onboard_usb_dev: don't defer probing after the device is configured
Date: Fri,  6 Nov 2026 13:12:51 +0700
Message-ID: <f24b025cde0c3af37a958042d9deb96ae4494994.1793941292.git.jjc@jclark.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <cover.1793941292.git.jjc@jclark.com>
References: <cover.1793941292.git.jjc@jclark.com>
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
-EPROBE_DEFER from its probe after it has registered child devices,
because that causes a probe loop (see commit fbc35b45f9f6 ("Add
documentation on meaning of -EPROBE_DEFER")). Its USB device driver
sets generic_subclass, so the generic probe runs first and registers
the device's interfaces. onboard_dev_usbdev_probe() then returns
-EPROBE_DEFER until the platform device for the onboard device has
probed. On a BeagleY-AI, the resulting loop has broken booting since
commit f918e3804498 ("arm64: enable HAVE_SHARED_GPIOS for all ARM64
platforms").

Call the generic driver's operations from the driver itself instead of
relying on generic_subclass.

When the device's node has neither a platform device nor a peer hub,
return -ENODEV instead of -EINVAL, so that the device is still
configured. The device now stays unconfigured while the probe is
deferred.

Fixes: 8bc063641ceb ("usb: misc: Add onboard_usb_hub driver")
Suggested-by: Johan Hovold <johan@kernel.org>
Signed-off-by: James Clark <jjc@jclark.com>
---
 drivers/usb/misc/onboard_usb_dev.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/misc/onboard_usb_dev.c b/drivers/usb/misc/onboard_usb_dev.c
index c60406240416..51985e3473ad 100644
--- a/drivers/usb/misc/onboard_usb_dev.c
+++ b/drivers/usb/misc/onboard_usb_dev.c
@@ -591,7 +591,7 @@ static struct onboard_dev *_find_onboard_dev(struct device *dev)
 		np = of_parse_phandle(dev->of_node, "peer-hub", 0);
 		if (!np) {
 			dev_err(dev, "failed to find device node for peer hub\n");
-			return ERR_PTR(-EINVAL);
+			return ERR_PTR(-ENODEV);
 		}
 
 		pdev = of_find_device_by_node(np);
@@ -639,7 +639,11 @@ static int onboard_dev_usbdev_probe(struct usb_device *udev)
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
@@ -647,6 +651,7 @@ static void onboard_dev_usbdev_disconnect(struct usb_device *udev)
 	struct onboard_dev *onboard_dev = dev_get_drvdata(&udev->dev);
 
 	onboard_dev_remove_usbdev(onboard_dev, udev);
+	usb_generic_driver_disconnect(udev);
 }
 
 static const struct usb_device_id onboard_dev_id_table[] = {
@@ -697,7 +702,10 @@ static struct usb_device_driver onboard_dev_usbdev_driver = {
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

