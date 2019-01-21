From: Stefan Wahren <stefan.wahren@i2se.com>
Subject: Re: [PATCH RFC V2 3/4] pinctrl: bcm2835: activate strict mux mode
Date: Mon, 21 Jan 2019 10:57:37 +0100
Message-ID: <db62122f-00fc-b251-6fa7-7d02a4d7d9c5@i2se.com>
References: <1548054685-3781-1-git-send-email-stefan.wahren@i2se.com>
 <1548054685-3781-4-git-send-email-stefan.wahren@i2se.com>
 <20190121073419.iosy3bd6tcnexya7@wunner.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190121073419.iosy3bd6tcnexya7@wunner.de>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Lukas Wunner <lukas@wunner.de>
Cc: linux-gpio@vger.kernel.org, Eric Anholt <eric@anholt.net>, Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Peter Robinson <pbrobinson@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-gpio@vger.kernel.org

Am 21.01.19 um 08:34 schrieb Lukas Wunner:
> On Mon, Jan 21, 2019 at 08:11:24AM +0100, Stefan Wahren wrote:
>> This activates strict mode muxing for the bcm2835 pin controller,
>> as the GPIO Function Select Registers do not allow GPIO and functions
>> at the same time.
> bcm2835_spi_setup() in spi-bcm2835.c converts a native chip select
> to a gpio chip select.  So pins 7+8 and/or 35+36 may be set to
> function alt0 but in reality the pins are requested and driven as
> generic output gpio pins.
>
> I'm not sure but doesn't this break in strict mode?

That's a good point. I hope that isn't a problem because owner should be
the same.

But i didn't test this scenario. Do you mind to give this series a try?

The only issue i found so far was a unnecessary pinctrl on the Raspberry
Pi Zero W, which should be fixed with this [1].

At the end we need to switch to strict mode, because currently a simple
gpioset can "destroy" the mux setting for I2C or SPI.

[1] - https://marc.info/?l=linux-arm-kernel&m=154800402627578

>
> Thanks,
>
> Lukas
>
