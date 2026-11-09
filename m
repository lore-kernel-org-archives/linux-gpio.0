Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=68.232.154.123
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794232253;
	b=iOLp2BQhzOG5d0qtIIz5tDEmZCAMgtbctAVmua7TD1ob+WSC7Occ3gzbFHvWsjNL+I+l
	 rEfWohZEDBNm+2bV3MvYkAR+G4neR+VPoEu+VIgNLKcAitLj3kC59ieRNeykmGq0MY9nQ
	 rnO0PCMbGEqNitu4ck97TlM1EqCpQyc8WR353fQjaliy1IU3jJ3Bnr4I+gBa6AAvGP4Fr
	 vaJEL0p24By6dY8KLPo1JlGhlRaa0NEN1l3C6wiR41eLDCwitMflAJECFwb2LAdg5HkKu
	 7YjRaVn8yUYVFMez/+y6iluJtG3CGwlWx84G8wg4wphlbUQ+YpaFZ4oPnNJbcgTOZQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794232253;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-Amp-Result:Received:Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-ID:References:In-Reply-To:To:CC:X-Mailer;
	bh=cchdRIXdDH+ZuqONJcFyi585VFaLRrBDFUIV1dNlKj4=;
	b=SnN9rTST3Do17wMHzTSOhhKrCh7C1LpmVMTYfMt2hMPP7z0I0zaXCkPLwdyfQzbb3rV9
	 J8s4pOetbuVDUfxM9ki/hQa+Fp9FHxoO2rqPoKKw1LvnoZ5f6AOLofPQfJONERvm3DW8o
	 2AAnw0nRus4R1dZCZhW/6+OcFZjVL1oGTs+bDzxDnaBQ3KMH/aAftkR0/WxEXUEm/G+lg
	 X1yCGAzp3dEkSQW3xP67ld4Us/DNkyHmDjIA5DuoE7BzwuinlHhGUJQmvedJB14fT/FAR
	 W1toznXFzNG62ICmBv4z4sHsHMtVZLT8EvBDHnyvEJ7jxqZlWkEhd5B2Ad2EcVxF7iA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=microchip.com;
	spf=pass smtp.mailfrom=microchip.com;
	dkim=pass header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=mA3iwUO2;
	arc=none smtp.remote-ip=68.232.154.123
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13897606D805;
	Mon,  9 Nov 2026 13:50:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13897606D805
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=mA3iwUO2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1794232253; x=1825768253;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=KJ7nI+y2+3u6aGJ43OEkoFlybCeTRkkOnnAS1Nj96MM=;
  b=mA3iwUO2djNe3mAwZhG6ueeIhJYuDZNkCNohgOvvY2iy6YwFuLIjMgbl
   NaZ/8NOb6+JiMhy/mRI3ZMhJcZbkBQkPkEysRE9eI7NZ9Q0/UsR82g9gz
   dGRbretDPDQW+qb0tZdaf/bxTAccF8XnoxsumZ4jfPvAxnS7JZBRxOdQ0
   BtcU/W8p2uX3WA0ixK8CuBkfm5Cw7jQ8AogkQR4TwRnNGMVNI2ty5P/qt
   BRktLSw2dBbDf/ODdzNBPUr21ztMx5WPGAaJJPr/AN7hBI9HpE4ol2pXi
   ZiiNd+6SUE7Ul7GUkmsFnskZH/VaPnfB7YLIKAN/Lr/lB8AYCRgSn1QL+
   g==;
X-CSE-ConnectionGUID: Is88lAHeTUi8yYLOizdCUw==
X-CSE-MsgGUID: rwg5ooJCRwCiFFAVrzY3Ig==
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="233294142"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 06:50:52 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.87.71) by
 chn-vm-ex1.mchp-main.com (10.10.87.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.56; Mon, 9 Nov 2026 06:50:51 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.58 via Frontend
 Transport; Mon, 9 Nov 2026 06:50:49 -0700
From: =?utf-8?q?Jens_Emil_Schulz_=C3=98stergaard?=
	<jensemil.schulzostergaard@microchip.com>
Date: Mon, 9 Nov 2026 14:50:42 +0100
Subject: [PATCH 2/2] pinctrl: ocelot: do not use the chained irqchip behind
 a sleeping bus
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20261109-ocelot-pinctrl-irqchip-fixes-v1-2-9d2d8fcd58f5@microchip.com>
References: <20261109-ocelot-pinctrl-irqchip-fixes-v1-0-9d2d8fcd58f5@microchip.com>
In-Reply-To: <20261109-ocelot-pinctrl-irqchip-fixes-v1-0-9d2d8fcd58f5@microchip.com>
To: Linus Walleij <linusw@kernel.org>, Sebastian Andrzej Siewior
	<bigeasy@linutronix.de>, Clark Williams <clrkwllms@kernel.org>, "Steven
 Rostedt" <rostedt@goodmis.org>, Horatiu Vultur
	<horatiu.vultur@microchip.com>, Colin Foster <colin.foster@in-advantage.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>, Lee Jones <lee@kernel.org>,
	Vladimir Oltean <vladimir.oltean@nxp.com>
CC: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	<linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-rt-devel@lists.linux.dev>,
	=?utf-8?q?Jens_Emil_Schulz_=C3=98stergaard?=
	<jensemil.schulzostergaard@microchip.com>
X-Mailer: b4 0.15-dev

Since the driver can use a regmap on a bus that can sleep, as for
VSC7512 attached over SPI, it still registers the gpiochip as not
sleeping and adds the chained irqchip when the node has an interrupt.
The chained handler and the irq_chip callbacks run in atomic context and
access the registers through that regmap, and consumers may use the
lines of a gpiochip that is not marked as sleeping from atomic context.

Mark the gpiochip as sleeping when the regmap can sleep, and do not
register the chained irqchip in that case.

The issue was found by code inspection and reproduced on a lan9668
board (pcb8385) with a lan9645x attached over SPI, whose pinctrl node
has an interrupt, by requesting an edge interrupt on one of its GPIOs
through the GPIO character device:

  BUG: sleeping function called from invalid context at kernel/locking/mutex.c:623
  in_atomic(): 1, irqs_disabled(): 128, non_block: 0, pid: 420, name: gpiomon
  preempt_count: 1, expected: 0
  locks held by gpiomon/420: 3, last CPU#0:
   #0: 84463cd0 (&gdev->srcu){.+.+}-{0:0}, at: lineinfo_get+0x13f/0x140
   #1: 838bbd30 (request_class){+.+.}-{4:4}, at: __setup_irq+0xe8/0x5c0
   #2: 838bbc70 (lock_class){-...}-{2:2}, at: __setup_irq+0x104/0x5c0
  ...
  Call trace:
  ...
   mutex_lock_nested from regmap_update_bits_base+0x1c/0x80
   regmap_update_bits_base from ocelot_irq_unmask+0x42/0x80
   ocelot_irq_unmask from irq_enable+0x1e/0x80
   irq_enable from irq_startup+0x64/0xc0
   irq_startup from __setup_irq+0x38c/0x5c0
   __setup_irq from request_threaded_irq+0x86/0x140
   request_threaded_irq from edge_detector_setup+0x1d8/0x240
   edge_detector_setup from linereq_create+0x3e2/0x540
   linereq_create from gpio_ioctl+0xa4/0x240

With the fix the lan9645x gpiochip is registered as sleeping and
without the chained irqchip, the request fails with -ENXIO instead and
without lockdep reports.

Fixes: 181f604b33cd ("pinctrl: ocelot: add ability to be used in a non-mmio configuration")
Signed-off-by: Jens Emil Schulz Østergaard <jensemil.schulzostergaard@microchip.com>
---
 drivers/pinctrl/pinctrl-ocelot.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-ocelot.c b/drivers/pinctrl/pinctrl-ocelot.c
index 06dd49782d74..90a1f859db67 100644
--- a/drivers/pinctrl/pinctrl-ocelot.c
+++ b/drivers/pinctrl/pinctrl-ocelot.c
@@ -2367,8 +2367,9 @@ static int ocelot_gpiochip_register(struct platform_device *pdev,
 	gc->parent = &pdev->dev;
 	gc->base = -1;
 	gc->label = "ocelot-gpio";
+	gc->can_sleep = regmap_might_sleep(info->map);
 
-	irq = platform_get_irq_optional(pdev, 0);
+	irq = gc->can_sleep ? 0 : platform_get_irq_optional(pdev, 0);
 	if (irq > 0) {
 		girq = &gc->irq;
 		gpio_irq_chip_set_chip(girq, &ocelot_irqchip);

-- 
2.52.0

