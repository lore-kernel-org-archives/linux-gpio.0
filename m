From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH v3] iio: adc: ti-ads7950: add GPIO support
Date: Wed, 20 Feb 2019 12:00:21 +0000
Message-ID: <20190220120021.65c91b83@archlinux>
References: <1550030242-5241-1-git-send-email-justinpopo6@gmail.com>
        <9e0a8a08-9636-906b-08cf-d99947d6f51a@lechnology.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <9e0a8a08-9636-906b-08cf-d99947d6f51a@lechnology.com>
Sender: linux-kernel-owner@vger.kernel.org
To: David Lechner <david@lechnology.com>
Cc: justinpopo6@gmail.com, linux-iio@vger.kernel.org, linux-gpio@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, f.fainelli@gmail.com, bgolaszewski@baylibre.com, linus.walleij@linaro.org, knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On Wed, 13 Feb 2019 09:10:53 +0100
David Lechner <david@lechnology.com> wrote:

> On 2/12/19 9:57 PM, justinpopo6@gmail.com wrote:
> > From: Justin Chen <justinpopo6@gmail.com>
> > 
> > The ADS79XX has GPIO pins that can be used. Add support for the GPIO
> > pins using the GPIO chip framework.
> > 
> > Signed-off-by: Justin Chen <justinpopo6@gmail.com>
> > ---  
> 
> It will be better to split this up into two patches[1]. One to replace 
> all uses of indio_dev->mlock with the new local lock and then another to 
> add GPIO support.
> 
> How are you using/testing this patch? Do we need device tree bindings?
> 
> It will also help reviewers if you add a note about what you changed in 
> each revision of the patch when you resubmit. The usual way to do this 
> is something like:
> 
>      v3 changes:
> 
>      - Fixed unlocking mutex too many times in ti_ads7950_init_gpio()
> 
> It also is nice to wait a few days at least before submitting the next 
> revision to give people some time to respond.

Agreed with all comments except the endian one.
SPI doesn't define an endianness of data on the wire, so we may need
to convert to match whatever ordering the ti chip expects.
I would expect things to be thoroughly broken if we remove those
conversions - particularly as I doubt this is being tested with a
big endian host!

Jonathan
> 
> 
> 
> [1]: 
> https://www.kernel.org/doc/html/latest/process/submitting-patches.html#split-changes
> 
> >   drivers/iio/adc/ti-ads7950.c | 169 ++++++++++++++++++++++++++++++++++++++++++-
> >   1 file changed, 166 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/iio/adc/ti-ads7950.c b/drivers/iio/adc/ti-ads7950.c
> > index 0ad6359..9723d66 100644
> > --- a/drivers/iio/adc/ti-ads7950.c
> > +++ b/drivers/iio/adc/ti-ads7950.c
> > @@ -17,6 +17,7 @@
> >   #include <linux/bitops.h>
> >   #include <linux/device.h>
> >   #include <linux/err.h>
> > +#include <linux/gpio/driver.h>
> >   #include <linux/interrupt.h>
> >   #include <linux/kernel.h>
> >   #include <linux/module.h>
> > @@ -36,10 +37,14 @@
> >    */
> >   #define TI_ADS7950_VA_MV_ACPI_DEFAULT	5000
> >   
> > +#define TI_ADS7950_CR_GPIO	BIT(14)
> >   #define TI_ADS7950_CR_MANUAL	BIT(12)
> >   #define TI_ADS7950_CR_WRITE	BIT(11)
> >   #define TI_ADS7950_CR_CHAN(ch)	((ch) << 7)
> >   #define TI_ADS7950_CR_RANGE_5V	BIT(6)
> > +#define TI_ADS7950_CR_GPIO_DATA	BIT(5)
> > +#define TI_ADS7950_NUM_GPIOS	4
> > +#define TI_ADS7950_GPIO_MASK	GENMASK(TI_ADS7950_NUM_GPIOS - 1, 0)
> >   
> >   #define TI_ADS7950_MAX_CHAN	16
> >   
> > @@ -56,11 +61,17 @@ struct ti_ads7950_state {
> >   	struct spi_message	ring_msg;
> >   	struct spi_message	scan_single_msg;
> >   
> > +	struct gpio_chip	chip;
> > +	struct mutex		slock;  
> 
> A comment stating what slock is protecting (i.e. the spi xfers and 
> buffers) would be helpful.
> 
> > +
> >   	struct regulator	*reg;
> >   	unsigned int		vref_mv;
> >   
> >   	unsigned int		settings;
> >   
> > +	unsigned int		gpio_direction_bitmask;
> > +	unsigned int		gpio_signal_bitmask;
> > +
> >   	/*
> >   	 * DMA (thus cache coherency maintenance) requires the
> >   	 * transfer buffers to live in their own cache lines.
> > @@ -248,7 +259,8 @@ static int ti_ads7950_update_scan_mode(struct iio_dev *indio_dev,
> >   
> >   	len = 0;
> >   	for_each_set_bit(i, active_scan_mask, indio_dev->num_channels) {
> > -		cmd = TI_ADS7950_CR_WRITE | TI_ADS7950_CR_CHAN(i) | st->settings;
> > +		cmd = TI_ADS7950_CR_WRITE | TI_ADS7950_CR_CHAN(i) | st->settings
> > +		      | (st->gpio_signal_bitmask & TI_ADS7950_GPIO_MASK);
> >   		st->tx_buf[len++] = cmd;
> >   	}
> >   
> > @@ -287,8 +299,9 @@ static int ti_ads7950_scan_direct(struct iio_dev *indio_dev, unsigned int ch)
> >   	int ret, cmd;
> >   
> >   	mutex_lock(&indio_dev->mlock);  
> 
> The use of mlock should be removed here since we are replacing it with 
> slock. Also, ti_ads7950_trigger_handler() will need to be changed to use 
> slock when the use of mlock is removed. (When 
> ti_ads7950_trigger_handler() is called, mlock is already held by the 
> calling function.)
> 
> > -
> > -	cmd = TI_ADS7950_CR_WRITE | TI_ADS7950_CR_CHAN(ch) | st->settings;
> > +	mutex_lock(&st->slock);
> > +	cmd = TI_ADS7950_CR_WRITE | TI_ADS7950_CR_CHAN(ch) | st->settings
> > +	      | (st->gpio_signal_bitmask & TI_ADS7950_GPIO_MASK);
> >   	st->single_tx = cmd;
> >   
> >   	ret = spi_sync(st->spi, &st->scan_single_msg);
> > @@ -298,6 +311,7 @@ static int ti_ads7950_scan_direct(struct iio_dev *indio_dev, unsigned int ch)
> >   	ret = st->single_rx;
> >   
> >   out:
> > +	mutex_unlock(&st->slock);
> >   	mutex_unlock(&indio_dev->mlock);
> >   
> >   	return ret;
> > @@ -362,6 +376,145 @@ static const struct iio_info ti_ads7950_info = {
> >   	.update_scan_mode	= ti_ads7950_update_scan_mode,
> >   };
> >   
> > +static void ti_ads7950_set(struct gpio_chip *chip, unsigned int offset,
> > +			   int value)
> > +{
> > +	struct ti_ads7950_state *st = gpiochip_get_data(chip);
> > +
> > +	mutex_lock(&st->slock);
> > +
> > +	if (value)
> > +		st->gpio_signal_bitmask |= BIT(offset);
> > +	else
> > +		st->gpio_signal_bitmask &= ~BIT(offset);
> > +
> > +	st->single_tx = cpu_to_be16(TI_ADS7950_CR_MANUAL | TI_ADS7950_CR_WRITE |
> > +			(st->gpio_signal_bitmask & TI_ADS7950_GPIO_MASK));  
> 
> SPI xfers are CPU-endian, so cpu_to_be16() doesn't seem right here.

How do we deal with the fact the TI device isn't CPU isn't necessarily CPU endian?
Unlike I2C (where lots of devices are technically broken ;) SPI doesn't define
an endian order, so we need to deal with whatever the device on the end is doing
when we send multi byte messages.

> 
> > +	spi_sync(st->spi, &st->scan_single_msg);
> > +
> > +	mutex_unlock(&st->slock);
> > +}
> > +
> > +static int ti_ads7950_get(struct gpio_chip *chip, unsigned int offset)
> > +{
> > +	struct ti_ads7950_state *st = gpiochip_get_data(chip);
> > +	int ret;
> > +
> > +	mutex_lock(&st->slock);
> > +
> > +	/* If set as output, return the output */
> > +	if (st->gpio_direction_bitmask & BIT(offset)) {
> > +		ret = st->gpio_signal_bitmask & BIT(offset);
> > +		goto out;
> > +	}
> > +
> > +	st->single_tx = cpu_to_be16(TI_ADS7950_CR_MANUAL | TI_ADS7950_CR_WRITE |
> > +				    TI_ADS7950_CR_GPIO_DATA);  
> 
> Again, cpu_to_be16() seems wrong.
> 
> > +	ret = spi_sync(st->spi, &st->scan_single_msg);
> > +	if (ret)
> > +		goto out;
> > +
> > +	ret = ((st->single_rx >> 12) & BIT(offset)) ? 1 : 0;
> > +
> > +out:
> > +	mutex_unlock(&st->slock);
> > +
> > +	return ret;
> > +}
> > +
> > +static int ti_ads7950_get_direction(struct gpio_chip *chip,
> > +				    unsigned int offset)
> > +{
> > +	struct ti_ads7950_state *st = gpiochip_get_data(chip);
> > +
> > +	return !(st->gpio_direction_bitmask & BIT(offset));  
> 
> The use of `!` here seems odd. Why make gpio_direction_bitmask inverted 
> compared to the gpio framework?
> 
> > +}
> > +
> > +static int _ti_ads7950_set_direction(struct gpio_chip *chip, int offset,
> > +				     int input)
> > +{
> > +	struct ti_ads7950_state *st = gpiochip_get_data(chip);
> > +	int ret = 0; > +
> > +	mutex_lock(&st->slock);
> > +  
> 
> A comment explaining what is going on here (i.e. we only send an SPI 
> message if the direction changes) would be helpful. It was not quite 
> obvious to me at first glance.
> 
> > +	if (input && (st->gpio_direction_bitmask & BIT(offset)))
> > +		st->gpio_direction_bitmask &= ~BIT(offset);
> > +	else if (!input && !(st->gpio_direction_bitmask & BIT(offset)))
> > +		st->gpio_direction_bitmask |= BIT(offset);
> > +	else
> > +		goto out;
> > +
> > +
> > +	st->single_tx = cpu_to_be16(TI_ADS7950_CR_GPIO |
> > +				    (st->gpio_direction_bitmask &
> > +				    TI_ADS7950_GPIO_MASK));
> > +	ret = spi_sync(st->spi, &st->scan_single_msg);
> > +
> > +out:
> > +	mutex_unlock(&st->slock);
> > +
> > +	return ret;
> > +}
> > +
> > +static int ti_ads7950_direction_input(struct gpio_chip *chip,
> > +				      unsigned int offset)
> > +{
> > +	return _ti_ads7950_set_direction(chip, offset, 1);
> > +}
> > +
> > +static int ti_ads7950_direction_output(struct gpio_chip *chip,
> > +				       unsigned int offset, int value)
> > +{
> > +	ti_ads7950_set(chip, offset, value);
> > +
> > +	return _ti_ads7950_set_direction(chip, offset, 0);
> > +}
> > +
> > +static int ti_ads7950_init_gpio(struct ti_ads7950_state *st)
> > +{
> > +	int ret;
> > +
> > +	/* Initialize GPIO */
> > +	mutex_lock(&st->slock);
> > +
> > +	/* Default to GPIO input */
> > +	st->gpio_direction_bitmask = 0x0;  
> 
> It is probably safe to leave this out since it should already be 0.
> 
> > +	st->single_tx = cpu_to_be16(TI_ADS7950_CR_GPIO |
> > +				    (st->gpio_direction_bitmask &
> > +				    TI_ADS7950_GPIO_MASK));
> > +	ret = spi_sync(st->spi, &st->scan_single_msg > +	if (ret) {
> > +		mutex_unlock(&st->slock);
> > +		return ret;
> > +	}
> > +
> > +	/* Default to signal low */
> > +	st->gpio_signal_bitmask = 0x0;
> > +	st->single_tx = cpu_to_be16(TI_ADS7950_CR_MANUAL |
> > +				    TI_ADS7950_CR_WRITE |
> > +				    (st->gpio_signal_bitmask &
> > +				    TI_ADS7950_GPIO_MASK));
> > +	ret = spi_sync(st->spi, &st->scan_single_msg);
> > +	mutex_unlock(&st->slock);
> > +	if (ret)
> > +		return ret;
> > +
> > +	/* Add GPIO chip */
> > +	st->chip.label = dev_name(&st->spi->dev);
> > +	st->chip.parent = &st->spi->dev;
> > +	st->chip.owner = THIS_MODULE;
> > +	st->chip.base = -1;
> > +	st->chip.ngpio = TI_ADS7950_NUM_GPIOS;
> > +	st->chip.get_direction = ti_ads7950_get_direction;
> > +	st->chip.direction_input = ti_ads7950_direction_input;
> > +	st->chip.direction_output = ti_ads7950_direction_output;
> > +	st->chip.get = ti_ads7950_get;
> > +	st->chip.set = ti_ads7950_set;  
> 
> Does it make sense to also implement chip.get_multiple and 
> chip.set_multiple to minimize SPI transactions?
> 
> > +
> > +	return gpiochip_add_data(&st->chip, st);
> > +}
> > +
> >   static int ti_ads7950_probe(struct spi_device *spi)
> >   {
> >   	struct ti_ads7950_state *st;
> > @@ -457,8 +610,17 @@ static int ti_ads7950_probe(struct spi_device *spi)
> >   		goto error_cleanup_ring;
> >   	}
> >   
> > +	mutex_init(&st->slock);  
> 
> This will probably never actually cause a problem, but the mutex should 
> probably be inited before registering the iio device since it uses the 
> mutex as well.
> 
> > +	ret = ti_ads7950_init_gpio(st);
> > +	if (ret) {
> > +		dev_err(&spi->dev, "Failed to initialize GPIOs\n");
> > +		goto error_destroy_mutex;
> > +	}
> > +
> >   	return 0;
> >   
> > +error_destroy_mutex:
> > +	mutex_destroy(&st->slock);
> >   error_cleanup_ring:
> >   	iio_triggered_buffer_cleanup(indio_dev);
> >   error_disable_reg:
> > @@ -475,6 +637,7 @@ static int ti_ads7950_remove(struct spi_device *spi)
> >   	iio_device_unregister(indio_dev);
> >   	iio_triggered_buffer_cleanup(indio_dev);
> >   	regulator_disable(st->reg);
> > +	mutex_destroy(&st->slock);
> >   
> >   	return 0;
> >   }
> >   
