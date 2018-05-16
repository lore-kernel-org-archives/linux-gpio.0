From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Subject: [PATCH] Documentation: gpio: driver: Fix a typo and some odd grammar
Date: Wed, 16 May 2018 14:08:00 +0200
Message-ID: <20180516120800.12517-1-j.neuschaefer@gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, Linus Walleij <linus.walleij@linaro.org>, Jonathan Corbet <corbet@lwn.net>, linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Signed-off-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>
---
 Documentation/driver-api/gpio/driver.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/driver-api/gpio/driver.rst b/Documentation/driver-api/gpio/driver.rst
index 505ee906d7d9..cbe0242842d1 100644
--- a/Documentation/driver-api/gpio/driver.rst
+++ b/Documentation/driver-api/gpio/driver.rst
@@ -44,7 +44,7 @@ common to each controller of that type:
 
  - methods to establish GPIO line direction
  - methods used to access GPIO line values
- - method to set electrical configuration to a a given GPIO line
+ - method to set electrical configuration for a given GPIO line
  - method to return the IRQ number associated to a given GPIO line
  - flag saying whether calls to its methods may sleep
  - optional line names array to identify lines
@@ -143,7 +143,7 @@ resistor will make the line tend to high level unless one of the transistors on
 the rail actively pulls it down.
 
 The level on the line will go as high as the VDD on the pull-up resistor, which
-may be higher than the level supported by the transistor, achieveing a
+may be higher than the level supported by the transistor, achieving a
 level-shift to the higher VDD.
 
 Integrated electronics often have an output driver stage in the form of a CMOS
@@ -382,7 +382,7 @@ Real-Time compliance for GPIO IRQ chips
 
 Any provider of irqchips needs to be carefully tailored to support Real Time
 preemption. It is desirable that all irqchips in the GPIO subsystem keep this
-in mind and does the proper testing to assure they are real time-enabled.
+in mind and do the proper testing to assure they are real time-enabled.
 So, pay attention on above " RT_FULL:" notes, please.
 The following is a checklist to follow when preparing a driver for real
 time-compliance:
-- 
2.17.0
