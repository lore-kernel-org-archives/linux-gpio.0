Received: from pdx-out-006.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-006.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.26.1.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C057F4E0B87;
	Tue, 22 Sep 2026 10:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.26.1.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790073069; cv=none; b=iiMzf5irYDIrQKlcKFdDfCjaNiCiYgIR93dAurC8d2ci/5RCJEjMbH71c7Oh3HS9SMesfSCXlqOJn2Hwd/DEPzYJSxSiekj9CgdlLs6Wax2xpFVZpi4s9fEsdG3gFLuG4TKBpTmNSKCE35DQL0/VK+WzqDaNpIMudex84rNbSK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790073069; c=relaxed/simple;
	bh=kijmClNdlWt7n5dplRoy4Xhn6MW1m2jwYvJI33YOmwk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C0onyC/rglzAWpnxvSOwwZ0sZe6f3dFlvE01OLbo2AnLYlqqXqV6SnCVj6E0sEjMSaVhVhiXykVl3UrMDJ/hqq9ZpG6M3TapnxRxgFqt64LTl2ASbXLumAInCurs6/eOax0o0zE8ovjdFIq7+o5V5niQ6yjQ73IjlciNDg+/EPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=ZwhKUbVw; arc=none smtp.client-ip=52.26.1.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="ZwhKUbVw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1790073066; x=1821609066;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=q1MwI5UxY9USzV2qnLkzAMkePAIfgay/bcyAOT7OyhU=;
  b=ZwhKUbVw4DIKgEYMIsZ8Vw4sPcaeHrvhxg+o9fad7+41AlscDhThCNyw
   7D8L7UVnuqNMHgUNw7P7BcgvHuElceUNZ882dRGjBXxf9qRAPsZQIMlkq
   LszqXx2LKDydsMvab3wpyzrrP0dAvWSBS9YTZPZxGAY7dsRSDQ+O3A5eg
   /QUK8QjZ3GB9g3DPjbZ4F8YCUJ1iSWEM20ykMBt5H/eyc2shadEAYsUy7
   1zuSShvU/wumtvYBeFrTjJF59vepBWWWPco2pqmItjsg+GWuLcfc1jbY+
   fnMTtfVvYknm2jj4b1ylEhK5epuB8pUZwLsSteccodPRVOQpmUWdQKi+/
   A==;
X-CSE-ConnectionGUID: JPXZ7l52Rn+J9Z9gCosa0Q==
X-CSE-MsgGUID: OPWx/mp5RP2RPnpFcT/oTg==
X-IronPort-AV: E=Sophos;i="6.27,116,1787011200"; 
   d="scan'208";a="29366157"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-006.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 10:31:00 +0000
Received: from EX19MTAUWA002.ant.amazon.com [205.251.233.178:31675]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.1.232:2525] with esmtp (Farcaster)
 id 7d136ed5-aa00-4fe0-b2c6-5634d5be14e4; Tue, 22 Sep 2026 10:31:00 +0000 (UTC)
X-Farcaster-Flow-ID: 7d136ed5-aa00-4fe0-b2c6-5634d5be14e4
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA002.ant.amazon.com (10.250.64.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49;
 Tue, 22 Sep 2026 10:30:59 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49; Tue, 22 Sep 2026
 10:30:57 +0000
From: Eliav Farber <farbere@amazon.com>
To: Rodolfo Giometti <giometti@enneenne.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
	Fabio Estevam <festevam@gmail.com>, Andrew Morton
	<akpm@linux-foundation.org>, Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Eliav Farber <farbere@amazon.com>, <devicetree@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 0/4] pps-gpio: restore pin mux on unbind and shutdown
Date: Tue, 22 Sep 2026 10:30:47 +0000
Message-ID: <20260922103051.5257-1-farbere@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260919171157.5502-1-farbere@amazon.com>
References: <20260919171157.5502-1-farbere@amazon.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D036UWB002.ant.amazon.com (10.13.139.139) To
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

Eliav Farber (4):
  pps: clients: gpio: propagate probe error codes
  pps: clients: gpio: only tear down the echo timer when it exists
  dt-bindings: pps: pps-gpio: document optional pinctrl states
  pps: clients: gpio: release pins to an inactive state on remove and
    shutdown

 .../devicetree/bindings/pps/pps-gpio.yaml     |  14 +-
 drivers/pps/clients/pps-gpio.c                | 123 ++++++++++++++++--
 2 files changed, 127 insertions(+), 10 deletions(-)


base-commit: 93f51579e7df248780214094418f205253383cc5
-- 
2.47.3

