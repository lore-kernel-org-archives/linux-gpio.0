Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83137137923
	for <linux-gpio@vger.kernel.org>; Thu, 27 Aug 2026 20:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787861584; cv=none; b=oU7l+vX6LHIpgw+v6KxlSQCk/ZptWgctAxGQGVqCz4FE1tU/rmABT71RQfHcppVs9+389/8kK1viSajjjeClKmaj3wr3YF6zTBt+79rpBQPmlurCZrCvtfyvwIlJTQ0DVCrg1kQIUYS6z55ve3+wGJmqfCjewa6FY7ajTJuO2v8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787861584; c=relaxed/simple;
	bh=U8UBuySMbGc/UOzxYrgjDZfQtW6BouTJtNoVMuBFFW8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FWOdejVsg1swhsUYxIFoTA6kKH0RPPBRi9GJSDyOxRb2acxINxrPHbyFHQQK9+MSFd4hLQ9cY4FccoIu8DwIS3I/PKUKjfF7t++ghosk7WR2xk7zWwMKAuwrSxOQjiAoUcOpIXxxnovgTiz5jTwjn+p3ZRkTTnSwKl6/QBrcGKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k4eGnoDj; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k4eGnoDj"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-482e2fdf6ebso220654f8f.1
        for <linux-gpio@vger.kernel.org>; Thu, 27 Aug 2026 13:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787861581; x=1788466381; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3WPvnxadCbM9/Z4zsvO6XezoC4evEDdj4rVtjW+XH0E=;
        b=k4eGnoDjPEMMJQuuHa9jOSeFyrV/vb7tlNaK7suV5p9gPUejK6Kjh8c3Xm5j51hATW
         NBCfEdQ1AufiQdUGugnKfYpOydaNC3IYn+YnKi9sIl9CdFb2gh7I2KzpmFMzbSEMr8Dn
         Y/mBL0EHuaPsLRaD4GtHxmUY8B+zoW92gzdaPWkXfpre1NECc76xJlZ+Dlc+sMjf3Kau
         +ym7cFwEWjhKVz5ydk5bZAqZ0rWaBXHoW4ljUaQi9z66NjuU4jHv/seNXlxLAsp4ZAqV
         +zY9yvdhI4ONtmh2QeZHqPnVxijTKx+egrYR4kzEMmWc1x5Mw0V9f68skK0LlEsEbVpr
         jV9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787861581; x=1788466381;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3WPvnxadCbM9/Z4zsvO6XezoC4evEDdj4rVtjW+XH0E=;
        b=TQfJJkxaJfs/K+pbSfQsYzBBsZfI+i7PYhEXkkG4YjpCrb8LGrlM7z4K0j3/Aa4bpN
         1DgnionJCwHz/khc2ITk/+cNKjoF5YscVj+Dylp+bYeP40DmorVql41BypmGOCK7ghiK
         Rez++lMHExpjyzH+h3tPj8PfiKwapcesTcuj9Lbc5W6DDiJBE4fnFIITVqAqisINjP5a
         T+42/mxZpVkukGB0VXlESr+JhzgvuZxfZPpCkLRZx4GFw0tvbC1yjU5H/43o6+NyN8/i
         we4e64Ko1/Bz3vfqmZEp+vjW2nJuITXFKMcSvPzg8JKDbs8Z90y++4ImUZm8BXLB7AGP
         RPGg==
X-Gm-Message-State: AFuF++k1uJtG/iW1eVCh8aadPMVsQb8PqpcA2vidlO41oyc9PsVEfFRM
	M7jTBbTLw0RdCHUWkwr0OGRFMiUkpBeHWBw0uML3nODPmdw8kB2+CDW5SQZ3ag==
X-Gm-Gg: AR+sD10RMj/vIOIOJ6gMNHBbefvxzPU14Ww2oUu+iVbeK8vvIPZkMpEphQDS48fUg+8
	1bOYUlcIyS+/7eYkE0s/a9taTPxZkpIK+ysQLZdIuEpFnTPY7ctkAujgt3Al3CnbCyoaTm4Odlz
	aHgxSDZESmoYOqpMuwjNj6O9gtAjR9RZ3m/LxRXqDnjeSa4pE1aVHxu65/l+f9myK9etXHzeGB4
	+niGa05SN3YphrisyP5wYRDPtB7ULLIEOnmjf7G30oUi4LrRX56IumiohRBwA8szBbiuziHFUE8
	EObG3sGjSrEabb+fmaVWG/EOJPY1oIIZOd5275V1zjipxnDoShVoYJv4DV3WNEb/+QgxaisndNe
	Y6wqncbVx6EJPP8s6t7i8cMFaOK7bQV4yhLMJ2aE+V/gjhHY3fajUeNGo1jiIFPMcGgFHa1EK45
	FV99Oh/wbCfPLv5XamdWGS5Aw63X3fXEMPDROYNxw5LwI4OLtX++NalHGyJoz87GBXew==
X-Received: by 2002:a05:6000:18a6:b0:482:d900:6558 with SMTP id ffacd0b85a97d-482f7984d0dmr1666760f8f.7.1787861580508;
        Thu, 27 Aug 2026 13:13:00 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e27ab4dasm11379085f8f.15.2026.08.27.13.12.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 13:13:00 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org
Subject: Re: [PATCH] gpiolib: return quietly from gpiod_get_direction() without .get_direction()
Date: Thu, 27 Aug 2026 22:12:59 +0200
Message-ID: <20260827201259.3647152-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <CAMRc=MeCeGDEGbDMtHZXGuiPQV-QBYfNW50MmiJ0ke=De2_nVQ@mail.gmail.com>
References: <CAMRc=MeCeGDEGbDMtHZXGuiPQV-QBYfNW50MmiJ0ke=De2_nVQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Bartosz,

On 26/08/2026 at 17:06, Bartosz Golaszewski wrote:

> I would rather implement the missing callback in gpio-mmio. We already call
> into pinctrl if needed when setting direction, could we call
> pinctrl_gpio_get_config() here and read the direction from the underlying
> pinctrl driver?

I agree that is the better place, and I am happy to drop this patch in
favour of it. One wrinkle I ran into while prototyping: for the config
road to work, the pinctrl driver has to report the direction as a
generic parameter, and pinctrl-imx (which serves vf610) does not - its
pin_config_get() returns the raw pad register value, not
pinconf-generic parameters, so gpio-mmio cannot decode it generically
(on vf610 the buffer enables are bits 1:0 of the shared mux/conf
register).

So my plan would be two small steps:

 1. teach the vf610 pinconf side to report PIN_CONFIG_OUTPUT_ENABLE
    (and PIN_CONFIG_INPUT_ENABLE) from the pad register;
 2. give gpio-mmio a get_direction() that is only installed when the
    chip has no direction registers, asking pinctrl for
    PIN_CONFIG_OUTPUT_ENABLE, as you suggest.

Does that match what you had in mind? If so I will send that series
instead of this patch. Enjoy the rest of your time off - September is
fine for me.

Thanks,
Mehmet
