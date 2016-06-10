From: Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH 4/4] pinctrl.txt: Reflow/wrap paragraph describing GPIO interaction
Date: Fri, 10 Jun 2016 16:46:36 +0930
Message-ID: <1465542996-12534-5-git-send-email-andrew@aj.id.au>
References: <1465542996-12534-1-git-send-email-andrew@aj.id.au>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1465542996-12534-1-git-send-email-andrew@aj.id.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Corbet <corbet@lwn.net>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-doc@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, trivial@kernel.org, Andrew Jeffery <andrew@aj.id.au>
List-Id: linux-gpio@vger.kernel.org

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 Documentation/pinctrl.txt | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/Documentation/pinctrl.txt b/Documentation/pinctrl.txt
index 07d102c3d05a..6414a613cb8a 100644
--- a/Documentation/pinctrl.txt
+++ b/Documentation/pinctrl.txt
@@ -286,13 +286,13 @@ see the section named "pin control requests from drivers" and
 "drivers needing both pin control and GPIOs" below for details. But in some
 situations a cross-subsystem mapping between pins and GPIOs is needed.
 
-Since the pin controller subsystem has its pinspace local to the pin
-controller we need a mapping so that the pin control subsystem can figure out
-which pin controller handles control of a certain GPIO pin. Since a single
-pin controller may be muxing several GPIO ranges (typically SoCs that have
-one set of pins, but internally several GPIO silicon blocks, each modelled as
-a struct gpio_chip) any number of GPIO ranges can be added to a pin controller
-instance like this:
+Since the pin controller subsystem has its pinspace local to the pin controller
+we need a mapping so that the pin control subsystem can figure out which pin
+controller handles control of a certain GPIO pin. Since a single pin controller
+may be muxing several GPIO ranges (typically SoCs that have one set of pins,
+but internally several GPIO silicon blocks, each modelled as a struct
+gpio_chip) any number of GPIO ranges can be added to a pin controller instance
+like this:
 
 struct gpio_chip chip_a;
 struct gpio_chip chip_b;
-- 
2.7.4
