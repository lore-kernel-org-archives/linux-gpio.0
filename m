Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793684406;
	b=mB4jAJe3zxohaOu4hSUaXqNvtfI5FUvvR97UpPO5ACerxJhpYPn826qQoBVuao7kDcK6
	 YhY77Sai3thGWM+bzu2MT7D9pBBwTgaOmnzwpvUKchg5OmjH8XztmxD4oDen3yCUFkh+q
	 pkJxXsajwjM0wTMJQeZeplonZWivLCdlMrditWEd5zriBWrWhXxypv4fCp6OdsGdC7+Xx
	 +oDiNgl3mdYYetMRXwGl8YpoDFLzqb2IHo7QXN+ReCmIIuosRszzqYSGbXfEMFZ2WjJZN
	 8C/7NeRbhLrfP9c3wRZ2u3rUfxlAGVFs05zoAoGOkm84La9VVSgZf2iPiIeHk8r8IXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793684406;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=SNfcSVIGEmINCcVw+uB8DPAiuuIIPUqBYgGuYhjglr0=;
	b=e/G5SsuzCkM7AifMgG18b1xQhu4Gy/XACvnnGFSqIoGq3rrxEqIL/mhk+die1IyF7zjd
	 lqSaYnNvSV7AQWiJfH5IcwfeIl/L4MRFnlAGmnAnLSEuGdKH/gskjPIwrjQtodGgZWbLa
	 Hh5YBUONV7/WN47aMKLu6JnaqWy7nXTOj9rJ9Q3C9jG+Vq66nSTJImzzY7or+ngc037lK
	 uSSGEFjLlf6ErwmOuUQA3U3GBuEKgx0i6c2GnAa5QgWB59aJIrdsdR9D0JNDxReyLt6+B
	 uhXG6jW+ujX6QYQQRLEIgG4oDgNbk28y1NTgDg/Pmh8mwnZKvZiwuMXoGhSnqH+MY2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jclark.com;
	spf=pass smtp.mailfrom=jclark.com;
	dkim=pass header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=XG7lEL+c;
	arc=none smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2248606A329
	for <linux-gpio@vger.kernel.org>; Tue,  3 Nov 2026 05:40:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2248606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jclark.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jclark.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=XG7lEL+c
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2e9d7791b00so29819815ad.0
        for <linux-gpio@vger.kernel.org>; Mon, 02 Nov 2026 21:40:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jclark-com.20260707.gappssmtp.com; s=20260707; t=1793684400; x=1794289200; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SNfcSVIGEmINCcVw+uB8DPAiuuIIPUqBYgGuYhjglr0=;
        b=XG7lEL+ceAJMrb013ECErNIArebvo21jKlpmwlwCIk72+UgmBRv2fFMHRknWaEXY+W
         iV0+e3X/dEY596kCb8JdOOQYDsW/+cqZGOf/B7uediCRkGs/hwXE/NP2iHHdqFCNJCqy
         Wc/04viUI1tAfYqtI88RHCoj/ywm/gJvKLpUleWDv9FkBAx0SUV3TFanEYbDWt8BeoYC
         PLyzQlrE4z51j1NE2aE65wV4rcZbI8oxFoepRZPIMrTSjvy+Q+gzNCqIcTml2Vs6HJCC
         o0NBfiKkgkBNGM52WZ7Ze2Dg1NJ5/lmYmt3z1WsfSt50xk7xo0zGaTBw3j4NHKsfgDfm
         YfRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793684400; x=1794289200;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SNfcSVIGEmINCcVw+uB8DPAiuuIIPUqBYgGuYhjglr0=;
        b=DfP86mFjVbXs2xNrztLV6c94ZAkhBoNV7bfHC8zWX1aO198SrPrD3GNOJMWvKwx/+g
         mPZlcjBe7SKGEXuWCXvOpzBEp+UaUxglyUcJsWy5mAuzxl9j2Ve+L3fn8vQRN2XwreZV
         lzEya0ZqIYvvHrg8yFH4hr0MZwzGIIqa4dORi8yFD1WQcDZUZIO4i9XlZtSy7P7AGK1I
         dwwWZpDq2WZENndqR2H8RoyHCrJw/wgu24IbFSK+yGer1h5SzjxhJTUes+zXf7OP+Eoa
         z+YjKlbRH7VbK1w18RZeCJfk0QaUxRWovU77EzTOk+wrVmAuatT/3ng1v9TjHrhpUsFB
         4ZdQ==
X-Forwarded-Encrypted: i=1; AKwUvBxEpCnlOmJp1ADajM/Akh0vcj0E1DWOXvdTeJEa7BYenQuAy7ck+fZeP3c7i3e8woI5z5L/faZ9bYyT@vger.kernel.org
X-Gm-Message-State: APuU4Z+UN76JbkNqVQKMpwehC0itoCzWdQkbHctzIjN+H0jJoKS+LCeG
	euXI+MuT3EqpsN4Par/Meal5HMlqdRuWWhafpEOF3PuODWfAPX38yZImWczoOg4Siw==
X-Gm-Gg: AYBFou22PcDTNUr/SfTboYMv/hhhZ/1Ym60CsbU2LlNsbRPf9tIr+pWXw3x7lMzfMex
	Na4sYCasRgBg0otaQT8mVmNLRN7WqnaW48RZRvEH6evB/m8oguuoOP69BzGy8Gw+LIvI4WAmUtr
	2HxwSf/PhUhwYIy2yZ28MUbp32isbtTnMEZJS2GBux+74DMYNUpVahUM1HwRN2KtoVGHZjKzNrp
	oOdinnYerR9SojNOphr5ioCaeYLaiZu/PS4jgLEu6BArs3d2Eo58AQ/Ky+h/Yv5/Dtuxr5CiIHo
	afk4bjP7Cph+HMrWjDEZ+cwN+R74sAZQO6+0gl8WdgeJhJF7Eb2I74ji9B9yl6MxNmtc6DSWL+G
	KiBOIknTYwmnAhWcP4WDJvaS6Hjc5O/pEsxsLPr5/vU0oltREnpbfzpC05iOUDGh5hlN1baAb+/
	SubfUecUOXHZJ2SKOZrIrDMN8t6LH7MWgXKs/ImotPQ2q325D+/vxdpIBXadDXFlOaL4x0m5RGx
	J/T3iMQAZaOZTiXypjLmunZ7/wo3zoUB6GxN473+vmjfjVqHEfUx6H7GDRPClCnLCQemD6nY14B
	7+D+wAx8LTEERVm/gvNxWzKgqCGRDDxBsoZBDy1xByO+7/+FR4qwzyQGYP/NpiIB+iqt0E9eXTB
	6qCWf/WBrm5H91vZ6Ng==
X-Received: by 2002:a17:902:ce05:b0:2dd:ad73:5b6f with SMTP id d9443c01a7336-2eb364b55camr111236385ad.31.1793684400160;
        Mon, 02 Nov 2026 21:40:00 -0800 (PST)
Received: from cantal.lan ([58.136.77.237])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb392494edsm35154505ad.31.2026.11.02.21.39.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 21:39:58 -0800 (PST)
From: James Clark <jjc@jclark.com>
To: sashiko-reviews@lists.linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	Johan Hovold <johan@kernel.org>,
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
Subject: Re: [PATCH v3 2/2] usb: core: add a pre_probe callback for device drivers that may defer
Date: Tue,  3 Nov 2026 12:39:52 +0700
Message-ID: <20261103053952.1138398-1-jjc@jclark.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <sashiko-outbox-194542@kernel.org>
References: <cover.1793669297.git.jjc@jclark.com> <e96b91c85945237ca455869bf4d5a1e177358b54.1793669297.git.jjc@jclark.com> <sashiko-outbox-194542@kernel.org>
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

On Tue, 03 Nov 2026 03:51:41 +0000, sashiko-bot@kernel.org wrote:
> First, when udriver->pre_probe(udev) returns -ENODEV (for example from
> onboard_dev_usbdev_pre_probe() -> _find_onboard_dev()), usb_probe_device()
> still calls usb_autoresume_device(udev) and usb_generic_driver_probe(udev)
> to configure the device, bind all child interface drivers (triggering
> deferred probing), and emit USB_DEVICE_ADD, only to immediately tear them
> all down a few lines later in the error == -ENODEV block via
> usb_generic_driver_disconnect(udev) and usb_autosuspend_device(udev).

This is deliberate, and documented in the @pre_probe kerneldoc. An
error from pre_probe() other than -EPROBE_DEFER is handled as if
probe() had returned it, after the generic probe has run. This keeps
the -ENODEV fallback to the generic driver working as it does for
probe(). For onboard_usb_dev nothing changes: its -ENODEV used to come
from probe().

> Second, if udriver->pre_probe(udev) or udriver->probe(udev) fails with any
> other error (such as -EINVAL or -ENOMEM), usb_probe_device() jumps to
> err_pre_probe, which only calls udriver->disconnect(udev) and does not call
> usb_generic_driver_disconnect(udev) or usb_autosuspend_device(udev) to
> unwind the generic probe and runtime PM state. Because really_probe()
> clears udev->dev.driver to NULL when usb_probe_device() fails:
>
> - When udev is later unplugged, usb_disconnect() -> device_del() skips
>   usb_unbind_device() because udev->dev.driver is NULL, so
>   usb_notify_remove_device() (USB_DEVICE_REMOVE) is never sent. Subscribers
>   such as usbport_trig_notify() in drivers/usb/core/ledtrig-usbport.c never
>   remove the port entries added on USB_DEVICE_ADD, leaking struct
>   usbport_trig_port objects and sysfs attributes with a dangling port->hub
>   pointer to the freed struct usb_device, and usbdev_notify() in
>   drivers/usb/core/devio.c never runs usbdev_remove().

This was raised in Sashiko's review of v2. I missed that it can be fixed
when the device is unplugged. I will attempt to fix this in v4. I think
it can be fixed by recording in struct usb_device that USB_DEVICE_ADD
has been sent, and having usb_disconnect() send USB_DEVICE_REMOVE for a
device that has no driver.

> - For drivers with supports_autosuspend = 1 (such as
>   onboard_dev_usbdev_driver), usb_probe_device() does not take a runtime PM
>   reference, and hub_configure() enables autosuspend on hub devices; once
>   the device suspends, usb_resume_device() fails with -ENOTCONN because
>   udev->dev.driver is NULL.

This is a pre-existing bug that is new in this review.
usb_suspend_device() does a generic suspend for a device without a
driver, but usb_resume_device() refuses to resume one. I don't know
why resume is refused. If a generic resume is safe there, that would
fix it.

> Third, if udriver->pre_probe(udev) succeeds and udriver->probe(udev) then
> returns -ENODEV, the error == -ENODEV block runs
> usb_generic_driver_disconnect(udev) and usb_autosuspend_device(udev) before
> err_pre_probe calls udriver->disconnect(udev), reversing the teardown order
> used in usb_unbind_device():

I will fix this in v4.

James
