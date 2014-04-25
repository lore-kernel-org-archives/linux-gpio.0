From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 1/2] gpio: Add missing device-managed documentation
Date: Fri, 25 Apr 2014 17:10:05 +0200
Message-ID: <1398438606-19718-1-git-send-email-thierry.reding@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Add the GPIO-related device-managed functions to the list of functions
in Documentation/driver-model/devres.txt.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 Documentation/driver-model/devres.txt | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/driver-model/devres.txt b/Documentation/driver-model/devres.txt
index a3477c3d69a2..7b7d1c4d06bf 100644
--- a/Documentation/driver-model/devres.txt
+++ b/Documentation/driver-model/devres.txt
@@ -310,3 +310,8 @@ SLAVE DMA ENGINE
 
 SPI
   devm_spi_register_master()
+
+GPIO
+  devm_gpiod_get()
+  devm_gpiod_get_index()
+  devm_gpiod_put()
-- 
1.9.2
