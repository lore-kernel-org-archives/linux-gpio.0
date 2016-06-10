From: Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH 2/4] pinctrl.txt: Fix grammar in pinmux request list
Date: Fri, 10 Jun 2016 16:46:34 +0930
Message-ID: <1465542996-12534-3-git-send-email-andrew@aj.id.au>
References: <1465542996-12534-1-git-send-email-andrew@aj.id.au>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1465542996-12534-1-git-send-email-andrew@aj.id.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Corbet <corbet@lwn.net>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-doc@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, trivial@kernel.org, Andrew Jeffery <andrew@aj.id.au>
List-Id: linux-gpio@vger.kernel.org

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 Documentation/pinctrl.txt | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/pinctrl.txt b/Documentation/pinctrl.txt
index 4976389e432d..cefcf5d88a1c 100644
--- a/Documentation/pinctrl.txt
+++ b/Documentation/pinctrl.txt
@@ -493,12 +493,12 @@ Definitions:
 - The combination of a FUNCTION and a PIN GROUP determine a certain function
   for a certain set of pins. The knowledge of the functions and pin groups
   and their machine-specific particulars are kept inside the pinmux driver,
-  from the outside only the enumerators are known, and the driver core can:
+  from the outside only the enumerators are known, and the driver core can
+  request:
 
-  - Request the name of a function with a certain selector (>= 0)
+  - The name of a function with a certain selector (>= 0)
   - A list of groups associated with a certain function
-  - Request that a certain group in that list to be activated for a certain
-    function
+  - That a certain group in that list to be activated for a certain function
 
   As already described above, pin groups are in turn self-descriptive, so
   the core will retrieve the actual pin range in a certain group from the
-- 
2.7.4
