From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 1/3] pinctrl: meson-gxbb: Fix typo in i2c ao groups
Date: Tue,  7 Mar 2017 14:31:00 +0100
Message-ID: <1488893462-7016-2-git-send-email-narmstrong@baylibre.com>
References: <1488893462-7016-1-git-send-email-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1488893462-7016-1-git-send-email-narmstrong@baylibre.com>
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

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/pinctrl/meson/pinctrl-meson-gxbb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/meson/pinctrl-meson-gxbb.c b/drivers/pinctrl/meson/pinctrl-meson-gxbb.c
index 7671424..31a3a98 100644
--- a/drivers/pinctrl/meson/pinctrl-meson-gxbb.c
+++ b/drivers/pinctrl/meson/pinctrl-meson-gxbb.c
@@ -667,11 +667,11 @@
 };
 
 static const char * const i2c_ao_groups[] = {
-	"i2c_sdk_ao", "i2c_sda_ao",
+	"i2c_sck_ao", "i2c_sda_ao",
 };
 
 static const char * const i2c_slave_ao_groups[] = {
-	"i2c_slave_sdk_ao", "i2c_slave_sda_ao",
+	"i2c_slave_sck_ao", "i2c_slave_sda_ao",
 };
 
 static const char * const remote_input_ao_groups[] = {
-- 
1.9.1
