Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793910628;
	b=Wx1WXIoP4rzbW9q4wCHf+4Xl03D7MqNXdAgVDocHn27Z8WrRC5ogcRD177zXYSBnjZSt
	 /F6xXClTUatAXtQ/mH8OaLYM2puYeQPQpSx4fxPKKsOFJzlJTO2ItwFD2hI9u/lFDlOfK
	 wQJp0zdiHBJvMuBdGXlGke/TgvDwsTKmpK1dD8EK3l452fV5fANlLHrwrT5BmX85WEsuu
	 bu2Y0yM8lvIPxBGc4fr4wKG+kKlG7LPMko91jPvFpvPTsZ7sv+ev29X4qlhu5727hEqhs
	 5HBjHLgoFZ8PFkDBbQpqkwPdfekGaJwTkCft9IyrIWFli6kwuf0rCnlBW0qcgCzktyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793910628;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=8iFcpvnEbr8OqpJfN5Lh96ASE9g3Jpc4XYATrN5TARs=;
	b=hA+VsxNMFQ0P4O2fgJbgVTVtDFmT2aeO5owoPx+CKyjX1VgeaDIJi8OS+gldSPqvO/eH
	 tl4cn+x+jAQNrzBOEQAx19OcJhAND7hh7xBdN18s/eO5s3qSdA2XijYi6ZMa058368n43
	 IHmcYrYALIySvHc0H0xSD63rHFqjjy6d0seMmn4gJg8DqpHOVIhtwAAP3Pc7vihoPgm0y
	 MvlYEfJL1p2N6EsbBOD6Y2Q/s2q6CIb859X9/E+/Xm70JbBc4VBHURHsgQ2RhV1qj6Dzb
	 Mr7vgfKPs/EedIF1CeYP71vtyR+Lcq3u04/9zlcCDB/Ql9/aK6CMAm1UQn9sOVm5zXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=nnP5JxbZ;
	arc=none smtp.remote-ip=209.85.160.178
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDB55606A31B
	for <linux-gpio@vger.kernel.org>; Thu,  5 Nov 2026 20:30:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EDB55606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=nnP5JxbZ
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-5495d549924so23050751cf.1
        for <linux-gpio@vger.kernel.org>; Thu, 05 Nov 2026 12:30:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1793910627; x=1794515427; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8iFcpvnEbr8OqpJfN5Lh96ASE9g3Jpc4XYATrN5TARs=;
        b=nnP5JxbZfeb8fykuTsu7lOgLI/QEFjRVc+fu1CYYF7N69sOiXDjrrCF6BHJfgpwcaL
         lEgvTmREkxcrtOZ4P8RIF3pTSLmhWQZb0J6DpuwAtLLTSNvKJnG0f4N7DpigRBO0w10/
         jnXWhSCUllEDxGd23xNXeJ90IIwwMXsh2ZZrTTMpleuZfIQ/2/YoYOnyLU+jdOktjhZK
         D6yZ3PFZBa09Jg2E2q2tFJ9dY64JNxtKAPkRezE/XXLt7YJQASLBnbdTsc6XqpZ8XqEo
         1p8iEvylpaNMSnujQyNYTblqNW60mVS0/K/5Nai7YLiJvG1GTl0xXFP/Skp78N2suhG4
         1OPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793910627; x=1794515427;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8iFcpvnEbr8OqpJfN5Lh96ASE9g3Jpc4XYATrN5TARs=;
        b=kXgXo/DU7RNOMl3Vu7zQ/youBiyO2vRs0IRYHIUh0bl96Ttjn1vz4n88ShIiPgQR45
         y1Wf9DQ7RBJjSTj+CzWMwQJTpX5yZv98VIPwI3VYueFmogVqTxGU/pohIt4lnF38fBZr
         jbMMykJhs8nljR9KmVsD+LkY6yh/piuuQ27jrMX23y8Lb5wyQJo+fE0nBmJJO1tY+mHm
         WBqurrIX1Pig4TvxHagyz7ypbDyZvTU8JKEQRTCqQHC/bqa8Yh66/4WQqpc++onhs45X
         Yi7tPuIGVnuFOFrtQRDYVXtlp2ZFHJcefi20nNVqNXkb4Q8+qQiYM2g1VXCZHhMvyq7h
         i+kQ==
X-Forwarded-Encrypted: i=1; AKwUvBwJy82NkUofmG9/RUhGybRJchB5mFOUyLPcF3DdgRFmxvgWA2QaDHRnrh02oVOm9GZAvIAuH0S/QaXm@vger.kernel.org
X-Gm-Message-State: APuU4Z9iD2njS7W7IPKiZ6xefiimInXSaCYYd39XDdc87iEi8l8dghAF
	EU6OdXEwFWtogFaiJrYvnG8PJisOL/WIxpX4bdo5unD5/YpCGNoNvzpxxuiaEAqHMw==
X-Gm-Gg: AYBFou3/v4S2dvlkeP1nqRxFVUtOHi5IXflhObZXjN+Gdf5d8CKB3VhG8m7G8EHKF1D
	hobT3g6x1owmxn4dMfrhg9dxPfir5CM8zyh+Bp8z96wC30BbV8gZzi0CCLR1lT19VJEeBExvtGA
	9bKvnlGTOgQsvbhRYncd2C2w+iUKoUFqD/YDUGZFFqtVhmriUqTjrg9mehDr6DJXb+5xUe1dS8C
	5wRJRQd2M6ZWvt5TQXU6RmxnJOhdZTJOdkYROT+T4ufRsNu7zQX5zU6+0cNY8MBoOr/MLGQWP1j
	jMxltfPv6dES4KRsbjSWJB60b/T5V7CK8HGD+6WAPVUTpuXjb4yj07dHPeIvIlcrV+5BN11AdXo
	6CaK9cYv+2yOEhrVX+M8fauQ+JXr7t6yIh2MlGGogLoM0gstsISjH1VV6QcosbU/y0a6u/KkZRW
	yyH7j+h/rGXUU4mKxNn+7Mxamtn3w6m0fkNoDOgYwGDs1d3cq+5PNZzrTx4NpzdrVCBOcKu6i7P
	chzFMOAAACP+QBE7kuKq0+X9NQtAd96c/jjOCrvVnK3vGBDZhTvMWtWET7npDqV7rz++bpcn8Da
	CZU5p65BvqDswathDUg0LuXPRJgQ
X-Received: by 2002:a05:622a:2308:b0:532:cad2:539f with SMTP id d75a77b69052e-54e1576ccbamr6840201cf.53.1793910626495;
        Thu, 05 Nov 2026 12:30:26 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::66b0])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-54e25d65a9csm2142601cf.11.2026.11.05.12.30.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 12:30:25 -0800 (PST)
Date: Thu, 5 Nov 2026 15:30:23 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: James Clark <jjc@jclark.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Johan Hovold <johan@kernel.org>, Bastien Nocera <hadess@hadess.net>,
	Matthias Kaehlcke <mka@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Douglas Anderson <dianders@chromium.org>,
	Robert Nelson <robertcnelson@gmail.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: [PATCH v3 1/2] usb: core: clean up before handing a device to
 the generic driver
Message-ID: <9372664c-a8d4-4098-ade2-b73ec214960c@rowland.harvard.edu>
References: <cover.1793669297.git.jjc@jclark.com>
 <74b3f919f214a8ece24161a2c904d8a5744b703e.1793669297.git.jjc@jclark.com>
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
In-Reply-To: <74b3f919f214a8ece24161a2c904d8a5744b703e.1793669297.git.jjc@jclark.com>

On Tue, Nov 03, 2026 at 10:34:12AM +0700, James Clark wrote:
> When a USB device driver's probe returns -ENODEV, usb_probe_device()
> hands the device to the generic driver. It does not first undo what it
> did before calling the probe. This causes two problems.
> 
> First, if the driver sets generic_subclass, the generic probe has
> already run. It configured the device and sent a USB_DEVICE_ADD
> notification. The generic driver then does both again. Notifier users
> such as the usbport LED trigger see two USB_DEVICE_ADDs with no
> USB_DEVICE_REMOVE in between.
> 
> Second, if the driver does not set supports_autosuspend, a runtime PM
> reference was taken before the probe. Nothing drops it, so the device
> can never be runtime suspended.
> 
> Clean up before handing the device over, in the same way as
> usb_unbind_device() does when a driver is unbound: first, for a driver
> that sets generic_subclass, call usb_generic_driver_disconnect();
> second, for a driver that does not set supports_autosuspend, drop the
> runtime PM reference with usb_autosuspend_device().
> 
> This leaves one limitation. Until the generic driver binds, the device
> has no driver. If it is runtime suspended in that time, it can't be
> resumed. This is transient: the generic driver resumes the device when
> it binds.
> 
> This change does not alter what happens when the probe fails with any
> other error. The device stays configured, so its interfaces keep
> working. It keeps the runtime PM reference, because a device without a
> driver can't be resumed. Its USB_DEVICE_ADD stays unpaired, because
> sending USB_DEVICE_REMOVE would mean unconfiguring the device.
> 
> Fixes: 88b7381a939d ("USB: Select better matching USB drivers when available")
> Signed-off-by: James Clark <jjc@jclark.com>
> ---
>  drivers/usb/core/driver.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/usb/core/driver.c b/drivers/usb/core/driver.c
> index d3a61ebc6afb..9b8cd0e4219e 100644
> --- a/drivers/usb/core/driver.c
> +++ b/drivers/usb/core/driver.c
> @@ -295,6 +295,10 @@ static int usb_probe_device(struct device *dev)
>  		error = -EINVAL;
>  	if (error == -ENODEV && udriver != &usb_generic_driver &&
>  	    (udriver->id_table || udriver->match)) {
> +		if (udriver->generic_subclass)
> +			usb_generic_driver_disconnect(udev);
> +		if (!udriver->supports_autosuspend)
> +			usb_autosuspend_device(udev);
>  		udev->use_generic_driver = 1;
>  		return -EPROBE_DEFER;
>  	}

I was talking about more than just this part.  What happens if 
usb_generic_driver_probe() (near the start of the function) returns an 
error?  (And shouldn't the lines that test the return value and do the 
early return be part of the same conditional block as the function 
call?)

Alan Stern
