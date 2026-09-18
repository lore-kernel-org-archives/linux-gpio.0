Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC4013AB5DA;
	Fri, 18 Sep 2026 09:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789724292; cv=none; b=CQgOEWPmOifK4sj8uEBgQT2JKxgZJSPGmi577NtAzlpMGmWoLOk2kWljivXSxSs2O9AhqjWv7U6PV0DWmUSd3bLzKypMeXbM2sXFZHACjbZ7nryptWoJE7chZvwLo+7epWUVcN13xWL8ngytxIQnB4tnmQa1JRoVJQzzPYgF500=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789724292; c=relaxed/simple;
	bh=514CWGMpspXGhpSoI23KtukaddntqJsVm/wLht4BqcA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Chhs3UwkmSXX+RsCQ3Fqio2edQ1+lvM4syhYgrRAMyqhdkYTVu5diNqf9pHprtPmeQPTq5VBoNy/eD4xfjKMZ4cBweFzKIqr1q05iIHzRPdWX8utLO6e6z5ivmJBpHDhCM2vT47ZBGXeTpKiwrgvUIitaB3C1TOnKniFppCX3l4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A68141F000FF;
	Fri, 18 Sep 2026 09:38:10 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] pinctrl: renesas: Updates for v7.4
Date: Fri, 18 Sep 2026 11:38:08 +0200
Message-ID: <cover.1789723325.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi Linus,

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-pinctrl-for-v7.4-tag1

for you to fetch changes up to 0cd4a7b3a4883970df3ae8814d9aabdecf65a81e:

  pinctrl: renesas: rzt2h: Add a helper for reading PFC (2026-09-15 10:49:07 +0200)

----------------------------------------------------------------
pinctrl: renesas: Updates for v7.4

  - Add SD power source support on RZ/G3L,
  - Add I3C power source support on RZ/G3S,
  - Miscellaneous fixes and improvements.

Thanks for pulling!

----------------------------------------------------------------
Biju Das (1):
      pinctrl: renesas: rzg2l: Add SD channel POC support for RZ/G3L

Claudiu Beznea (5):
      pinctrl: renesas: rzg2l: Generalize power source code
      pinctrl: renesas: rzg2l: Drop defines present in struct rzg2l_hwcfg
      pinctrl: renesas: rzg2l: Unify power source handling
      dt-bindings: pinctrl: renesas,rzg2l-pinctrl: Document missing I3C power source option
      pinctrl: renesas: rzg2l: Add RZ/G3S support for selecting I3C power source

Cosmin Tanislav (8):
      pinctrl: renesas: rzt2h: Fix used_irqs indexing in clear path
      pinctrl: renesas: rzt2h: Wire up struct gpio_chip::set_config
      pinctrl: renesas: rzt2h: Remove unused struct rzt2h_pinctrl::gpio_range
      pinctrl: renesas: rzt2h: Restore correct pin mode on IRQ free
      pinctrl: renesas: rzt2h: Setup IRQ in .irq_{request,release}_resources()
      pinctrl: renesas: rzt2h: Fix reading pin value in IRQ function
      pinctrl: renesas: rzt2h: Reuse helpers
      pinctrl: renesas: rzt2h: Add a helper for reading PFC

Josua Mayer (1):
      dt-bindings: pinctrl: renesas,rzg2l-pinctrl: Allow input/output-disable

 .../bindings/pinctrl/renesas,rzg2l-pinctrl.yaml    |   4 +-
 drivers/pinctrl/renesas/pinctrl-rzg2l.c            | 410 ++++++++++++++-------
 drivers/pinctrl/renesas/pinctrl-rzt2h.c            | 182 +++++----
 3 files changed, 403 insertions(+), 193 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
