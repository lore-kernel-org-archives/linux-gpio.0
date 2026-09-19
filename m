Received: from pdx-out-008.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-008.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.42.203.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F447377023;
	Sat, 19 Sep 2026 17:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.42.203.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789837929; cv=none; b=JR7GRFU39LbM8Q4hikv3kzKnY2Y8lKlwBqQpVeFm7oOY6cMWmJsK191HgOQAz69XPJmPJMpJMnmshVhV2cv+jXKcui3P/7Fw7E+oplWj7u534fZbO0e1h4oK8vW095IHLRGMhOrXMqehZyRh8Ll4sHgbEjMZvoxi2HgWiXf5vNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789837929; c=relaxed/simple;
	bh=YKZin5QxfewXSYMIhfYSZoq62qqHbGB19BPh2rZv7/4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=e6xALO9o46CrjoR99JaVup2N6kcz4GvY3GYnqpJ7+DajZ5sElSU5cPeGjDPOG9KqEoovykzzhX7V0BDe/dNYq1KxEF5S/RrXxKe7x1ORBxrqi9s51Ko9odBofQ9/WL09rOT0Nf62srbHvPxaauF5cwvudhG2L9vwUlGGGPBKQhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=R/5dX5Vp; arc=none smtp.client-ip=52.42.203.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="R/5dX5Vp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1789837928; x=1821373928;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jl/UmkuU1Kk2puKbD9FgSHPvWH0KYxx8quuxvr6bGs4=;
  b=R/5dX5VpBGAx9GskHEiVVNf/WikDIklbnIwUr4Eo5RghBU56y8YHQd6G
   oa+aUmryqseNCSml/eqyi91q8jtu4ZpTiISgswKELVszCn5fFh3f5YArB
   WDSe2/3lYXm59inJj3vLA7LCdwOZj+U2/TTXubU7vHj0vYShhZSNNra2p
   hQ8R/jdGZ+z8qzq0kbFNVHsIlceXDvckS6e29dtykT9q+I2IWrRnt1Gpb
   kHPV5DE1HdIa32QNCQy7CfYc93RE2wBYI7YXcHtEnLdsvg/w75JvaDgFN
   RJLDpdzfyy/AfdeO9nwrtkmSxIY1nSpcMjV8M3KIo1ASFn4geeY0UfhG7
   Q==;
X-CSE-ConnectionGUID: rG/1sQX7RaiOtY+Ebxmtmw==
X-CSE-MsgGUID: +hvfO1qeRj2YWGs/wMcNpg==
X-IronPort-AV: E=Sophos;i="6.27,111,1787011200"; 
   d="scan'208";a="29146811"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-008.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2026 17:12:06 +0000
Received: from EX19MTAUWC002.ant.amazon.com [205.251.233.51:25178]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.16.195:2525] with esmtp (Farcaster)
 id aedfb6b3-42fb-4df0-ade6-458558e1be8e; Sat, 19 Sep 2026 17:12:05 +0000 (UTC)
X-Farcaster-Flow-ID: aedfb6b3-42fb-4df0-ade6-458558e1be8e
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC002.ant.amazon.com (10.250.64.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.46;
 Sat, 19 Sep 2026 17:12:05 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49; Sat, 19 Sep 2026
 17:12:03 +0000
From: Eliav Farber <farbere@amazon.com>
To: Rodolfo Giometti <giometti@enneenne.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
	Fabio Estevam <festevam@gmail.com>, Andrew Morton
	<akpm@linux-foundation.org>, Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Eliav Farber <farbere@amazon.com>, <devicetree@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 0/3] pps-gpio: restore pin mux on unbind and shutdown
Date: Sat, 19 Sep 2026 17:11:54 +0000
Message-ID: <20260919171157.5502-1-farbere@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260917075611.47881-1-farbere@amazon.com>
References: <20260917075611.47881-1-farbere@amazon.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D035UWA002.ant.amazon.com (10.13.139.60) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

Some boards route the PPS input GPIO through a pin controller and mux the
pins to a different function when the pps-gpio driver is not active.

The driver core already selects the "default" pinctrl state before probe,
so the pins can be muxed for GPIO/PPS use while the driver is bound without
any driver change. Nothing, however, hands the pins back when the driver
is unbound or the system is shut down (for example before kexec), leaving
them stuck in the GPIO mux for the next kernel.

This series lets pps-gpio select an optional "inactive" pinctrl state in
remove() and shutdown(), so a board can describe the alternate mux there
and have it restored. The state is looked up and selected by the driver
itself (devm_pinctrl_get() + pinctrl_lookup_state() + pinctrl_select_
state()), so its meaning is unambiguous and it does not depend on
CONFIG_PM. It is a no-op for boards that do not describe an "inactive"
state.

Patch 1 is a small preparatory fix to propagate the gpiod_to_irq() and
request_threaded_irq() error codes (rather than a hardcoded -EINVAL) on
the probe error paths that patch 3 then converts to gotos. Patch 2
documents the optional "default"/"inactive" pinctrl-names in the binding;
patch 3 implements the driver side.

Tested on an AL11 K2V6 JRD10 board: binding/unbinding each pps-gpio device
toggles the corresponding PBS pin-mux register between the GPIO function
and the alternate ec_ptp_trigger_in function as expected, and re-binding
restores the GPIO function via the core-applied "default" state. Reading
the mux register with the devices left unbound confirms the "inactive"
mux persists. Also tested with a pps-gpio node that describes no pinctrl
at all, where probe, remove and shutdown behave as before.

Open question for the maintainers (patch 3): a probe that fails before
pps_gpio_get_pins() has run -- devm_kzalloc() or pps_gpio_setup() -- returns
without going through err_release_pins, so the pins are left in the
core-applied "default" state rather than "inactive". I did not change this
in v4 as I would like your guidance on the preferred approach; the trade-offs
are laid out at the end of patch 3's changelog. In short:

  A. Move pps_gpio_get_pins() to the top of probe and route the
     pps_gpio_setup() failure through err_release_pins too, so every path
     the driver can act on restores "inactive". (The devm_kzalloc() failure
     is inherently before the driver holds any pinctrl handle, so it cannot
     be covered by the driver in any option.)
  B. Keep v4 as-is and treat "inactive" as a successful-ownership concern:
     a probe that never looked up the state never took the pins, so leaving
     the core-applied "default" (long-standing behaviour) is acceptable.
  C. As A, but keep the release helper's existing NULL guard so it is robust
     regardless of ordering (belt and braces).

I lean towards B (the restore is meaningful only once the driver has taken
ownership), but I am happy to implement A/C if you prefer uniform failure
paths.

Changes in v4:
- Patch 1: add "Fixes: 161520451dfa (\"pps: new client driver using
  GPIO\")" and Bartosz Golaszewski's Reviewed-by. See the reply on the v3
  1/3 thread for why the tag points at the original driver rather than the
  descriptor conversion (4461d65176b4) Rodolfo suggested: the hardcoded
  -EINVAL on both error paths predates 4461d65176b4, which only switched
  gpio_to_irq() to gpiod_to_irq() and left those returns as context
- Patch 2: rework the binding per Rob Herring. Do not express the
  ordering in prose; use an ordered "items" list ("default" then
  "inactive") with minItems: 1, since pinctrl-0 is already implicitly
  "default" and its position is fixed. This also fixes the
  "['default', 'inactive'] is too long" dt_binding_check error seen on v3.
  Reword the commit message accordingly
- Patch 3: unchanged from v3

Changes in v3 (addressing Sashiko's and Rodolfo Giometti's
review):
- New preparatory patch 1: propagate the gpiod_to_irq() and
  request_threaded_irq() error codes instead of overwriting them with
  -EINVAL, and log the errno on the request_threaded_irq() failure. The
  pinctrl patch only converts those returns into gotos, so fixing the
  discarded errors separately keeps them out of the pinctrl change
- Do not constrain pinctrl-names to a fixed ["default", "inactive"] tuple
  in the binding. The driver looks the states up by name, so "inactive"
  may appear in any position and other states may coexist; the binding
  now only requires that a "default" state exists
- Treat -ENODEV from devm_pinctrl_get() as "no pinctrl described" rather
  than a probe failure. A DT device without a "pinctrl-0" property gets
  -ENODEV from the pinctrl core; that is expected, not an error. Real
  errors, including -EPROBE_DEFER, are still propagated
- Restore the "inactive" mux on probe failure too. The error paths after
  pps_gpio_get_pins() now go through a new err_release_pins label, so a
  probe that fails in gpiod_to_irq(), pps_register_source() or
  request_threaded_irq() no longer leaves the pins stuck in the
  core-applied "default" state
- Warn if applying the "inactive" state fails rather than ignoring the
  pinctrl_select_state() return silently
- Trim and de-duplicate the comments added in v2

Changes in v2 (all addressing Rodolfo Giometti's review):
- Rename the released state from "idle" to "inactive". "idle" is the
  runtime-PM state in pinctrl-state.h; overloading it for "driver not
  active" would clash with any future runtime PM or .suspend() and was
  being baked into the binding as ABI. "inactive" is not a well-known
  state, so no generic PM helper will ever auto-select it -- the driver
  drives it explicitly
- Look the state up in the driver (devm_pinctrl_get() +
  pinctrl_lookup_state() + pinctrl_select_state()) instead of
  pinctrl_pm_select_idle_state(), removing the CONFIG_PM dependency so a
  CONFIG_PM=n kernel that describes an "inactive" state now honors it
  instead of silently doing nothing
- Fix shutdown(): tear down in the same order as remove() -- free_irq()
  and timer_delete_sync() first, the mux change last -- so no IRQ or echo
  timer callback can drive a pin after it has been handed back to another
  function; shutdown() no longer changes the mux while the hardware is
  still live
- Require a "default" state whenever "inactive" is present and reject the
  mismatch, rather than releasing pins that were never put into a defined
  PPS state

Link: https://lore.kernel.org/all/20260916134744.46354-1-farbere@amazon.com/ [v1]
Link: https://lore.kernel.org/all/20260916182641.9768-1-farbere@amazon.com/ [v2]
Link: https://lore.kernel.org/all/20260917075611.47881-1-farbere@amazon.com/ [v3]

Eliav Farber (3):
  pps: clients: gpio: propagate probe error codes
  dt-bindings: pps: pps-gpio: document optional pinctrl states
  pps: clients: gpio: release pins to an inactive state on remove and
    shutdown

 .../devicetree/bindings/pps/pps-gpio.yaml     |  14 ++-
 drivers/pps/clients/pps-gpio.c                | 102 +++++++++++++++++-
 2 files changed, 111 insertions(+), 5 deletions(-)


base-commit: 4982d3552a3bf94de503acf93433277d08421de6
-- 
2.47.3

