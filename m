Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CAB14BEE22;
	Sat, 12 Sep 2026 12:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789216555; cv=none; b=HRg7MbLMCrNoIPoJTtgGgLNwBY6wMr5b0VjjO8hr0TTjFaPBH9ZK7mOayBG8Mv0ApZjw4MEuPfm3PbNVhaLYS0v7AgKFJIK8X190z0pEJibf+QmUsg2dJl0p8PLhcjuIbWbHU0QjE1z2GAoTON4+c9l34u3tYNrrVp1aQr1SvWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789216555; c=relaxed/simple;
	bh=TWZEC54bLK00kXeOtabiyWj+qzrU5BA86uJhYlmW8gU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=t8seQPS/HvhmwTGGG8DPx+/c2HXvw0ECEOyc0FdkPFQjGuoVUBS7qwajjTbn+OQMpKuZkzH/3qnhlXJvXF/skHNwaZYt+HSSlunj1gYEefE6oo15LfOZ8LwfETl2wGnmTKiWuwN2IFGzYWH+VQe51fGqItSBR7SHpm/uNOQ5rAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WdlQW2kg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WdlQW2kg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4756A1F000FF;
	Sat, 12 Sep 2026 12:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789216553;
	bh=xNb0L15IXhfLloKf7VB3JE2WPDpU2+nArFv5hqH0SMs=;
	h=From:To:Cc:Subject:Date;
	b=WdlQW2kgQ6nhpMp/ElbDXC/6Tbcux+aFtmwfyrAUhB2rvegpnQ0arUmMYcZRmifru
	 HLsr6dZVoaziY3yzgbRXl6Z/lBESwgc6K/m6AsHkwHjwjO53kKc+PlTc+e2RhZSD/7
	 H8I78VaqHN9NXsHCjgDSun21fGCSDCs9Xv/mDPrwWPZce8jCnYw87qKh3o/ESxGTDT
	 jRhRXiB5OUZUAobTNFwCKA2YES30+IAuvWpFIKhIUYQo30rIxjITZS9zNhAiC2uaV8
	 lCIM/kEbBKKgaYdhluOSIJ75yDN0G6PKG3Kap7m50NGZOmzLiaEBWN5ZT0d05hcp0J
	 CDj6mSdBGLFpA==
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
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	tzungbi@kernel.org
Subject: [PATCH v13 0/3] drivers/base: Introduce revocable
Date: Sat, 12 Sep 2026 20:35:26 +0800
Message-ID: <20260912123529.7951-1-tzungbi@kernel.org>
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
- Dynamic allocation: no user yet; I could find it later.

[1] https://lpc.events/event/17/contributions/1627/
[2] https://lpc.events/event/19/contributions/2262/
---
v13:
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

Tzung-Bi Shih (3):
  revocable: Revocable resource management
  revocable: Add KUnit test cases
  gpio: Leverage revocable for accessing struct gpio_chip

 .../driver-api/driver-model/index.rst         |   1 +
 .../driver-api/driver-model/revocable.rst     | 425 +++++++++++++
 MAINTAINERS                                   |  11 +
 drivers/base/Makefile                         |   2 +-
 drivers/base/revocable.c                      | 302 +++++++++
 drivers/base/test/Kconfig                     |   5 +
 drivers/base/test/Makefile                    |   4 +
 drivers/base/test/revocable-test.c            | 576 ++++++++++++++++++
 drivers/gpio/gpiolib-cdev.c                   |  77 +--
 drivers/gpio/gpiolib-sysfs.c                  |  31 +-
 drivers/gpio/gpiolib.c                        | 259 ++++----
 drivers/gpio/gpiolib.h                        |  28 +-
 include/linux/revocable.h                     | 220 +++++++
 13 files changed, 1700 insertions(+), 241 deletions(-)
 create mode 100644 Documentation/driver-api/driver-model/revocable.rst
 create mode 100644 drivers/base/revocable.c
 create mode 100644 drivers/base/test/revocable-test.c
 create mode 100644 include/linux/revocable.h

-- 
2.53.0

