From: Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH RESEND V3 0/2] pinctrl: bcm2835: Improve generic behavior
Date: Fri,  8 Feb 2019 13:21:11 +0100
Message-ID: <1549628473-4485-1-git-send-email-stefan.wahren@i2se.com>
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

This series is the non-controversial part of "pinctrl: bcm2835: improve
libgpiod output". It has been split up in order to apply for the next
kernel release.

Changes in V3:
- drop patches #3 and #4 from former series

Stefan Wahren (2):
  pinctrl: bcm2835: declare pin config as generic
  pinctrl: bcm2835: Direct GPIO config changes to generic pinctrl

 drivers/pinctrl/bcm/pinctrl-bcm2835.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

-- 
2.7.4
