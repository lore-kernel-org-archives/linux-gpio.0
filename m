From: Ludovic Barre <ludovic.Barre@st.com>
Subject: [PATCH 1/2] dt-bindings: pinctrl: add syscfg mask parameter
Date: Tue, 17 Jul 2018 11:56:26 +0200
Message-ID: <1531821387-29845-2-git-send-email-ludovic.Barre@st.com>
References: <1531821387-29845-1-git-send-email-ludovic.Barre@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1531821387-29845-1-git-send-email-ludovic.Barre@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Ludovic Barre <ludovic.barre@st.com>
List-Id: linux-gpio@vger.kernel.org

From: Ludovic Barre <ludovic.barre@st.com>

This patch adds mask parameter to define IRQ mux field.
This field could vary depend of IRQ mux selection register.
This parameter is needed if the mask is different of 0xf.

Signed-off-by: Ludovic Barre <ludovic.barre@st.com>
---
 Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.txt | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.txt
index 9a06e1f..4d60119 100644
--- a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.txt
@@ -39,9 +39,10 @@ Optional properties:
  - reset:	  : Reference to the reset controller
  - interrupt-parent: phandle of the interrupt parent to which the external
    GPIO interrupts are forwarded to.
- - st,syscfg: Should be phandle/offset pair. The phandle to the syscon node
-   which includes IRQ mux selection register, and the offset of the IRQ mux
-   selection register.
+ - st,syscfg: Should be phandle/offset/mask.
+	-The phandle to the syscon node which includes IRQ mux selection register.
+	-The offset of the IRQ mux selection register
+	-The field mask of IRQ mux, needed if different of 0xf.
  - gpio-ranges: Define a dedicated mapping between a pin-controller and
    a gpio controller. Format is <&phandle a b c> with:
 	-(phandle): phandle of pin-controller.
-- 
2.7.4
