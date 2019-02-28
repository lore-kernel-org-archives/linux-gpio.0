From: justinpopo6@gmail.com
Subject: [PATCH v4 1/2] iio: adc: ti-ads7950: Fix improper use of mlock
Date: Thu, 28 Feb 2019 14:16:48 -0800
Message-ID: <1551392209-20004-2-git-send-email-justinpopo6@gmail.com>
References: <1551392209-20004-1-git-send-email-justinpopo6@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1551392209-20004-1-git-send-email-justinpopo6@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-iio@vger.kernel.org
Cc: linux-gpio@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, f.fainelli@gmail.com, bgolaszewski@baylibre.com, linus.walleij@linaro.org, jic23@kernel.org, knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net, linux-kernel@vger.kernel.org, Justin Chen <justinpopo6@gmail.com>
List-Id: linux-gpio@vger.kernel.org

From: Justin Chen <justinpopo6@gmail.com>

Indio->mlock is used for protecting the different iio device modes.
It is currently not being used in this way. Replace the lock with
an internal lock specifically used for protecting the SPI transfer
buffer.

Signed-off-by: Justin Chen <justinpopo6@gmail.com>
---
 drivers/iio/adc/ti-ads7950.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/iio/adc/ti-ads7950.c b/drivers/iio/adc/ti-ads7950.c
index 0ad6359..1e47bef 100644
--- a/drivers/iio/adc/ti-ads7950.c
+++ b/drivers/iio/adc/ti-ads7950.c
@@ -56,6 +56,9 @@ struct ti_ads7950_state {
 	struct spi_message	ring_msg;
 	struct spi_message	scan_single_msg;
 
+	/* Lock to protect the spi xfer buffers */
+	struct mutex		slock;
+
 	struct regulator	*reg;
 	unsigned int		vref_mv;
 
@@ -268,6 +271,7 @@ static irqreturn_t ti_ads7950_trigger_handler(int irq, void *p)
 	struct ti_ads7950_state *st = iio_priv(indio_dev);
 	int ret;
 
+	mutex_lock(&st->slock);
 	ret = spi_sync(st->spi, &st->ring_msg);
 	if (ret < 0)
 		goto out;
@@ -276,6 +280,7 @@ static irqreturn_t ti_ads7950_trigger_handler(int irq, void *p)
 					   iio_get_time_ns(indio_dev));
 
 out:
+	mutex_unlock(&st->slock);
 	iio_trigger_notify_done(indio_dev->trig);
 
 	return IRQ_HANDLED;
@@ -286,7 +291,7 @@ static int ti_ads7950_scan_direct(struct iio_dev *indio_dev, unsigned int ch)
 	struct ti_ads7950_state *st = iio_priv(indio_dev);
 	int ret, cmd;
 
-	mutex_lock(&indio_dev->mlock);
+	mutex_lock(&st->slock);
 
 	cmd = TI_ADS7950_CR_WRITE | TI_ADS7950_CR_CHAN(ch) | st->settings;
 	st->single_tx = cmd;
@@ -298,7 +303,7 @@ static int ti_ads7950_scan_direct(struct iio_dev *indio_dev, unsigned int ch)
 	ret = st->single_rx;
 
 out:
-	mutex_unlock(&indio_dev->mlock);
+	mutex_unlock(&st->slock);
 
 	return ret;
 }
@@ -432,16 +437,19 @@ static int ti_ads7950_probe(struct spi_device *spi)
 	if (ACPI_COMPANION(&spi->dev))
 		st->vref_mv = TI_ADS7950_VA_MV_ACPI_DEFAULT;
 
+	mutex_init(&st->slock);
+
 	st->reg = devm_regulator_get(&spi->dev, "vref");
 	if (IS_ERR(st->reg)) {
 		dev_err(&spi->dev, "Failed get get regulator \"vref\"\n");
-		return PTR_ERR(st->reg);
+		ret = PTR_ERR(st->reg);
+		goto error_destroy_mutex;
 	}
 
 	ret = regulator_enable(st->reg);
 	if (ret) {
 		dev_err(&spi->dev, "Failed to enable regulator \"vref\"\n");
-		return ret;
+		goto error_destroy_mutex;
 	}
 
 	ret = iio_triggered_buffer_setup(indio_dev, NULL,
@@ -463,6 +471,8 @@ static int ti_ads7950_probe(struct spi_device *spi)
 	iio_triggered_buffer_cleanup(indio_dev);
 error_disable_reg:
 	regulator_disable(st->reg);
+error_destroy_mutex:
+	mutex_destroy(&st->slock);
 
 	return ret;
 }
@@ -475,6 +485,7 @@ static int ti_ads7950_remove(struct spi_device *spi)
 	iio_device_unregister(indio_dev);
 	iio_triggered_buffer_cleanup(indio_dev);
 	regulator_disable(st->reg);
+	mutex_destroy(&st->slock);
 
 	return 0;
 }
-- 
2.7.4
