From: Barry Song <21cnbao@gmail.com>
Subject: [PATCH 4/5] pinctrl: atlas7: adjust vip pin groups for atlas7
Date: Mon, 30 Nov 2015 06:05:56 +0000
Message-ID: <1448863557-25352-4-git-send-email-21cnbao@gmail.com>
References: <1448863557-25352-1-git-send-email-21cnbao@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f53.google.com ([209.85.220.53]:34668 "EHLO
	mail-pa0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752715AbbK3Fzu (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 30 Nov 2015 00:55:50 -0500
Received: by padhx2 with SMTP id hx2so173585057pad.1
        for <linux-gpio@vger.kernel.org>; Sun, 29 Nov 2015 21:55:50 -0800 (PST)
In-Reply-To: <1448863557-25352-1-git-send-email-21cnbao@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, linux-gpio@vger.kernel.org
Cc: workgroup.linux@csr.com, Wei Chen <Wei.Chen@csr.com>, Barry Song <Baohua.Song@csr.com>

From: Wei Chen <Wei.Chen@csr.com>

The vip low 8bit mode and vip high 8 bit mode pin groups had missed
3 pins:vip_vsync, vip_hsync and vip_pxclk. Without these 3 pins, the
vip could not work properly.
Now we add these 3 pins into these two pin groups.

Signed-off-by: Wei Chen <Wei.Chen@csr.com>
Signed-off-by: Barry Song <Baohua.Song@csr.com>
---
 drivers/pinctrl/sirf/pinctrl-atlas7.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/sirf/pinctrl-atlas7.c b/drivers/pinctrl/sirf/pinctrl-atlas7.c
index f73eff5..fc9c3f7 100644
--- a/drivers/pinctrl/sirf/pinctrl-atlas7.c
+++ b/drivers/pinctrl/sirf/pinctrl-atlas7.c
@@ -1002,9 +1002,9 @@ static const unsigned int vi_vip1_ext_pins[] = { 74, 75, 76, 77, 78, 79, 80,
 		81, 82, 83, 84, 108, 103, 104, 105, 106, 107, 102, 97, 98,
 		99, 100, };
 static const unsigned int vi_vip1_low8bit_pins[] = { 74, 75, 76, 77, 78, 79,
-		80, 81, };
-static const unsigned int vi_vip1_high8bit_pins[] = { 82, 83, 84, 108, 103,
-		104, 105, 106, };
+		80, 81, 82, 83, 84, };
+static const unsigned int vi_vip1_high8bit_pins[] = { 82, 83, 84, 103, 104,
+		105, 106, 107, 102, 97, 98, };
 
 /* definition of pin group table */
 struct atlas7_pin_group altas7_pin_groups[] = {
@@ -4294,6 +4294,9 @@ static struct atlas7_pad_mux vi_vip1_low8bit_grp_pad_mux[] = {
 	MUX(1, 79, 1, N, N, N, N),
 	MUX(1, 80, 1, N, N, N, N),
 	MUX(1, 81, 1, N, N, N, N),
+	MUX(1, 82, 1, N, N, N, N),
+	MUX(1, 83, 1, N, N, N, N),
+	MUX(1, 84, 1, N, N, N, N),
 };
 
 static struct atlas7_grp_mux vi_vip1_low8bit_grp_mux = {
@@ -4305,11 +4308,14 @@ static struct atlas7_pad_mux vi_vip1_high8bit_grp_pad_mux[] = {
 	MUX(1, 82, 1, N, N, N, N),
 	MUX(1, 83, 1, N, N, N, N),
 	MUX(1, 84, 1, N, N, N, N),
-	MUX(1, 108, 2, N, N, N, N),
 	MUX(1, 103, 2, N, N, N, N),
 	MUX(1, 104, 2, N, N, N, N),
 	MUX(1, 105, 2, N, N, N, N),
 	MUX(1, 106, 2, N, N, N, N),
+	MUX(1, 107, 2, N, N, N, N),
+	MUX(1, 102, 2, N, N, N, N),
+	MUX(1, 97, 2, N, N, N, N),
+	MUX(1, 98, 2, N, N, N, N),
 };
 
 static struct atlas7_grp_mux vi_vip1_high8bit_grp_mux = {
-- 
1.9.1

