From: David Daney <ddaney.cavm@gmail.com>
Subject: [PATCH 3/3] MAINTAINERS: Add entry for THUNDERX GPIO Driver.
Date: Tue,  3 Jan 2017 16:55:34 -0800
Message-ID: <1483491334-167095-4-git-send-email-ddaney.cavm@gmail.com>
References: <1483491334-167095-1-git-send-email-ddaney.cavm@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pf0-f194.google.com ([209.85.192.194]:33879 "EHLO
        mail-pf0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S965333AbdADAzq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Jan 2017 19:55:46 -0500
In-Reply-To: <1483491334-167095-1-git-send-email-ddaney.cavm@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: David Daney <david.daney@cavium.com>

From: David Daney <david.daney@cavium.com>

Signed-off-by: David Daney <david.daney@cavium.com>
---
 MAINTAINERS | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 63cefa6..41c3208 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10660,6 +10660,11 @@ M:	Andreas Noever <andreas.noever@gmail.com>
 S:	Maintained
 F:	drivers/thunderbolt/
 
+THUNDERX GPIO DRIVER
+M:	David Daney <david.daney@cavium.com>
+S:	Maintained
+F:	drivers/gpio/gpio-thunderx.c
+
 TI BQ27XXX POWER SUPPLY DRIVER
 R:	Andrew F. Davis <afd@ti.com>
 F:	include/linux/power/bq27xxx_battery.h
-- 
1.8.3.1

