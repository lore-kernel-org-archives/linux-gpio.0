From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH] gpiolib: fix filtering out unwanted events
Date: Fri, 23 Jun 2017 13:45:16 +0200
Message-ID: <1498218316-27860-2-git-send-email-brgl@bgdev.pl>
References: <1498218316-27860-1-git-send-email-brgl@bgdev.pl>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1498218316-27860-1-git-send-email-brgl@bgdev.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
List-Id: linux-gpio@vger.kernel.org

GPIOEVENT_REQUEST_BOTH_EDGES is not a single flag, but a binary OR of
GPIOEVENT_REQUEST_RISING_EDGE and GPIOEVENT_REQUEST_FALLING_EDGE.

The expression 'le->eflags & GPIOEVENT_REQUEST_BOTH_EDGES' we'll get
evaluated to true even if only one event type was requested.

Fix it by checking both RISING & FALLING flags explicitly.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 drivers/gpio/gpiolib.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 5db4413..a42a1ee 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -708,7 +708,8 @@ static irqreturn_t lineevent_irq_thread(int irq, void *p)
 
 	ge.timestamp = ktime_get_real_ns();
 
-	if (le->eflags & GPIOEVENT_REQUEST_BOTH_EDGES) {
+	if (le->eflags & GPIOEVENT_REQUEST_RISING_EDGE
+	    && le->eflags & GPIOEVENT_REQUEST_FALLING_EDGE) {
 		int level = gpiod_get_value_cansleep(le->desc);
 
 		if (level)
-- 
2.9.3
