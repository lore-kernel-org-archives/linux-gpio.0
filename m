From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v4 0/1] Meson8b RGMII Ethernet pin fixes
Date: Sat, 12 Jan 2019 13:59:12 +0100
Message-ID: <20190112125913.22085-1-martin.blumenstingl@googlemail.com>
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
To: linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org, linus.walleij@linaro.org
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, khilman@baylibre.com, ingrassia@epigenesys.com, linux-arm-kernel@lists.infradead.org
List-Id: linux-gpio@vger.kernel.org

This series fixes Ethernet RX performance on boards using a Gigabit PHY
and a Meson8b SoC.
We now reach near Gigabit speeds in RX and TX direction (when data is
flowing in only one direction, full-duplex seems be have another issue
which is probably not related to pinctrl).


Changes since v3 at [2]:
- Collected Emiliano's and Kevin's Reviewed-by/Tested-by
- dropped patch #2 (.dts patch) as it has been applied by Kevin already
- include the linux-gpio mailing list this time


Changes since v2 at [1]:
- Thanks to Jianxin for providing the documentation for the two missing
  bits in pin mux register 7
- added a patch to add the missing eth_rxd2 and eth_rxd3 pin groups to
  the pinctrl-meson8b driver
- update the meson8.dtsi patch to include the eth_rxd2 and eth_rxd3 pin
  groups on top of the previous change which only removed eth_txd0_1
  and eth_txd1_1 (including the patch description)
- update subject of the cover-letter and the meson8b.dtsi patch


Changes since v1 at [0]:
- rebased so it applies on top of "ARM: dts: meson: meson8b: add the CPU
  OPP tables" which will be part of v4.20-rc1 once the arm-soc tree is
  merged into mainline
- updated patch description with more details


[0] http://lists.infradead.org/pipermail/linux-amlogic/2018-May/007274.html
[1] https://patchwork.kernel.org/cover/10744709/
[2] https://patchwork.kernel.org/cover/10744905/


Martin Blumenstingl (1):
  pinctrl: meson: meson8b: add the eth_rxd2 and eth_rxd3 pins

 drivers/pinctrl/meson/pinctrl-meson8b.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

-- 
2.20.1
