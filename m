Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792456691;
	b=arQ9bFHHYW41h5omMltBc2WkZ2R35L82Uk9sR4m/GbMO48RJYjn3zUhcj8c0XPPioVC/
	 BGIrqke0R8ra74H1EmdnzJxO3HO1Ql/mwMdv6KT6iuXlj3eIp4sSO+RDRDy3uvEPra5Cv
	 /KE07aD3DKXL984jM4C3UMNwznjsPuw6qA9Z1jE9CspF9K24eGAokMIipeSrR6dWjqbC2
	 rtyebdlaEp7yCbRN4F2fUTPM5tq+NvRgpIF7rJGca0iqhDyBANw476DXdtxtXnkmkueWk
	 nQ8ylv+8nef23FapxIkpJjx3V9eCJJ48+vmD97VPmq4mGqjLOZ1TS0vpuxBFOOw1ljA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792456691;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=mojc9oUGKoL5xRIH+sn0yNL2fIvEPVJXRu+9L0mIv3A=;
	b=SwUvK9JZ80D+rNYJK+ZaiIVf7USK+WQR4tVwJfgMNK+k1jHKS+0q9IFBUknadz7uvM9O
	 eOeUfjhXcQsWAnId6/TAoWh8RO0KtKPQYEtyOj29OFtfd2C5bAVprMUVNAo/GnPyJVY9l
	 AobRHNCqtJcGCYciMo5BMN3XLLqnyII9xwfS2f0o+2JCKaE2/tFVkEwsY6PU373uA/Yxn
	 PMsrKa3+CHqDhDFjxGcc0CR6iqRXX/zeVGvs2I6mnNLjEZpqRj8okP6roW39gRhZtlW98
	 DYGxq1RI4nC3u8hBp6YV+e4tY9m77JVinNFd5G4OS6YPv9MrjaksGPof4XCSsiVrQEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=J14OKaKj;
	arc=none smtp.remote-ip=209.85.161.43
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD0AE606A31D
	for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2026 00:38:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD0AE606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=J14OKaKj
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-6dd4f3f696aso1630192eaf.1
        for <linux-gpio@vger.kernel.org>; Mon, 19 Oct 2026 17:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792456689; x=1793061489; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mojc9oUGKoL5xRIH+sn0yNL2fIvEPVJXRu+9L0mIv3A=;
        b=J14OKaKjegI+hf34qYKT3g/uETm3ZdA9WlFqkdGlks0B2XfNBbaOecA3UaqYuLQ/s6
         RQcRe52pPBxyu1MJtTeghcNk/HeZDDFTmgXDb08eA6/r13ITimE7RIwuqJyTvjg98be0
         zS0VQDmA6dc8tFXqxNEvef4TsIiaGngQUotaOrPW4Lqhori4TIMjXERZ2J3oDHdD+71c
         6fYpJmv0CUeCodzgeAyEccqnxDmYm3+BnBV+nT02nz2mM7P/rQQfpkJOQWLMqK0e7xtG
         WG1HxfZkUMQqQyzdmoMX2WixQnmVipfkSgTFkEy5kc6iIB+9O0KiimvyVKyZ6bRCiBYq
         cqXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792456689; x=1793061489;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mojc9oUGKoL5xRIH+sn0yNL2fIvEPVJXRu+9L0mIv3A=;
        b=ksiKW3cCgRl7+tx70uABymo6yEPkC9t4Vpcefug/n6NTyMvPyS5XKtaSaUkdfWExF6
         YcaNKzrIZgtPpbNz/w8yfL6rpRbqKLcKUBMFIpykpyP0Zk09jjDoBTr0cxNUqBIXKYec
         x3EmjEMv0CzXXNNc4UFWG/4SITH/XogGfkknQKNwAY6BejcufbP4ZBMEEdmUIQIfONjD
         nSeMxgg+lssz7AAwTF6c+5vGlrFCJ18kf5gHr/qp+SS7xwN8zwPFFDGjLBvXxRN66qg/
         CJJHc6HfnUx4BDsk18IxVQewzqYotIiGhugoucNOTy1QSGRZmrE8cUPjoHt1NqAaqcCX
         Cblw==
X-Gm-Message-State: AFq9FYJNrYP1qxHscdGzf1KKNKYurlfWYfJwOW/d8DJDuqsaGosNoJhM
	D6oDZ59pc7y5/g+BpZFq81Pq0RpA1J8iMk8wBigBAwrrwY31orIIK11VaLDa0A==
X-Gm-Gg: AYBFou3Oyr8JsgnMPIIS5TpAg/vs8+tpiL64ABSDfHa4BH/pG18H2wvZwUIgkj1vVkF
	mEaMeXkrTs3iXNCi2C2+gSFmBXIOtEEjH1+8wLt9QqkdcxjAz4KK5TziMGWXnUjC7Jsee7EkTEE
	cwUA99JkqEuMzInppgeKMoJlsD5Q6f+6XRFnYSnmnt/lXlXPEShzkXXayV6HGm00Tby2FsCOO+S
	G+pAZ1YWEw58CPNonLxvl/s11lRhtKYnhqL2zJvRh6tqbx/teXvX8fl5YRL0Qq0UmiYZV7yas3u
	ThWf40wHfIUTWqURfRghHgZ6osEGOn+nGGR4+XlG3Nx4LoqhM9svwy141mKb/SEhVtAsoU7pzSS
	rzTrf+rm2nBw8E0HPYvGJ/cvy/7NJBx2/epryP6duLro/ma644ldTuUK7RuUAp8PqslGFXdhP7w
	D58t8Uz7k19LuD8tWIZ+b7oD2LsTdy0IXY0KHzvLhp4K+qsriLTwstkfNKPxJVIMCDnBj1ywx44
	8LgBHiCB6CWqq2eaEaNi4/eiDO5niAY73m9cQ==
X-Received: by 2002:a05:6820:200d:b0:6f9:6bb7:180e with SMTP id 006d021491bc7-70352879bafmr5888724eaf.4.1792456689470;
        Mon, 19 Oct 2026 17:38:09 -0700 (PDT)
Received: from Zephyrus.localdomain ([66.188.87.142])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8429b57870fsm10373383a34.0.2026.10.19.17.38.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 17:38:07 -0700 (PDT)
From: Vincent Fazio <vfazio@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: brgl@kernel.org,
	Vincent Fazio <vfazio@gmail.com>
Subject: [libgpiod][PATCH 10/14] bindings: python: bump ruff linter dependency
Date: Mon, 19 Oct 2026 19:37:24 -0500
Message-ID: <20261020003728.13669-11-vfazio@gmail.com>
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

