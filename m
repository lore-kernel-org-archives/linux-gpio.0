From: Kelsey Skunberg <skunberg.kelsey@gmail.com>
Subject: [PATCH] tools: gpio: Add include/linux/gpio.h to .gitignore
Date: Sat, 11 May 2019 23:37:49 -0600
Message-ID: <20190512053749.7508-1-skunberg.kelsey@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: bgolaszewski@baylibre.com, linus.walleij@linaro.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, skhan@linuxfoundation.org, linux-kernel-mentees@lists.linuxfoundation.org
Cc: Kelsey Skunberg <skunberg.kelsey@gmail.com>
List-Id: linux-gpio@vger.kernel.org

File include/linux/gpio.h is generated after building
tools/testing/selftests

Add gpio.h to .gitignore to help clean up working tree status.

Signed-off-by: Kelsey Skunberg <skunberg.kelsey@gmail.com>
---
 tools/gpio/.gitignore | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/gpio/.gitignore b/tools/gpio/.gitignore
index 9e9dd4b681b2..a94c0e83b209 100644
--- a/tools/gpio/.gitignore
+++ b/tools/gpio/.gitignore
@@ -1,4 +1,4 @@
 gpio-event-mon
 gpio-hammer
 lsgpio
-
+include/linux/gpio.h
--
2.20.1
