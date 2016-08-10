From: <patrice.chotard@st.com>
Subject: [RESEND v2 10/10] gpio: stmpe: Add STMPE1600 support
Date: Wed, 10 Aug 2016 09:39:15 +0200
Message-ID: <1470814755-19447-11-git-send-email-patrice.chotard@st.com>
References: <1470814755-19447-1-git-send-email-patrice.chotard@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1470814755-19447-1-git-send-email-patrice.chotard@st.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: lee.jones@linaro.org, linus.walleij@linaro.org, linux-gpio@vger.kernel.org
Cc: gnurou@gmail.com, amelie.delaunay@st.com, vireshk@kernel.org, Patrice Chotard <patrice.chotard@st.com>, thierry.reding@gmail.com, kernel@pengutronix.de, dinguyen@opensource.altera.com, shawnguo@kernel.org, shiraz.linux.kernel@gmail.com, linux-arm-kernel@lists.infradead.org
List-Id: linux-gpio@vger.kernel.org

From: Patrice Chotard <patrice.chotard@st.com>

The particularities of this variant are:
- GPIO_XXX_LSB and GPIO_XXX_MSB memory locations are inverted compared
  to other variants.
- There is no Edge detection, Rising Edge and Falling Edge registers.
- IRQ flags are cleared when read, no need to write in Status register.

Signed-off-by: Amelie DELAUNAY <amelie.delaunay@st.com>
Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-stmpe.c | 48 +++++++++++++++++++++++++++++++++++++----------
 1 file changed, 38 insertions(+), 10 deletions(-)

diff --git a/drivers/gpio/gpio-stmpe.c b/drivers/gpio/gpio-stmpe.c
index 6d6d76a..32c5a72 100644
--- a/drivers/gpio/gpio-stmpe.c
+++ b/drivers/gpio/gpio-stmpe.c
@@ -128,8 +128,9 @@ static int stmpe_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 	if (type & IRQ_TYPE_LEVEL_LOW || type & IRQ_TYPE_LEVEL_HIGH)
 		return -EINVAL;
 
-	/* STMPE801 doesn't have RE and FE registers */
-	if (stmpe_gpio->stmpe->partnum == STMPE801)
+	/* STMPE801 and STMPE 1600 don't have RE and FE registers */
+	if (stmpe_gpio->stmpe->partnum == STMPE801 ||
+	    stmpe_gpio->stmpe->partnum == STMPE1600)
 		return 0;
 
 	if (type & IRQ_TYPE_EDGE_RISING)
@@ -173,9 +174,10 @@ static void stmpe_gpio_irq_sync_unlock(struct irq_data *d)
 	int i, j;
 
 	for (i = 0; i < CACHE_NR_REGS; i++) {
-		/* STMPE801 doesn't have RE and FE registers */
-		if ((stmpe->partnum == STMPE801) &&
-				(i != REG_IE))
+		/* STMPE801 and STMPE1600 don't have RE and FE registers */
+		if ((stmpe->partnum == STMPE801 ||
+		     stmpe->partnum == STMPE1600) &&
+		     (i != REG_IE))
 			continue;
 
 		for (j = 0; j < num_banks; j++) {
@@ -208,11 +210,21 @@ static void stmpe_gpio_irq_unmask(struct irq_data *d)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 	struct stmpe_gpio *stmpe_gpio = gpiochip_get_data(gc);
+	struct stmpe *stmpe = stmpe_gpio->stmpe;
 	int offset = d->hwirq;
 	int regoffset = offset / 8;
 	int mask = 1 << (offset % 8);
 
 	stmpe_gpio->regs[REG_IE][regoffset] |= mask;
+
+	/*
+	 * STMPE1600 workaround: to be able to get IRQ from pins,
+	 * a read must be done on GPMR register, or a write in
+	 * GPSR or GPCR registers
+	 */
+	if (stmpe->partnum == STMPE1600)
+		stmpe_reg_read(stmpe,
+			       stmpe->regs[STMPE_IDX_GPMR_LSB + regoffset]);
 }
 
 static void stmpe_dbg_show_one(struct seq_file *s,
@@ -285,6 +297,7 @@ static void stmpe_dbg_show_one(struct seq_file *s,
 			fall = !!(ret & mask);
 
 		case STMPE801:
+		case STMPE1600:
 			irqen_reg = stmpe->regs[STMPE_IDX_IEGPIOR_LSB + bank];
 			break;
 
@@ -331,18 +344,32 @@ static irqreturn_t stmpe_gpio_irq(int irq, void *dev)
 {
 	struct stmpe_gpio *stmpe_gpio = dev;
 	struct stmpe *stmpe = stmpe_gpio->stmpe;
-	u8 statmsbreg = stmpe->regs[STMPE_IDX_ISGPIOR_MSB];
+	u8 statmsbreg;
 	int num_banks = DIV_ROUND_UP(stmpe->num_gpios, 8);
 	u8 status[num_banks];
 	int ret;
 	int i;
 
+	/*
+	 * the stmpe_block_read() call below, imposes to set statmsbreg
+	 * with the register located at the lowest address. As STMPE1600
+	 * variant is the only one which respect registers address's order
+	 * (LSB regs located at lowest address than MSB ones) whereas all
+	 * the others have a registers layout with MSB located before the
+	 * LSB regs.
+	 */
+	if (stmpe->partnum == STMPE1600)
+		statmsbreg = stmpe->regs[STMPE_IDX_ISGPIOR_LSB];
+	else
+		statmsbreg = stmpe->regs[STMPE_IDX_ISGPIOR_MSB];
+
 	ret = stmpe_block_read(stmpe, statmsbreg, num_banks, status);
 	if (ret < 0)
 		return IRQ_NONE;
 
 	for (i = 0; i < num_banks; i++) {
-		int bank = num_banks - i - 1;
+		int bank = (stmpe_gpio->stmpe->partnum == STMPE1600) ? i :
+			   num_banks - i - 1;
 		unsigned int enabled = stmpe_gpio->regs[REG_IE][bank];
 		unsigned int stat = status[i];
 
@@ -362,10 +389,11 @@ static irqreturn_t stmpe_gpio_irq(int irq, void *dev)
 
 		/*
 		 * interrupt status register write has no effect on
-		 * 801 and 1801, bits are cleared when read.
-		 * Edge detect register is not present on 801 and 1801
+		 * 801/1801/1600, bits are cleared when read.
+		 * Edge detect register is not present on 801/1600/1801
 		 */
-		if (stmpe->partnum != STMPE801 || stmpe->partnum != STMPE1801) {
+		if (stmpe->partnum != STMPE801 || stmpe->partnum != STMPE1600 ||
+		    stmpe->partnum != STMPE1801) {
 			stmpe_reg_write(stmpe, statmsbreg + i, status[i]);
 			stmpe_reg_write(stmpe,
 					stmpe->regs[STMPE_IDX_GPEDR_LSB + i],
-- 
1.9.1
