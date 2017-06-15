From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [RFC] gpio: about the need to manage irq mapping dynamically.
Date: Thu, 15 Jun 2017 18:20:42 +0200
Message-ID: <1497543642.3086.35.camel@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Marc Zyngier <marc.zyngier@arm.com>
Cc: "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, Kevin Hilman <khilman@baylibre.com>, Linux Kernel <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

Hi Linus,

I would to (re)start the discussion around the management of the
irq_mapping in the gpio framework:

Many gpio controllers are able to provide a working irq to all the gpios at the
same time. On those controller we can create all the irq mapping during the
probe of the controller. Things are easy.

Then, there is another type of controller, with constraints that make it
impossible to provide a working irq to all pins at the same it. On Amlogic SoC
for example, we have only 8 parent irqs with and 8 to many (the number of pins)
router. Ressource has be to managed in a more "dynamic" fashion.

To handle this we tried:
- [0]: To create the mapping in the gpio_to_irq. Linus, you pointed out that
this is not allowed as gpio_to_irq is callable in irq context, therefore it
should not sleep. Actually 3 drivers [2] are calling gpio_to_irq in irq
handlers.
I would also add that "gpio_to_irq" has no "free" counter part, so this approach
leaks mappings. The fact that 26 gpio drivers [3] create mapping in the
gpio_to_irq callback shows that the problem of managing the irq mapping is not
specific to Amlogic and that an evolution might be useful.

- [1]: To create an empty domain to get a virq for each pins but delay the setup
of the interrupt hierarchy to the "irq_request_resources" callback. Testing this
approach led me to some nasty race conditions in the interrupt handlers. I
discussed this solution with Marc and he told me that doing the setup of the
interrupt hierarchy in the irqchip callbacks is "too late" . If I understood
correctly (Marc feel to correct me if necessary), you should only get a virq
when the full interrupt hierarchy is setup, from the triggering device to the
CPU. 

With this last comment, I don't think there is a (clean) way ATM for a gpio
driver to create the mapping "on demand". By "on-demand", I mean the consumer
drivers doing this kind of thing:

ret = request_irq(gpio_to_irq(GPIOX_Y), ... )

I would to like propose a way to fix that. It is not going to be a oneline fix,
but I'm convinced we can do it w/o breaking anything:

1) Introduce new gpio driver callbacks (.irq_prepare, .irq_unprepare): Drivers
will be free to implement those callbacks or not. Driver which can create all
their mappings at probe time would obviously skip those.

2) Introduce gpio_irq_prepare and gpio_irq_unprepare to the gpio API: This
functions would do refcounting to handle shared irq and avoid wrongly disposing
of used mappings. Then call the new drivers callbacks, if defined. A devm
version of gpio_irq_prepare might be usefull

3) Add calls to gpio_irq_prepare to consumer drivers probe/init which use the
gpio_to_irq callback. I don't think this is going to be that hard to do, but
it's going be to long and boring ...

As long as a platform does not implement these new callbacks, all the above is
basically a noop and should not change anything.

I think this course of action would allow us to slowly fix those offending
drivers [3], providing them with a solution.

As this is not going to be a small task, I would like to get your view on it
before going further.

Best Regards
Jerome

[0]: https://patchwork.ozlabs.org/patch/684208/
[1]: http://lkml.kernel.org/r/5b352c8d-a426-fa73-58b7-0c935979492b@gmail.com

[2]: Drivers using gpio_to_irq in irq_handlers
* drivers/gpio/gpio-ep93xx.c 
* drivers/gpio/gpio-pxa.c
* drivers/gpio/gpio-tegra.c

[3]: Drivers creating mapping in the gpio_to_irq callback (either through
irq_create_mapping, irq_create_fwspec_mapping or regmap_irq_get_virq)
* arch/sh/boards/mach-x3proto/gpio.c
* drivers/gpio/gpio-bcm-kona.c
* drivers/gpio/gpio-da9052.c
* drivers/gpio/gpio-da9055.c
* drivers/gpio/gpio-wm831x.c
* drivers/gpio/gpio-wm8994.c
* drivers/pinctrl/nomadik/pinctrl-abx500.c
* drivers/pinctrl/pinctrl-as3722.c
* drivers/pinctrl/pinctrl-rockchip.c
* drivers/pinctrl/samsung/pinctrl-samsung.c
* drivers/pinctrl/stm32/pinctrl-stm32.c
* arch/arm/plat-orion/gpio.c
* drivers/gpio/gpio-davinci.c
* drivers/gpio/gpio-em.c
* drivers/gpio/gpio-grgpio.c
* drivers/gpio/gpio-max77620.c
* drivers/gpio/gpio-mpc8xxx.c
* drivers/gpio/gpio-mvebu.c
* drivers/gpio/gpio-palmas.c
* drivers/gpio/gpio-tb10x.c
* drivers/gpio/gpio-tps6586x.c
* drivers/gpio/gpio-tz1090.c
* drivers/gpio/gpio-xgene-sb.c
* drivers/pinctrl/pinctrl-adi2.c
* drivers/pinctrl/samsung/pinctrl-exynos5440.c
