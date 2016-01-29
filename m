From: Quan Nguyen <qnguyen@apm.com>
Subject: [PATCH v5 0/3] Enable X-Gene standby GPIO as interrupt controller
Date: Fri, 29 Jan 2016 11:28:52 +0700
Message-ID: <1454041735-8434-1-git-send-email-qnguyen@apm.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pf0-f172.google.com ([209.85.192.172]:36321 "EHLO
	mail-pf0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752033AbcA2E3J (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 28 Jan 2016 23:29:09 -0500
Received: by mail-pf0-f172.google.com with SMTP id n128so34986823pfn.3
        for <linux-gpio@vger.kernel.org>; Thu, 28 Jan 2016 20:29:09 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>
Cc: Y Vo <yvo@apm.com>, Phong Vo <pvo@apm.com>, Loc Ho <lho@apm.com>, Feng Kan <fkan@apm.com>, Duc Dang <dhdang@apm.com>, patches@apm.com, Quan Nguyen <qnguyen@apm.com>

V5 Changes:
        - Add optional properties to describe HW specifics
        - Use irq_create_fwspec_mapping() instead of low level functions
        - Move gpiochip_lock_as_irq() to activate method
        - Remove redundant checks
	- Add optional HW properties description to DT binding document
        - Update "interrupts" property description in DT binding document.
V4 Changes:
        - Convert to hierarchical irq domain
V3 Changes:
        - Picking up from version 2 of "Y Vo <yvo@apm.com>"
        - Get HW resource information from DT
        - Avoid keeping parent IRQ controller
V2 Changes:
        - Support X-Gene standby GPIO as an interrupt controller.

Quan Nguyen (3):
  gpio: xgene: Enable X-Gene standby GPIO as interrupt controller
  Documentation: gpio: Update description for X-Gene standby GPIO
    controller DTS binding
  arm64: dts: Update X-Gene standby GPIO controller DTS entries

 .../devicetree/bindings/gpio/gpio-xgene-sb.txt     |  47 +++-
 arch/arm64/boot/dts/apm/apm-storm.dtsi             |   3 +
 drivers/gpio/gpio-xgene-sb.c                       | 275 ++++++++++++++++++---
 3 files changed, 286 insertions(+), 39 deletions(-)

-- 
1.7.12.4

