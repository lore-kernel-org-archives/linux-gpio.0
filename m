From: Robert Abel <rabel@robertabel.eu>
Subject: [of] deadlock b/c of gpiochip and pinctrl dependency
Date: Sat, 17 Nov 2018 22:15:43 +0100
Message-ID: <6409e5aa-4129-0706-2704-f5f609bb54a8@robertabel.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

Hi!

I found a dependency issue with gpiochip and pinctrl while using the gpio-hog feature that was implemented by Benoit
Parrot in f625d4601759f. Relevant device-tree overlay shown below [3].

I ran into a deadlock situation, because adding a gpiochip requires a registered pinctrl with registered ranges, because
the function to add the gpiochip will check for hogged pins and request gpio pin functionality for them.
This works in situations when gpiochip and pinctrl functionality don't depend on each other. However, consider the
following code, which is from the bcm2835 driver for Raspberry Pi found here [1]:

pinctrl-bcm2835.c:
    err = gpiochip_add_data(&pc->gpio_chip, pc);
    if (err) {
            dev_err(dev, "could not add GPIO chip    n");
            return err;
    }

    ...

    pc->pctl_dev = devm_pinctrl_register(dev, &bcm2835_pinctrl_desc, pc);
    if (IS_ERR(pc->pctl_dev)) {
        gpiochip_remove(&pc->gpio_chip);
        return PTR_ERR(pc->pctl_dev);
    }

    ...

    pinctrl_add_gpio_range(pc->pctl_dev, &pc->gpio_range);


It's not very obvious, that calling gpiochip_add_data should only be done after adding the required ranges to pinctrl,
because the following happens:

gpiochip_add_data(_with_key):
  of_gpiochip_add:
    of_gpiochip_scan_gpios:
      for_each_available_child_of_node(chip->of_node, np) with "gpio-hog":
        gpiod_hog
          gpiochip_request_own_desc:
            gpiod_request_commit:
              status = chip->request(chip, gpio_chip_hwgpio(desc)):
                gpiochip_generic_request(...):
                  pinctrl_gpio_request:
                    pinctrl_get_device_gpio_range:
                      /* GPIO range not found, because it wasn't registered yet */
                      return -EPROBE_DEFER;

This of course deadlocks my system, because everything ends up waiting on the gpiochip, which cannot ever be
instantiated. I couldn't find any documentation explicitly mentioning this dependency between gpiochip and pinctrl.
My workaround for the moment is to re-order the gpiochip_add_data call after the devm_pinctrl_register and
pinctrl_add_gpio_range calls. I haven't observed any ill effect, but I'm not sure what other components may already act
on pinctrl while gpiochip is dangling or if any of the other functions that are called by add require it as well.

Obviously, this approach won't work for SoCs where setting certain pinctrl settings need to touch gpio settings to e.g.
activate pull-ups.

In general, I sought the same functionality that Markus Pargmann was trying to implement in 2015 [2].
That is, to name and possibly export gpios through device tree.

It seems disadvantageous that one cannot currently specify pinctrl settings while hogging or export by name.
Dynamic device tree overlays also don't work. Perhaps an actual driver instead of the hogging mechanism would solve all
dependency issues better?

Regards,

Robert

Please CC, as I'm off-list.


  [1]: https://github.com/raspberrypi/linux/blob/83ea2e93/drivers/pinctrl/bcm/pinctrl-bcm2835.c#L1027
  [2]: http://lists.infradead.org/pipermail/linux-arm-kernel/2015-July/357418.html
  [3]: gpio-hog.dtso
       /dts-v1/;
       /plugin/;

       #include <dt-bindings/gpio/gpio.h>

       / {
           compatible = "brcm,bcm2708";
           fragment@0 {
               target = <&gpio>;
               __overlay__ {
                   myLed {
                       gpios = <18 GPIO_ACTIVE_HIGH>;
                       gpio-hog;
                       output-low;
                   };
               };
           };
       };
