From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RFC] gpio: about the need to manage irq mapping dynamically.
Date: Fri, 30 Jun 2017 00:16:12 +0200
Message-ID: <CACRpkda7Nsgwv9AqQeN1vnGu6sZmW_nKMbiWfXTtRYxRtfv+uA@mail.gmail.com>
References: <1497543642.3086.35.camel@baylibre.com> <CACRpkdZWw_-joPT4CJ-RAJ31s4BxuE6vusjg5YnZWaHtkRg5+w@mail.gmail.com>
 <1497954416.7387.1.camel@baylibre.com> <CACRpkdZu74aAsu8hggxsfffQPMk0nqihCSfuMaMbf+-4EFSYYA@mail.gmail.com>
 <1497979438.7387.10.camel@baylibre.com> <CACRpkdZ2cqUgMwOFG+9JVyAOxYTfHYa3+yrUzUozLpYD87KdOQ@mail.gmail.com>
 <1498141515.7387.16.camel@baylibre.com> <0e12f9bd-4e0b-c602-5627-5dbda5371dee@ti.com>
 <1498587929.25567.12.camel@baylibre.com> <CACRpkdZfvGm+sy+B2wsuw5TfD57h9cTJc7ii=1Q1DEuMxNk_8A@mail.gmail.com>
 <1498748238.27840.5.camel@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1498748238.27840.5.camel@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Grygorii Strashko <grygorii.strashko@ti.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Marc Zyngier <marc.zyngier@arm.com>, "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, Kevin Hilman <khilman@baylibre.com>, Linux Kernel <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, Jun 29, 2017 at 4:57 PM, Jerome Brunet <jbrunet@baylibre.com> wrote:
> On Thu, 2017-06-29 at 16:14 +0200, Linus Walleij wrote:

>> So I changed my mind, it is fine for this type of driver to call
>> irq_create_mapping() in gpio_to_irq(). Preferably with some comment
>> around the call.
>
> What about disposing of the mapping ? there still is no counter part function to
> gpio_to_irq. It seems weird to leave them lying around, don't you think ?

Yeah that sucks. We need a way to fix that.

Is gpio_irq_prepare/unprepare the right approach?

Yours,
Linus Walleij
