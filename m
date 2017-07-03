From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH] gpiolib: skip unwanted events, don't convert them to opposite edge
Date: Mon,  3 Jul 2017 11:12:03 +0200
Message-ID: <1499073123-13393-1-git-send-email-brgl@bgdev.pl>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f50.google.com ([74.125.82.50]:35238 "EHLO
        mail-wm0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753378AbdGCJMK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 3 Jul 2017 05:12:10 -0400
Received: by mail-wm0-f50.google.com with SMTP id w126so161789279wme.0
        for <linux-gpio@vger.kernel.org>; Mon, 03 Jul 2017 02:12:09 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>

The previous fix for filtering out of unwatched events was not entirely
correct. Instead of skipping the events we don't want, they are now
interpreted as events with opposing edge.

In order to fix it: always read the GPIO line value on interrupt and
only emit the event if it corresponds with the event type we requested.

Fixes: ad537b822577 ("gpiolib: fix filtering out unwanted events")
Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
Hi Linus,

I tested my previous fix on a real board, where I got a storm of
interrupts from simply playing with a GPIO manually. It looked ok so I
posted the patch, but I didn't notice that when waiting for rising-edge
events, all falling-edge events got interpreted as such. This patch
should actually fix this bug. Tested carefully with gpio-mockup this
time.

 drivers/gpio/gpiolib.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index a42a1ee..2e96b3d 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -704,24 +704,23 @@ static irqreturn_t lineevent_irq_thread(int irq, void *p)
 {
 	struct lineevent_state *le = p;
 	struct gpioevent_data ge;
-	int ret;
+	int ret, level;
 
 	ge.timestamp = ktime_get_real_ns();
+	level = gpiod_get_value_cansleep(le->desc);
 
 	if (le->eflags & GPIOEVENT_REQUEST_RISING_EDGE
 	    && le->eflags & GPIOEVENT_REQUEST_FALLING_EDGE) {
-		int level = gpiod_get_value_cansleep(le->desc);
-
 		if (level)
 			/* Emit low-to-high event */
 			ge.id = GPIOEVENT_EVENT_RISING_EDGE;
 		else
 			/* Emit high-to-low event */
 			ge.id = GPIOEVENT_EVENT_FALLING_EDGE;
-	} else if (le->eflags & GPIOEVENT_REQUEST_RISING_EDGE) {
+	} else if (le->eflags & GPIOEVENT_REQUEST_RISING_EDGE && level) {
 		/* Emit low-to-high event */
 		ge.id = GPIOEVENT_EVENT_RISING_EDGE;
-	} else if (le->eflags & GPIOEVENT_REQUEST_FALLING_EDGE) {
+	} else if (le->eflags & GPIOEVENT_REQUEST_FALLING_EDGE && !level) {
 		/* Emit high-to-low event */
 		ge.id = GPIOEVENT_EVENT_FALLING_EDGE;
 	} else {
-- 
2.9.3

