From: Tomer Maimon <tmaimon77@gmail.com>
Subject: [PATCH v1 0/1] pinctrl: nuvoton: modify NPCM7xx pin configuration
Date: Wed,  7 Nov 2018 15:44:33 +0200
Message-ID: <20181107134434.354795-1-tmaimon77@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, yuenn@google.com, venture@google.com, benjaminfair@google.com, brendanhiggins@google.com, avifishman70@gmail.com, joel@jms.id.au, kunyi@google.com
Cc: linux-gpio@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Tomer Maimon <tmaimon77@gmail.com>
List-Id: linux-gpio@vger.kernel.org

This patch Modify GPIO direction setting in pin configuration function.

please refer patch:
Kun Yi https://patchwork.ozlabs.org/patch/985540/

Tomer Maimon (1):
  pinctrl: nuvoton: modify NPCM7xx pin configuration function

 drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

-- 
2.14.1
