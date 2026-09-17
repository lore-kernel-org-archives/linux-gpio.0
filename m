Received: from pdx-out-001.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-001.esa.us-west-2.outbound.mail-perimeter.amazon.com [44.245.243.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA3D83A7D81;
	Thu, 17 Sep 2026 07:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=44.245.243.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789631786; cv=none; b=NgJR1qqJx9Lpacg9HcsiqinAiJPHla4ql1rxyq9kZI4HJVou4scRCcZKyUTHqiMBh//r5rmRHbK0XkmpbAJF7xijFHyG0Yza6NHAFdRgKlsJWwu2W7G/TmOjSWc6Nu3jql3s1X30CMpMF0+02e4IhOsBZcSn1JMR1Qs7tSl/PfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789631786; c=relaxed/simple;
	bh=q2imLB7DAcnODQLGYGDQw1pxfE00L145xo82F9cM6Ok=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QJofnfKyS8nLIhQzujsjS43ccZVqCBaaZi6zdogO3iUmXZZmPnHWPBiy6cOdHK/fP677bvkz23J/2Rsu14wafsmz4LE78HfahbfYtaPGj6ccb5APofXYpyevCKzutoIhRh5CHGy9+z4WZonrs19cNQBJOnX0uQyxo6JDwAZxlDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=AYjrEC0p; arc=none smtp.client-ip=44.245.243.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="AYjrEC0p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1789631784; x=1821167784;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZdtsmIJ+5HEo2vvt44CeG3gDnKZgeRd/9JLiG2dN6I0=;
  b=AYjrEC0pmYsjATjwDzFtic36IpFdZfWWT6CFaJIEVqOX9xoQisedHH7s
   kZZVlGtjYvEQpZhZp06QMEsB94vp6jbPs9Igwu5KYSTK5UNFGxQ4tiOYr
   lakErc3WUi6lQetCyYXd0M1YEoacC4yI+7QT1XHdzvd0El9vXkiYR08Yh
   CTzTiT4r4YWNRMDB0TbBtIToxAp4ex6GeHjWeuNc31NEcwaDMVqL2cZed
   dp1CM6ChEgyD1zNU5gA1JKOWAahVH/izqZFTIQ5xHART1k7uM4as5hOAU
   +VL+bN5591CzEyHB4xfRpFENmtH8DNObDzAZ1wbNzLUqKQbBV1mlm1fIF
   w==;
X-CSE-ConnectionGUID: HntPkuUmQaievKElN+gbrA==
X-CSE-MsgGUID: 1zIy5RyHT5yfGmk4TWRzhw==
X-IronPort-AV: E=Sophos;i="6.27,103,1787011200"; 
   d="scan'208";a="28408864"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-001.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 07:56:22 +0000
Received: from EX19MTAUWB001.ant.amazon.com [205.251.233.104:25044]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.23.40:2525] with esmtp (Farcaster)
 id 1bc143c1-2357-4219-852f-18020763d2e5; Thu, 17 Sep 2026 07:56:22 +0000 (UTC)
X-Farcaster-Flow-ID: 1bc143c1-2357-4219-852f-18020763d2e5
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB001.ant.amazon.com (10.250.64.248) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.46;
 Thu, 17 Sep 2026 07:56:22 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.46; Thu, 17 Sep 2026
 07:56:19 +0000
From: Eliav Farber <farbere@amazon.com>
To: Rodolfo Giometti <giometti@enneenne.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
	Fabio Estevam <festevam@gmail.com>, Andrew Morton
	<akpm@linux-foundation.org>, Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Eliav Farber <farbere@amazon.com>, <devicetree@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 0/3] pps-gpio: restore pin mux on unbind and shutdown
Date: Thu, 17 Sep 2026 07:56:08 +0000
Message-ID: <20260917075611.47881-1-farbere@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260916182641.9768-1-farbere@amazon.com>
References: <20260916182641.9768-1-farbere@amazon.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D036UWB001.ant.amazon.com (10.13.139.133) To
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

Eliav Farber (3):
  pps: clients: gpio: propagate probe error codes
  dt-bindings: pps: pps-gpio: document optional pinctrl states
  pps: clients: gpio: release pins to an inactive state on remove and
    shutdown

 .../devicetree/bindings/pps/pps-gpio.yaml     |  16 ++-
 drivers/pps/clients/pps-gpio.c                | 102 +++++++++++++++++-
 2 files changed, 113 insertions(+), 5 deletions(-)

-- 
2.47.3

