Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793946623;
	b=N5rJOTK99Qu/FiQ/tyTYeeHyX/W9qJuVmMf9RXmSOGFgP45o6uDSenXy29y2HkONQ6Qm
	 UkNhzKIVJtIQZbXTcO4R+y/NawuLe8KaHd/sTQD6DpwSWlAzoBQx0OcyI0WbEZYpzgZKK
	 YZb43pc+Y8BiN6kDmYUjv3di2mAbd1WSSKzmz51rI5StejNphXHr+GxWvQdZFiceCB+Id
	 pE5u2HQz4d9t10D3n4ClaWBTjWYuD8oOWc/TPvLLspA9Qb1j80XZXgvvQ8FTvuyonrHkM
	 FgyGR6xRW82jLe1CYPAU1qeQZ2CGCn+mRvUkyGyNN8N3Azozph4d+AeRchtWppryMsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793946623;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=ItBykLd5DoKUCAFjji4dnCaemcLNkADKFd9nP3zuwvE=;
	b=lkNfTOPAfcrFsBBEsT8T3zv6uJyZSbVtHeWPNZhMjSSEZT5r/g/lnYh8z3/ul8He6JPd
	 TOimV5Bg52z09rT3kCHhAoq9o8F+zZTg9ENLBGHakj/1mvF8uHiXPd/TKim2Sqg0eQBc+
	 3oP8J88NBA2JCSkRHZxuam1ZOPAUGtrHRq4Nw2iNdK+nDOD7Jk47bPQ0TW12/N1CGpkNV
	 ZgKl2R73aXu+ASHGlTDaNv+vB3Xir6PPfXvJN5MsN/IvUZIZCbweRyjoI/TaYoNv8uJQz
	 29tTw41wD4zl6dTmQiHgAVlQbEMJK8ifcwunnGLZX8YibOZ4pl4hdoPlbtFYvQdUCDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vinlYpl9;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE235606A332
	for <linux-gpio@vger.kernel.org>; Fri,  6 Nov 2026 06:30:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE235606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vinlYpl9
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1931ff67a29so1109451c88.1
        for <linux-gpio@vger.kernel.org>; Thu, 05 Nov 2026 22:30:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793946621; x=1794551421; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ItBykLd5DoKUCAFjji4dnCaemcLNkADKFd9nP3zuwvE=;
        b=vinlYpl9vBdmMhv67mK6yvmlR4aUZu57cPe5otGjYVU+p/03YHOq8NGo18bFHskP1+
         pv5rpotqFLH8UoWaNZKfOp1aXWkE7KeSXYIlGmE/cd8FmmSLQ6NFTwE+cldkjZUnW4pp
         U23Vt50ue61zbaVKImHYsoKSQRWL6igLL171bobvHdjmA/wal89LC1aPPpPoIgmSvZJg
         z3LgTFOX4iyiG4GE8x+08SoHYBKWGh2AvYQR9mOD0DRz1pOweQQM5TQNQmDWI3okvh9e
         o5FkosdaPFRoSY1iEw8/PDoIJ78NY5qZJCE+D4nSoPiopXUM46WpthJVrOrY80E+Rkqq
         TUPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793946621; x=1794551421;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ItBykLd5DoKUCAFjji4dnCaemcLNkADKFd9nP3zuwvE=;
        b=N+6XyB4kpwFex8bdQLxincT9TbJbqjkJIFeuoy0P26tU3o4i/VrbRqWO5RVg1YR6lt
         hp+b1cu/QAkjWM1uMZsLW+j5F11zlpo+XAOjobGWWuua17ZQZv3cubxv2ffWTy7c9N5z
         snsMEmP5NnBnxTUINVeZdnTSnuf5Tgzm2UHx1giPsRMUolQFdA10h7o3/oWMe3wMht++
         9Evg4KYvSgLSzWvEFsjT666ph9glpVL94sQD9ekR3GYcLU4N+Pfhi+ukVpFgzGkedGfz
         kJkzmxn3o5ccmiqD4zrL/mfWSFU0wGAAC9baWpbcxd9ZKQEGCyYiBzEbSSLVGZZvT1MT
         tR4w==
X-Forwarded-Encrypted: i=1; AKwUvByUxyDJQ73y0kzdy1sVIa/5rPOQUxIUjs7M+FiGWRmUUgg1V/+4RH/EdfvEBPQaY0ear5fZSs+Sxsfp@vger.kernel.org
X-Gm-Message-State: APuU4Z8xnrEndbKXYFIT2/qOY1utmWFCp+r1NfGreAQ3SVPLRFsh9fvf
	qsJJvmL4HUiQznHLm0qx9Bbsli4vuwA8FqhRu24u6OR6XnZQcs6Grra0
X-Gm-Gg: AYBFou2Svu8w5dt8OQOn+6NuB8n6SAapNs1kBbPTltA9MwHYqm/+YqJ1gwt04Fq0DTL
	x/9NWaszlGkYm2QsP6q0Ivw0DWOb3q6x9XbH6teovZwe/9xRITMF0rk5vK9fyh1CmSU4p2d0+cp
	NY5SStUMtcXwAHpNBjpLoiCJLMvafXRwN+/R+GbY9qg78LRTxxapagHBBWz+tUXVh4fnOJA916m
	24Cc4Mx3o3yztOTivgI8VCizRQDmV0Ww9GzEKhFrUYMUdJjODb74cCfq0tQ9sVntEOalsBwso9M
	z/lOS6MihWwke8gd/+D2OUVq5XE9d8TCqqueYhEIm9lmWIbnKmz6ht/X9mAcNUvs1nYQ3BTzKrh
	0jj1OmpptVWUZ91j87UpTk+Yj/ELDB3/Okzhm20PLFCWEKv0az0LOETMuOi/+n/4chLYxthJVnN
	idc37DMFTfaL80k9Ov9dBpXQvanc+rWxh3U/4NxRFtnZeGL9TXPqg+oeRLU38IYn3IWUa7ybk/P
	yHS+G8rx9N3339mKotbV3b+NRTaawPh3k205V4hBCLtv2JDMcf5mExf1zzKDR7oSt4usg3TKbaT
	vqAzWHRRygglhBuGoxxMFmZ824f0Y3MW6rWGJLBK9vRoTd0klAkROkOMfskIBKIln5qiaiQEh0G
	/QDmX3r0rGAHXJgwd
X-Received: by 2002:a05:7022:3b8c:b0:18c:e014:6f1d with SMTP id a92af1059eb24-1b25d2889f6mr2108897c88.1.1793946621244;
        Thu, 05 Nov 2026 22:30:21 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:64e:8358:c9cb:c17b])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4a63f6sm3734266c88.9.2026.11.05.22.30.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 22:30:20 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH v3 0/8] gpiolib: scope-based management and cleanup for
 GPIO descriptor arrays
Date: Thu, 05 Nov 2026 22:30:14 -0800
Message-Id: <20261105-b4-gpiolib-free-v3-0-bb47ad58642d@gmail.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPZz7WoC/2WOQQ6CMBBFr0K6dkg7IIgr72FcQBlgFChpsdEY7
 m7RRE3cTPKT/96fh3BkmZzYRw9hybNjM4aQbCKhu3JsCbgOWaDETElUUKXQTmx6rqCxRJCndYF
 UFmorExGoyVLDt5fxeHpnd63OpOdVszY6drOx99ekV2vvY1dFOBgjJvlOpqCgHni29zj0zaUz/
 tAOJfexNoNY3R6/tJLJ328eQQKVaZZnuS50s/vll2V5AmTDBVT+AAAA
X-Change-ID: 20261021-b4-gpiolib-free-74d92ea91503
To: Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>, 
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@intel.com>
X-Mailer: b4 0.17-dev-e56a4

This series fixes a GPIO descriptor leak and a fast-path cancellation
bug in gpiod_get_array(), fixes the !CONFIG_OF_GPIO stub for
of_gpio_count() to return -ENOENT instead of 0, introduces
DEFINE_FREE() scope-based cleanup helpers for GPIO descriptors
(gpiod_put and gpiod_put_array), converts gpiod_get_array() to use
them, reworks descriptor array allocation to avoid krealloc(),
switches fastpath bitmaps in struct gpio_array to bitmap_zalloc()
and bitmap_free(), and uses the %*pb format specifier when printing
array masks.

In patch 7/8, each of the three fastpath bitmaps (get_mask,
set_mask, and invert_mask) is allocated with its own bitmap_zalloc()
call rather than packing all three into a single bitmap_zalloc()
allocation. While Andy suggested a single 3x bitmap_zalloc() call to
avoid multiple allocations, slicing one bitmap into three pointers
still requires rounding the bit count up to BITS_PER_LONG and doing
manual unsigned long pointer arithmetic (which would still break if
bitmaps ever gained a header or tail), while still adding a second
allocation and extra bitmap_free() paths on fastpath cancellation and
teardown. Using three separate bitmap_zalloc() calls achieves full
bitmap API abstraction at the cost of three extra slab allocations when
the fastpath is used, and is kept as a separate patch so the
maintainers can decide whether they prefer the single contiguous
allocation in patch 6/8 or the strict bitmap abstraction in patch 7/8.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
Changes in v3:
- In patch 1/8, declared loop induction variable in for loop header and
  carried it through the series.
- In patch 5/8, placed descs definition and kzalloc_flex()
  initialization on a single line, and preserved reverse Christmas
  tree order.
- In patch 6/8, moved descs definition after count < 0 error check.
- In patch 7/8, deferred descs definition in gpio_descs_alloc() until
  after the early return, using struct_size_t() and a single statement
  initialization at the kzalloc() call site.
- Added patch 8/8 using %*pb format specifier when printing array masks.
- Added Reviewed-by tags from Andy Shevchenko and Linus Walleij.
- Link to v2: https://patch.msgid.link/20261103-b4-gpiolib-free-v2-0-ea46767c9cf8@gmail.com

Changes in v2:
- Added cover letter for the series.
- Added a patch fixing the !CONFIG_OF_GPIO of_gpio_count() stub to
  return -ENOENT instead of 0, and dropped the count == 0 check in
  gpiod_get_array().
- In patch 6/7, separated array_info assignment from declaration in
  gpio_descs_check_fastpath() immediately before NULL check to preserve
  reverse-christmas-tree order.
- Added patch 7/7 switching fastpath bitmaps in struct gpio_array to
  individual bitmap_zalloc() and bitmap_free() calls per Andy's review
  feedback.
- Link to v1: https://patch.msgid.link/20261021190212.2237804-1-dmitry.torokhov@gmail.com

---
Dmitry Torokhov (8):
      gpiolib: fix GPIO descriptor leak in gpiod_get_array()
      gpiolib: fix fast-path cancellation in gpiod_get_array()
      gpiolib: of: return -ENOENT from of_gpio_count() stub
      gpiolib: add support for scope-based management of GPIO descriptors
      gpiolib: use __free(gpiod_put_array) in gpiod_get_array()
      gpiolib: avoid krealloc() in gpiod_get_array()
      gpiolib: use bitmap_zalloc() for fastpath bitmaps
      gpiolib: use %*pb format specifier when printing array masks

 drivers/gpio/gpiolib-of.h     |   2 +-
 drivers/gpio/gpiolib.c        | 225 ++++++++++++++++++++++++------------------
 drivers/gpio/gpiolib.h        |   2 +-
 include/linux/gpio/consumer.h |   4 +
 4 files changed, 135 insertions(+), 98 deletions(-)
---
base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
change-id: 20261021-b4-gpiolib-free-74d92ea91503

Thanks.

-- 
Dmitry

