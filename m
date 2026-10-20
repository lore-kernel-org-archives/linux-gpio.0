Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792530768;
	b=g+KDhYQIQTgT4beIAPkJJptxWUiXT2yLqZ7bKQ695MjoNqzCAM0ljU++f/u5QmFD7yBo
	 YZT7kzvB4/gguA5X6PuHFM0vZHAMLeOmRoHDt8DK1chzUuN0IqIZDHf3+w8o6IQlUq71h
	 RJ9kcAx73ruHVkKqHTjx2jOa9epwyYux2RhQYJ40D0Nh7hKUp6QWWu1pejI8Vvurfwvyk
	 gMyOTPSFrFnreTyWX0N7WeCda7f2rnlMDHMduOeXtl+ljr09z83Ews1L5GBh8Pt12ppcQ
	 k5DG5r383H8/3xrGcNCD39LBdi+VKKN43UWknOUFzp+8FxL6IYiZu9ejt5fMCHslvtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792530768;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=nlYF77CiqgNZ3vyuVU7SL2QHYNZi73um8u3WiAaxcV4=;
	b=l8O8qDQ9zTGIrJ8N2BQFzsnJ3sgZs/qiJ0y5u3M/wV1Gv1tbkuIUbnjipv2s0dhnYm8Q
	 ZqvywLmJGVuR4DbYjJpgsOGPTnAGtl7V/C1m8tCN7Au+GI49fC7ckXT08VCaUoS0+F8lC
	 6ticQRQPFKmOrtCE8b+a5gLXcX83fD+E+QLPjDHqb5q/omJstcLg7FU7qsp4LrhXVmiJ1
	 NdrZ7aybmQT663hlbZfi62soVkkNuf6ihdhSzxCB3FLDBx0X5mf8sygyOGiNoF5WGreI+
	 /sEb9VfgB0iWoNfi8fCfcEFTQv4xNmIIaXvklHRp/FV1jkklLaegPovuS9asz3Q9meA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=S35GmRKD;
	arc=none smtp.remote-ip=209.85.160.46
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC7AE606A31A
	for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2026 21:12:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC7AE606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=S35GmRKD
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-451a49abd8aso86681fac.3
        for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2026 14:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792530767; x=1793135567; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nlYF77CiqgNZ3vyuVU7SL2QHYNZi73um8u3WiAaxcV4=;
        b=S35GmRKDOex8mvCumK1wk8+ZjdCeyOa//8z+v55pE+Asm+hbgPmGNKsfIJPTkvP91i
         n/Nwmf0LAHsXWZrumGraZ5Uyt41IjXsmWkT5cNSqG3c64NWxqx6ByoUjjuO0kno9lKj7
         ygXgNwl0hcId67xDJd5nxLhQM3+4VfO9O6kkkEeHWXZFenifUhIk6leb2DCBxdNzPfsS
         ueKZSQFXl2wFJUoYyaRwGxJ3j/r+N1LXY/R/oPBVvMoXxGLU27jFIbIga0yamsWPf6zK
         HIOfwiW3+EcTb7qIHuKFncKRZLDvlB8quLGYu1GSbZ5CKppI69Do1jbVCdGcG5/cuAqc
         yLCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792530767; x=1793135567;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nlYF77CiqgNZ3vyuVU7SL2QHYNZi73um8u3WiAaxcV4=;
        b=GCOl4mhlpfMJ8xZeuUdr+pWObZimCKChpkvvh5k3LptJUBTf5q7JLvwc14xOPTOxOg
         yT6FcE4sybYl1BSu+zzYgKaZmg4230lotM4LQkVSft0xXG+ZDj2e2NU0FP1NMWCCXg8d
         odUHT5Lbd8+YE8PlMtlBCpgUkkvFZ7gJocKPqxfAopj3S4q2e2luIUXZ0xJm/9zNotP5
         gdnFdlQz9WLKRy7iNGyX4r8x+f1iArNdK+iln+WqqESZNB5CJFdzmZtn0ju9I/LvoiAx
         V7rWDdXfLK4NrNXWRUwxeuvo0FYpG7rQmI4HUBUIsjDluc+JTxXs+pEpgDFvuaAZoRHL
         9WTw==
X-Gm-Message-State: AFq9FYKYGwHgWL4MDC+YAmSPmsOTTB9jo8gnwBMgNVLUQguExQ9dNNc0
	v9ox5bUcC7B/dh6tdYkZJbCztSD4M3btLgCLTKgELXZX9tFF5DHtDQmnunZt/w==
X-Gm-Gg: AYBFou3ofEp6x9b5vXnH/dkr6Pj07+jirbMdYk+NxYJZ8VfV3N5QgVzKYzYVvlduw8p
	TLGe+X72Fy1i3NoxrATlB7A24IGu5B+/SFMNsL58G3aZj1iMcMqyfD07pHdsagg6T2CAK5TAXwG
	0zJGleStBvd6qgjK/pj6JVlnZ2kij0Bjl/4WG0zxrKvI1oys4BxsYI4EbAlgEcoevymhi0INJsJ
	TVNAf06A11gUmmKM8K052Wk5kqSkEc3Czagkbx6pV/yXdmvx8qJ4sUd6EXLpDCbuRqvJEg+QRz1
	sE+ufu/+XPugjqaZeHEGxVlXEYI8UY5daXxzBCOiMbJM5JeQAk37yJwD/8VlIwwZSNZU+hNHYwP
	mmyiRl5zXgX/BgI3/gPDVzTe2BnKF/Esg53xoZs2hIgHUI55z0TpY7BUuddADrgnbfPf0QezATQ
	PwnxxDqaHnqHS7YgnnYQLikK2OPJ0rl0QenOF9TzipHxI7H0z9YRWqNZjYhl50tSNzbacn1awuY
	+M1zp8WJRzUizFqaRIgOw3XqwAUagDkwEGg
X-Received: by 2002:a05:6808:2226:b0:525:184c:7952 with SMTP id 5614622812f47-553559a2323mr37836b6e.16.1792530766617;
        Tue, 20 Oct 2026 14:12:46 -0700 (PDT)
Received: from Zephyrus.localdomain ([66.188.87.142])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-552b8ba5107sm370375b6e.17.2026.10.20.14.12.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 14:12:45 -0700 (PDT)
From: Vincent Fazio <vfazio@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: brgl@kernel.org,
	Vincent Fazio <vfazio@gmail.com>
Subject: [libgpiod][PATCH v2 11/14] bindings: python: include Python.h before other headers
Date: Tue, 20 Oct 2026 16:12:37 -0500
Message-ID: <20261020211237.16514-1-vfazio@gmail.com>
X-Mailer: git-send-email 2.43.0
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
Changes in v2
 - Added white space to separate the Python.h include from others
   (Bartosz)
 - Added a comment beside the include to provide rationale (vfazio)
 - Expanded to include tests/system/ext.c for consistency (vfazio)
---
 bindings/python/gpiod/ext/internal.h | 4 +++-
 bindings/python/gpiod/ext/module.c   | 4 +++-
 bindings/python/tests/gpiosim/ext.c  | 4 +++-
 bindings/python/tests/system/ext.c   | 2 ++
 4 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/bindings/python/gpiod/ext/internal.h b/bindings/python/gpiod/ext/internal.h
index 2996884..2c7ecd2 100644
--- a/bindings/python/gpiod/ext/internal.h
+++ b/bindings/python/gpiod/ext/internal.h
@@ -4,9 +4,11 @@
 #ifndef __LIBGPIOD_PYTHON_MODULE_H__
 #define __LIBGPIOD_PYTHON_MODULE_H__
 
-#include <gpiod.h>
+/* Import Python.h before other headers per API documentation */
 #include <Python.h>
 
+#include <gpiod.h>
+
 PyObject *Py_gpiod_SetErrFromErrno(void);
 unsigned int Py_gpiod_PyLongAsUnsignedInt(PyObject *pylong);
 void Py_gpiod_dealloc(PyObject *self);
diff --git a/bindings/python/gpiod/ext/module.c b/bindings/python/gpiod/ext/module.c
index 21ea519..8a9a07f 100644
--- a/bindings/python/gpiod/ext/module.c
+++ b/bindings/python/gpiod/ext/module.c
@@ -1,9 +1,11 @@
 // SPDX-License-Identifier: LGPL-2.1-or-later
 // SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
 
-#include <gpiod.h>
+/* Import Python.h before other headers per API documentation */
 #include <Python.h>
 
+#include <gpiod.h>
+
 struct module_const {
 	const char *name;
 	long val;
diff --git a/bindings/python/tests/gpiosim/ext.c b/bindings/python/tests/gpiosim/ext.c
index cc7bd37..1a6a238 100644
--- a/bindings/python/tests/gpiosim/ext.c
+++ b/bindings/python/tests/gpiosim/ext.c
@@ -1,9 +1,11 @@
 // SPDX-License-Identifier: LGPL-2.1-or-later
 // SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
 
-#include <gpiosim.h>
+/* Import Python.h before other headers per API documentation */
 #include <Python.h>
 
+#include <gpiosim.h>
+
 struct module_const {
 	const char *name;
 	long val;
diff --git a/bindings/python/tests/system/ext.c b/bindings/python/tests/system/ext.c
index 8b307f6..88d594d 100644
--- a/bindings/python/tests/system/ext.c
+++ b/bindings/python/tests/system/ext.c
@@ -2,7 +2,9 @@
 // SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
 // SPDX-FileCopyrightText: 2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
 
+/* Import Python.h before other headers per API documentation */
 #include <Python.h>
+
 #include <linux/version.h>
 #include <sys/prctl.h>
 #include <sys/utsname.h>
-- 
2.43.0

