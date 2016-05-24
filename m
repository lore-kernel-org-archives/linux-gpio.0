From: <patrice.chotard@st.com>
Subject: [PATCH v2] pinctrl: stm32: .pin_config_dbg_show fixes
Date: Tue, 24 May 2016 13:57:42 +0200
Message-ID: <1464091063-22341-1-git-send-email-patrice.chotard@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: patrice.chotard@st.com
List-Id: linux-gpio@vger.kernel.org

From: Patrice Chotard <patrice.chotard@st.com>

v1 -> v2
	_ rebase on top of Linus Torsvald tree.
	_ remove "[PATCH 1/2]: pinctrl: stm32: fix warning", already fixed by Linus Torvalds

Patrice Chotard (1):
  pinctrl: stm32: factorize stm32_pconf_input/output_get()

 drivers/pinctrl/stm32/pinctrl-stm32.c | 31 ++++++++++---------------------
 1 file changed, 10 insertions(+), 21 deletions(-)

-- 
1.9.1
