From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH v3] iio: adc: ti-ads7950: add GPIO support
Date: Wed, 20 Feb 2019 17:23:31 +0000
Message-ID: <20190220172331.40d7cbf0@archlinux>
References: <1550030242-5241-1-git-send-email-justinpopo6@gmail.com>
        <9e0a8a08-9636-906b-08cf-d99947d6f51a@lechnology.com>
        <20190220120021.65c91b83@archlinux>
        <96ec33f3-6e58-325f-9c55-4f1a92f635f7@lechnology.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <96ec33f3-6e58-325f-9c55-4f1a92f635f7@lechnology.com>
Sender: linux-kernel-owner@vger.kernel.org
To: David Lechner <david@lechnology.com>
Cc: justinpopo6@gmail.com, linux-iio@vger.kernel.org, linux-gpio@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, f.fainelli@gmail.com, bgolaszewski@baylibre.com, linus.walleij@linaro.org, knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On Wed, 20 Feb 2019 10:48:49 -0600
David Lechner <david@lechnology.com> wrote:

> On 2/20/19 6:00 AM, Jonathan Cameron wrote:
> > On Wed, 13 Feb 2019 09:10:53 +0100
> > David Lechner <david@lechnology.com> wrote:
> >   
> >> On 2/12/19 9:57 PM, justinpopo6@gmail.com wrote:  
> >>> From: Justin Chen <justinpopo6@gmail.com>
> >>>
> >>> The ADS79XX has GPIO pins that can be used. Add support for the GPIO
> >>> pins using the GPIO chip framework.
> >>>
> >>> Signed-off-by: Justin Chen <justinpopo6@gmail.com>
> >>> ---  
> >>
> >> It will be better to split this up into two patches[1]. One to replace
> >> all uses of indio_dev->mlock with the new local lock and then another to
> >> add GPIO support.
> >>
> >> How are you using/testing this patch? Do we need device tree bindings?
> >>
> >> It will also help reviewers if you add a note about what you changed in
> >> each revision of the patch when you resubmit. The usual way to do this
> >> is something like:
> >>
> >>       v3 changes:
> >>
> >>       - Fixed unlocking mutex too many times in ti_ads7950_init_gpio()
> >>
> >> It also is nice to wait a few days at least before submitting the next
> >> revision to give people some time to respond.  
> > 
> > Agreed with all comments except the endian one.
> > SPI doesn't define an endianness of data on the wire, so we may need
> > to convert to match whatever ordering the ti chip expects.
> > I would expect things to be thoroughly broken if we remove those
> > conversions - particularly as I doubt this is being tested with a
> > big endian host!
> > 
> > Jonathan  
> 
> I'm a bit confused then. I got this idea from include/linux/spi.h, which
> says:
> 
>   * In-memory data values are always in native CPU byte order, translated
>   * from the wire byte order (big-endian except with SPI_LSB_FIRST).  So
>   * for example when bits_per_word is sixteen, buffers are 2N bytes long
>   * (@len = 2N) and hold N sixteen bit words in CPU byte order.
> 
> 
> And in the most recent patches to the ti-ads7950 driver where we switched
> from 8-bit words to 16-bit words, I had to remove the calls to cpu_to_be16()
> to keep things working.
Ah, my apologies, I didn't look at this closely enough.

I was assuming we weren't in 16 bit mode here - oops.

Otherwise this wouldn't have any hope of working... Except I'm assuming it is...
hohum.

Hmm. Given the result of that cpu_to_be16 will be to swap (as almost certainly
on le system), I'm going to hazzard a guess that the ti device is expecting
little endian and we should be setting SPI_LSB_FIRST.
Which is odd because the data sheet definitely looks MSB first. Not to mention
this isn't be done elsewhere in the driver.

So only option I can fall back on is that it is being used on a be system
(hence noop) or is a forward port of an older patch for the driver that missed
your 16 bit change...

> 
> I realize that I am only using one SPI controller, so I may be making a bad
> assumption here, but it seems to me that it is up to the SPI controller to
> make sure the bits get sent over the wire in the correct order and we
> shouldn't have to worry about it here. We are implicitly telling the SPI
> controller that we need big-endian over the wire by omitting the SPI_LSB_FIRST
> flag here:
> 
> 	spi->bits_per_word = 16;
> 	spi->mode |= SPI_CS_WORD;
> 	ret = spi_setup(spi);
> 
You are entirely correct, I was too lazy and had forgotten your change to
move to 16 bits.

Jonathan
