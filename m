From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v4 3/6] pinctrl: baytrail: Update gpio chip operations
Date: Mon, 4 Apr 2016 16:08:47 +0200
Message-ID: <CACRpkdbyGZbzX6k2b6CSKFZmxShXQ0i1=efgX6EKAnCG1EibOg@mail.gmail.com>
References: <1459508407-22011-1-git-send-email-cristina.ciocan@intel.com>
	<1459508407-22011-4-git-send-email-cristina.ciocan@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1459508407-22011-4-git-send-email-cristina.ciocan@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Cristina Ciocan <cristina.ciocan@intel.com>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Irina Tirdea <irina.tirdea@intel.com>, Octavian Purdila <octavian.purdila@intel.com>
List-Id: linux-gpio@vger.kernel.org

On Fri, Apr 1, 2016 at 1:00 PM, Cristina Ciocan
<cristina.ciocan@intel.com> wrote:

> This patch updates the gpio chip implementation in order to interact with
> the pin control model: the chip contains reference to SOC data and
> pin/group/community information is retrieved through the SOC reference.
>
> Signed-off-by: Cristina Ciocan <cristina.ciocan@intel.com>

Patch applied with Mika's ACK.

Cristina & Mika, can you provide feedback on a patch I sent last week:
http://marc.info/?l=linux-gpio&m=145864063724362&w=2

This makes it possible for a GPIO driver to use native
open drain if the hardware supports this instead of relying
on switching the pin to input and thus expecting high impedance.

With a backing pin control driver I think that maybe we need
a pin control back-end performing things like this on behalf
of the GPIO driver, something like
pinctrl_gpio_set_config(unsigned gpio, enum pin_config_param param,
u16 argument);

So the pin controller can perform config on behalf of the
GPIO driver (e.g. setting a backing pin to open drain).

Do you think we will need this?

Yours,
Linus Walleij
