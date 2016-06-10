From: Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH 3/4] pinctrl.txt: s/have/has/ in GPIO driver interaction description
Date: Fri, 10 Jun 2016 16:46:35 +0930
Message-ID: <1465542996-12534-4-git-send-email-andrew@aj.id.au>
References: <1465542996-12534-1-git-send-email-andrew@aj.id.au>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1465542996-12534-1-git-send-email-andrew@aj.id.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Corbet <corbet@lwn.net>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-doc@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, trivial@kernel.org, Andrew Jeffery <andrew@aj.id.au>
List-Id: linux-gpio@vger.kernel.org

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 Documentation/pinctrl.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/pinctrl.txt b/Documentation/pinctrl.txt
index cefcf5d88a1c..07d102c3d05a 100644
--- a/Documentation/pinctrl.txt
+++ b/Documentation/pinctrl.txt
@@ -286,7 +286,7 @@ see the section named "pin control requests from drivers" and
 "drivers needing both pin control and GPIOs" below for details. But in some
 situations a cross-subsystem mapping between pins and GPIOs is needed.
 
-Since the pin controller subsystem have its pinspace local to the pin
+Since the pin controller subsystem has its pinspace local to the pin
 controller we need a mapping so that the pin control subsystem can figure out
 which pin controller handles control of a certain GPIO pin. Since a single
 pin controller may be muxing several GPIO ranges (typically SoCs that have
-- 
2.7.4
