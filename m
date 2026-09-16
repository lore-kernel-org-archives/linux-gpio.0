Received: from pdx-out-004.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-004.esa.us-west-2.outbound.mail-perimeter.amazon.com [44.246.77.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E88224A7C86;
	Wed, 16 Sep 2026 18:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=44.246.77.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789583230; cv=none; b=PdacNWZJKE/xca6rzj5MqDGx+DKHs9YnUcc7Oy/GpGfmOySeQq0hB5C/jJ71aaVMbuTV2bCZp3YnHM6IVDFQgxEbTnybE57IZnEUdLYakhKqfedcP7QcOF+XGmwkdLLfKhHQYyGYWKkvxLr3nrDo1l7q/h4IzTBJRKyswT22xa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789583230; c=relaxed/simple;
	bh=5iu8at4bHseY+qnJur33V97oSMRr/WWx9auH+Qn6Di8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Sn/iHuRU/kOqveIfxOjFDtpIz2cch3Cu7D357RncnwoQIStYiu9ur1BsmpEFJGlQsJjXvrnVOlNNlwt8aB0HpozUlu+YAX1oPs8YiqtKLllT1WIIIKhGmjscF6SCPsM0HsEZB2y8ZSk+JSWOiKmjCBVlch4Tjlr+2W/kENqOiaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=knV1Bwkt; arc=none smtp.client-ip=44.246.77.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="knV1Bwkt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1789583215; x=1821119215;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=K+tp4Ifgiz+juHPMXFHMhK8pmuPOCqKXIVBlkggvSdc=;
  b=knV1BwktUy1D+AUYU3s9+w7uky8UIsv5aN+3n3Nk1o3AioPaeKC5+G8+
   a93H+rlump206IJ5Me2iBQzJiFEcZvZtcQWKGT/FkaaAzAI4PdrvIs0A+
   4Q8a5UVP2JvzwXRA7Ad5CDqflBIvG68NsxDWEejSiqxUuuOWqUJdk9qBC
   ZTh0VAjIPb9t50dMEWRSTKYjnDZWBfBxCJkDd7t+lLBBtDmMwKNamLLnt
   6S+4te5R7XW92ZNctn4TS9SmY+z/MyUTXgzXuD2xRDSTDwETkKeJJ5Ryk
   MOEwgETjjvyZ0svOP7Elja0tdXc/NJKhaw2KschVn/nxRAW5CrZAcFWg8
   Q==;
X-CSE-ConnectionGUID: EsG3BvBuTGyhEPI1LLCrvw==
X-CSE-MsgGUID: IXFfP0s8SX6jy+Ucrd3LsA==
X-IronPort-AV: E=Sophos;i="6.27,103,1787011200"; 
   d="scan'208";a="28850154"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-004.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 18:26:50 +0000
Received: from EX19MTAUWB001.ant.amazon.com [205.251.233.51:1257]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.16.195:2525] with esmtp (Farcaster)
 id 3294550a-847d-4a91-9b29-30bee7d3a3d7; Wed, 16 Sep 2026 18:26:49 +0000 (UTC)
X-Farcaster-Flow-ID: 3294550a-847d-4a91-9b29-30bee7d3a3d7
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB001.ant.amazon.com (10.250.64.248) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.46;
 Wed, 16 Sep 2026 18:26:49 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.46; Wed, 16 Sep 2026
 18:26:47 +0000
From: Eliav Farber <farbere@amazon.com>
To: Rodolfo Giometti <giometti@enneenne.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
	Fabio Estevam <festevam@gmail.com>, Andrew Morton
	<akpm@linux-foundation.org>, Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Eliav Farber <farbere@amazon.com>, <devicetree@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 0/2] pps-gpio: restore pin mux on unbind and shutdown
Date: Wed, 16 Sep 2026 18:26:39 +0000
Message-ID: <20260916182641.9768-1-farbere@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260916134744.46354-1-farbere@amazon.com>
References: <20260916134744.46354-1-farbere@amazon.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D040UWA001.ant.amazon.com (10.13.139.22) To
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

Patch 1 documents the optional "default"/"inactive" pinctrl-names in the
binding; patch 2 implements the driver side.

Tested on an AL11 K2V6 JRD10 board: binding/unbinding each pps-gpio device
toggles the corresponding PBS pin-mux register between the GPIO function
and the alternate ec_ptp_trigger_in function as expected, and re-binding
restores the GPIO function via the core-applied "default" state.

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

Eliav Farber (2):
  dt-bindings: pps: pps-gpio: document optional pinctrl states
  pps: clients: gpio: release pins to an inactive state on remove and
    shutdown

 .../devicetree/bindings/pps/pps-gpio.yaml     | 16 +++-
 drivers/pps/clients/pps-gpio.c                | 75 +++++++++++++++++++
 2 files changed, 90 insertions(+), 1 deletion(-)

base-commit: 9b87fdc9af2fbfcdb5c24a64139685ef80f6573f
-- 
2.47.3

