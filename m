Received: from mx.adeep.su (mx.adeep.su [185.250.0.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C02344D01C;
	Wed, 10 Jun 2026 15:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.250.0.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781106074; cv=none; b=aeTAcr5ZYXNnoX1zy1rNfJ2K99cCtHvl7W8LhjqTpGzYOdAePPo3gGhmsH0/087otQYgdzS/0oCZCkHYUF5nn39Z72vFbXJWAFGgdmLwOqc8UIMPwzZplzIbdQZBxjJ3Ysp+aP/2hb95x4+fu7cSVB4YPAksQN9D5dKwnqJ0q78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781106074; c=relaxed/simple;
	bh=7ub1gbQwZ/d1m6aycEJFfGiUqHJ1vkgBlNcGdzDmHt4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SH3IvQk3t1m4DlsivH8pJWOeKpb2ND5b/iC21L0J4tbsYUmmFMXyHsOPH1EZ2ByCK4L283lYlvc3SP1VMYu+cMUeiNKXnXLmblww6qB3U8l417qYGR7xRPbRH5FVItoK5Tm2Ho3VyK4rBlWjaIaHseCHZyFjkBgSmxrF++ulclo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=baodeep.com; spf=pass smtp.mailfrom=baodeep.com; dkim=fail (2048-bit key) header.d=baodeep.com header.i=@baodeep.com header.b=V6EMpbO2 reason="signature verification failed"; arc=none smtp.client-ip=185.250.0.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=baodeep.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baodeep.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baodeep.com header.i=@baodeep.com header.b="V6EMpbO2"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 003B6176A2A;
	Wed, 10 Jun 2026 18:34:03 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=baodeep.com; s=dkim;
	t=1781105658; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=wWnMIfRoPEPairQ9ngOUWFlbPHVSKvx5vY/dr6ad4k4=;
	b=V6EMpbO2Bb3ARZsvqwyY97TkfCoZYL2xO4Iz0o5bbtiiWbHYw+4vzh4fHA2v9Zj8JxnkaE
	csPVm7SSVcH1F1blcmNBUPk1cbWnbYDxEI8vXymB0LmwlQqE3Sq+bEyRJ67yUaYuPdBGUR
	nGLQa9sx1/+II/MlFDB0zLxoXkBIqUp1N8g/PzqOX4saB+OHoMztZ6lPgpF0vDnzT4ghmb
	NBqObMmumjBlCRpBz54Rvib3JeK0UA4AyUKd7mSWLX8TcEhQLsxW+pKXJESHIXOzEBHAaA
	cqtXXMLEwMl66oBXWzu65atkZPN/bv9SYPcE0ALQZK51hXLxVzDtUgzP7v8TSg==
From: Viacheslav Bocharov <v@baodeep.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Diederik de Haas <diederik@cknow-tech.com>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] gpio: fix sleeping-in-atomic in shared-proxy; restore meson non-sleeping
Date: Wed, 10 Jun 2026 18:32:09 +0300
Message-ID: <20260610153329.937833-1-v@baodeep.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

gpio-shared-proxy chooses its descriptor lock (mutex vs spinlock) from
the underlying chip's can_sleep, but under that lock it calls config and
direction ops that reach sleeping pinctrl paths. On a controller with
non-sleeping MMIO value ops the lock is a spinlock, so a sleeping call
runs from atomic context:

  BUG: sleeping function called from invalid context
    ... pinctrl_gpio_set_config <- gpiochip_generic_config
    <- gpio_shared_proxy_set_config (voting spinlock held)
    <- ... <- mmc_pwrseq_simple_probe

This was reported on Khadas VIM3 and worked around for Amlogic by
commit 28f240683871 ("pinctrl: meson: mark the GPIO controller as
sleeping"), which marked the whole meson controller sleeping. That
workaround broke atomic value-path consumers: w1-gpio (1-Wire bitbang)
no longer detects devices, because its IRQ-disabled read slot calls the
non-cansleep gpiod_*_value() and now hits WARN_ON(can_sleep) per bit.

Patch 1 fixes the proxy locking generically (always a sleeping mutex).
Patch 2 then restores meson can_sleep=false, fixing 1-Wire.

Patch 1 has a trade-off: a proxied GPIO becomes sleeping, so consumers
gating on gpiod_cansleep() change behaviour. No current device needs
atomic (non-cansleep) value access on a shared GPIO -- every report
(Khadas VIM3, ODROID-M1, my test on JetHub D1+) is a shared reset line
(eMMC/SDIO pwrseq or PCIe reset) driven through the cansleep accessors,
which is what the proxy exists to vote on. An alternative that keeps
atomic value access (split locking) is possible but adds a second lock
and new race windows. I went with the simpler, verified approach and
would appreciate guidance on whether the atomic value path must be
preserved.

The two are a unit: patch 2 must not be applied without patch 1,
otherwise the original VIM3 splat returns on boards that share a meson
GPIO -- please keep the order. I have not Cc'd stable; I will request
stable backports separately once both patches have landed.

Viacheslav Bocharov (2):
  gpio: shared-proxy: always serialize with a sleeping mutex
  pinctrl: meson: restore non-sleeping GPIO access

 drivers/gpio/gpio-shared-proxy.c      | 43 ++++++---------------------
 drivers/gpio/gpiolib-shared.c         |  9 ++----
 drivers/gpio/gpiolib-shared.h         | 31 ++++++++-----------
 drivers/pinctrl/meson/pinctrl-meson.c |  2 +-
 4 files changed, 24 insertions(+), 61 deletions(-)

-- 
2.54.0

