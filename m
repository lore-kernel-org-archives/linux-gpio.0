Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793816516;
	b=kj4ParJnd7LQ7VPkXh/N3NT2+38g4r7MuzUHPIXWYcbAX1/TVtVvoRX/Tv19SAOjYv1m
	 OLVV5WXwtNbfD2Mzf1ZBVG2vcs/iTlLoN05vmZL7KuRGHPLuEx1KquTzq2YgqB+7BTxIu
	 wkn5P3PFr/K4A5qBFcOEtUCJr3CsabDrUlRZRpVUfjJSIjdJJjAZ0vyaaCjtuyyPHdDBP
	 b8NSEa+A2b2MY8YGBfbBBXWZGrl3kufZtl/T8pcyA1100pExQ6R+rDh3/51d82XPlxLXa
	 rchHOXevhq2l+Q1laQH60Ay1pY1VBjzLYUd4nRuIedy7OMUo7xKTrioibPsP2U6p6aQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793816516;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=k1ZMud2ru8EkHu0dKN3690ViMmseOOoYb0VNfefUgMo=;
	b=pn2zqvbap1p/F7May6/4NFHXrX9uTUY6xCd53cnFoCYItfqnTu9Mc4X9Xa5r6+ISqmO/
	 cQjS4nBtWgfb1xb2edymfHbnGb68gh0FSXItkdUVLDVKW4aaMNqfUioVza1Q2ArfUq4AB
	 RsChPaHNNYrPYDCgz5kNExVV8OVEJ2f3iPHCqcdwBA3zpg7VAYL/blRTJ4+eVUO404g+g
	 5+QQ21cQz/tH2vtHFRypaUmRA+YrYKv476mxUQVSYTfreguqBa2RmbRGxylEiNCALWco7
	 E+MCf6XgRW2LFQ4L1aWqTR0tnVB4CBAr8m+1hfIuDwvUNtlqXL7hcghfFvDwKUa+bnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LyoDgvxA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD8FF606C444;
	Wed,  4 Nov 2026 18:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LyoDgvxA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6310B1F00A15;
	Wed,  4 Nov 2026 18:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793816515;
	bh=k1ZMud2ru8EkHu0dKN3690ViMmseOOoYb0VNfefUgMo=;
	h=From:To:Cc:Subject:Date;
	b=LyoDgvxAYlFHEsaQVGXWkDl9VrOFwYWV968c/p1mk2AmHvcD2T2YAMx/ymj8bS6E2
	 wrK5xS1lJuIozBzYLtj222S2rl50qz8y3+RLDKgJxN5NvgbMWzEuK50h+UW0a7JpDK
	 JY5ZP4FgSFiJzuiDy24ACo45vQkUzVm+ZphJM/9UX/wiZnKt+GEKd3xwKgjyO0o1i/
	 4/w+7dGXBTU1xQOhOux5Ud0AQkSNTokEw0DYdN3R3QLj8BZCgrsPq2MPMwKyRzECcz
	 1eYPVViYWcjMdxwap7RsV4eAp5SJsj2I0jYznEw+5mymwXMXk96iyW1ycaISwK/kjY
	 IDc+pI/eMBhNA==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org
Cc: linux-kernel@vger.kernel.org,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	ChiYuan Huang <cy_huang@richtek.com>,
	Chris Morgan <macromorgan@hotmail.com>,
	Douglas Anderson <dianders@chromium.org>,
	Eduardo Candelaria <jedu@slimlogic.co.uk>,
	Esteban Blanc <eblanc@baylibre.com>,
	Graeme Gregory <gg@slimlogic.co.uk>,
	Gyungoh Yoo <jack.yoo@maxim-ic.com>,
	Jerome Neanne <jneanne@baylibre.com>,
	Jiale Yao <yaojiale02@163.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Laxman Dewangan <ldewangan@nvidia.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Mal Nadar <m.nirmaladevi@ltts.com>,
	Mark Brown <broonie@kernel.org>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Stephen Warren <swarren@nvidia.com>,
	Uday Khare <udaykhare77@gmail.com>,
	Wentao Liang <vulab@iscas.ac.cn>,
	linux-gpio@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: [PATCH 00/10] regulator: Fix teardown races, reference counting, and error handling
Date: Wed,  4 Nov 2026 18:20:50 +0000
Message-ID: <20261104182148.1176116-1-lee@kernel.org>
X-Mailer: git-send-email 2.56.0.398.g882cbad275-goog
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

These issues were reported by Sashiko.

This series addresses ten bugs across the regulator core and regulator
drivers:

- Clear the caller's handle pointer (*handle = NULL) in
  regulator_irq_helper_cancel() instead of assigning NULL to the local
  variable.
- Remove the redundant arizona_ldo1_remove() callback that caused a
  premature and double gpiod_put() on config.ena_gpiod (whose lifetime
  is owned by the regulator core).
- Flush rdev->disable_work with flush_delayed_work() before releasing
  rdev->supply in regulator_unregister().
- Cancel micsupp->check_cp_work on device teardown in arizona-micsupp
  using devm_work_autocancel().
- Take a dedicated device reference for rdev->supply in set_supply() and
  retain the local lookup reference throughout regulator_resolve_supply().
- Initialise rdev->last_off with ktime_get_boottime() in
  set_machine_constraints() to match _regulator_do_enable() and
  _regulator_do_disable().
- Propagate GPIO lookup errors (such as -EPROBE_DEFER) from
  bq257xx_reg_dt_parse_gpio() instead of leaving an ERR_PTR in
  pdata->otg_en_gpio.
- Fix the LDO4 n_voltages count in tps6594-regulator so selectors 0x3f
  through 0x74 are reachable.
- Guard against a NULL idata pointer for BBAT, SDBY, and VRTC in
  max8907_regulator_probe().
- Check the pm_runtime_resume_and_get() return value in
  rt6190_out_enable().

Cc: "André Draszik" <andre.draszik@linaro.org>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: ChiYuan Huang <cy_huang@richtek.com>
Cc: Chris Morgan <macromorgan@hotmail.com>
Cc: Douglas Anderson <dianders@chromium.org>
Cc: Eduardo Candelaria <jedu@slimlogic.co.uk>
Cc: Esteban Blanc <eblanc@baylibre.com>
Cc: Graeme Gregory <gg@slimlogic.co.uk>
Cc: Gyungoh Yoo <jack.yoo@maxim-ic.com>
Cc: Jerome Neanne <jneanne@baylibre.com>
Cc: Jiale Yao <yaojiale02@163.com>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Laxman Dewangan <ldewangan@nvidia.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>
Cc: Mal Nadar <m.nirmaladevi@ltts.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Stephen Warren <swarren@nvidia.com>
Cc: Uday Khare <udaykhare77@gmail.com>
Cc: Wentao Liang <vulab@iscas.ac.cn>
Cc: linux-gpio@vger.kernel.org
Cc: patches@opensource.cirrus.com

Lee Jones (10):
  regulator: irq_helpers: Clear caller handle in
    regulator_irq_helper_cancel()
  regulator: arizona-ldo1: Avoid double gpiod_put() on enable GPIO
  regulator: core: Flush delayed disable_work before releasing supply in
    regulator_unregister()
  regulator: arizona-micsupp: Cancel check_cp_work on device teardown
  regulator: core: Hold supply device reference until constraints are
    resolved in regulator_resolve_supply()
  regulator: core: Use ktime_get_boottime() in set_machine_constraints()
  regulator: bq257xx: Propagate GPIO error in
    bq257xx_reg_dt_parse_gpio()
  regulator: tps6594-regulator: Fix LDO4 n_voltages in tps6594_ldo_regs
  regulator: max8907: Avoid NULL idata dereference in
    max8907_regulator_probe()
  regulator: rt6190: Check pm_runtime_resume_and_get() return value in
    rt6190_out_enable()

 drivers/regulator/arizona-ldo1.c      | 16 ----------------
 drivers/regulator/arizona-micsupp.c   |  6 +++++-
 drivers/regulator/bq257xx-regulator.c | 20 ++++++++++++--------
 drivers/regulator/core.c              | 22 ++++++++++++----------
 drivers/regulator/irq_helpers.c       |  2 +-
 drivers/regulator/max8907-regulator.c |  3 ++-
 drivers/regulator/rt6190-regulator.c  |  4 +++-
 drivers/regulator/tps6594-regulator.c |  2 +-
 8 files changed, 36 insertions(+), 39 deletions(-)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.56.0.385.gac671c819a-goog

