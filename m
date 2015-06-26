From: Y Vo <yvo@apm.com>
Subject: [PATCH v1] arm64: dts: Add poweroff button device node for APM X-Gene platform
Date: Fri, 26 Jun 2015 15:01:46 +0700
Message-ID: <1435305707-22786-1-git-send-email-yvo@apm.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pd0-f170.google.com ([209.85.192.170]:36701 "EHLO
	mail-pd0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751796AbbFZICI (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 26 Jun 2015 04:02:08 -0400
Received: by pdcu2 with SMTP id u2so70444671pdc.3
        for <linux-gpio@vger.kernel.org>; Fri, 26 Jun 2015 01:02:07 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, arm@kernel.org, linux-kernel@vger.kernel.org
Cc: Y Vo <yvo@apm.com>, Phong Vo <pvo@apm.com>, Toan Le <toanle@apm.com>, patches@apm.com, Loc Ho <lho@apm.com>

This patch adds poweroff button device node to support poweroff feature
on APM X-Gene Mustang platform.

V1 change:
	- Remove unused property.

Y Vo (1):
  arm64: dts: Add poweroff button device node for APM X-Gene platform

 arch/arm64/boot/dts/apm/apm-mustang.dts |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)

