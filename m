Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.152
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793363119;
	b=fWGlT/c4KT8hIqdLmoreoPBl+lbmOSEaAkj5bZrDLn5VlfZ96j0uTZLwuA6g/39J45jz
	 dLDtIMNq5hC3/wKfw/cPKmtlsYT9Tfe1DBdj7jADAehcq+tgA0b7ZO40umZK6jNx68rcf
	 qWtxztMrZdlOZ4pPEFN26QH0GfNi7sWfoTSF8woQp2hs0mSov9iLoWzsv9t+Gzq9qJFG4
	 66wsS/ps74yK35CznO30ELw560h/RklHWT4WpY6GRS54iZtY4BRZEvDaz1P8DGkzDlbVz
	 MjPj3YE3ecyErfg1Oj4QNrkch+6dweBfihVuB64cJbTaHpP3fsgnXEnOPfbs9yebI2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793363119;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=J8dAsB3ABUd2P8nmGjUreI+WMzKE8n8IiSWGI4JbEHM=;
	b=PHO8y/khRayLUcOo4YosznC0d/uenQBWJxAtbFom2XKvT7KxM+vhUwW3yIPo+Ufuhs43
	 6RW/SlcSthhxJqmumFFAOfQqZ05N+S2s0S/LEKWshqZF958esylJ3lgRMeKk7KBEtqXeB
	 t74LpuAeqjfBwAlM3TwWXEi0AA3EhtgBnu7NzTOGWm8oNwpvGUtknw34awj/WVlLfemF3
	 r6W+GnwqTt/11VZyG6dNZl0KwRJ6DV/wTU9Ml3CYt7Ul9jTlk0vE4wVe2+s8C5509U+Uw
	 h6HbDIwEwPXojcGsWoF+I0MtV9B4P8Wu48dkKVCW463cXEZyhodjkdAL21EdDu1i0cA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arndb.de;
	spf=pass smtp.mailfrom=arndb.de;
	dkim=pass header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=NnYKhc8O;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=ruVTPoyU;
	arc=none smtp.remote-ip=103.168.172.152
Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A117A606A320
	for <linux-gpio@vger.kernel.org>; Fri, 30 Oct 2026 12:25:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A117A606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=NnYKhc8O;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=ruVTPoyU
Received: from ams-compute-01.internal (ams-compute-01.internal [10.64.2.61])
	by mailfhigh.phl.internal (Postfix) with ESMTP id CC2961400183
	for <linux-gpio@vger.kernel.org>; Fri, 30 Oct 2026 08:25:17 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-01.internal (MEProxy); Fri, 30 Oct 2026 08:25:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1793363114;
	 x=1793449514; bh=J8dAsB3ABUd2P8nmGjUreI+WMzKE8n8IiSWGI4JbEHM=; b=
	NnYKhc8OxhnuTLAhJbRHmsyXxr7iSNm0NhcLETnHmLlwdxquROZS10DPKZYNpL4Q
	2yGHRipLfeq+D+PICH7hFpla9cQKTnLkjDZRQMAhKNmO3YjoDr9cBbh9cUifoZyS
	Rsuy1vecDxoowQCiiHSAojqtmYSosyG9I1CkvoGUcVXbwPMx+yVxfPq2a2iekEAP
	6+ObZ7JV//KJgZeKBDgjjdOQd+YWI7UVhk1mOU1LDZMdz8VqWc5PDeQ6+/+WmY7L
	rn1ebJM3gUW7MQj/nc9g9tZPWv7e2WTiwvXwrH4l+jlkMpp9+UOYZTYUVGxtTTxj
	zf0eJh5PLI6gWtLhqYnsXA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1793363114; x=
	1793449514; bh=J8dAsB3ABUd2P8nmGjUreI+WMzKE8n8IiSWGI4JbEHM=; b=r
	uVTPoyUCLgWu8Gm1TzCJzzH+w4hWxGlrNxJSYZ90I5H07rGOApI9czQvQH5G7d6c
	MMto7icwSOJmceDzxaNL71BpzFOOL7CvgFn22fXnU0oP/oBYTYFX7cjWN7Bvp9LH
	8ZgR397lCepU2FTQizCBqQ3nHpH3TaX2NbLiIgizJqn/jf9+APztJyz5hyWIRPJG
	xbnUqF7/FcCWhYIHf3aAQRNZtnBbTE4z4ZkTOmPouSkquRYm9hpzlrLLdOSPNzrL
	lMDTMCmRfb9kwjhw+zB4YojlCv/t63NPxzgqxONQj90MRnvo2aON8xN693GJL4Aq
	KmeCf85K70b9f1tXH1xQA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793363114; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWdwaW9Admdlci5rZXJuZWwub3JnPg==;
	s=fm2:rsa-sha256:J8QaEaq7IJOq0JDA3G2Fcn5vWF5KZGbnf/QQUtZXYJ0Aw/Z
	0fU4z2pLty11iYbehhdlvuSAjcW1bFlnwju8UfA5YzAoCQT0Abz1eZo8siV+/7UA
	E+UJhM9V+GT1o/dsSGUDrBjLzZRgFTcq9FCtmTIm0ju2Af8qHbFIVk20l7Ilgh/i
	GpIvpXGuPGEl3EuZb0pS02Pnge+d7IisSVkfu/MoihBnYj7z4Jr3wAv8SxdQsWP0
	IxYWeIvd0Q7YtUQBfe5/v0+HrNtHS94h5vM384Wq6ZCFD9yfnun9vL05ASqHVzxz
	el00o5NgoZTf13RwdksWVQxq35zTpjgEVamZ+Yw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:UxV6YTAoizPqtWa2AKjflWrZ77Hac13iK0pOv5rsOTE=:Zb2QRSDduhAAZaKJYul8Fpn1yObyVkEUtJHw3o0ClbQ=;
X-ME-Sender: <xms:pYzkahReiNadF71TTxmY85O4IfeA8J1dmYOUcAOEZh_x7xClk6S69A>
    <xme:pYzkakM8R5xQWll_ZILuDt4bMTHxxZ0kFWawAJE2FYahkKoQ24yZdri_oxVUb_cQ8
    GaeFE1OlwN0RCwuVzw4UjcFPSV5ll9UXmUkwv0G8lWM-Q9yPblQmtTN>
X-ME-Proxy-Cause: dmFkZTEjdZ0WgKkDeZ8IivnHN+6FPi2JsxEAcdLRcU74d11ptltXsOcEZjcgcfftZR168E
    EIO6J7QiGPQhuHkRDyG6EOG4oAJQ4UYkVdOUJI20ULjkxm7ziBeG52p28bahXxlpCY3UNE
    g68WjC/XnD4RBVHNhJPdtq8tXpN0R5KRf1WNe5IaB45Yfj7TJKbZsiduV3NicElToLV7iW
    qV/o0BNeWEflK2OQESy5mqGWEijeriULooLwws4KKtnIneMx2NbMoOU+UyJr+4zbEXLsuO
    TNznEF6cHoRSev/AS+8N74XtUlIj0s0NkQfiF3PikAxBSLvgApRMMEmYCgH/vdDcUdeUcU
    7LFIwMXT3KUo1Kke0WrSjSCAcgJZW5iA6vr7sDlpVB42Rt5s7yDXU0VjvrHBGVkLOgR63h
    TRua6UzXd/s8L51Jw1YXLOdVQ4WBdeKCkiHwheGudyzR3KI8mNHDZ9zXvr5vLV/rjZnZBf
    O06vlJ6cocxbVKkqJd276EuuOOUdteQzEi6PbFR1n3zhMQf4yVo+0MNgvzy4iZZRKFf9Iv
    NXEyzqvwcJPXrWIFJ6HwdLmBH2i/rq6SxRrAOwpa3aIYFzwv5z1zxrijy1dUl35cWxiIne
    pvjlj+1L9ZShKPsQVLOvF8prqgnjARLBYbezMCKhswtkwubg+4pHt/fILLHw
X-ME-Proxy: <xmx:qIzkalTJdaYVdlRDHnqAMt1yAN8Zdiu_lyxC9YS9WY-ZrQbrEfYqig>
    <xmx:qIzkamo7Iz_ZsiYWFDE6AThXyvdqemjpNBvO-1YTVUzvPT_wnbK4bA>
    <xmx:qIzkaqPnzO5SSUvkUhpu5GFniLnw3mSEiEJWGDwmShbtjxMqsxiGCg>
    <xmx:qIzkakya8L1StVeIWzkABZsO-WjOwJ0emIqiXVTcA28L_9-Z-MHCuA>
    <xmx:qozkajw6P7XiW7VrfJnlv8PvD5-6XSb2j8BYbCY7QveDIbQPgymwf90e>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id ED26F32A0097; Fri, 30 Oct 2026 08:25:09 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-ThreadId: A9hbWorxIEzB
Date: Fri, 30 Oct 2026 13:24:49 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "James Clark" <jjc@jclark.com>, "Matthias Kaehlcke" <mka@chromium.org>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 "Doug Anderson" <dianders@chromium.org>,
 "Ravi Chandra Sadineni" <ravisadineni@chromium.org>,
 "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 regressions@lists.linux.dev
Message-Id: <10ad94b3-66db-49b5-95c6-3ce9090f3278@app.fastmail.com>
In-Reply-To: <20261030114705.3159093-1-jjc@jclark.com>
References: <20261030114705.3159093-1-jjc@jclark.com>
Subject: Re: [PATCH] usb: misc: onboard_usb_dev: don't defer the USB device probe
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, Oct 30, 2026, at 12:47, James Clark wrote:
> On a BeagleY-AI with BeagleBoard's device tree, kernels since commit
> f918e3804498 ("arm64: enable HAVE_SHARED_GPIOS for all ARM64 platforms")
> no longer boot to a usable system. The log repeats "hub 1-1:1.0: USB hub
> found" for the on-board TUSB8041 hub every few milliseconds, with no USB
> disconnect in between. The flood of uevents stalls udev and the boot ends
> in emergency mode. Reverting that commit makes the board boot normally
> again.
>
> The underlying problem is in onboard_usb_dev. Both peer hub nodes in this
> device tree carry the same reset-gpios, so the GPIO is now a shared one,
> and with CONFIG_GPIO_SHARED_PROXY=m (the default) the hub's platform
> probe is legitimately deferred until udev has loaded that module. The
> bootloader leaves the hub running, so the USB core enumerates it long
> before, and the USB device probe finds the platform device without
> driver data.

> At that point, onboard_dev_usbdev_probe() returns -EPROBE_DEFER. This is
> what causes the problem. The driver has generic_subclass set, so
> usb_probe_device() has already run the generic probe, which configured
> the device and bound the interface drivers. Each binding is a
> deferred-probe trigger, and the driver core re-triggers when a trigger
> happened during a probe that then deferred. So the device is re-probed
> straight away, reconfigured, its interfaces bound again, and so on for
> as long as the platform device remains unbound. This is not specific to
> shared GPIOs: it happens whenever the platform probe is deferred, and
> briefly whenever onboard_usb_dev is a module.

It sounds like the underlying problem should be fixed elsewhere,
possibly by preventing the deferred probe to be retried each time.
 
> +/*
> + * Attach a USB device that was bound by onboard_dev_usbdev_probe() 
> while its
> + * platform device was still unbound. The device lock serialises this 
> with
> + * the probe and with an unbind. This walks the USB bus, not the 
> driver's
> + * device list: unbinding a device holds its lock while it waits for 
> all
> + * references to its node on the driver's list to be dropped, so an 
> iterator
> + * over that list that takes the device lock would deadlock with it.
> + */
> +static int onboard_dev_attach_usbdev(struct usb_device *udev, void 
> *data)
> +{

This conceptually looks like a layering violation: no driver should
have to look through the list of devices like this.

> +	struct device *dev = &udev->dev;
> +	struct onboard_dev *onboard_dev;
> +	int err;
> +
> +	/* Unlocked pre-check, so as not to wait for every USB device's lock. 
> */
> +	if (READ_ONCE(dev->driver) != &onboard_dev_usbdev_driver.driver)
> +		return 0;
> +
> +	device_lock(dev);
> +
> +	if (dev->driver != &onboard_dev_usbdev_driver.driver ||
> +	    dev_get_drvdata(dev))
> +		goto out;
> +
> +	onboard_dev = _find_onboard_dev(dev);
> +	if (IS_ERR_OR_NULL(onboard_dev))
> +		goto out;

IS_ERR_OR_NULL() is almost always a bug, make sure you understan
the interface and what this can return. If the function can
actually return both error codes or NULL pointers, fix that
first.

     Arnd
