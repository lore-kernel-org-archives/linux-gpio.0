Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AE03493625;
	Thu, 10 Sep 2026 13:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789047328; cv=none; b=Okjj7O+HyvoZfmNSCgg6nSBZrt0o57w2HL+R8RhGVY4rQAxMB6ff4o54fLICDeeZx9mWgaSYZsV8F078LnbjSMvQA6gLSAn6kGvH5iHYJN5NOtHGlBhW58xg5i/Emns/AWvb8816dp3IvvFjQIT+fpyKRJqXZF2SykeEMpWA2fE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789047328; c=relaxed/simple;
	bh=HwQDBz5oLzKG9qLyiXZqxlvO7T32/h+XjqXU5wEETFo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BzlxhyabZWnQnvu4Cbnmu3qdzoWrNgbkhn1t0sGVzEHVDTY9veO8tT2FpXVXD2UFTntZeaKufzr+A7WkP82E+3JRTYEXQEVMJBtO06CQLyfytQxZgXkT8DZXrCM7M7lj/aZ1K7JB9gLUb+Fin0tCasbO6OJXyUdf6ooFcQipOmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=kaDox7Tv; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="kaDox7Tv"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D9B72204C;
	Thu, 10 Sep 2026 06:35:21 -0700 (PDT)
Received: from e142021.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EB7123F528;
	Thu, 10 Sep 2026 06:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789047325; bh=HwQDBz5oLzKG9qLyiXZqxlvO7T32/h+XjqXU5wEETFo=;
	h=From:To:Cc:Subject:Date:From;
	b=kaDox7TvjHq/wLCyMuQdsXIbtx5DQsNGh6oyDgT/Cxvxv7vQRdS5r1UxLlsU8LSqJ
	 TIOw8AIde6Yiqu5gR4NsOicFXr/Jc9q71hdDMzsKKlAsCNGeBJb1UaJkp4aCk+sooD
	 wpvyIg4tLtxqqDtTqACV790BKbDzA3cExEwNs8JA=
From: Andre Przywara <andre.przywara@arm.com>
To: Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Yixun Lan <dlan@gentoo.org>,
	Enzo Adriano <enzo.adriano.code@gmail.com>,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 0/7] pinctrl: sunxi: Add Allwinner A733 support
Date: Thu, 10 Sep 2026 15:35:11 +0200
Message-ID: <20260910133519.459011-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

more than a year(!) after the RFC, now the first "proper" version of the
pinctrl and GPIO IP support for the new Allwinner A733 SoC. I originally
had planned to prepend the GPIO_GENERIC support [1] here, but there are
quite some nasty details to solve there, and I don't want to jeopardise the
hardware enablement for this SoC on this rework. LinusW, I hope you can
forgive me for dropping this rework (just for this series), I still want
to work on this, but it takes more time. I do understand this would make
you to give up some of your leverage on this topic then, so please let me
know if that's fine for you. I can elaborate on the GPIO_GENERIC
problems if you like.
So compared to the RFC this is mostly a rebase, dropping one patch that
has already been merged (RFC PATCH 2/9 "pinctrl: sunxi: pass down flags
to pinctrl routines"). I also dropped the patch that introduces the GPIO
set/clear optimisation, using the new separate registers, as this would
become obsolete with the adoption of GPIO_GENERIC.
Changelog below, based on v7.3-rc1.

[1] https://lore.kernel.org/linux-arm-kernel/20260313000652.11470-1-andre.przywara@arm.com/

================================
Add GPIO and pinctrl support for the new Allwinner A733 SoC.
With all our abstractions and data structure driven code, life could
have been so easy, but Allwinner decided to change the layout of the
MMIO register frame, which requires all kinds of special handling and
code changes here and there. Hopefully this new layout (which admittedly
looks more future proof) will stay around for a while, but I am not
holding my breath on this.

In summary, the changes are:
- Each GPIO bank now occupies 128 bytes instead of just 36 or 48.
- PortA (not implemented on the A733) starts at offset 0x80, not at 0.
- The non-bank specific registers are moved into this gap at the
  beginning.
- There are two new registers per bank, to set or clear bits in the GPIO
  data register, to allow for single-write, lockless GPIO settings.
- The drive level register is moved (to make room for the set/clr regs).
- The IRQ registers are moved into the now bigger respective bank control
  registers part, instead of being grouped separately, as before.

The series follows the usual pattern of refactoring first, to prepare
for the new MMIO frame layout (patches 1-3), then using the changed code
to enable support for this new generation, in patch 4/7.
Patch 5/7 adds the new DT bindings, patch 6/7 enables the secondary
controller, which curiously is not using the new layout, but looks very
similar to the secondary A523 pin controller.
The final patch 7/7 then adds the driver stub file, which just describes
the GPIO bank configuration and lists the one quirk bit that engages the
code changes added for the new layout.

Please have a look, review and test.
I tested this on a Cubie A7Z board.

Cheers,
Andre

Changes in v1:
- rebase on v7.3-rc1
- drop already applied RFC patch 2/9
- drop SET/CLEAR register patch


Andre Przywara (7):
  pinctrl: sunxi: rename SUNXI_PINCTRL_NEW_REG_LAYOUT
  pinctrl: sunxi: only use PortK special handling on A523
  pinctrl: sunxi: refactor IRQ register accessors
  pinctrl: sunxi: support A733 generation MMIO register layout
  dt-bindings: pinctrl: add compatible for Allwinner A733
  pinctrl: sunxi: a523-r: add a733-r compatible string
  pinctrl: sunxi: add support for the Allwinner A733

 .../allwinner,sun55i-a523-pinctrl.yaml        |  6 +-
 drivers/pinctrl/sunxi/Kconfig                 |  5 ++
 drivers/pinctrl/sunxi/Makefile                |  1 +
 drivers/pinctrl/sunxi/pinctrl-sun20i-d1.c     |  2 +-
 drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c |  3 +-
 drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c   |  2 +-
 drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c   | 50 +++++++++++++
 drivers/pinctrl/sunxi/pinctrl-sunxi.c         | 41 +++++++----
 drivers/pinctrl/sunxi/pinctrl-sunxi.h         | 71 +++++++++++++------
 9 files changed, 139 insertions(+), 42 deletions(-)
 create mode 100644 drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c


base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
-- 
2.47.3

