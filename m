From: Ludovic Barre <ludovic.Barre@st.com>
Subject: [PATCH 0/2] add syscfg mask parameter
Date: Tue, 17 Jul 2018 11:56:25 +0200
Message-ID: <1531821387-29845-1-git-send-email-ludovic.Barre@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Ludovic Barre <ludovic.barre@st.com>
List-Id: linux-gpio@vger.kernel.org

From: Ludovic Barre <ludovic.barre@st.com>

This patch series adds mask parameter to define IRQ mux field.
This field could vary depend of IRQ mux selection register.
This parameter is needed if the mask is different of 0xf.

Ludovic Barre (2):
  dt-bindings: pinctrl: add syscfg mask parameter
  pinctrl: stm32: add syscfg mask parameter

 .../devicetree/bindings/pinctrl/st,stm32-pinctrl.txt     |  7 ++++---
 drivers/pinctrl/stm32/pinctrl-stm32.c                    | 16 ++++++++++++++--
 2 files changed, 18 insertions(+), 5 deletions(-)

-- 
2.7.4
