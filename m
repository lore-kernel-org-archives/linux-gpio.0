From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: devicetree: Fix dt_to_map_one_config handling of hogs
Date: Fri, 2 Mar 2018 09:42:54 +0100
Message-ID: <CACRpkdYc1Ovvhwze37-uJJL+5YG5kHuW9rgDSbfhxLRP30aPWg@mail.gmail.com>
References: <20180228155306.1006-1-rf@opensource.cirrus.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180228155306.1006-1-rf@opensource.cirrus.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, patches@opensource.cirrus.com
List-Id: linux-gpio@vger.kernel.org

On Wed, Feb 28, 2018 at 4:53 PM, Richard Fitzgerald
<rf@opensource.cirrus.com> wrote:

> When dt_to_map_one_config() is called with a pinctrl_dev passed
> in, it should only be using this if the node being looked up
> is a hog. The code was always using the passed pinctrl_dev
> without checking whether the dt node referred to it.
>
> A pin controller can have pinctrl-n dependencies on other pin
> controllers in these cases:
>
> - the pin controller hardware is external, for example I2C, so
>   needs other pin controller(s) to be setup to communicate with
>   the hardware device.
>
> - it is a child of a composite MFD so its of_node is shared with
>   the parent MFD and other children of that MFD. Any part of that
>   MFD could have dependencies on other pin controllers.
>
> Because of this, dt_to_map_one_config() can't assume that if it
> has a pinctrl_dev passed in then the node it looks up must be
> a hog. It could be a reference to some other pin controller.
>
> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>

Seems correct. Also the code is a little more clear
after the patch.

Patch applied.

It'd be nice to see some testing of this, I hope linux-next is a good
testing ground.

Yours,
Linus Walleij
