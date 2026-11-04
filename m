Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.246.1.125
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793813362;
	b=ARvalLpiHhd5ouymkZhLwX+d71FjiTfMSHLaSoWsePg2t1hoKfrAC/AGYzXGTox2bun/
	 L2ttARs30gg2R3kY9B9OGzR9UnsuWBQ5LQgZFFoyMDFe3tVNOkREn3ce4hFtBkf7DhM1j
	 S/mDQfXazHqC7yJMOx90XO/OXk9ACgPR9Likq6pWe8qJz6VGW96yJzeOEkZEhp7YB5R6O
	 HP/iWbmtr9MBecgCkuflBAq79plhRZcW+KjknBgtTVkIf1O1LcFk5WEg3W1HEm/zVZfOC
	 DBaduXISY29aJthu9GVJYovnQ2xPPU1gvHUW49YvpL31r/GBhuNSFxYqdsV40dk+4KA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793813362;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:X-Farcaster-Flow-ID:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=gFEJqRgH61IzklfvA3n605Eh40ve416hHe8RcUF6mxQ=;
	b=bjBOqnGwmacGbRD2Rj9ADJlSKjA3QVngp0nIF5iZU0bhDiiH726a88yMXyh3937Plmxi
	 dffOtRZPm0Qzpw8/jv+tTlsZCDjUwTU836ewG6lZiwRgM+wm4LMgvunMKxwkrVRDEPDtJ
	 CCyk7olLgul+wEKgVxtDENUJhgSOXdX/EEIPZ0pHg7Hr/33FQ4OK8d2zwaLfUQoG23s0G
	 RqFezDgE2Kpvml3B2nPZ65cpTXc4W/TTXSwruTigSblTpEqhOlFdNxJ7zxOnaBZavOhb6
	 pq0Owe8WU0X/qlWUuFPT2tZ2EBBook30LmCcb6tRDWIDpHoKg1qY5jSBiHMua8r6bVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.com;
	spf=pass smtp.mailfrom=amazon.com;
	dkim=pass header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=DvTeETXw;
	arc=none smtp.remote-ip=44.246.1.125
Received: from pdx-out-002.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-002.esa.us-west-2.outbound.mail-perimeter.amazon.com [44.246.1.125])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63E8F6083629;
	Wed,  4 Nov 2026 17:29:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63E8F6083629
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=DvTeETXw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1793813362; x=1825349362;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=gFEJqRgH61IzklfvA3n605Eh40ve416hHe8RcUF6mxQ=;
  b=DvTeETXwqIsqHuJichv6o6UFSLbkQqkvW0PqDJbtHtq7VjGTFSBj4xu8
   +8luNC7RuUjLGy8zsJacZL+CsBGbsiS4xaDUR1FAItCUuIfQldUnIvSE/
   IwBjJVZGU40IJu433xz2lyhHhc5kSnfxl5JdNsy+/Vzj5Go0+aoywy/J9
   Z6erxydIzzvhCf8JDAhZL6SLWbKsCYZYPEuT+W4xlF2z4JHO8TII8BxDP
   MadcwpIS6tPqxaHeYrsvgKr2xFVQ9F+VODjeyAvBiu/iMitlGuT7Z65C7
   ncUP2dd0YFEY+B0IZvF78KbQ+WXo3Uj2KrXvWJ2reewTjSHj3oc/W0twT
   Q==;
X-CSE-ConnectionGUID: CUqxpeSkSBCTTU11AbvPSQ==
X-CSE-MsgGUID: KeNNsBn9QgKFHR6iA1dSzA==
X-IronPort-AV: E=Sophos;i="6.27,195,1787011200"; 
   d="scan'208";a="33106334"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-002.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 17:29:19 +0000
Received: from EX19MTAUWA002.ant.amazon.com [205.251.233.178:14926]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.52.149:2525] with esmtp (Farcaster)
 id d71e35ff-853a-41e5-9909-cd966cd05095; Wed, 4 Nov 2026 17:29:19 +0000 (UTC)
X-Farcaster-Flow-ID: d71e35ff-853a-41e5-9909-cd966cd05095
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA002.ant.amazon.com (10.250.64.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Wed, 4 Nov 2026 17:29:19 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56; Wed, 4 Nov 2026
 17:29:17 +0000
From: Eliav Farber <farbere@amazon.com>
To: Andrew Morton <akpm@linux-foundation.org>, Rodolfo Giometti
	<giometti@enneenne.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
	Fabio Estevam <festevam@gmail.com>, Takashi Sakamoto
	<o-takashi@sakamocchi.jp>, Eliav Farber <farbere@amazon.com>,
	<devicetree@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v7 0/4] pps-gpio: restore pin mux on unbind and shutdown
Date: Wed, 4 Nov 2026 17:29:08 +0000
Message-ID: <20261104172912.26456-1-farbere@amazon.com>
X-Mailer: git-send-email 2.47.3
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
Content-Type: text/plain
X-ClientProxiedBy: EX19D031UWA001.ant.amazon.com (10.13.139.88) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

Andrew,

v6 [1] was acked by Rodolfo Giometti on all four patches and reviewed by
Bartosz Golaszewski, Rob Herring and Linus Walleij, and Rodolfo asked for
it to go through your tree, as LinuxPPS has no tree of its own [2].

I am bumping it as a standalone thread because I mistakenly posted each
new version in reply to the previous one, so v6 may have gone under the
radar. v7 is v6 rebased onto v7.4-rc1 with the tags collected; the code
is unchanged, and the only other change is one paragraph in the commit
message of patch 4 (see "Changes in v7" below).

[1] https://lore.kernel.org/all/20260923182243.41060-1-farbere@amazon.com/
[2] https://lore.kernel.org/all/4a62a294-ae53-455b-bc00-d16088684682@enneenne.com/

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
the probe error paths that patch 4 then converts to gotos. Patch 2 is a
small preparatory fix restoring the echo-GPIO guard in remove() that a
later cleanup dropped, since patch 4 mirrors remove()'s teardown in the
new shutdown() and would otherwise carry the same latent issue. Patch 3
documents the optional "default"/"inactive" pinctrl-names in the binding;
patch 4 implements the driver side.

Tested on an Amazon AL11 K2V6 JRD10 board: binding/unbinding each pps-gpio
device toggles the corresponding pin-mux register between the GPIO
function and the alternate ec_ptp_trigger_in function as expected, and
re-binding restores the GPIO function via the core-applied "default"
state. Reading the mux register with the device left unbound confirms the
"inactive" mux persists. Also tested with a pps-gpio node that describes
no pinctrl at all, where probe, remove and shutdown behave as before.

For the probe-failure path (see below), a forced-defer test confirmed that
a probe failing after pps_gpio_get_pins() releases the pins to "inactive",
the core re-applies "default" before the next attempt, and the mux settles
back at "default" once probe finally succeeds, with no spurious PPS event
or warning across the cycles.

Changes in v7:
- Post as a standalone thread instead of in reply to previous version.
- Rebase onto v7.4-rc1 (applies cleanly; no code change)
- Patch 4: commit message only, note that shutdown() also runs on boards
  with no "inactive" state, where the IRQ/echo teardown is harmless but
  not needed (Rodolfo Giometti). No code change, so the tags are kept
- Collect tags: Rodolfo Giometti's Acked-by on all four patches; Bartosz
  Golaszewski's Reviewed-by on patches 1-2; Rob Herring's Reviewed-by on
  patch 3; Linus Walleij's Reviewed-by on patch 4

Changes in v6:
- Patch 4: fold the pps_register_source() failure path into the same
  dev_err_probe() + goto err_release_pins style as the other two paths
  sharing that label, with a commit-message note that it is a logging
  change, not a fix (Rodolfo Giometti)
- Patch 3: unchanged. Rob Herring confirmed the two-entry
  ["default", "inactive"] items list is fine as-is; the "sleep" state
  discussed on the list is not something this binding needs
- No other functional changes

Changes in v5:
- Patch 1: use dev_err_probe() on both error paths instead of a bare
  dev_err() + return, so the propagated -EPROBE_DEFER is logged at debug
  level rather than spamming the console and the code is emitted
  symbolically. Drop Bartosz's Reviewed-by as the patch changed
  materially (Rodolfo Giometti)
- New patch 2: restore the data->echo_pin guard around the echo-timer
  teardown in remove(), dropped by commit fde046a8c490. timer_delete_sync()
  on a never-initialised timer trips debug_assert_init() under
  CONFIG_DEBUG_OBJECTS_TIMERS. Split out so patch 4's new shutdown() does
  not reintroduce it (Rodolfo Giometti)
- Patch 4: resolve the v4 probe-failure open question by taking option "A
  + keep the NULL guard": look the pinctrl states up first in probe(),
  before pps_gpio_setup(), and route the setup() failure through
  err_release_pins too, so every path the driver can act on restores
  "inactive". Guard the echo-timer teardown in the new shutdown() with
  data->echo_pin, matching remove() (Rodolfo Giometti)

Changes in v4:
- Patch 1: add Fixes: 161520451dfa and Bartosz Golaszewski's Reviewed-by.
  The hardcoded -EINVAL predates 4461d65176b4, so the tag points at the
  original driver rather than the descriptor conversion
- Patch (binding): rework per Rob Herring - drop the prose, use an ordered
  "items" list ("default" then "inactive") with minItems: 1, fixing the
  "['default', 'inactive'] is too long" dt_binding_check error

Changes in v3 (addressing Sashiko's and Rodolfo Giometti's review):
- New preparatory patch to propagate the gpiod_to_irq() and
  request_threaded_irq() error codes instead of overwriting them with
  -EINVAL
- Do not constrain pinctrl-names to a fixed ["default", "inactive"] tuple
- Treat -ENODEV from devm_pinctrl_get() as "no pinctrl described" rather
  than a probe failure; keep propagating everything else incl.
  -EPROBE_DEFER
- Restore the "inactive" mux on probe failure via a new err_release_pins
  label
- Warn if applying the "inactive" state fails rather than ignoring the
  pinctrl_select_state() return

Changes in v2 (all addressing Rodolfo Giometti's review):
- Rename the released state from "idle" to "inactive" ("idle" is the
  runtime-PM state in pinctrl-state.h)
- Look the state up in the driver instead of pinctrl_pm_select_idle_state(),
  removing the CONFIG_PM dependency
- Fix shutdown(): tear down (free_irq/timer) before the mux change,
  matching remove()
- Require a "default" state whenever "inactive" is present and reject the
  mismatch

Link: https://lore.kernel.org/all/20260916134744.46354-1-farbere@amazon.com/ [v1]
Link: https://lore.kernel.org/all/20260916182641.9768-1-farbere@amazon.com/ [v2]
Link: https://lore.kernel.org/all/20260917075611.47881-1-farbere@amazon.com/ [v3]
Link: https://lore.kernel.org/all/20260919171157.5502-1-farbere@amazon.com/ [v4]
Link: https://lore.kernel.org/all/20260922103051.5257-1-farbere@amazon.com/ [v5]
Link: https://lore.kernel.org/all/20260923182243.41060-1-farbere@amazon.com/ [v6]

Eliav Farber (4):
  pps: clients: gpio: propagate probe error codes
  pps: clients: gpio: only tear down the echo timer when it exists
  dt-bindings: pps: pps-gpio: document optional pinctrl states
  pps: clients: gpio: release pins to an inactive state on remove and
    shutdown

 .../devicetree/bindings/pps/pps-gpio.yaml     |  14 +-
 drivers/pps/clients/pps-gpio.c                | 127 ++++++++++++++++--
 2 files changed, 129 insertions(+), 12 deletions(-)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.47.3

