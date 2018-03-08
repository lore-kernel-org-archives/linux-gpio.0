From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Subject: [PATCH 2/8] Documentation: driver-api: Move gpio.rst to gpio/index.rst
Date: Fri,  9 Mar 2018 00:40:18 +0100
Message-ID: <20180308234024.24145-3-j.neuschaefer@gmx.net>
References: <20180308234024.24145-1-j.neuschaefer@gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180308234024.24145-1-j.neuschaefer@gmx.net>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, Jonathan Corbet <corbet@lwn.net>, Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Walleij <linus.walleij@linaro.org>, Vinod Koul <vinod.koul@intel.com>, Sanyog Kale <sanyog.r.kale@intel.com>, Sagar Dharia <sdharia@codeaurora.org>, Thierry Reding <treding@nvidia.com>
List-Id: linux-gpio@vger.kernel.org

To make space for more files in the GPIO section, create a
Documentation/driver-api/gpio/ directory.

Signed-off-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>
---
 Documentation/driver-api/{gpio.rst => gpio/index.rst} | 0
 Documentation/driver-api/index.rst                    | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename Documentation/driver-api/{gpio.rst => gpio/index.rst} (100%)

diff --git a/Documentation/driver-api/gpio.rst b/Documentation/driver-api/gpio/index.rst
similarity index 100%
rename from Documentation/driver-api/gpio.rst
rename to Documentation/driver-api/gpio/index.rst
diff --git a/Documentation/driver-api/index.rst b/Documentation/driver-api/index.rst
index 62d056471c0d..9b54fb99d9ca 100644
--- a/Documentation/driver-api/index.rst
+++ b/Documentation/driver-api/index.rst
@@ -45,7 +45,7 @@ available subsections can be seen below.
    uio-howto
    firmware/index
    pinctl
-   gpio
+   gpio/index
    misc_devices
    dmaengine/index
    slimbus
-- 
2.16.1
