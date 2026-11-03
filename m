Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793676864;
	b=oZwBqRqEYLyZafW5PBvIITxS75WzwyEk4SFmjXSiBQZlp2YkGqeKI3BxGOPb5z0SKhp4
	 BnETp2xxRDLhxTRJm1xI0LYLrYPcqgc70lfd7EmwY7aQqM4j48I2XIx/g4xVyswXM0toX
	 jvYNSiOMKmapDRX7FVH4vcW7ekGuRqLtAfWLU762uv4dqIzNl5IN0YHKYTsPLG4kX/oxD
	 AKSk/3TeS3t/apJ0kodWagwj2WB/LsLxjIT8f6tEDkSXIfcpyjEJDTpJ86cx4JT79roub
	 R42Mb8RdSRxrbCa93Zhh/uJDlaQUgu6CrukAD1lN5ojlyj9rznoqM/L5AZZfAlMNbyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793676864;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=mwU+A6308ip2iXwKodsHaokt6SloRiTa7TXQScnGfWM=;
	b=v8yfx/FX8yIEf1kWWlGhnkVdBPmbceLoyQpZBJP8nfQar9lg93GT2y37vKNe2M404cjU
	 Z8BPC9FXV4wE7wx2cYd+h8JbupF/A/4QNoPcufSUeqQ8b3wi+uleIC3S4RAoBO7MdnnaK
	 JaiNEROog9Tv2M6SC5KlxsjFqtDObzKyizqiLeYR0jwIM2a2+O13XsAhgS+vjzQuggB2O
	 FrUIb1Nh1GsPLMjbzWlQwYkowv/aB62EQpi9yVMuOVCPvGV5sb9eF2MkbKKf55QPfaK94
	 ppx4eKWRguG1zUBDdnrQ5IIsLryMTEtX10VonoWixYBUMPGmZUBYqVZrsZNGSUsZhuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jclark.com;
	spf=pass smtp.mailfrom=jclark.com;
	dkim=pass header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=kFs3+pAc;
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03DDD606D808
	for <linux-gpio@vger.kernel.org>; Tue,  3 Nov 2026 03:34:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03DDD606D808
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jclark.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jclark.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=kFs3+pAc
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3a4b3ac8fb7so2224658a91.0
        for <linux-gpio@vger.kernel.org>; Mon, 02 Nov 2026 19:34:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jclark-com.20260707.gappssmtp.com; s=20260707; t=1793676863; x=1794281663; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mwU+A6308ip2iXwKodsHaokt6SloRiTa7TXQScnGfWM=;
        b=kFs3+pAcB2asJWia3nXl4sSrY/b/Ui7HgpSzZneznbPnWtV6Mq9e5Nv6abO3BjNH80
         A0w5Ur4yLCOq9nLaDLNxez3qjItS5VkTubjlUfhhA2mxe8LUvFkIYJZH9Q+FHvedA0a8
         ZTEQx9yRXePLVOJ8X1rO1e7nCQUI3QqPJfgwI2sjD1JmiKeTB7YyVweGL2QUM+Qj+LBu
         oqmBTywQZo6ayf1POIANGkd6CslqT5/YZVc1LZE3NMPnsUdt57j5pf2Dlg30PUFZyA8G
         PTu/nNLm8iYQHzF38Qc9xo4mMWSwtMfQ+gYTikU2HQrx2wieSsI2NkdOPUJSLtokYy90
         PX2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793676863; x=1794281663;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mwU+A6308ip2iXwKodsHaokt6SloRiTa7TXQScnGfWM=;
        b=HOja0eerd+cvXjNlfqwMJMkfDfUsK6Y0Z3MR2Uikr/krOMJFcBaw1bbwM35BSg+F5k
         xpmEf/6TAgkVeQAQsdOUkxn8UyQgpY86CZekdzk3h2QOJB9DQb2y+YHAcHrXAtufocrZ
         E5Wg2xSLLYQqechYKM5BVKQwErKkHUIUKc0S95cTNU3L8TcLWey0k1QLgDEMbbqQ/dou
         pQ/ZNy7QeN4TUJzxqvrGp8nyMQQUptF/d3VJM8k/sIIoZTh3dD2L1HP92y567u4haf2Q
         MKpURo2xt/rJ3wuCv+6TfLTdnwqH88GsmfxD53afCsd6Qenr07ZOtCieQ5WAWzIWW3h2
         mp/A==
X-Forwarded-Encrypted: i=1; AKwUvBy2ZGW0P4njKqJWNDU0kKz1D7quBUhtAY8GQ2fSjLWSpydNiVTNJFOiB+jMDC6N7GcN7c//KZtlstlZ@vger.kernel.org
X-Gm-Message-State: APuU4Z/9OYFsUgG6Yg6fDL3ZMNU5+6bCBHnZBOHrx1Ma8DCIEsKe4Sef
	ZxjRa1zLws9gtFluYAfpfr5XpPb6ywk+SAa7Wr+OBjFMcre3/Rxw2NF9ozEFjT/u+A==
X-Gm-Gg: AYBFou14ycieOiBjsxARgJrgLxThoWpMeTag0ci23eydD+VajBhYXmuyTypI812etRw
	PthbvJJY6Z3Dm918a4lu7NwzLMctxF3f/2rc1Bhj4eFOGGa3Tman5whzZx2YABRDjNM/jUG8SNm
	YSawHbChHnrRYLAuI6a5aalXJcrAbxFBTvlpkH8r6VcKrjpsHROfXBS0JsxvYHqQhtuedNWF+a6
	2t0wJpblMCx/633uu1oN+3uzPd7Sm6eDRImrE2UbpA4f+H9PTSHB5ze+pB84I2Gevu6poH+H6RR
	tZ7q1Tyb7ceqRVm40fWPdfL6Y4unS5tciYvEdU+EYJ3nd8cv2Y56sAP+WcAgebMgy+JXfCA9J1m
	gKW02EqB8ayiXyg8pmg7LLLs+StixIX4TEb/GcIU++xuzKqaE/qsTjZ8vBYsTFcpj0RO9jAnNZP
	i81RBj1pLgyIwFzJa0xACP1SkyijC3Cf6fHtRQ67oOKVW+8Am1WhKmKJrblB/jDbIItrvOil+Wb
	2hGi4hNco7hsS+2awdSjHYK6bN1n1HTd8FfN6uKDh6+OfKVjfFymbeE3zXdBNthA66a9h/NqpiU
	t0wKL/KV4H94SdiT6EH5P+BZxUa3lEQCUPK9Ysfgx/55n6lHBnV3cHtMUpAQ1nqg0jZJa9Ovaky
	FC2qPEuhFFKFpvS1mog==
X-Received: by 2002:a17:90b:518c:b0:3ae:2961:14d5 with SMTP id 98e67ed59e1d1-3ae8979807emr9012242a91.42.1793676863114;
        Mon, 02 Nov 2026 19:34:23 -0800 (PST)
Received: from cantal.lan ([58.136.77.237])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c29e619sm1965566a91.0.2026.11.02.19.34.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 19:34:22 -0800 (PST)
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
Subject: [PATCH v3 1/2] usb: core: clean up before handing a device to the generic driver
Date: Tue,  3 Nov 2026 10:34:12 +0700
Message-ID: <74b3f919f214a8ece24161a2c904d8a5744b703e.1793669297.git.jjc@jclark.com>
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

When a USB device driver's probe returns -ENODEV, usb_probe_device()
hands the device to the generic driver. It does not first undo what it
did before calling the probe. This causes two problems.

First, if the driver sets generic_subclass, the generic probe has
already run. It configured the device and sent a USB_DEVICE_ADD
notification. The generic driver then does both again. Notifier users
such as the usbport LED trigger see two USB_DEVICE_ADDs with no
USB_DEVICE_REMOVE in between.

Second, if the driver does not set supports_autosuspend, a runtime PM
reference was taken before the probe. Nothing drops it, so the device
can never be runtime suspended.

Clean up before handing the device over, in the same way as
usb_unbind_device() does when a driver is unbound: first, for a driver
that sets generic_subclass, call usb_generic_driver_disconnect();
second, for a driver that does not set supports_autosuspend, drop the
runtime PM reference with usb_autosuspend_device().

This leaves one limitation. Until the generic driver binds, the device
has no driver. If it is runtime suspended in that time, it can't be
resumed. This is transient: the generic driver resumes the device when
it binds.

This change does not alter what happens when the probe fails with any
other error. The device stays configured, so its interfaces keep
working. It keeps the runtime PM reference, because a device without a
driver can't be resumed. Its USB_DEVICE_ADD stays unpaired, because
sending USB_DEVICE_REMOVE would mean unconfiguring the device.

Fixes: 88b7381a939d ("USB: Select better matching USB drivers when available")
Signed-off-by: James Clark <jjc@jclark.com>
---
 drivers/usb/core/driver.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/core/driver.c b/drivers/usb/core/driver.c
index d3a61ebc6afb..9b8cd0e4219e 100644
--- a/drivers/usb/core/driver.c
+++ b/drivers/usb/core/driver.c
@@ -295,6 +295,10 @@ static int usb_probe_device(struct device *dev)
 		error = -EINVAL;
 	if (error == -ENODEV && udriver != &usb_generic_driver &&
 	    (udriver->id_table || udriver->match)) {
+		if (udriver->generic_subclass)
+			usb_generic_driver_disconnect(udev);
+		if (!udriver->supports_autosuspend)
+			usb_autosuspend_device(udev);
 		udev->use_generic_driver = 1;
 		return -EPROBE_DEFER;
 	}
-- 
2.56.0

