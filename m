From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 0/3] pinctrl: meson: Fix and add missing pins definitions
Date: Tue,  7 Mar 2017 14:30:59 +0100
Message-ID: <1488893462-7016-1-git-send-email-narmstrong@baylibre.com>
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
To: khilman@baylibre.com, carlo@caione.org, linus.walleij@linaro.org
Cc: linux-gpio@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
List-Id: linux-gpio@vger.kernel.org

This patchset fixes the GXBB and GXL pins definitions and add missing GXL
pins to have an 1:1 support for GXBB and GXL.

The error in the current GXL pins definitions was only some bits inversions
in same groups, behaviour should be the same.

Missing pins on GXL was the UART rts/cts, NOR pins, AO i2c and a PWM alias.

Neil Armstrong (3):
  pinctrl: meson-gxbb: Fix typo in i2c ao groups
  pinctrl: meson-gxl: Fix inverted registers and add missing pins
  ARM64: dts: meson-gxl: Add missing pinctrl pins groups

 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi | 32 +++++++++++
 drivers/pinctrl/meson/pinctrl-meson-gxbb.c |  4 +-
 drivers/pinctrl/meson/pinctrl-meson-gxl.c  | 86 +++++++++++++++++++++++++-----
 3 files changed, 106 insertions(+), 16 deletions(-)

-- 
1.9.1
