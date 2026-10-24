Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792872057;
	b=0Kudt5QjyXZfO/sXFhIk0i9p6K5hTugBGvQ6LU8ehcP1fXfJaW3WZku58amED6LL6Qx9
	 mYYfAF8q6+gRtrd3ec/4TUgzhEyXeHX836/RQI6Cd2jnt4u8hRbQljBBNdibUd+U6VIRh
	 P82EJEONadSEKUSEtZPst6dCVvZYIh7eEfLi/DW07VNzEfBz0yJAXEliOdawayMdJ/L6z
	 uStdtzWvscGyfOl6qWJ9jAD6Lm3WJlrk7btK4iF3IEmhdWmJR17xKTxYpc+a1yJrRyBpv
	 VD+6wFQx/qTCEvbpLyVPYQiM3ISb0878UFccCt+MwCfxcYy8m37hkOnmpYXJwC0ov7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792872057;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Wx/a1/S5nCXfr7UjsPeZ2VkMwp+xoj92Le3I2vwllLU=;
	b=PRkclDQv+Yhq06ddMVVyYGKOyWVdbW+oC+YtWRKYlTDsX2/2wSkqEIE88xU0HznXDmbB
	 tQDadkloUl1Z1+VQqsHjozqsR4/Mrfx6CIPSwSagJmuOZVCyGGBfG5ShVPGVSfgMEO77H
	 cpHf9HfpO+z+22zbaf4K8yh/HCcNBwoCZAb6Cxyfd2v0rfA2b3QYiTUt9kSH1kVyYUtfF
	 XKgc+4wvOkuFa3UwmJ/iGzMypKFaVp0VmBNzMAKfNKo75oyO09q/jUgqoZPQ4y2uC2Ll3
	 eCdt6PpRgvFV+aOUcgn2CyEwcB0SVqymHKB6sBYcjY4AcGC3h+LHpWDyzIpiONEXEhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ILqYuCmQ;
	arc=none smtp.remote-ip=209.85.167.171
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ED57606A31A
	for <linux-gpio@vger.kernel.org>; Sat, 24 Oct 2026 20:00:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5ED57606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ILqYuCmQ
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-53aa0802881so937579b6e.0
        for <linux-gpio@vger.kernel.org>; Sat, 24 Oct 2026 13:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792872056; x=1793476856; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wx/a1/S5nCXfr7UjsPeZ2VkMwp+xoj92Le3I2vwllLU=;
        b=ILqYuCmQACLWzexmejUClXPfMjjei4fWkwXsrRZcLKX6CQa6yWe+lppBrswZRIhJ9h
         zHYH84CkVyQ3GtDSPlBZ0wsrJ10GTd2DPTSwMKKa+CVg0FXbxdknFT05uq/pnd/R6jFM
         kXmdMJCdoyVe59DkJlbMNEVVGsq+WaeORHZbWWV70pu7WnxJi+XU5UX7/3tHZZ7yk+pY
         a41dcz0W1u5EN/4WwX+d6CB7u2iDDBmwgYhUOpegHoTdpCXZGYBPueWDhvX92GbKQhYr
         EsRkVNHmug3JQ5tBZZxdMQIIz0it+Yf2Z+Jr9dq5LhYzuGzZ7OTmdymHuVw7c6bmJxPU
         ld4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792872056; x=1793476856;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Wx/a1/S5nCXfr7UjsPeZ2VkMwp+xoj92Le3I2vwllLU=;
        b=MVpz8Mtn2t/1Wp8dxQV8A3ZwABBYUE6UXIqkmYqOliiXtwOplU+K40QSKYHO+huO4k
         V4M5s3jjPMoIQJBrqimz0orTTAph4tFH6BNxMhU9rTzNszv3XxoMF8mbr/HD5T+HgxvW
         QWRZAwNzFE2EKFKwPjvyGfFIEfoA/LXKSt+UiayPxmrbXx8cag/NbRfNjALNAbbvdAmV
         UMIFz1tKfcm6DfZTkTZNQpDSi/87/2j630qmJR/jEv4WFSNEZok2FyrLOlhSSUaEla1U
         ZV+YDljumKe7Q54OJKcKgRJrfZo/Z8fxhZ60uiREs7sXqeFXCBeWMO6xP/hhhzbmxCx6
         1gZw==
X-Gm-Message-State: AFq9FYIFnOZfw+ijLusckHGbS+6FwUrIXmvdA8q1S4xGx15zH5To1W4G
	B+qB5gIlLjtyTgLb4CIOKZRwl9FRZG3CciRSwa3rWBWjUrcr5FxKLjAEqum0rg==
X-Gm-Gg: AYBFou1lhtxIqw6+heDGl9KyZhB1M1m2wtb+MCXriXQdH+saMiNn21ZljCmDro4xTCm
	UepGaOvDGArlS4yNI3iNpZYu9VvzaM88yufOOES1Ct/SlgKD+CP0W5JzfaFaXC1216j0dL/l6Sc
	2eM/utcl3+aLojKzMp3F9A9YyPufrI0bkKBau6iPUu8fGENmQDfkAM1gOCjNOET/mkzOx5MHRkJ
	j+PF2ND/283fBsMBd3he84HRN5HqWQWrMgG+LCTkPbduSMpdRus7Ao6xhmumotcOK/HqWvWBf+q
	K3I81LXgge6JGnp2gmV5WYQSGPg50jsBArd4suhPCSADjOttuhUCOSYCxWlbcEQsh95dvqhstLm
	Cq80BZHMU/63jCoZ54l853Z6fKaELvO72YFhZIG7iMmgcmUbtqqWHS6BuTM9uEq+VVFKAsdSqoE
	znXiAAToll6Z2lZjEtphkPfibDJSWBLF+iPl7KY2ROwLAxBE5nsHkhNlkHad5o3RGkSbjkc4h+Y
	kmzd8ZuNgWMklieBi4R63ImjbDyn8QAZKNhbokf/PQopmh8YzqSEJ3QQUBYn4sBNtLIAFm/jYan
	aKT0aGI/4Wal/Ae9Fg==
X-Received: by 2002:a05:6808:11d0:b0:4fb:f1d7:932a with SMTP id 5614622812f47-55bfff7abbfmr1707941b6e.3.1792872056268;
        Sat, 24 Oct 2026 13:00:56 -0700 (PDT)
Received: from Zephyrus.localdomain ([66.188.87.142])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-55c042da8c5sm1731361b6e.14.2026.10.24.13.00.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 13:00:55 -0700 (PDT)
From: Vincent Fazio <vfazio@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: brgl@kernel.org,
	Vincent Fazio <vfazio@gmail.com>
Subject: [libgpiod][PATCH v2 11/14] bindings: python: include Python.h before other headers
Date: Sat, 24 Oct 2026 15:00:45 -0500
Message-ID: <20261024200048.25987-3-vfazio@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261024200048.25987-1-vfazio@gmail.com>
References: <20261024200048.25987-1-vfazio@gmail.com>
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

Per the Python C API reference manual [0], Python.h should be included
before other headers since it specifies some pre-processor definitions
that may differ from system defaults.

This was noticed when testing on CPython 3.15 [1] which emitted warnings
due to redefinitions of _XOPEN_SOURCE and _POSIX_C_SOURCE during builds
of the Python bindings.

Note: despite the manual stating that `PY_SSIZE_T_CLEAN` should also be
defined, it is intentionally not included. The Python bindings do not
use the `#` format specifier when parsing any arguments so defining it
provides no value [2] and it is deprecated in future versions.

[0]: https://docs.python.org/3/c-api/intro.html#include-files
[1]: https://github.com/python/cpython/commit/927eb448aad6436d794ec9f55780013e25609600
[2]: https://docs.python.org/3/c-api/arg.html#strings-and-buffers

Signed-off-by: Vincent Fazio <vfazio@gmail.com>
---
Changes in v2:
- Add an blank line between Python.h and other includes (Bartosz)
---
 bindings/python/gpiod/ext/internal.h | 3 ++-
 bindings/python/gpiod/ext/module.c   | 3 ++-
 bindings/python/tests/gpiosim/ext.c  | 3 ++-
 bindings/python/tests/system/ext.c   | 1 +
 4 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/bindings/python/gpiod/ext/internal.h b/bindings/python/gpiod/ext/internal.h
index 2996884..b600071 100644
--- a/bindings/python/gpiod/ext/internal.h
+++ b/bindings/python/gpiod/ext/internal.h
@@ -4,9 +4,10 @@
 #ifndef __LIBGPIOD_PYTHON_MODULE_H__
 #define __LIBGPIOD_PYTHON_MODULE_H__
 
-#include <gpiod.h>
 #include <Python.h>
 
+#include <gpiod.h>
+
 PyObject *Py_gpiod_SetErrFromErrno(void);
 unsigned int Py_gpiod_PyLongAsUnsignedInt(PyObject *pylong);
 void Py_gpiod_dealloc(PyObject *self);
diff --git a/bindings/python/gpiod/ext/module.c b/bindings/python/gpiod/ext/module.c
index 21ea519..f13b86e 100644
--- a/bindings/python/gpiod/ext/module.c
+++ b/bindings/python/gpiod/ext/module.c
@@ -1,9 +1,10 @@
 // SPDX-License-Identifier: LGPL-2.1-or-later
 // SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
 
-#include <gpiod.h>
 #include <Python.h>
 
+#include <gpiod.h>
+
 struct module_const {
 	const char *name;
 	long val;
diff --git a/bindings/python/tests/gpiosim/ext.c b/bindings/python/tests/gpiosim/ext.c
index cc7bd37..e3cb2ef 100644
--- a/bindings/python/tests/gpiosim/ext.c
+++ b/bindings/python/tests/gpiosim/ext.c
@@ -1,9 +1,10 @@
 // SPDX-License-Identifier: LGPL-2.1-or-later
 // SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
 
-#include <gpiosim.h>
 #include <Python.h>
 
+#include <gpiosim.h>
+
 struct module_const {
 	const char *name;
 	long val;
diff --git a/bindings/python/tests/system/ext.c b/bindings/python/tests/system/ext.c
index 8b307f6..7d8304d 100644
--- a/bindings/python/tests/system/ext.c
+++ b/bindings/python/tests/system/ext.c
@@ -3,6 +3,7 @@
 // SPDX-FileCopyrightText: 2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
 
 #include <Python.h>
+
 #include <linux/version.h>
 #include <sys/prctl.h>
 #include <sys/utsname.h>
-- 
2.43.0

