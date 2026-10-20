Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792456660;
	b=d5qAf3Tl5upxgS3uUX3FG4Fi1W0OI44tClyyR1Mp4fidLqm/K+2ad78VXDvCz6FIVz1S
	 L4xcAIl8wrqDg8d2y2i3gl7ol8cBOQPkvYiZ07iX0Sp5FX2blk09DmBA5Qv8rhaorUFV/
	 s7tygpylzvwrzEhzUPxBdKo1/fawORgfhZS3DQu9QptYgEDf4mCKS/3Bre9sXzLDLmvCM
	 xGmjFH1Jsm9C9BjORjPBh21hEXJ+J4Og60rcX3rHOljooXKP3jE8Ddwxns6R6i0JLuRd0
	 80of2/A+xYlctP+OOO3cVp8egl0JS7dCrmOBR3MBAQ2nX8FatlhRHxXX/OIOV56rUPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792456660;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=fTJxB+oLDt9/ZVBYMO6jox5RaQYFcz+pA8ZQQ2DHW6U=;
	b=ArE3qZHIjH3Xc5XcXXqc1vRDvPCC7lMY7ycDNhJoySBQfW3y4Hcgz4wtZDsqzuNsv73L
	 up/TBhVfEt5+/GX0bwfphv32zcSQO9etEKoQ8h/8MCvGK8bYPCxFM6UHOQjLoQPmlsQCA
	 UtL/Ph6t21eAGuId06eWjnFSwXp+UgKPDySvxpwKmJYiUneXcQ6CiGPRGUc2SV+D/GZgR
	 JtUVKsK5KyxrAIEwgdmKNfXkzI27bOLCPpDFDN9OhC1UA3KZoQT89Oz/9+HxoVo/Vkiuv
	 5grq/UtThc0aCBcBKZ3U5auZjBy43h0TwVXNGvTd3L90rbAIIKLNsp5m6YeD/Cu4yuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lnqapCKw;
	arc=none smtp.remote-ip=209.85.210.41
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83422606A31A
	for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2026 00:37:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83422606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lnqapCKw
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-833e671ee9fso1810698a34.0
        for <linux-gpio@vger.kernel.org>; Mon, 19 Oct 2026 17:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792456658; x=1793061458; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fTJxB+oLDt9/ZVBYMO6jox5RaQYFcz+pA8ZQQ2DHW6U=;
        b=lnqapCKwxWFmPBce3XVscxBf6NXcXECbrEikkeFAGOeMmUNr1a4WMNGUhkagjik5k5
         wc/3BOSP/iCCUANwmixpZqg+HPDyTOMMh3L0YcyM9/l7rC1/btrKhq+Nsd+Rvu3fLFlu
         BbOPMYdoIsr4tZCzBr4FMFCNpDJsEyUnyXWtM6Q36/GbI7de6szy0gls/Y+CwsFnuge6
         706mf7MH8W/B+15BYCP1sARkgQC2ZdsXot2/Ts5km0Rpy+ZcuA7uiQrF3Y4DxkzJ5NRh
         X0p6b1unG0XLzMNPF+Nw/LwxSFrSI5rlU4kcFxewlNH4ii05CIgFJFXOh2fq9tLlsXT9
         jRxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792456658; x=1793061458;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fTJxB+oLDt9/ZVBYMO6jox5RaQYFcz+pA8ZQQ2DHW6U=;
        b=IbvVy3FFtXI7iTTeMU+mB+NuwLOL+na/Cwp/npCrkIeOWdOzcJBIxyTj4dCWpBZxXQ
         cwCpo504sLWQ/NNINN5jbaON3buyEmKe6saRRg8mqmxMMVnsioXCeLKKPh1elkLqe/tV
         ue14vgtakfC0FqMc3lBE7HWzu8eeKWMYNtCKcIsP02tIJN4235RFYYpT9rGngIxBh+J+
         z4JZGRK1M03XU7F2jPGQ9oZKw0Tk6XIbcWhsiL9Q8ddGdSDq81uLg/1PKWx40KBSTh2o
         2mvdv1pob0pT8Q97kcoUWjUxp3sw/PWhdkir4VwKZhVSu7cgb0TXgtfc5HkglEjobjZ2
         91ZA==
X-Gm-Message-State: AFq9FYJdu1IdMrkkOaXfnd8h1nd2tVBi7BFLg9x4++i4U/TY3Ncbyygx
	Ueh56mzEWUPE3I8UkSyk2mMECqe6CxQKSJBFzjGWntpQEXK8JfnIpT0jR6JdiA==
X-Gm-Gg: AYBFou0UrqPyWYOiep0E2+bdj8a62Ez9qjvM54U1ieAEJmoA6Q9al9LhsnetkC+ObeO
	E9Gt/+rY4Zqx8SJ8rP/5zbyb1NzspMmeAm51GcQuydOobwU0e3kSXcp7MzsLyht+/1TQSjl5ivS
	EJf06+uCpYDhbxDEuFz0cvym2sjPvvmMnnJorg5Yjymx4YyV9kGwTD8bn6MTtJRb3XSejIfBChy
	VIzwt2tLcc1h09eo3oBxfOqiHUl48oIhERzLRT3oxLiSiCqSyEUy86d41cSNyfRpLOpuEzKD2cY
	fqgImE31C5UJn1FeTKYgtXI4P5+vuBKG0vXJtfvgje9zbSllkcEb3PAw1soYROp4SSVIdCwPtw1
	HxFKjPw9auiKQ42nXTZHyf5898hQR4Vohc6MWFUBNxGEkc3oasUVB9KY8V4jxtA0YeZ7Yfa8ltt
	I3rGhAX7c88bwM2M+sdR8NBpZT1RAfhvoQhFUb8y+Y5rAFJ3CN/CyA5d6GS3R582US+YN07iAvu
	y2E3m3NGEE7ztGziLvyG0oGhkO4ZxQNtv3+
X-Received: by 2002:a05:6830:490e:b0:834:b015:aed2 with SMTP id 46e09a7af769-844fd106633mr8204210a34.6.1792456658366;
        Mon, 19 Oct 2026 17:37:38 -0700 (PDT)
Received: from Zephyrus.localdomain ([66.188.87.142])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8429b57870fsm10373383a34.0.2026.10.19.17.37.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 17:37:36 -0700 (PDT)
From: Vincent Fazio <vfazio@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: brgl@kernel.org,
	Vincent Fazio <vfazio@gmail.com>
Subject: [libgpiod][PATCH 00/14] bindings: python: cleanup and support Python 3.15
Date: Mon, 19 Oct 2026 19:37:14 -0500
Message-ID: <20261020003728.13669-1-vfazio@gmail.com>
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

This series prepares the Python bindings for release to support Python
3.15 by performing some minor clean ups, fixes to the bindings
themselves, and fixes to the script that generates the PyPI artifacts.

Patches 1-9 apply fixes for linter callouts based on the default ruleset
selected by ruff 0.17. There are no functional changes.

Patch 10 bumps the minimal version of ruff to lint the bindings,
simplifies the linter configuration in pyproject.toml, reformats any
non-compliant files, and applies linter noqa flags where necessary.

Patch 11 fixes some compile warnings that were noticed when building the
bindings for Python 3.15.

Patch 12 adds the trove classifier to advertise Python 3.15 support.

Patch 13 fixes a few small oversights re directory validation in the
script used to generate the PyPI artifacts.

Patch 14 bumps the dependencies in the PyPI artifact script to use newer
utilities that support generating wheels for Python 3.15.

Note: changelog entries are not included in case changes are accepted
partially.

Vincent Fazio (14):
  bindings: python: _internal: sort exports
  bindings: python: _internal: simplify poll_fd calculation
  bindings: python: _internal: collapse isinstance checks
  bindings: python: setup: use a context manager to manage files
  bindings: python: line: sort exports
  bindings: python: line_request: simplify __bool__ expression
  bindings: python: chip: simplify __bool__ expression
  bindings: python: chip: drop redundant exception in reraise
  bindings: python: chip: use literals for dict/list and declare types
  bindings: python: bump ruff linter dependency
  bindings: python: include Python.h before other headers
  bindings: python: advertise Python 3.15 support
  bindings: python: fix directory validation in artifact script
  bindings: python: bump dependencies in artifact script

 .../examples/toggle_multiple_line_values.py    |  4 ++--
 bindings/python/generate_pypi_artifacts.sh     |  8 ++++----
 bindings/python/gpiod/_internal.py             |  8 +++++---
 bindings/python/gpiod/chip.py                  | 14 +++++++-------
 bindings/python/gpiod/ext/internal.h           |  2 +-
 bindings/python/gpiod/ext/module.c             |  2 +-
 bindings/python/gpiod/line.py                  |  2 +-
 bindings/python/gpiod/line_request.py          |  2 +-
 bindings/python/pyproject.toml                 | 18 +++++++-----------
 bindings/python/setup.py                       | 17 ++++++++++-------
 bindings/python/tests/gpiosim/ext.c            |  2 +-
 bindings/python/tests/tests_line_request.py    |  3 ++-
 12 files changed, 42 insertions(+), 40 deletions(-)

-- 
2.43.0

