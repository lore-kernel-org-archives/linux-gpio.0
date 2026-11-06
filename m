Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793984550;
	b=NJAURoApeJxgJxXQfQx3r+ELNe/Nf1ocz5LIB+e9XQRZFt0xvpLU1EYFUeKH1yeOZhB9
	 9iq6fJ6UXYu6rhZOhKK6WYHdMgvBZtLd9D+ssXyKzOpWbnsGI93dzMgqpSp7a84tOsXvu
	 5zmnYhH2qRbRZ1/7Qc7Xe1pgUXz70XE+V23QC6n67NWNdYLegecQ/gyr49Ztyse40yqw6
	 qSrZok9BV8Al4N7PkqHW5IasZZHo5yWJ+Iax/kmkOXHx3ICGP33XFVpV6cziLOI39cC8j
	 LImg/xtLM2j9oeKdRtEgacDhI9BG1TsNYVPIPcv13tc0vByml4g0hvkgoIdOYe+VGgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793984550;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=/qZTKeMtYLlan9SFU3DlCAiu7yexd3IDtiotPT8o4LQ=;
	b=2rlmU24DQ7cAeN2Q5HOPQ4E+G3CWdRyKv/sKZT7sy3iWIx/SfTyLZDwi8/NGR1ohrhhJ
	 xZfcSKGRkGMSCvbyzNyVUwq9gQ4/B2cgditRLcC4uDCFMtyr/BQvxOhIykb5FKqAEdD51
	 pXERdXszIoE+kTGo3p/URf+yXtAnaYnRI2c1+Mm6qAcHRcUi+XfvK2kdr3/LvzbWLUlcZ
	 /FOFAwS/RWjLQQbHWexqmhKJoWujVHbvWkwR5Ow6eUnIBYbZ00DPmVcds8C6iTBjR73T0
	 lmrNLKiKCXsUhNaOwjktwhe7you4ES0f5yrTmkRGFN6hnpxio9WjrxUNcAtqC9St1Pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=la2KYYkN;
	arc=none smtp.remote-ip=209.85.219.44
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E82A606A335
	for <linux-gpio@vger.kernel.org>; Fri,  6 Nov 2026 17:02:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E82A606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=la2KYYkN
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-91e7fc8265aso11651256d6.0
        for <linux-gpio@vger.kernel.org>; Fri, 06 Nov 2026 09:02:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1793984549; x=1794589349; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/qZTKeMtYLlan9SFU3DlCAiu7yexd3IDtiotPT8o4LQ=;
        b=la2KYYkNdIoMoc6wEeIb+LbDPl6uyQUQpIfVl89pwSwtrSGbFTunXRL/lFB0HHbGhI
         X376hmYEScQTcKJwZUtZ+vdZ6Pgc1ld83KsGwkwClcMPZDjj0fvJqCldasPof/eBi7Bm
         uwEP/FyxQb4B/rn/PbVrDW4ujFfjzM0lVu8BohuxO92lUqF2l2AE4LyG+ZlcCEmUCNZx
         3K99FJipn354A0jE7JlMSh7Cyn7axTGVKg1/J1Y9kw3oHDr+IWgH//MoxGF2e8ZscCod
         nk37zD8oIoHkQV1sCfMDQSOolbvj6V20gRh0gyETflKTVOMZWIbzQqGB565HVcjZ/fyR
         z1jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793984549; x=1794589349;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/qZTKeMtYLlan9SFU3DlCAiu7yexd3IDtiotPT8o4LQ=;
        b=2QyBpsoYcXjyxlu9l7aAGDwbXbABTmFW9wDvUmRAGWEzfA1/j0g/t0RiZxOwM5443w
         XA7YyZeHaWmINQN5bKpFWR5DtcXfRAaeIaYAIJrxrq58RXF+xkKdxPUbQQ9V2Ulz7LSQ
         N3wpvP8RwvJUJSrmBgiTqHBVjjSGDrRF4GSvVHbPG4L9vr9kHVH28EI9VM4mGqbMxwuZ
         IL7LjYoA2rMyRv6fdjA7fPmhWaZe8a0u8dyvjZsaSEyWAJjxmS9k11nE5oWF5Z+bdf+l
         qLwCt1boCNK0aZeyjsTdLecXkx439uRZzztU6x5O+dQOQiVgz3P2/O3FOP1kwbj+1ke+
         Zi4Q==
X-Forwarded-Encrypted: i=1; AL+hErF0GjsuQwItf4weTtyz1L6VVypz1IsaN00HBIxf3OeTrnn8RJdufjxlTYoOwdOGYdDlXlOqqgNrvW1N@vger.kernel.org
X-Gm-Message-State: APuU4Z+I/vX6U+lnuhQQB28ZELLdr7F4SwcWohbhdXmff6Vbotx2wZZa
	IGiQ+mT0EG0DpukFnwbPbzKlSZlOnKm6Q1W0TIYe73Wn0xnrOYZrHDCKPwXORfOjrAo3Q0nM08/
	JPb54BbiP
X-Gm-Gg: AYBFou3JinC691zYXZYYlgtTEbXrjC701vgWqhL1HyC2khntz0tUOSUzevrkBBFDaR5
	hmDhPaSOelUyt9F3WviYVsem+Skq0rm13taWeeGOBJgpwHM8qclpWD02CuQeJO0tYkCpNk/rH2u
	QpBQ3b1y3hh6JavYDFPRqnQo6Cr50WZJYvSXOomwA8q7H3VQvglGIuXOastCA/G3QCkqfoG+hxm
	Eww8eaqElsFv4C6//v6oYRSrtETweOIKI9QZthglF/Mp5n9rUwpM+ubfLMoQN8t64PaEkjYZqzg
	NGFhQbOKekbK3GMuPgk3ltPbScXKO8d4B2f6hPfWNeh7mqscQ/g1qPXxk/bt/qnH94F0gQGEPwP
	/xVr18QvHolYHGaViR7G+1FZgyjAe6a6f5K+++9Qljh1+e3BvQLo76UbHtLYoBQPDZjxkZ6e6Pf
	seIkjTqDOqshDGI7P7nK8V8gwMMjLa1Yzq3AMJFpf7rOSb43FUsX0N5sKVYToPvIQ4ernd33VkO
	kiNAeylqBPT/8GdL3M8Yy4xFwnRPqtvQe5oEvwVm3Ej5ofYPLLafgRvAuuB+arTbl22rSkaQmmw
	Z4lHj2FQhJqwdzxtAdGyvyDLJXv0
X-Received: by 2002:ad4:5dc8:0:b0:91e:9463:7194 with SMTP id 6a1803df08f44-91ea96643b4mr48110016d6.24.1793984548922;
        Fri, 06 Nov 2026 09:02:28 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::66b0])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ea6aa7a97sm24230156d6.35.2026.11.06.09.02.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 09:02:28 -0800 (PST)
Date: Fri, 6 Nov 2026 12:02:25 -0500
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
Subject: Re: [PATCH v4 1/2] usb: core: export the generic device driver's
 operations
Message-ID: <c267f8af-78eb-43b5-b6f8-98af6749db22@rowland.harvard.edu>
References: <cover.1793941292.git.jjc@jclark.com>
 <c1fdf2ed4c508b08734c7a9de002336f60d3b865.1793941292.git.jjc@jclark.com>
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
In-Reply-To: <c1fdf2ed4c508b08734c7a9de002336f60d3b865.1793941292.git.jjc@jclark.com>

On Fri, Nov 06, 2026 at 01:12:50PM +0700, James Clark wrote:
> Export usb_generic_driver_probe(), usb_generic_driver_disconnect(),
> usb_generic_driver_suspend() and usb_generic_driver_resume(), and move
> their declarations to include/linux/usb.h. This lets a driver whose
> probe may return -EPROBE_DEFER leave generic_subclass unset and call
> them itself, so that it can defer before the device is configured.
> 
> Say in the generic_subclass kerneldoc not to set it in that case.
> 
> Signed-off-by: James Clark <jjc@jclark.com>
> ---

It's ironic that the generic_subclass thing was added to support 
onboard_usb_dev, after some debate about whether it would be better just 
to export the generic callbacks.  Now you're going to implement the 
alternative solution for onboard_usb_dev, while other drivers continue 
to use generic_subclass.

Oh well, I guess there's nothing wrong with having two ways to do it.

Acked-by: Alan Stern <stern@rowland.harvard.edu>

Alan Stern

