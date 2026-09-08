Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDEE3552940;
	Tue,  8 Sep 2026 13:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788874999; cv=none; b=GtfCRzUDNHKFNDXrqeLMWuIaQWb0XEuhHVLSw75teVA2XVsFGoJxLsCs+K9MedHU5092gCtshmyfI8aFzcK8/ltO72MbYhnSNuudoj2EjCqrqkB9QqL/NeDLNj4ZudDFXyRqs9hgPh3wC2LFfYp4j9d8Yw9p+K27v3vgEpWjWJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788874999; c=relaxed/simple;
	bh=4gpJZI3owGqPGMuPntEB9R9BYzgKwJeBnpOe4mK3Zxc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=A+2xA7Sa9dGbe1BT/Nk8pCys7G6aLQEo5cWP73VrWqVf8r8RIcucdL9qSZk+fTNNODQNSdgRz7tom79tVyrcUAGxgAnbCzdQMa2cd8UU2SGCnVux8G8x2GdrLvtEje2sz96bxPDnbXrseII72smLnuCuC7kILEHdXpIWY8Gmxzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 530C61F00A3E;
	Tue,  8 Sep 2026 13:42:53 +0000 (UTC)
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	driver-core@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	tzungbi@kernel.org
Subject: [PATCH v12 0/3] drivers/base: Introduce revocable
Date: Tue,  8 Sep 2026 21:42:20 +0800
Message-ID: <20260908134223.13638-1-tzungbi@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
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

Since v9, there are two ways to manage the resource provider handle.
- Embedded allocation: patch 3 is the user.
- Dynamic allocation: no user yet.

[1] https://lpc.events/event/17/contributions/1627/
[2] https://lpc.events/event/19/contributions/2262/
---
v12:
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

Tzung-Bi Shih (3):
  revocable: Revocable resource management
  revocable: Add KUnit test cases
  gpio: Leverage revocable for accessing struct gpio_chip

 .../driver-api/driver-model/index.rst         |   1 +
 .../driver-api/driver-model/revocable.rst     | 384 +++++++++++++++++
 MAINTAINERS                                   |  11 +
 drivers/base/Makefile                         |   2 +-
 drivers/base/revocable.c                      | 267 ++++++++++++
 drivers/base/test/Kconfig                     |   5 +
 drivers/base/test/Makefile                    |   4 +
 drivers/base/test/revocable-test.c            | 406 ++++++++++++++++++
 drivers/gpio/gpiolib-cdev.c                   |  77 ++--
 drivers/gpio/gpiolib-sysfs.c                  |  31 +-
 drivers/gpio/gpiolib.c                        | 259 +++++------
 drivers/gpio/gpiolib.h                        |  28 +-
 include/linux/revocable.h                     | 204 +++++++++
 13 files changed, 1438 insertions(+), 241 deletions(-)
 create mode 100644 Documentation/driver-api/driver-model/revocable.rst
 create mode 100644 drivers/base/revocable.c
 create mode 100644 drivers/base/test/revocable-test.c
 create mode 100644 include/linux/revocable.h

-- 
2.53.0

