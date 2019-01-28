From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH RFC V2 4/4] gpiolib: Take MUX usage into account
Date: Mon, 28 Jan 2019 10:06:46 +0100
Message-ID: <CACRpkdb5DjAMRYkT+b0U6HVk7E6ccLT79-LB=QGQWWtE17aPUg@mail.gmail.com>
References: <1548054685-3781-1-git-send-email-stefan.wahren@i2se.com>
 <1548054685-3781-5-git-send-email-stefan.wahren@i2se.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1548054685-3781-5-git-send-email-stefan.wahren@i2se.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stefan Wahren <stefan.wahren@i2se.com>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Eric Anholt <eric@anholt.net>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Lukas Wunner <lukas@wunner.de>, Peter Robinson <pbrobinson@gmail.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: linux-gpio@vger.kernel.org

Hi Stefan!

I like the idea with these patches.

Some thinking aloud below:

On Mon, Jan 21, 2019 at 8:11 AM Stefan Wahren <stefan.wahren@i2se.com> wrote:


> @@ -1075,7 +1075,8 @@ static long gpio_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
>                     test_bit(FLAG_IS_HOGGED, &desc->flags) ||
>                     test_bit(FLAG_USED_AS_IRQ, &desc->flags) ||
>                     test_bit(FLAG_EXPORT, &desc->flags) ||
> -                   test_bit(FLAG_SYSFS, &desc->flags))
> +                   test_bit(FLAG_SYSFS, &desc->flags) ||
> +                   pinctrl_gpio_is_in_use(chip->base + lineinfo.line_offset))

So the idea is that if a line is already in use somehow, we do not
present it to userspace. Fair enough.

> +bool pinctrl_gpio_is_in_use(unsigned gpio)

Please rename it pinctrl_gpio_can_use_line(), as it is more
specific. (Also see below as to why.)

> +{
> +       struct pinctrl_dev *pctldev;
> +       struct pinctrl_gpio_range *range;
> +       bool result;
> +       int pin;
> +
> +       if (pinctrl_get_device_gpio_range(gpio, &pctldev, &range))
> +               return false;

So if this tries to obtain the GPIO range, if the gpio line
is not found in any range, we decide that it is not in use.

Add a comment saying that if we don't find a range, it probably
means we are using a GPIO driver without a backing
pin controller, so we bail out. (Just like the stub does, maybe
add that kind of comment to the stub as well.)

> +       mutex_lock(&pctldev->mutex);
> +
> +       /* Convert to the pin controllers number space */
> +       pin = gpio_to_pin(range, gpio);
> +
> +       result = pinmux_is_in_use(pctldev, pin);

It gets hard to understand the code here, we need to either add
a comment on what's going on or rename that function
(as described below) or both.

> +
> +       mutex_unlock(&pctldev->mutex);
> +
> +       return result;
> +}
> +EXPORT_SYMBOL_GPL(pinctrl_gpio_is_in_use);

(...)

> +bool pinmux_is_in_use(struct pinctrl_dev *pctldev, unsigned pin)

Please name is pinmux_can_be_used_for_gpio() as non-strict
pin controllers allow non-exclusive use and return false,
and that is something GPIO-specific.

I see the idea with the naming, but the fact that this will
return false in some cases where the pin is actually is in
use makes the function name misleading.

Add some kerneldoc above it explaining that this returns true
if the pin is in any kind of use whether by a function or some
GPIO and the controller is strict.

> +{
> +       struct pin_desc *desc = pin_desc_get(pctldev, pin);
> +       const struct pinmux_ops *ops = pctldev->desc->pmxops;
> +
> +       if (!desc) {
> +               dev_err(pctldev->dev,
> +                       "pin %u is not registered so it cannot be requested\n",
> +                       pin);

Is this error message really relevant?

Should be something like "cannot be inspected" but I suspect it
should just silently return false.

> +               return false;
> +       }
> +
> +       if (ops->strict && desc->mux_usecount)
> +               return true;

We return here if the pin is used for some function.

This *could* create a problem for some systems.

In those systems, a pin controller may define a hog in the
device tree like this:

pinctrl@800000 {
                        foo_gpios: foo {
                                bar {
                                        pins = "gpio57";
                                        bias-pull-up;
                                };
                        };
                        pinctrl-names = "default";
                        pinctrl-0 = <&foo_gpios>;
};

This means this controller is not using the fast path with
gpio_owner etc, but instead has created one group per
GPIO pin, which is a common solution.

What the device tree want to do is set this pin up as GPIO,
and apply a pull up, but still expects that pin to be used
from userspace later on. This patch however, would
hide the pin from userspace if the pin controller is strict.

I don't know for sure if this is a real problem, probably not
because such a pin controller should be careful not to
set itself as strict. (That would strictly speaking be a bug IMO, they
are already hogging the line mux and thus the pin controller
itself IS using it, so....) But if someone is using this approach
today it would cause a regression.

But I think we are safe.

> +       return ops->strict && !!desc->gpio_owner;

This catches the case for gpio controllers using the
fast path to access GPIOs very nicely, i.e. controllers
implementing .gpio_request_enable() etc in their
struct pinmux_ops.

Add a comment saying that all non-strict controllers
will return false here thus making all pins in a GPIO range
available for use.

Yours,
Linus Walleij
