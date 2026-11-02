Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793636266;
	b=4sQd0352MlmCKWBvbN2BiQm67X3tniw8CrcHC2d51Rwt/ldiZ3OWFHSMsFqYcdh0Zh3m
	 C1pwD76owzz3l0jar1m1yJOh3/pryjnYLzxoU+hKCpzFd0LR+gy8odQuAsI2KQdm3ickm
	 qdf1wt7AXNznQagJFqOiYgkLfGCpov1R9ND2ZvwOsJhDebmRFnxPBGe7BGU3xdDKx6B+L
	 dPhwO8y/2DQevJl0f+cuhE0Ug3Y1lpocuaWDDMBrVjs4W/XoX1qdPzUOpt0yXEQ0DRDo6
	 XEm4rgR3jw0JZpHmbS/VSochrOeaJxuWi4/4n0wfdAzXnnyvBN97j4oHxeJPSpQ+Ixg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793636266;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=kzVTbu8ingZzRNtB29p8thlcSTm8N1ZaYOvktC0Fylw=;
	b=W8xiGR9t1jgRX7gsKW2el+F6Iy9BrLg8ja/hPaClkE/2bbRND8d6idKklmLhPjgPDLLU
	 mmBGZtuKS6za44cWAJAby1zHNWp8b351isJM9Yftf3+uo6LOZZVfcONfLFcahTGuOJqXV
	 0Eh2abDFfwxy27JXFKH8Z/9vnWZ6wbn33NZg3iHklBqphALYfHT7X1zkPGGqXqaxUBJYn
	 NSbVCUGWZP67xCgtxP8EtZV8wT64LM8WFBMegV1qQwwFap01rF36KzPEW+0ZbwYa1dUl/
	 4fpwl1xqhbZH44YF6jQO/h9k5krekLg79XyItyRLRPJiPBQHQToEdSbnZG57VGQM3Og==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nAkx31Uv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7886A6082C7E;
	Mon,  2 Nov 2026 16:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nAkx31Uv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D126E1F00A16;
	Mon,  2 Nov 2026 16:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793636265;
	bh=kzVTbu8ingZzRNtB29p8thlcSTm8N1ZaYOvktC0Fylw=;
	h=From:To:Cc:Subject:Date;
	b=nAkx31Uvokdrwrk/m7jCzOA1pkrdNDvpF7KKD5MsBA6HExo95RCTDUFf6dVXm2Vze
	 Q0ln28UEuKU3jUr9Ri/hlr+JDhCHpAHETA5To5Q6vw+mC+A+J/kAFOdrc0hN30qRNf
	 9sDSNWLdV8VhRlSOCMa1MGKBzJJSgGmcFeqHHH59ry/2xdb2J0XAxkvgSF/UraKYia
	 GGjd20NWwOjO2KJUMgIUnmyhd7Kd1ij39MJfkhByu4Q5hEsynP83RVUWRzONJ6Ny2a
	 wB3Qc4oMbsN+bC5ZTktw5z3m67+o7piYqWUs89l/Xd+d8NpjxPDGGfVSK7XKoI72V0
	 iWpO/WJiBoCGA==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Johan Hovold <johan@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	tzungbi@kernel.org
Subject: [PATCH v15 0/4] drivers/base: Introduce revocable
Date: Tue,  3 Nov 2026 00:17:05 +0800
Message-ID: <20261102161710.24076-1-tzungbi@kernel.org>
X-Mailer: git-send-email 2.53.0
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

This series introduces the "revocable" mechanism, a synchronization
primitive designed to prevent Use-After-Free errors.

- Patch 1 introduces the revocable which is an implementation of ideas
  from the talk [1][2].

- Patch 2 adds KUnit test cases.

- Patch 3 transitions the UAF prevention logic within the GPIO core
  (gpiolib) to use the "revocable" mechanism.

  The existing code aims to prevent UAF issues when the underlying GPIO
  chip is removed.  The patch replaces that custom logic with the
  generic "revocable" API, which is designed to handle such lifecycle
  dependencies.  There should be no changes in behavior.

- Patch 4 transitions the reset controller framework to use the
  "revocable" mechanism.

Since v9, there are two ways to manage the resource provider handle.
- Embedded allocation: patch 3 is the user.
- Dynamic allocation: patch 4 is the user.

[1] https://lpc.events/event/17/contributions/1627/
[2] https://lpc.events/event/19/contributions/2262/
---
Greg, Danilo, Rafael, Johan,

Since the revert in February, the API and lifetime model have been
redesigned, and the series now has concrete in-kernel users for both
embedded allocation (gpiolib in patch 3) and dynamic allocation (reset in
patch 4).

Do you think this series is heading in a direction that driver-core can
accept, or do you still have fundamental concerns with the approach?  I
would appreciate your thoughts on whether we should continue working on
this series.
---
v15:
- Rebase onto v7.4-rc1.
- Fix resource and kthread cleanup on error paths in KUnit tests.
- Rename revocable struct members in GPIO and reset subsystems.
- Separate patch 4 (KUnit tests for reset controller) out.

v14: https://lore.kernel.org/all/20261011121246.162759-1-tzungbi@kernel.org
- Rebase onto next-20261009.
- See changelogs in [PATCH v14 1/5] and [PATCH v14 2/5] for revocable
  API and KUnit test updates.
- Add patches 4 and 5 for the reset controller framework.

v13: https://lore.kernel.org/all/20260912123529.7951-1-tzungbi@kernel.org
- Rebase onto next-20260911.

v12: https://lore.kernel.org/all/20260908134223.13638-1-tzungbi@kernel.org
- Rebase onto next-20260907.
- Drop patch 4 and 5.

v11: https://lore.kernel.org/all/20260513091043.6766-1-tzungbi@kernel.org
- Rebase onto v7.1-rc3.
- Squash patches 4 to 7 into patch 3.  A single patch for GPIO.

v10: https://lore.kernel.org/all/20260508105448.31799-1-tzungbi@kernel.org
- Unify handling of embedded and dynamic allocation.

v9: https://lore.kernel.org/all/20260427135841.96266-1-tzungbi@kernel.org
- Rebase onto v7.1-rc1.
- Remove the selftests patch as it makes less sense to test revocable
  APIs via kselftests.
- Merge patches 7 to 11 from
  https://lore.kernel.org/all/20260213092958.864411-1-tzungbi@kernel.org
  into the series.
- Merge patch from
  https://lore.kernel.org/all/20250923075302.591026-5-tzungbi@kernel.org
- Merge patch from
  https://lore.kernel.org/all/20250912081718.3827390-6-tzungbi@kernel.org

v8: https://lore.kernel.org/all/20260213092307.858908-1-tzungbi@kernel.org
- Rework on the revocable APIs.  See changelog in [PATCH v8 1/3] for details.

v7: https://lore.kernel.org/all/20260116080235.350305-1-tzungbi@kernel.org
- Rebase onto next-20260115.

v6: https://lore.kernel.org/all/20251106152330.11733-1-tzungbi@kernel.org
- Rebase onto next-20251106.
- Separate revocable core and use cases.

v5: https://lore.kernel.org/all/20251016054204.1523139-1-tzungbi@kernel.org
- Rebase onto next-20251015.
- Add more context about the PoC.
- Support multiple revocable providers in the PoC.

v4: https://lore.kernel.org/all/20250923075302.591026-1-tzungbi@kernel.org
- Rebase onto next-20250922.
- Remove the 5th patch from v3.
- Add fops replacement PoC in 5th - 7th patches.

v3: https://lore.kernel.org/all/20250912081718.3827390-1-tzungbi@kernel.org
- Rebase onto https://lore.kernel.org/all/20250828083601.856083-1-tzungbi@kernel.org
  and next-20250912.
- The 4th patch changed accordingly.

v2: https://lore.kernel.org/all/20250820081645.847919-1-tzungbi@kernel.org
- Rename "ref_proxy" -> "revocable".
- Add test cases in Kunit and selftest.

v1: https://lore.kernel.org/all/20250814091020.1302888-1-tzungbi@kernel.org

Tzung-Bi Shih (4):
  revocable: Revocable resource management
  revocable: Add KUnit test cases
  gpio: Leverage revocable for accessing struct gpio_chip
  reset: Leverage revocable for accessing struct reset_controller_dev

 .../driver-api/driver-model/index.rst         |   1 +
 .../driver-api/driver-model/revocable.rst     | 440 +++++++++++++
 MAINTAINERS                                   |  11 +
 drivers/base/Makefile                         |   2 +-
 drivers/base/revocable.c                      | 305 +++++++++
 drivers/base/test/Kconfig                     |   5 +
 drivers/base/test/Makefile                    |   2 +
 drivers/base/test/revocable-test.c            | 598 ++++++++++++++++++
 drivers/gpio/gpiolib-cdev.c                   |  77 +--
 drivers/gpio/gpiolib-sysfs.c                  |  32 +-
 drivers/gpio/gpiolib.c                        | 262 ++++----
 drivers/gpio/gpiolib.h                        |  28 +-
 drivers/reset/core.c                          | 125 ++--
 include/linux/reset-controller.h              |   3 +
 include/linux/revocable.h                     | 220 +++++++
 15 files changed, 1781 insertions(+), 330 deletions(-)
 create mode 100644 Documentation/driver-api/driver-model/revocable.rst
 create mode 100644 drivers/base/revocable.c
 create mode 100644 drivers/base/test/revocable-test.c
 create mode 100644 include/linux/revocable.h

-- 
2.53.0

