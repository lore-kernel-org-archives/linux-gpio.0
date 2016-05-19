From: Vignesh R <vigneshr@ti.com>
Subject: [PATCH 0/2] AM335x ICE: Add support for PCA9536 GPIO expander
Date: Thu, 19 May 2016 12:17:28 +0530
Message-ID: <1463640450-16762-1-git-send-email-vigneshr@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from comal.ext.ti.com ([198.47.26.152]:44576 "EHLO comal.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752061AbcESGsZ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Thu, 19 May 2016 02:48:25 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Rob Herring <robh+dt@kernel.org>, Tony Lindgren <tony@atomide.com>
Cc: Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Vignesh R <vigneshr@ti.com>



This patch series adds support for TI PCA9536 GPIO expander present on
AM335x ICE board.

Vignesh R (2):
  gpio: pca953x: Add support for TI PCA9536
  ARM: dts: am335x-icev2: Add DT node for TI PCA9536

 Documentation/devicetree/bindings/gpio/gpio-pca953x.txt | 1 +
 arch/arm/boot/dts/am335x-icev2.dts                      | 7 +++++++
 drivers/gpio/gpio-pca953x.c                             | 1 +
 3 files changed, 9 insertions(+)

-- 
2.8.2

