From: justinpopo6@gmail.com
Subject: [PATCH] iio: adc: ti-ads7950: add GPIO support
Date: Fri,  8 Feb 2019 11:24:16 -0800
Message-ID: <1549653856-47409-1-git-send-email-justinpopo6@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-iio@vger.kernel.org
Cc: linux-gpio@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, f.fainelli@gmail.com, bgolaszewski@baylibre.com, linus.walleij@linaro.org, jic23@kernel.org, knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net, david@lechnology.com, linux-kernel@vger.kernel.org, Justin Chen <justinpopo6@gmail.com>
List-Id: linux-gpio@vger.kernel.org

From: Justin Chen <justinpopo6@gmail.com>

The ADS79XX has GPIO pins that can be used. Add support for the GPIO
pins using the GPIO chip framework.

Signed-off-by: Justin Chen <justinpopo6@gmail.com>
---
 drivers/iio/adc/ti-ads7950.c | 166 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 164 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/adc/ti-ads7950.c b/drivers/iio/adc/ti-ads7950.c
index 0ad6359..c54706ad 100644
--- a/drivers/iio/adc/ti-ads7950.c
+++ b/drivers/iio/adc/ti-ads7950.c
@@ -17,6 +17,7 @@
 #include <linux/bitops.h>
 #include <linux/device.h>
 #include <linux/err.h>
+#include <linux/gpio/driver.h>
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
@@ -36,10 +37,14 @@
  */
 #define TI_ADS7950_VA_MV_ACPI_DEFAULT	5000
 
+#define TI_ADS7950_CR_GPIO	BIT(14)
 #define TI_ADS7950_CR_MANUAL	BIT(12)
 #define TI_ADS7950_CR_WRITE	BIT(11)
 #define TI_ADS7950_CR_CHAN(ch)	((ch) << 7)
 #define TI_ADS7950_CR_RANGE_5V	BIT(6)
+#define TI_ADS7950_CR_GPIO_DATA	BIT(5)
+#define TI_ADS7950_NUM_GPIOS	4
+#define TI_ADS7950_GPIO_MASK	GENMASK(TI_ADS7950_NUM_GPIOS - 1, 0)
 
 #define TI_ADS7950_MAX_CHAN	16
 
@@ -56,11 +61,17 @@ struct ti_ads7950_state {
 	struct spi_message	ring_msg;
 	struct spi_message	scan_single_msg;
 
+	struct iio_dev		*indio_dev;
+	struct gpio_chip	*chip;
+
 	struct regulator	*reg;
 	unsigned int		vref_mv;
 
 	unsigned int		settings;
 
+	unsigned int		gpio_direction_bitmask;
+	unsigned int		gpio_signal_bitmask;
+
 	/*
 	 * DMA (thus cache coherency maintenance) requires the
 	 * transfer buffers to live in their own cache lines.
@@ -248,7 +259,8 @@ static int ti_ads7950_update_scan_mode(struct iio_dev *indio_dev,
 
 	len = 0;
 	for_each_set_bit(i, active_scan_mask, indio_dev->num_channels) {
-		cmd = TI_ADS7950_CR_WRITE | TI_ADS7950_CR_CHAN(i) | st->settings;
+		cmd = TI_ADS7950_CR_WRITE | TI_ADS7950_CR_CHAN(i) | st->settings
+		      | (st->gpio_signal_bitmask & TI_ADS7950_GPIO_MASK);
 		st->tx_buf[len++] = cmd;
 	}
 
@@ -288,7 +300,8 @@ static int ti_ads7950_scan_direct(struct iio_dev *indio_dev, unsigned int ch)
 
 	mutex_lock(&indio_dev->mlock);
 
-	cmd = TI_ADS7950_CR_WRITE | TI_ADS7950_CR_CHAN(ch) | st->settings;
+	cmd = TI_ADS7950_CR_WRITE | TI_ADS7950_CR_CHAN(ch) | st->settings
+	      | (st->gpio_signal_bitmask & TI_ADS7950_GPIO_MASK);
 	st->single_tx = cmd;
 
 	ret = spi_sync(st->spi, &st->scan_single_msg);
@@ -362,10 +375,149 @@ static const struct iio_info ti_ads7950_info = {
 	.update_scan_mode	= ti_ads7950_update_scan_mode,
 };
 
+static void ti_ads7950_set(struct gpio_chip *chip, unsigned int offset,
+			   int value)
+{
+	struct ti_ads7950_state *st = gpiochip_get_data(chip);
+
+	mutex_lock(&st->indio_dev->mlock);
+
+	if (value)
+		st->gpio_signal_bitmask |= BIT(offset);
+	else
+		st->gpio_signal_bitmask &= ~BIT(offset);
+
+	st->single_tx = cpu_to_be16(TI_ADS7950_CR_MANUAL | TI_ADS7950_CR_WRITE |
+			(st->gpio_signal_bitmask & TI_ADS7950_GPIO_MASK));
+	spi_sync(st->spi, &st->scan_single_msg);
+
+	mutex_unlock(&st->indio_dev->mlock);
+}
+
+static int ti_ads7950_get(struct gpio_chip *chip, unsigned int offset)
+{
+	struct ti_ads7950_state *st = gpiochip_get_data(chip);
+	int ret;
+
+	mutex_lock(&st->indio_dev->mlock);
+
+	/* If set as output, return the output */
+	if (st->gpio_direction_bitmask & BIT(offset)) {
+		ret = st->gpio_signal_bitmask & BIT(offset);
+		goto out;
+	}
+
+	st->single_tx = cpu_to_be16(TI_ADS7950_CR_MANUAL | TI_ADS7950_CR_WRITE |
+				    TI_ADS7950_CR_GPIO_DATA);
+	ret = spi_sync(st->spi, &st->scan_single_msg);
+	if (ret)
+		goto out;
+
+	ret = ((st->single_rx >> 12) & BIT(offset)) ? 1 : 0;
+
+out:
+	mutex_unlock(&st->indio_dev->mlock);
+
+	return ret;
+}
+
+static int ti_ads7950_get_direction(struct gpio_chip *chip,
+				    unsigned int offset)
+{
+	struct ti_ads7950_state *st = gpiochip_get_data(chip);
+
+	return !(st->gpio_direction_bitmask & BIT(offset));
+}
+
+static int _ti_ads7950_set_direction(struct gpio_chip *chip, int offset,
+				     int input)
+{
+	struct ti_ads7950_state *st = gpiochip_get_data(chip);
+	int ret = 0;
+
+	mutex_lock(&st->indio_dev->mlock);
+
+	if (input && (st->gpio_direction_bitmask & BIT(offset)))
+		st->gpio_direction_bitmask &= ~BIT(offset);
+	else if (!input && !(st->gpio_direction_bitmask & BIT(offset)))
+		st->gpio_direction_bitmask |= BIT(offset);
+	else
+		goto out;
+
+
+	st->single_tx = cpu_to_be16(TI_ADS7950_CR_GPIO |
+				    (st->gpio_direction_bitmask &
+				    TI_ADS7950_GPIO_MASK));
+	ret = spi_sync(st->spi, &st->scan_single_msg);
+
+out:
+	mutex_unlock(&st->indio_dev->mlock);
+
+	return ret;
+}
+
+static int ti_ads7950_direction_input(struct gpio_chip *chip,
+				      unsigned int offset)
+{
+	return _ti_ads7950_set_direction(chip, offset, 1);
+}
+
+static int ti_ads7950_direction_output(struct gpio_chip *chip,
+				       unsigned int offset, int value)
+{
+	ti_ads7950_set(chip, offset, value);
+
+	return _ti_ads7950_set_direction(chip, offset, 0);
+}
+
+static int ti_ads7950_init_gpio(struct ti_ads7950_state *st)
+{
+	int ret;
+
+	/* Initialize GPIO */
+	mutex_lock(&st->indio_dev->mlock);
+
+	/* Default to GPIO input */
+	st->gpio_direction_bitmask = 0x0;
+	st->single_tx = cpu_to_be16(TI_ADS7950_CR_GPIO |
+				    (st->gpio_direction_bitmask &
+				    TI_ADS7950_GPIO_MASK));
+	ret = spi_sync(st->spi, &st->scan_single_msg);
+	mutex_unlock(&st->indio_dev->mlock);
+	if (ret)
+		return ret;
+
+	/* Default to signal low */
+	st->gpio_signal_bitmask = 0x0;
+	st->single_tx = cpu_to_be16(TI_ADS7950_CR_MANUAL |
+				    TI_ADS7950_CR_WRITE |
+				    (st->gpio_signal_bitmask &
+				    TI_ADS7950_GPIO_MASK));
+	ret = spi_sync(st->spi, &st->scan_single_msg);
+	mutex_unlock(&st->indio_dev->mlock);
+	if (ret)
+		return ret;
+
+	/* Add GPIO chip */
+	st->chip->label = dev_name(&st->spi->dev);
+	st->chip->parent = &st->spi->dev;
+	st->chip->owner = THIS_MODULE;
+	st->chip->base = -1;
+	st->chip->ngpio = TI_ADS7950_NUM_GPIOS;
+	st->chip->get_direction = ti_ads7950_get_direction;
+	st->chip->direction_input = ti_ads7950_direction_input;
+	st->chip->direction_output = ti_ads7950_direction_output;
+	st->chip->get = ti_ads7950_get;
+	st->chip->set = ti_ads7950_set;
+
+	return gpiochip_add_data(st->chip, st);
+}
+
 static int ti_ads7950_probe(struct spi_device *spi)
 {
 	struct ti_ads7950_state *st;
 	struct iio_dev *indio_dev;
+	struct gpio_chip *chip;
 	const struct ti_ads7950_chip_info *info;
 	int ret;
 
@@ -381,6 +533,10 @@ static int ti_ads7950_probe(struct spi_device *spi)
 	if (!indio_dev)
 		return -ENOMEM;
 
+	chip = devm_kzalloc(&spi->dev, sizeof(*chip), GFP_KERNEL);
+	if (!chip)
+		return -ENOMEM;
+
 	st = iio_priv(indio_dev);
 
 	spi_set_drvdata(spi, indio_dev);
@@ -396,6 +552,8 @@ static int ti_ads7950_probe(struct spi_device *spi)
 	indio_dev->channels = info->channels;
 	indio_dev->num_channels = info->num_channels;
 	indio_dev->info = &ti_ads7950_info;
+	st->indio_dev = indio_dev;
+	st->chip = chip;
 
 	/* build spi ring message */
 	spi_message_init(&st->ring_msg);
@@ -457,6 +615,10 @@ static int ti_ads7950_probe(struct spi_device *spi)
 		goto error_cleanup_ring;
 	}
 
+	ret = ti_ads7950_init_gpio(st);
+	if (ret)
+		dev_warn(&spi->dev, "Unable to initialize GPIOs\n");
+
 	return 0;
 
 error_cleanup_ring:
-- 
2.7.4
