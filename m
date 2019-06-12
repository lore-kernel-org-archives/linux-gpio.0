From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH net-next v2 0/1] stmmac: honor the GPIO flags for the PHY reset GPIO
Date: Wed, 12 Jun 2019 21:31:14 +0200
Message-ID: <20190612193115.6751-1-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: netdev@vger.kernel.org, peppe.cavallaro@st.com, alexandre.torgue@st.com, joabreu@synopsys.com, davem@davemloft.net, andrew@lunn.ch
Cc: linus.walleij@linaro.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, maxime.ripard@bootlin.com, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
List-Id: linux-gpio@vger.kernel.org

Recent Amlogic SoCs (G12A which includes S905X2 and S905D2 as well as
G12B which includes S922X) use GPIOZ_14 or GPIOZ_15 for the PHY reset
line. These GPIOs are special because they are marked as "3.3V input
tolerant open drain (OD) pins" which means they can only drive the pin
output LOW (to reset the PHY) or to switch to input mode (to take the
PHY out of reset).
The GPIO subsystem already supports this with the GPIO_OPEN_DRAIN and
GPIO_OPEN_SOURCE flags in the devicetree bindings.

The goal of this series to add support for these special GPIOs in
stmmac (even though the "snps,reset-gpio" binding is deprecated).

My test-cases were:
- X96 Max: snps,reset-gpio = <&gpio GPIOZ_15 0> with and without
           snps,reset-active-low before these patches. The PHY was
           not detected.
- X96 Max: snps,reset-gpio = <&gpio GPIOZ_15
                              (GPIO_ACTIVE_LOW | GPIO_OPEN_DRAIN)>.
           The PHY is now detected correctly
- Meson8b EC100: snps,reset-gpio = <&gpio GPIOH_4 0> with
                 snps,reset-active-low. Before and after these
                 patches the PHY is detected correctly.
- Meson8b EC100: snps,reset-gpio = <&gpio GPIOH_4 0> without
                 snps,reset-active-low. Before and after these
                 patches the PHY is not detected (this is expected
                 because we need to set the output LOW to take the
                 PHY out of reset).
- Meson8b EC100: snps,reset-gpio = <&gpio GPIOH_4 GPIO_ACTIVE_LOW>
                 but without snps,reset-active-low. Before these
                 patches the PHY was not detected. With these patches
                 the PHY is now detected correctly.


Changes since RFC v1 at [0]:
- dropped all patches except the main patch which changes
  stmmac_mdio_reset to use GPIO descriptors (I will send the cleanup
  patches in a separate series once this patch is merged)
- drop the active_low field from struct stmmac_mdio_bus_data
- added Linus Walleij's Reviewed-by (thank you!)


DEPENDENCIES:
This has a runtime dependency on the preparation patch [0] from
Linus W.'s GPIO tree. Without that dependency the
snps,reset-active-low property (which quite a few .dts files use)
will be ignored.
Linus created an immutable branch which can be pulled into net-next:
git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
ib-snps-reset-gpio
gitweb for this immutable branch: [2]


[0] https://patchwork.kernel.org/cover/10983801/
[1] https://patchwork.ozlabs.org/cover/1113217/
[2] https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git/log/?h=ib-snps-reset-gpio


Martin Blumenstingl (1):
  net: stmmac: use GPIO descriptors in stmmac_mdio_reset

 .../net/ethernet/stmicro/stmmac/stmmac_mdio.c | 27 +++++++++----------
 include/linux/stmmac.h                        |  2 +-
 2 files changed, 14 insertions(+), 15 deletions(-)

-- 
2.22.0
