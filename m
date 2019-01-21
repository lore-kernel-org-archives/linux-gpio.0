From: Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH RFC V2 0/4] pinctrl: bcm2835: improve libgpiod output
Date: Mon, 21 Jan 2019 08:11:21 +0100
Message-ID: <1548054685-3781-1-git-send-email-stefan.wahren@i2se.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Eric Anholt <eric@anholt.net>
Cc: Stefan Wahren <stefan.wahren@i2se.com>, linux-gpio@vger.kernel.org, Lukas Wunner <lukas@wunner.de>, Peter Robinson <pbrobinson@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-gpio@vger.kernel.org

Based on a recent discussion [1],[2] about the unexpected output of gpioinfo
this patch series tries to improve the situation. Patches 1-3 are specific
changes for bcm2835 while the last one is the intended improvement for gpiolib.

Changes in V2:
- take strict mode into account as suggested by Linus
- add bcm2835 specific changes

[1] - https://marc.info/?l=linux-gpio&m=154716249606544
[2] - https://marc.info/?l=linux-gpio&m=154747265118765

Stefan Wahren (4):
  pinctrl: bcm2835: declare pin config as generic
  pinctrl: bcm2835: Direct GPIO config changes to generic pinctrl
  pinctrl: bcm2835: activate strict mux mode
  gpiolib: Take MUX usage into account

 drivers/gpio/gpiolib.c                |  3 ++-
 drivers/pinctrl/bcm/pinctrl-bcm2835.c |  5 ++++-
 drivers/pinctrl/core.c                | 23 +++++++++++++++++++++++
 drivers/pinctrl/pinmux.c              | 18 ++++++++++++++++++
 drivers/pinctrl/pinmux.h              |  7 +++++++
 include/linux/pinctrl/consumer.h      |  6 ++++++
 6 files changed, 60 insertions(+), 2 deletions(-)

-- 
2.7.4
