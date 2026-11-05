Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793910721;
	b=IPIGDHYcuEE/NRGyUFKW5wpJyup5+Ld9hEqkozuCG5TBRVZAq7q+B3OjLqB3NdKtAbaP
	 s4ql6HhaTbcvOkp11r98mkkW7xz4L7beS+Mnp3QwUXDsw5HTFahrc/S7ZkBiVThfX0zwo
	 /HArA/0e7boPkRC/2uxJcfbstJarXDrQwWirHgpzYwtBE9mL7NXUBP0YJ9d0CRS7AXK9x
	 MhK6ZwWAw/anGf3zjJZGOKVhmWiy8t5ajAaZANNvl3/qP7OtxDVaDhgboRCyXGFlcOjy2
	 t3wEE95x0SLGi/J5til3pPAnfuKLfEPM5aU0n7B2kfhycNxgj5M3axQTGbHaJpZUUTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793910721;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=naL9ZYlGHpjK154MUN/eO3m7g6+A6qo1lAhYSkBJyWI=;
	b=bmzlhFCUcmo+VGeEekBoHjxaNmCLvCd4+irYFx8TgrS9E5c0oFJj50FxJ0ve+R2AeYTk
	 xPaW6TF1meRsWo3tK8+UtL1LD+oofVQjTuAgS2EWaJPyJcqUp2A8zuGp/UvBSAgP/Bc80
	 4JRAYO4HmMMawG1cG7HaO7xnoNbRcvem7YuRMy3KpX1e3c43r5W7xKVWOR8cpT0BxZHnG
	 VrDOblrKf6jcfDbMD6IrrOUDxAxFUc7rQxipuDf4KxRgUhhWQmZ2K0zAHqXEnE3/otEy7
	 UcXUG5mSky5PRwONm2I0omel6qyLnMV6YNsM7X7L935UzA5/Pk9rwn4zgslSOU6d7JQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=QuEcehMG;
	arc=none smtp.remote-ip=209.85.160.179
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5196606A32C
	for <linux-gpio@vger.kernel.org>; Thu,  5 Nov 2026 20:32:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5196606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=QuEcehMG
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-535179e995bso23700941cf.0
        for <linux-gpio@vger.kernel.org>; Thu, 05 Nov 2026 12:32:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1793910720; x=1794515520; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=naL9ZYlGHpjK154MUN/eO3m7g6+A6qo1lAhYSkBJyWI=;
        b=QuEcehMGpMoP1K0IVbN/jVj5FL16+s94k5t0K2g5d5AuYxTOCh6G4Jz8w3y0e27Ot2
         zjBFLHRAzM/Ti0n2KRuJaKiZ6olZN9GtZRXeHTVndUylx9APp6ow0YwbN7xjTxyx10zJ
         kdOYN2vLpWaJFVSHUEHHJ1hmP19gmsD7CISX8rluknE01JEHFdBxhDChOCXZKhEPxxPl
         v87bQoOa90cvKjHG3/jJXdY7C5Zm7dx6vyByYMIw0erq7zDu+/jRkawvk1sbni8vxpQW
         vi1jBCewTx7IZ0PNMjwxUuVSUuI553Yxr1C6eovL76hM822B3OBk+EWb0+m3HwoCP2UL
         hVQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793910720; x=1794515520;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=naL9ZYlGHpjK154MUN/eO3m7g6+A6qo1lAhYSkBJyWI=;
        b=HKundCieDlKRz7wp5r5Rq36iIT+xf+yITFd1rMJb73sYXzDbW58duqTWt9buGE+g8R
         yjCLubXU1PIao5XfIgPXSdnRV1z8S+eHP2cL+Fl42ani1OAw7EhWWZT42IOt0YLOkPIF
         LffRlVq1RToskJeugMKonkvu0u+aO5APAP5pAnd8TBz0CKuTKMnkXXn1C4xvik/2DPnb
         YhE/bVjpF32xnjM5K5UiX5KbnPlob/QRZRoPwrV6oGr5uN60adU79xsSiWkyDR+Sg6Q+
         WAUIWPg1PbzdhEp9PyaGyC1f+0q/WRkTXX1kCBM2gy30vsyRaR+OXWtip4bMticHua1/
         6FBA==
X-Forwarded-Encrypted: i=1; AKwUvByvpfFMlASiOYCX0ZejBwaGAp1RV1OH/3y5GmqfP9o1PZWTb/o2b+HVCX09UMxn6ankQ1T1NuTOS5cJ@vger.kernel.org
X-Gm-Message-State: APuU4Z+ASnHSsCstYBjEGJ6EQ0LqcQ9M5U4o6vCmjkybwly22OmACLqk
	anEXbKepT15FnLmt7k6g5H0OTGNm8K+Oir1LGBu3vICfBLO0H/+kOvwqpepNP7Y+yg==
X-Gm-Gg: AYBFou1ioXdVhNC6kvtxHa9dYHH0j+jbeoOjpGJ9GQyv54LfYA4vji5LcqAspANZjlc
	/4vMbpiF5e+KGanRUvwo+qmGQDFmt+FbieRh260s0GsYk+mk6AXVjumjDRRSKHIwue5ZG+JVmSf
	+uMe7xegEXdBO9Les3y8VYnds0zHUyErQ33cfcb54dJM+GAkIQDq5JtmbX3DCfs920fRgCqt8zg
	JisQ8ifzotknJFOvJ8kat6ZnXVxZ29JjC48GWJkhg7jqA/lIMOoVvjmsV1eDb8J6Kz7F1W91o91
	a2ce40qJc2OOPhLBROY7kFSyKt1+ugSI2mzyPFTD+XykKd1UuIdlLk0nWXL4P5Og2DlvaxPkmow
	LlNeJL60ZSv6X10FCq9ISdaCln+xzuPd/uGjPs2OCMpgaDP3SvKoRd5bWW6cIni68PO1cEaXQ0i
	hz7S0JdLqWOqvLIxT9FgI7A05NaZu3Mrd9+67v7VD34J2Jyjjh/vBpbgDumikk4qbBeYEnTpC9c
	1KIzvz3+dt8CzFRCsf6J1dVEtbYo3tSO8MFYDkTmayvR9gfXU/2qyaYYdnA5LQQO/RIXPmZoPAy
	SW+ooGmdqGReAzbQUM2FkQiXy7i3
X-Received: by 2002:a05:622a:5a18:b0:535:85c0:fda2 with SMTP id d75a77b69052e-54e100e5826mr8821511cf.11.1793910719615;
        Thu, 05 Nov 2026 12:31:59 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::66b0])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ea6a870dcsm3921886d6.30.2026.11.05.12.31.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 12:31:58 -0800 (PST)
Date: Thu, 5 Nov 2026 15:31:56 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: James Clark <jjc@jclark.com>
Cc: sashiko-reviews@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Johan Hovold <johan@kernel.org>, Bastien Nocera <hadess@hadess.net>,
	Matthias Kaehlcke <mka@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Douglas Anderson <dianders@chromium.org>,
	Robert Nelson <robertcnelson@gmail.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: [PATCH v3 2/2] usb: core: add a pre_probe callback for device
 drivers that may defer
Message-ID: <a0918852-57e6-42b3-9321-38d766a20025@rowland.harvard.edu>
References: <cover.1793669297.git.jjc@jclark.com>
 <e96b91c85945237ca455869bf4d5a1e177358b54.1793669297.git.jjc@jclark.com>
 <sashiko-outbox-194542@kernel.org>
 <20261103053952.1138398-1-jjc@jclark.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261103053952.1138398-1-jjc@jclark.com>

On Tue, Nov 03, 2026 at 12:39:52PM +0700, James Clark wrote:
> On Tue, 03 Nov 2026 03:51:41 +0000, sashiko-bot@kernel.org wrote:
> > First, when udriver->pre_probe(udev) returns -ENODEV (for example from
> > onboard_dev_usbdev_pre_probe() -> _find_onboard_dev()), usb_probe_device()
> > still calls usb_autoresume_device(udev) and usb_generic_driver_probe(udev)
> > to configure the device, bind all child interface drivers (triggering
> > deferred probing), and emit USB_DEVICE_ADD, only to immediately tear them
> > all down a few lines later in the error == -ENODEV block via
> > usb_generic_driver_disconnect(udev) and usb_autosuspend_device(udev).
> 
> This is deliberate, and documented in the @pre_probe kerneldoc. An
> error from pre_probe() other than -EPROBE_DEFER is handled as if
> probe() had returned it, after the generic probe has run. This keeps
> the -ENODEV fallback to the generic driver working as it does for
> probe(). For onboard_usb_dev nothing changes: its -ENODEV used to come
> from probe().
> 
> > Second, if udriver->pre_probe(udev) or udriver->probe(udev) fails with any
> > other error (such as -EINVAL or -ENOMEM), usb_probe_device() jumps to
> > err_pre_probe, which only calls udriver->disconnect(udev) and does not call
> > usb_generic_driver_disconnect(udev) or usb_autosuspend_device(udev) to
> > unwind the generic probe and runtime PM state. Because really_probe()
> > clears udev->dev.driver to NULL when usb_probe_device() fails:
> >
> > - When udev is later unplugged, usb_disconnect() -> device_del() skips
> >   usb_unbind_device() because udev->dev.driver is NULL, so
> >   usb_notify_remove_device() (USB_DEVICE_REMOVE) is never sent. Subscribers
> >   such as usbport_trig_notify() in drivers/usb/core/ledtrig-usbport.c never
> >   remove the port entries added on USB_DEVICE_ADD, leaking struct
> >   usbport_trig_port objects and sysfs attributes with a dangling port->hub
> >   pointer to the freed struct usb_device, and usbdev_notify() in
> >   drivers/usb/core/devio.c never runs usbdev_remove().
> 
> This was raised in Sashiko's review of v2. I missed that it can be fixed
> when the device is unplugged. I will attempt to fix this in v4. I think
> it can be fixed by recording in struct usb_device that USB_DEVICE_ADD
> has been sent, and having usb_disconnect() send USB_DEVICE_REMOVE for a
> device that has no driver.
> 
> > - For drivers with supports_autosuspend = 1 (such as
> >   onboard_dev_usbdev_driver), usb_probe_device() does not take a runtime PM
> >   reference, and hub_configure() enables autosuspend on hub devices; once
> >   the device suspends, usb_resume_device() fails with -ENOTCONN because
> >   udev->dev.driver is NULL.
> 
> This is a pre-existing bug that is new in this review.
> usb_suspend_device() does a generic suspend for a device without a
> driver, but usb_resume_device() refuses to resume one. I don't know
> why resume is refused. If a generic resume is safe there, that would
> fix it.
> 
> > Third, if udriver->pre_probe(udev) succeeds and udriver->probe(udev) then
> > returns -ENODEV, the error == -ENODEV block runs
> > usb_generic_driver_disconnect(udev) and usb_autosuspend_device(udev) before
> > err_pre_probe calls udriver->disconnect(udev), reversing the teardown order
> > used in usb_unbind_device():
> 
> I will fix this in v4.

This is all starting to sound very complicated and fragile.  Isn't there 
any way to simplify it?

Alan Stern
