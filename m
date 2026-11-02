Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793587334;
	b=fcOOQrWDGrPKi1VFoHiDNDVSWpjp6PeDI//NBslkcNHT2BHQ0wi8OUFo/9Ppt/MhNvCx
	 LLDf6eWDxVlQZNi/v3jgmY0Vy4xRBfehnO2DSZnnPOufsNG33/Iu5L28P46/sEXHgxMJ8
	 NYsCBzFls0Gu5aa8A31u+/nfiQAsM8K4c7hqyWJ2+PATrj1q4QftYZOgecrj9m6pu42k/
	 4qX50rtp60nQY+RkgzioUr4kWiq4VKef5c6ZUwp1xNOHfms7yj82Z7ptnUoi+euCz2r4q
	 HC+iJlFNPC+9TwHlpFeDHAUBlQgSTHDW7wjYvdN17pOzv0KFDZaIsoQ+MQdbFZyRLOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793587334;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=j2TRRoSnT/Jv3a4iwHG1ldeVncOShjDWYYLdrAMUUEI=;
	b=5W9+SisyunEbuQ58615vln/HoQ4RP15eIGrMkQgJbekUFIZxRkLc9zYhXUt2mMHZR9Oh
	 rIbP/fHxGLCH8syCcQxu+qDg5Mjsy+DBopz8tYxmt66x67tG5O2LR8yggkNmOVsgfSnlL
	 yfI0dwlOWGlkTrRpBAsrtbWo8m3MLLhEE1UYHaDyU+MlnHFW9CHolD26OzmvWnLlNHZ7h
	 kbA09cfEJ2T5lqTuW1xD2tP1MdaViBSlNceWgCGwu2eycmabjd6Ta9qWFIN/XBeeM4b5E
	 I2HYGU0kNefW2hZfClrXvQnzvSowV3RaIwxb1Ry9RbjdArsub8wPZgUSu7Knl2/OAGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=FzCmt13c;
	arc=none smtp.remote-ip=209.85.160.180
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E79FF606A326
	for <linux-gpio@vger.kernel.org>; Mon,  2 Nov 2026 02:42:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E79FF606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=FzCmt13c
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-5363c8de563so31688491cf.0
        for <linux-gpio@vger.kernel.org>; Sun, 01 Nov 2026 18:42:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1793587333; x=1794192133; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=j2TRRoSnT/Jv3a4iwHG1ldeVncOShjDWYYLdrAMUUEI=;
        b=FzCmt13cG+aKsnwVBtMJ9Fmc970lVhhc0e6juVp8IQ97lKL5tpXK3/7CBqRRs2hyJN
         Tze0XcdilstpMTPfqXpq8JvpLywnDzkJFC1em60OFU2G6Cx/netBP4j7KLlFiynKpB5T
         4wjfPJjpyh1zg1x10htvP77jqd854dNdSDKFpzQt7uhTCr0aW3s37SZ2jl9yQ6SJruqC
         mO25pb1tsMdmfK4+VqtiIJUDekdVFkmmOAuCNqcPMROcLtJ/H0h64e7TLmr4QS42uCck
         7/OZebM2x4eqGwYljgydfAXealLtCmRC43f6V733FbDl+vvQHAKuxsetvrkovYH9HTDI
         nT7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793587333; x=1794192133;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j2TRRoSnT/Jv3a4iwHG1ldeVncOShjDWYYLdrAMUUEI=;
        b=VjrYtiLhEilY+AbRe6/zYL6X3VxWdkGH6cQeAGqQZqxxr8FwIKADtFARnSMjbBtSMr
         78O/QCZgmJ90ylOdgjjiJK8yC7MgjVKLGchzjkTvOKGBH6dG1htjennppJ7B0+C2iH0k
         BycDxE0FW30gjNP/XnFzJfLdn2E2k1UVzYmfLqGJRb2jBbN3yaaDo7zXEdOcLragv+vW
         0vESAKXu0v3n8dNeJYRddHwaUNSjUVK1ULvLu4G5DuJRdTun9T2wWznYSvV72zT3Upz+
         LJBha6LB8Mhc48RlpHzqK3PXrGajTEn3LE2QOQTlESoEi2vUSu6+Cbnl+GbPfRv5/j94
         tjkA==
X-Forwarded-Encrypted: i=1; AKwUvBxD64MPp1ZW32L943XkwVUo/sZ6xHMQ8O8253NshzE5hQYm5Hz8QMfwcc+5BBxfE58ZIzkfbBXO7VLO@vger.kernel.org
X-Gm-Message-State: AFq9FYK9sAqpGohfDOROAYVIBuQRD+6pK0T/Ymd1xje3AP2TMYIK4Pfu
	UHpzjYSVnSZeOJlqJEV4J/0MFMXBgZXd/5mAeNtXRt7td4TN1HMvRzrmN5ezAaM81J9yamfHlZ0
	ZgT5jcg==
X-Gm-Gg: AYBFou3Hg2JDWgLTYYBBXJ0NZZKxrjGEZrbMkcQ0i0eDTKnrJpH+qRZWEbBX//koKmT
	td9+dBINJ73rZ/lUbccZcGJirULmfCytHp6oLge0j/iHMdFC2ysB9YphTmBGYZmTL5cjf/Yn15C
	8zTHRyoT/5Nhlm3dIxSDWTvhaEizRnH6s/3xk6jpeNM6e+67EL6OSlZxXU1hA1h6UFkQEIgQsuU
	XcusyDWqQf0CAGiMl+y8THRIkG2GVy9TDPN8eft9jUlQajWNB3xahg/+3eSyIrsaAWCddH5nBdC
	O8a5+xS7EmlbrNGwpIQFbw6Voy07Jzg1i8HolY0izM00O02uqtMfKnIWbwYhla2gxgSgOJgmX2M
	n++EmdnuE5MJKw2YuOAs3+VO7vf/6MBCPajoviGCoj+ykr/pQzAYZEtiJUXWhRVU99H4TUED8l/
	QtT+jJ4QweMeXSxsxiz+1msV9xyQo//Tq1zSKqe3cbnLlrlvagTXjljrGXQ4nApUdbfVXC2WrC4
	cfOu+k6Q0DqfNMAOCrAgHsxSQ8N6GwC9IyejaoQ+OnntbX6QtwNeWUFfjldOsbVQA20AxTcVfPt
	AldC4ueo62TrjGqWlnIAVlj4QFAl
X-Received: by 2002:a05:620a:3916:b0:93f:47fa:b722 with SMTP id af79cd13be357-94421618771mr1465258685a.13.1793587332748;
        Sun, 01 Nov 2026 18:42:12 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::66b0])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-94425a7195esm724633685a.27.2026.11.01.18.42.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 18:42:12 -0800 (PST)
Date: Sun, 1 Nov 2026 21:42:09 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: James Clark <jjc@jclark.com>
Cc: sashiko-reviews@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Johan Hovold <johan@kernel.org>, Bastien Nocera <hadess@hadess.net>,
	Matthias Kaehlcke <mka@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Douglas Anderson <dianders@chromium.org>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: [PATCH v2] usb: core: add a pre_probe callback for device
 drivers that may defer
Message-ID: <b666dc31-1dde-41c3-be0c-3ae5091b9683@rowland.harvard.edu>
References: <20261030151919.3511106-1-jjc@jclark.com>
 <sashiko-outbox-191184@kernel.org>
 <20261031032449.3536559-1-jjc@jclark.com>
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
In-Reply-To: <20261031032449.3536559-1-jjc@jclark.com>

On Sat, Oct 31, 2026 at 10:24:49AM +0700, James Clark wrote:
> On Fri, 30 Oct 2026 15:41:34 +0000, sashiko-bot@kernel.org wrote:
> > However, err_pre_probe only invokes udriver->disconnect(udev) and does not
> > undo usb_generic_driver_probe(udev) or usb_autoresume_device(udev) the way
> > usb_unbind_device() does:
> [...]
> > Similarly, on the -ENODEV fallback path where udev->use_generic_driver is set
> > to 1 and usb_probe_device() returns -EPROBE_DEFER, won't leaving
> > usb_generic_driver_probe(udev) and usb_autoresume_device(udev) in place cause
> > the subsequent usb_generic_driver probe to call usb_generic_driver_probe() a
> > second time and emit a duplicate USB_DEVICE_ADD notification without an
> > intervening USB_DEVICE_REMOVE?
> 
> Both of Sashiko's points are correct, but both are pre-existing and this
> patch does not change them.
> 
> Before the patch, a probe() failure returned straight after
> usb_generic_driver_probe() had run, with neither the configuration nor
> the runtime PM reference undone. That has been so since commit
> c9d503370f24 ("USB: Make it possible to "subclass" usb_device_driver").
> The -ENODEV fallback has re-run the generic probe under
> usb_generic_driver since commit 88b7381a939d ("USB: Select better
> matching USB drivers when available").
> 
> The patch deliberately handles a pre_probe() error other than
> -EPROBE_DEFER exactly as it handles the same error from probe(), so that
> the fallback keeps working. This is stated in the kerneldoc. The only
> new code on the error path is the disconnect() call, which undoes what
> pre_probe() set up. A complete unwind in usb_probe_device() would be a
> separate change.

Since your new pre_probe() will interact with the bugs mentioned by 
Sashiko, perhaps you could submit a patch series which implements 
pre_probe() _and_ fixes those bugs?

Alan Stern
