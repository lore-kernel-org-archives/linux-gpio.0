Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792456693;
	b=dKu0W5IkRjviAKsbSHUz7RzxXVfgDdLrALTBNXLu306XtvViAZ3IeR1qRPV1p3iThZZj
	 7/6lDG9UVUHLKJlNCtx+R3wTXLF6EcJqts0LJAo41wqiwow4zV91qoewbBdAuOfYM/X9U
	 mdtO8eRUaO4FXv96NIMWU4UUJx0nU7PCMjIOiOF3Ujrrk5n788QVXAo9NJ0bz5P0OuamV
	 Qd1/neHk1N2kpcyyN3YjCXWPLfWWnfx569//6UlGIDDbUGmsWubRfdBc/UXVGdZ8ei7v5
	 6WjYAds47BQ/av8X7OU4X3bf0sRbYAWClTsoPK9kD2I485WoFaoFr120RNtafbERCtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792456693;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=eTNgECk0aJjIcx7mStKdSjGex/85xJLMVF19JFpf26Y=;
	b=dOmhpmKeLXNnB6qsrmif1FsgiROK3VcsPozouuGHE1m7clVoRWPOVJilxudqAU31FIs+
	 dKFx6j/I+FWELO9+4JE1/6JEz5yqwNXHDhuwrQV/zdw6WYjTHWvHDxvsaR5pppAM7jJZ3
	 BpVUB7Q/aFrYhhW0RgLzJN4jk8geyRlpcjTtkphGB9Hjcu7ME8lSMsDt0yEv5KRTQ1sse
	 rmm2yhxB+mrID2BB+u92+rCPooPt2gFP4ls7aqreEGQSWbyanezFDp3fL/IxuncmV8Rx4
	 bHB7gwYAGYtLfHy4etVMfzUVbPBIYXc+kARFZ9s7mKkNPpoTWr52P56+a2gxSKhu+xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZabfXPH3;
	arc=none smtp.remote-ip=209.85.210.48
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE48C606A31C
	for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2026 00:38:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE48C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZabfXPH3
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-81ae6aefdceso2423062a34.0
        for <linux-gpio@vger.kernel.org>; Mon, 19 Oct 2026 17:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792456692; x=1793061492; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eTNgECk0aJjIcx7mStKdSjGex/85xJLMVF19JFpf26Y=;
        b=ZabfXPH3s59tkZw9SJRDHQPG/F87Q+4JNsIsUOlP5CqkdFSMKbLho8J9Qnpdh3AJ2O
         3oJpZo2ruoIUZxlF/4ZFEy3IlGiHd5tLmDVTOTH1VL78q2vrfD8pGWV2enZiQFtqeyl3
         ipiMlJ4QoF+gVUbnBBg8O0/mLj+QZnwQvOlba/YUISy37F8gOk4BU42N4mMm4O69Faan
         u1IEO/ewimPKEIW0wGKC53LwTrME4QSclBoASpoaZ0d4aRM0n9h9o78+lbU+zQ1bH+dQ
         EMWnOfWDxMBp8iTPRv/82UwV1BCTy1T0YhurrNMCkRuNuo3ALUMoSIp3si2tFhYMvpwY
         TwrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792456692; x=1793061492;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eTNgECk0aJjIcx7mStKdSjGex/85xJLMVF19JFpf26Y=;
        b=22sWbFYKoDiwimsgsFt1kEXLomI3G3AaTp/ZTYMc/2/nM6xKTAQRyrHOqUGmbpuVQj
         8eWVEUGIPcisUvH4YxqsoVsKCCLHrPQDV24gA7yn+9hwJpypM+yx3RXoLgWHLqlkj9DY
         cGLZX/aAJOrAqVQi2+yh8olSjpX4gbJChm4uf2AGeO54NsMJ4BAgPMf5+Ib/OO+ZaF+Y
         sfag+DkR+aHkiTBxmkiC7bahhQJoX7G+c9Xmg+iaDl5kbSDmWChqGWIXM6RE+j+qD8fP
         QyLIZrVVXZbBZe2UomK9kWEyN7D7hVK52MoPC8FLN0X0KVQKSCxR0L/qafr3idHlM51N
         TZuA==
X-Gm-Message-State: AFq9FYIrYdSxXGta2E1xL8zcYjgNOa7Lefpg55Xs4N8/z2fpRvHY+IDb
	osXQIwCcReOqIlPV4HFl1e5WO7WAWP5x0R4pKQK2sLOYykWlSsBFgjb4O3nlxQ==
X-Gm-Gg: AYBFou2/mGsJMdFmVrqeOzG7XwvLhgHxLcT5ifiMyFyAewsaWKhuUTSFtvyDk7vV1d3
	PucD6X1USh/YH0p09C5h2du1oOZtdVz+fExm1xQ2jMExLiplwjNFVrEczB/dLF0gsNXPqm6EYyl
	CClLmzfjJmqHe2+VEco3mE5+xhAxtQXASw0I8tGvOaPB0jTd7ZtwDFYHGOfQVWAKV4Kw9YQR5l0
	eD6f2ebvn1lv7PWL4wxz9XZePYp4Di98a/syXWb3q3mTQ/yNcpMcR3DwoXTNux/42FEnV/aSWK4
	9qkVViFY5rf8Ht9PbWedQVvaooE79SOmvDy25PbQ0hdPrh5VI/mVssxCb6XVQd5+3/K6PkgKcdH
	dkX+xfQbgS/zKB80y+FNjgZuQ1i+LIy9SC6AY9MQcRIFJEh/HlmiCll9JuijF5SzZ5zL4+QfiB4
	WN5PwZBUshDL8TI6rlbZom63ahsmgNRMUVMiQj0SJMfSQOgePisd+7guByjwZh/JnBRI6JQT30L
	8YWrDhhCJjjqtErNnOE/4YYauVUgvy1ZIKP
X-Received: by 2002:a05:6830:3805:b0:81b:a5aa:e82b with SMTP id 46e09a7af769-844fffc4c6cmr9074174a34.24.1792456691840;
        Mon, 19 Oct 2026 17:38:11 -0700 (PDT)
Received: from Zephyrus.localdomain ([66.188.87.142])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8429b57870fsm10373383a34.0.2026.10.19.17.38.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 17:38:10 -0700 (PDT)
From: Vincent Fazio <vfazio@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: brgl@kernel.org,
	Vincent Fazio <vfazio@gmail.com>
Subject: [libgpiod][PATCH 11/14] bindings: python: include Python.h before other headers
Date: Mon, 19 Oct 2026 19:37:25 -0500
Message-ID: <20261020003728.13669-12-vfazio@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261020003728.13669-1-vfazio@gmail.com>
References: <20261020003728.13669-1-vfazio@gmail.com>
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
 bindings/python/gpiod/ext/internal.h | 2 +-
 bindings/python/gpiod/ext/module.c   | 2 +-
 bindings/python/tests/gpiosim/ext.c  | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/bindings/python/gpiod/ext/internal.h b/bindings/python/gpiod/ext/internal.h
index 2996884..12c2ac6 100644
--- a/bindings/python/gpiod/ext/internal.h
+++ b/bindings/python/gpiod/ext/internal.h
@@ -4,8 +4,8 @@
 #ifndef __LIBGPIOD_PYTHON_MODULE_H__
 #define __LIBGPIOD_PYTHON_MODULE_H__
 
-#include <gpiod.h>
 #include <Python.h>
+#include <gpiod.h>
 
 PyObject *Py_gpiod_SetErrFromErrno(void);
 unsigned int Py_gpiod_PyLongAsUnsignedInt(PyObject *pylong);
diff --git a/bindings/python/gpiod/ext/module.c b/bindings/python/gpiod/ext/module.c
index 21ea519..6b5ead7 100644
--- a/bindings/python/gpiod/ext/module.c
+++ b/bindings/python/gpiod/ext/module.c
@@ -1,8 +1,8 @@
 // SPDX-License-Identifier: LGPL-2.1-or-later
 // SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
 
-#include <gpiod.h>
 #include <Python.h>
+#include <gpiod.h>
 
 struct module_const {
 	const char *name;
diff --git a/bindings/python/tests/gpiosim/ext.c b/bindings/python/tests/gpiosim/ext.c
index cc7bd37..dcdde7b 100644
--- a/bindings/python/tests/gpiosim/ext.c
+++ b/bindings/python/tests/gpiosim/ext.c
@@ -1,8 +1,8 @@
 // SPDX-License-Identifier: LGPL-2.1-or-later
 // SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
 
-#include <gpiosim.h>
 #include <Python.h>
+#include <gpiosim.h>
 
 struct module_const {
 	const char *name;
-- 
2.43.0

