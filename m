Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792872056;
	b=TPXl0njWwRd3yoynnP6KXOE0dxVy2QL29P46VADosr57ApNSI7e2FKlseEzb7t5KQMeY
	 vwqWvYAZ/i6VPynYsVTaGW1PxMTbby8ZUNC+qWh+uPgT4EUaH3F95hh2D2FdqvqVBhyFO
	 6gtw7TTLXA0vTFKNNJLM3xq+AWrLxp2oZNCVrWCaYLmMzomNSSnWpyQeM7cy/IhUvaMER
	 oRGgrqwN7NefXsS2dGzR0h5k331TbuRPmwg76nX7EFGMKe05dm6n/JDHB9u9oD336Brjx
	 Mld0dbMt4RA5aTEfcdNsxfFn8xcdhgiDuBR23dqfW/EIrseT0FWe3MQjzzjvWlgXOEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792872056;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=mojc9oUGKoL5xRIH+sn0yNL2fIvEPVJXRu+9L0mIv3A=;
	b=Xdx7T5uOl7M30EiMft6OPiq7kSGVVkacv66i9gWcm0Noaer4n9NqjXVytrFGeOMPv7Z8
	 3Ei4LjHDUem47+zbNBZ+LvsCYsfVx9ufFqDxySi9bM0amt5kEwo6erTajs1rm6sUK5lt5
	 kLHnOL/b7t4MXUPKLD5f041Z29hrQfBejruugQ81I2OjwC2NNRtxMHd7hPAuVnltG6lsx
	 QHJ1ZDbt7YhFZTzI6xIZTKgzkdVZq7w8uSmDqX5bkyUFIraV5vbofRSZxtAiyMI2BvJbe
	 ABtuiwpirxcunggNWZvMyn4rJoFi/LsKSVh7ZLVMvZP0bDZSGHB/4Tfs4MyCYsUhO8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=R0smwoEU;
	arc=none smtp.remote-ip=209.85.167.175
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EDFF606A31A
	for <linux-gpio@vger.kernel.org>; Sat, 24 Oct 2026 20:00:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1EDFF606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=R0smwoEU
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-53a448f86e0so986362b6e.1
        for <linux-gpio@vger.kernel.org>; Sat, 24 Oct 2026 13:00:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792872055; x=1793476855; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mojc9oUGKoL5xRIH+sn0yNL2fIvEPVJXRu+9L0mIv3A=;
        b=R0smwoEU2JEOSYNfmNwvjuka3VJhgsrslTsMa30QLr/yYDcg/O6k/2a4zHciUJEjao
         eoN4hOyZ8pUXpZPStELEOwWF48xeaLcT1GNtwJ9i18rlvZRZ55FhHmfWQojqCM0TpK1V
         BOwvYreJ+Q4VBuzXNQdPNCnVkPFcWaQId0Kzwxtve7L21pLyVW9wYDGujZc9NlYWgfsQ
         MyPYVNV7FplYk5H9GvXyM1ciCrPzHj8wrRgR8093HWpXJR39RppM/pDtltt1SPdW0aRC
         inWp1wivFtFU+erFSDqU83TuADolczTRf4hmiRb2KnRYFF8KRWmhv942b4J8vF/5cCIb
         Q45A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792872055; x=1793476855;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mojc9oUGKoL5xRIH+sn0yNL2fIvEPVJXRu+9L0mIv3A=;
        b=Y2akDlIu73jPspCkj7G///DYYzAQ0UjwJFDnCwupA2qfG53XLjC2A0XmbxdA2FwrZE
         5u1qWNuIGEXr3G9FEbvP32ZL9V1nO9m62VwVDzsPp3h1ytrPc3gl0dIPmISiozxLWP4I
         vWM36ZF2+0/IsyADx1p3zYxe5N4pPos0ImL3E1M77h009V6BQgbeHQNBZA68+D8mBB5v
         GoEnVEx4+CSnJTaCQadg1cldfTVRYKbAI9S4JEgisMr9T/tt7oyER8qXvkQqQre8rjsj
         a22CCZ1Eow/AtxMYs+0xytgtdY7cfBQLtpUmMZQU3AxzQaTpSWVkOzCM9WwMHyioX27p
         yrAw==
X-Gm-Message-State: AFq9FYLTYgMxvp2OhDeKc1k2HVLSHuZhrYsv67vpk6bv8q4/HOnkQOOS
	Gf6aLl4BrrWwtG2iDke56NpHFW6jpI9ddYfVoZOMINrcN95stKDJ9cFUCMNNVA==
X-Gm-Gg: AYBFou2FLZkgpZLyMePIGLr/6Go+YzrUrFBas9KJdj0fzUr9IHgkGvKiDgriBWAyf+M
	FgaM3AjZoDmAslJ4mqU09Q4DVINObSUCZ2Ar3RWJLg3AMw+qBvAppV7ojvrFvnB4rcVVgCNAPOq
	30vRFGxdcQhXUtopB/w8IAMV6qJ3AX8IaBqnzzHDMxO7jdKyx3lDFQaPkom3251Y/aVMHyH+h5Q
	wdg+Pg+iiSychnryk7YCg8vRts3bvyei4uu+J+An3yyNyA+p3TKuNCifq2eNoSc/S9ySmlVJAu2
	cmyhHrHnegLnBbAJeqpZizPWcrfOG6PfsiPtVWG9IGGvTpdHxWJucDsxziadtpSCHn4S8L35ilb
	DnkbZVh/w1rSMLnBUIgRjh49ED/V6cPGKXNmD0Ic9NmYYDpV1pDxEz8evxWs2M7ZyTzJlv+7o/0
	q7Okj8swyhbTVAenDtZgy4+EcQyC6frufeCRIyZdxrCTpXrp6hEDEMhERlqV/JTa94t1di3QSjB
	KgiZRD6v62MKoMFIQmthfGLE0e8sQCo1tmUSQkM0m3dMs4CkTSnUtx6cZ40chGfLgGUyq3waufI
	qD6sQWNioFbqFIdVoBjcKrYCm29w3avbTsQp1WY=
X-Received: by 2002:a05:6808:1524:b0:55b:f88d:6ebd with SMTP id 5614622812f47-55bfff900camr1696533b6e.3.1792872054966;
        Sat, 24 Oct 2026 13:00:54 -0700 (PDT)
Received: from Zephyrus.localdomain ([66.188.87.142])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-55c042da8c5sm1731361b6e.14.2026.10.24.13.00.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 13:00:54 -0700 (PDT)
From: Vincent Fazio <vfazio@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: brgl@kernel.org,
	Vincent Fazio <vfazio@gmail.com>
Subject: [libgpiod][PATCH v2 10/14] bindings: python: bump ruff linter dependency
Date: Sat, 24 Oct 2026 15:00:44 -0500
Message-ID: <20261024200048.25987-2-vfazio@gmail.com>
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

Bump ruff to the recently released 0.17. Most of the important changes
are from 0.16, but there were no incompatibilities found during testing.

Of note is the expansion of the default ruleset [0] which is now
leveraged over the previously selected rules and simplifies the tool
configuration section significantly.

Two things are explicitly disabled as part of this migration:

  * Formating of Python blocks in markdown files is disabled [1]
  * The typing-extensions flag is set to false since the bindings do not
    depend on this package [2] so appropriate lint rules get disabled

As part of this change:

  * Unused error suppression flags were removed from
    examples/toggle_multiple_line_values.py
  * tests/tests_line_requests.py was reformatted to bring it in line
    with the rest of the bindings
  * The `readlines` call in setup.py has FURB129 [3] suppressed since it
    only affects builds (edge case) on 3.10 (now EOL). When the minimal
    version is bumped to 3.11, the entire block will go away.

[0]: https://astral.sh/blog/ruff-v0.16.0#better-default-rule-set
[1]: https://docs.astral.sh/ruff/formatter/#markdown-code-formatting
[2]: https://docs.astral.sh/ruff/settings/#lint_typing-extensions
[3]: https://docs.astral.sh/ruff/rules/readlines-in-for/#readlines-in-for-furb129

Signed-off-by: Vincent Fazio <vfazio@gmail.com>
---
 .../examples/toggle_multiple_line_values.py     |  4 ++--
 bindings/python/pyproject.toml                  | 17 ++++++-----------
 bindings/python/setup.py                        |  2 +-
 bindings/python/tests/tests_line_request.py     |  3 ++-
 4 files changed, 11 insertions(+), 15 deletions(-)

diff --git a/bindings/python/examples/toggle_multiple_line_values.py b/bindings/python/examples/toggle_multiple_line_values.py
index 8c973f8..e5fbcd9 100755
--- a/bindings/python/examples/toggle_multiple_line_values.py
+++ b/bindings/python/examples/toggle_multiple_line_values.py
@@ -29,9 +29,9 @@ def toggle_multiple_line_values(
     )
 
     while True:
-        print(" ".join(f"{l}={value_str[v]}" for (l, v) in line_values.items()))  # noqa: E741
+        print(" ".join(f"{l}={value_str[v]}" for (l, v) in line_values.items()))
         time.sleep(1)
-        for l, v in line_values.items():  # noqa: E741
+        for l, v in line_values.items():
             line_values[l] = toggle_value(v)
         request.set_values(line_values)
 
diff --git a/bindings/python/pyproject.toml b/bindings/python/pyproject.toml
index 3337306..7d1c777 100644
--- a/bindings/python/pyproject.toml
+++ b/bindings/python/pyproject.toml
@@ -36,7 +36,7 @@ Issues = "https://github.com/brgl/libgpiod/issues/"
 Changelog = "https://github.com/brgl/libgpiod/blob/master/bindings/python/CHANGELOG.md"
 
 [dependency-groups]
-lint = ["mypy>=1.18.1", "ruff~=0.15.0", "types-setuptools", "packaging"]
+lint = ["mypy>=1.18.1", "ruff~=0.17.0", "types-setuptools", "packaging"]
 
 [tool.setuptools]
 platforms = ["linux"]
@@ -56,19 +56,14 @@ files = [
   ".",
 ]
 
+[tool.ruff]
+extend-exclude = ["*.md"]
+
 [tool.ruff.lint]
-select = ["B", "E", "F", "I", "TC", "UP"]
-ignore=[
-  # Ignore chained exception warnings for now: https://docs.astral.sh/ruff/rules/raise-without-from-inside-except/
-  "B904",
-  # Never enforce line length violations. Let the formatter handle it: https://docs.astral.sh/ruff/formatter/#conflicting-lint-rules
-  "E501",
-]
+typing-extensions = false
 
 [tool.ruff.lint.per-file-ignores]
-"gpiod/__init__.py" = ["F403", "F405"]  # ignore warnings about star imports
-"tests/__main__.py" = ["F403"]
-"tests/**.py" = ["F841"]  # ignore warnings about unused variables
+"tests/**.py" = ["F841", "SIM117"]  # ignore warnings about unused variables and chaining context managers
 
 [tool.cibuildwheel]
 build = "cp*"
diff --git a/bindings/python/setup.py b/bindings/python/setup.py
index 4297615..af922c8 100644
--- a/bindings/python/setup.py
+++ b/bindings/python/setup.py
@@ -167,7 +167,7 @@ def fetch_tarball(func: Callable[[T], None]) -> Callable[[T], None]:
                     project = cast("dict[str,str]", tomllib.load(f).get("project"))
                     license_file = project.get("license")
                 else:  # tomllib isn't standard, fall back to parsing by line
-                    for line in f.readlines():
+                    for line in f.readlines():  # noqa: FURB129
                         _line = line.decode()
                         if _line.startswith("license = "):
                             license_file = _line.split("=")[1].strip(' \r\n"')
diff --git a/bindings/python/tests/tests_line_request.py b/bindings/python/tests/tests_line_request.py
index bc85eba..8e74490 100644
--- a/bindings/python/tests/tests_line_request.py
+++ b/bindings/python/tests/tests_line_request.py
@@ -692,7 +692,8 @@ class UsingMoreLinesThanRequestedNotAllowed(TestCase):
 
     def test_line_set_more_values_than_requested_lines(self) -> None:
         with gpiod.request_lines(
-            self.sim.dev_path, config={0: gpiod.LineSettings(direction=Direction.OUTPUT)}
+            self.sim.dev_path,
+            config={0: gpiod.LineSettings(direction=Direction.OUTPUT)},
         ) as req:
             with self.assertRaises(ValueError):
                 req.set_values({i: Value.ACTIVE for i in range(64)})
-- 
2.43.0

