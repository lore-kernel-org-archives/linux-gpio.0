Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793417097;
	b=UNpfqoj17lb5WiZVcQky7zWjHPXBpj79UkdZfYr6iUfpD0O3hU4cMrzw21XQphrJuIUg
	 wOJQ1V/82hHV07V23I2ZsmEJH3EKuXOLn+mWt4oZFqUAOmvYNcG5RE60hOIv+uKRLdnXw
	 e2YA268nz64EmsaVbMdA247b9JfOYZcMzXd90E6SMRrQPnsKY6EfbmoQSF7GRBf3zDK/3
	 WL7h4/ffCyJxJQFauouzSj+2AXcqcKd/7JZ8ROiZT4ZJfvfjR6hGYFaxzes6crfqoUea5
	 qyWxejAdvgSijtJZrIMfrH+SA3MlbWsYnkEdc1I+VCAu9GrfXHIQ03MN1jNGs63Vf4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793417097;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xjFmgriWXzydd1YKnmihJ3tonTeyGDj5VqBui4OA5C8=;
	b=YvGGe/lFmDDimjXlaiLLAt7y6es/VaRlC8uDGr+XwtIvwR+Cj+/A5I5b1fog3ph8LLi2
	 qJ52bkQMtI7fGjpXy7aIPbiIsjVVVt97XWwDKhKJnEr4kMmcW+38wuRTOrWYUHwSAfiFQ
	 Lz1JIWBRjD2vxgK1oJpHAo5qO64jrMXeukYDfs+MvwG2t5DKQsEoZvoip4t7pEeNl2ZXq
	 nkAjqr6yJQRBiWK5mFEQiwN0IvGbviCjG79XLogSxffRWTL3SP/aAHBH/1dAhvKrlmSIQ
	 wY/s1wMemHVDWnXOK8L0W/JiqViW7b+MGIE58M7tHBMmmun5LMa3yGNZALSvpykOSEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jclark.com;
	spf=pass smtp.mailfrom=jclark.com;
	dkim=pass header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=aDgZ3UpT;
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AFF7606A325
	for <linux-gpio@vger.kernel.org>; Sat, 31 Oct 2026 03:24:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1AFF7606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jclark.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jclark.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=aDgZ3UpT
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2eb0f1b592bso4929055ad.1
        for <linux-gpio@vger.kernel.org>; Fri, 30 Oct 2026 20:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jclark-com.20260707.gappssmtp.com; s=20260707; t=1793417096; x=1794021896; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xjFmgriWXzydd1YKnmihJ3tonTeyGDj5VqBui4OA5C8=;
        b=aDgZ3UpToUzDOlnxjbE7VNaBZ7cdT+IEag6WoI9S/ekgWsEOfCHcDjkjKIS+JOhFTD
         /k3oUgD+3btUmUjvLioU1ab4F3dLBVtjW0AcoPwHZc7QLiB12xn/KNi+Msj3TLZX3+46
         XGbEG4pbl+KHZcoGpoKcgsg84bIybc2QqFpLTRnnQcutN8v6P6Z4aqQkHCzzYyvtlOvC
         aJak7nKtDXuOMX2GcPsjnZ2q3bMOuvq+Z3uDed9zW94UGkexgA+ZlxCfmvxmsHOu0uBR
         UZZxRRCaYekQ1gTEAg6a2hIot9TGmODssEuU//ODKx9v+/yeoeZQKFQfLRuQiXv6TRUC
         efBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793417096; x=1794021896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xjFmgriWXzydd1YKnmihJ3tonTeyGDj5VqBui4OA5C8=;
        b=vO7Ifnf5qKue213LA9bwgKbXy9Sm7v7TXtdUHLT3TAwehXCoilqnwctlauc8/mPnml
         7/Q6vplVelToPWkbcDCs1Lfi7MZ4Npv2UsMfStYefsqyRsGXvnWF3hzMqDynnk/sPEvJ
         7m63FiGEeBsZmDKl/Ddkol9e6u/+jbpeg9L67ZgLBSqkxYUxyhyl1jmuzSkDTRKM+QDr
         rR6CcOhKtLLtu2UDfWNXNZkNdCnVOCv4/AjOpkSLcbHzsXoZf31NC0F5haLk2qo9Bjet
         im6fbhV4+YIZtVFyt+HQYqW+6xUzRvhvqfaS9Grg/a3dmq4xmbn6GkfeLNnVrRG7cmGO
         w5zQ==
X-Forwarded-Encrypted: i=1; AKwUvBwl0suE3Lp/U2hyI6XdmeRYDtWNl/jbDSUekn0f9gI+OGWR3h/fsiwcic0qstr9Ie2iCeof/sdlIo4m@vger.kernel.org
X-Gm-Message-State: AFq9FYIuVlbOv6+M28pZBmKkHK7HLtZ+WKf3lynhAP7FO6u8qzM8eTmf
	YYcmonlRPhr1gp6/YNRFe5r/HgWuUoATKq87+J6rOf2L+fUbfQ7PnDOvFej6aCnqPg==
X-Gm-Gg: AYBFou3UqYGL8wov0J84GoXk+nbFfGUVn+EJ22pUwk2BsxkdsDSG0vz352PUSKEuPmW
	tvUHFqy9OIy6RhSjIsS2QV3VnUE4nwh0QGhqfevEl6yEVr7n7VOH6HSQ5P16d+bKlBxY0oU5M1p
	F4nbAPce711rIHXfpTKaPNc0DJIIcozhaF3rzffZ+zCYryORQGDoI9sarO2TwknVnWTrbsN4D1Z
	0EwHv2d/5BbILwJ79S+PAiDgcm4v0JL1nQSsG5w53XheJ9SnOtqntLTKA9+Ujg+3t6EW3hxcLRX
	ms1UO2BHME/YYVnbE06Wehhha3DPOtB1B4E/+awUQksSVU555N6HJYmhf3kAm3vtR2QN/Jwy/H4
	M8duqIFJ5g6IR8WE/XCy5j6VjLIC3ful3oiPQ/dkorNwAiGcjFUP6PK40n5ukHYwRMeBhlmmaOv
	+c3a5RBJezdY7qfJBnjhZANvvyJr97od/pMkPs0nZVroPwKgaabzszNfSHvxIesRrvTHBMw4djI
	eP9fEw/YNhWQ5Oi48vmIVXzw9jJKK58RYW5Sk/N+b33J0Y5nqIXZJozNQuSkuou+llglsN24XWA
	8uZviLYXrlpYyArl6zlflWVGN5wdCcMoriAJiIyffEsq5PXmZUKeadSM+MQvt5tRjKdJh0CcMMl
	Jj/m8JDe4n2H1YuX55DhyfCGiZdV+QWrmUcbATw==
X-Received: by 2002:a17:90a:ec8e:b0:3ac:a203:e0a1 with SMTP id 98e67ed59e1d1-3ae8980ede9mr2974708a91.37.1793417096261;
        Fri, 30 Oct 2026 20:24:56 -0700 (PDT)
Received: from cantal.lan ([58.136.77.93])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae87f99899sm2940976a91.2.2026.10.30.20.24.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 20:24:55 -0700 (PDT)
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
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: [PATCH v2] usb: core: add a pre_probe callback for device drivers that may defer
Date: Sat, 31 Oct 2026 10:24:49 +0700
Message-ID: <20261031032449.3536559-1-jjc@jclark.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <sashiko-outbox-191184@kernel.org>
References: <20261030151919.3511106-1-jjc@jclark.com> <sashiko-outbox-191184@kernel.org>
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

On Fri, 30 Oct 2026 15:41:34 +0000, sashiko-bot@kernel.org wrote:
> However, err_pre_probe only invokes udriver->disconnect(udev) and does not
> undo usb_generic_driver_probe(udev) or usb_autoresume_device(udev) the way
> usb_unbind_device() does:
[...]
> Similarly, on the -ENODEV fallback path where udev->use_generic_driver is set
> to 1 and usb_probe_device() returns -EPROBE_DEFER, won't leaving
> usb_generic_driver_probe(udev) and usb_autoresume_device(udev) in place cause
> the subsequent usb_generic_driver probe to call usb_generic_driver_probe() a
> second time and emit a duplicate USB_DEVICE_ADD notification without an
> intervening USB_DEVICE_REMOVE?

Both of Sashiko's points are correct, but both are pre-existing and this
patch does not change them.

Before the patch, a probe() failure returned straight after
usb_generic_driver_probe() had run, with neither the configuration nor
the runtime PM reference undone. That has been so since commit
c9d503370f24 ("USB: Make it possible to "subclass" usb_device_driver").
The -ENODEV fallback has re-run the generic probe under
usb_generic_driver since commit 88b7381a939d ("USB: Select better
matching USB drivers when available").

The patch deliberately handles a pre_probe() error other than
-EPROBE_DEFER exactly as it handles the same error from probe(), so that
the fallback keeps working. This is stated in the kerneldoc. The only
new code on the error path is the disconnect() call, which undoes what
pre_probe() set up. A complete unwind in usb_probe_device() would be a
separate change.

James
