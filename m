From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: GPIO consumer interface and DT
Date: Thu, 16 Aug 2018 08:39:06 +0200
Message-ID: <CACRpkdZ04vLKZ43TAh+OLh1hwd4tkZf9fnRf120aBBSe+-MCxg@mail.gmail.com>
References: <20180815221102.GA4375@arek-VirtualBox>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <kernelnewbies-bounces+glkk-kernelnewbies=gmane.org@kernelnewbies.org>
In-Reply-To: <20180815221102.GA4375@arek-VirtualBox>
List-Unsubscribe: <https://lists.kernelnewbies.org/mailman/options/kernelnewbies>,
 <mailto:kernelnewbies-request@kernelnewbies.org?subject=unsubscribe>
List-Archive: <http://lists.kernelnewbies.org/pipermail/kernelnewbies/>
List-Post: <mailto:kernelnewbies@kernelnewbies.org>
List-Help: <mailto:kernelnewbies-request@kernelnewbies.org?subject=help>
List-Subscribe: <https://lists.kernelnewbies.org/mailman/listinfo/kernelnewbies>,
 <mailto:kernelnewbies-request@kernelnewbies.org?subject=subscribe>
Errors-To: kernelnewbies-bounces+glkk-kernelnewbies=gmane.org@kernelnewbies.org
To: areklis909@gmail.com
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Kernelnewbies@kernelnewbies.org
List-Id: linux-gpio@vger.kernel.org

On Thu, Aug 16, 2018 at 12:11 AM Arkadiusz Lis <areklis909@gmail.com> wrote:

> What I learned
> from Documentation/driver-api/gpio/board.rst is this string should be
> equal to <function> prefix in <function>-gpios node in device tree.
> For example: in file drivers/i2c/busses/i2c-gpio.c author gets gpio
> descriptor with con_ids 'sda' and 'scl'. They are described in
> Documentation/devicetree/bindings/i2c/i2c-gpio.txt as required
> properties.

You got it right.

> In my case I didn't find bindings for emxx_udc driver and I don't know
> what string should I insert:
> gpiod = devm_gpiod_get(udc->dev, "DT_GPIOS_NAME", GPIOD_IN); //
> "DT_GPIOS_NAME" is a placeholder

This driver is not yet converted to use device tree so there is
no way you can know this property name before bindings are
established.

You or someone else first need to define device tree bindings
in Documention/devicetree/bindings/usb/* somwhere, then augment
the driver to use these bindings, including the right name for
the GPIO line, when using the devm_gpiod_get().

Pretty certainly the chosen GPIO name will be "vbus-gpios" in this
case so you will pass "vbus" as name. But that needs to first
be discussed by the DT bindings mailing list.

I wonder how you're testing this though.

Yours,
Linus Walleij
