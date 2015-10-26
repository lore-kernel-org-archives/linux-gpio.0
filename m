From: Y Vo <yvo@apm.com>
Subject: [PATCH v2 0/3] gpio: xgene: add support to configure GPIO line as input, output or external IRQ pin
Date: Mon, 26 Oct 2015 13:49:32 +0700
Message-ID: <1445842175-11446-1-git-send-email-yvo@apm.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f43.google.com ([209.85.220.43]:36404 "EHLO
	mail-pa0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753199AbbJZGts (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 26 Oct 2015 02:49:48 -0400
Received: by pacfv9 with SMTP id fv9so187238091pac.3
        for <linux-gpio@vger.kernel.org>; Sun, 25 Oct 2015 23:49:47 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Y Vo <yvo@apm.com>, Phong Vo <pvo@apm.com>, Toan Le <toanle@apm.com>, Loc Ho <lho@apm.com>, Feng Kan <fkan@apm.com>, Quan Nguyen <qnguyen@apm.com>, Duc Dang <dhdang@apm.com>, patches@apm.com

V2 Changes:
	- support X-Gene standby GPIO as an interrupt controller.

Y Vo (3):
  gpio: xgene: add support to configure GPIO line as input, output or  
      external IRQ pin
  Documentation: gpio: Update description for X-Gene standby GPIO    
    controller DTS binding
  arm64: dts: Update APM X-Gene standby GPIO controller DTS entries

 .../devicetree/bindings/gpio/gpio-xgene-sb.txt     |   23 ++-
 arch/arm64/boot/dts/apm/apm-storm.dtsi             |   15 +-
 drivers/gpio/gpio-xgene-sb.c                       |  234 +++++++++++++++++---
 3 files changed, 223 insertions(+), 49 deletions(-)

