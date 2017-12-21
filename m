From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: pinctrl-amd: What hardware does it apply to?
Date: Thu, 21 Dec 2017 11:11:18 +0100
Message-ID: <CACRpkdaHj8SFL5AfSkAqDG0mHpgRVbmHuyrhwMUkEH2c4p0VDg@mail.gmail.com>
References: <6c675643-45ec-c57f-f1b2-afb25f3e947e@opengear.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <6c675643-45ec-c57f-f1b2-afb25f3e947e@opengear.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Cooks <andrew.cooks@opengear.com>, Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nehal Shah <Nehal-bakulchandra.Shah@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, Ken Xue <Ken.Xue@amd.com>, Tobias Diedrich <ranma+kernel@tdiedrich.de>, Sudheesh Mavila <sudheesh.mavila@amd.com>, platypus-sw <platypus-sw@opengear.com>, Timur Tabi <timur@codeaurora.org>
List-Id: linux-gpio@vger.kernel.org

Hi Andrew!

Thank you for your mail!

On Wed, Dec 20, 2017 at 11:25 PM, Andrew Cooks
<andrew.cooks@opengear.com> wrote:

> I'm working on gpio for an AMD Family 16h Model 30h system[1].
> The SoC is the same as the GX412-TC used in the PC Engines APU2.

OK

> There is an out-of-tree gpio driver (gpio-amd) for this SoC in the meta-amd yocto layer[2].

That is bad. It needs to be upstream.

I have to try very hard to avoid sarcasm about it "seeming like a good idea
at the time" and silly things like that.

What we are seeing is breakage of social norms, in this case,
upstream first. :(

> Another driver (gpio-sb8xx) was submitted for upstream inclusion, but was
> knocked back with the suggestion that pinctrl is the way forward[3].

Hm I cannot follow link [3] right now. And I don't remember the submission :(
It doesn't seem to be in my mail archives either.

> I would much prefer to use a mainline driver for the system I'm working
> on, so I'm looking at the pinctrl-amd driver to see whether it applies to our
> SoC, or whether it could be extended, or used as starting point for a new driver.

This is the right spirit!

> The out-of-tree drivers apply to the GX412-TC SoC and uses PCI for probing:
>
> gpio-amd registers a platform driver that applies to { PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_HUDSON2_SMBUS }
> gpio-sb8xx applies to { PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_HUDSON2_SMBUS } and { PCI_DEVICE(PCI_VENDOR_ID_ATI, PCI_DEVICE_ID_ATI_SBX00_SMBUS }
>
> These IDs make it easy to cross reference with the datasheet, and keeps the coupling between ACPI and the driver low.
> These drivers do not provide a mechanism for firmware (ACPI or DT) to specify which gpios are safe to use or how to use them.

The Intel pin control driver has gone to lengths to avoid using unusable
ACPI-controlled GPIOs. Thought they were mostly concerned with
GPIOs not available for IRQs. This is what the "valid_mask" in
struct gpio_irq_chip is for.

Timur Tabi from CodeAurora is currently
floating a patch set that makes it possible to remove entire sets of
lines as "controlled by someone else" (read: ACPI BIOS).
This will apply to the whole GPIO chip.
https://marc.info/?l=linux-gpio&m=151379704013464&w=2

This is however under heavy discussion.

So there is work being done to mask out sets of GPIOs that
are used by ACPI. (Or secure worlds or whatever.)

> In contrast, the pinctrl-amd driver only mentions the newer KERNCZ platform
> name and uses ACPI for probing without disclosing any Family or Model numbers.
>
> pinctrl-amd applies to "AMD0030" and "AMDI0030"
>
> The ACPI HID matching makes it difficult to determine what family and model the
> driver applies to, or rather, I have not been able to find such a mapping of HIDs
> to family and model numbers. It's also impossible to guess an ACPI _HID
> that may or may not exist for the Family 16h Model 30h platform and even if I
> allocate a new HID for our ACPI implementation, that HID has little hope of
> being accepted into the mainline driver.

I didn't understand anything of what you just wrote.
I am basically ignorant when it comes to ACPI details.

So let's CC the GPIO ACPI maintainer, Mika Westerberg.

> I would like to extend the generically named, but very specifically implemented
> pinctrl-amd driver to also work on Family 16h, Model 30h (specifically the FT3b
> package), and I propose to use the PCI_DEVICE_ID_AMD_16H_M30H_NB_F3
> symbol to probe for the device.
>
> Does this seem like a sensible way forward?

Sounds good to me.

Any ACPI questions, I hope Mika can help out with.

The AMD folks are sometimes silent, I would say just hack on it so
we get somewhere with this!

Your effort is appreciated.

Yours,
Linus Walleij
