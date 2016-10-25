From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: mxc: Shift generic request/free after gpiochip registration
Date: Tue, 25 Oct 2016 14:11:12 +0200
Message-ID: <CACRpkdYbMxk_NoJpJS5bU-zOL=aXDAxrhT2LjLSj+CaPaBE7jw@mail.gmail.com>
References: <580EE62D.4090704@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <580EE62D.4090704@mentor.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Deepak Das <deepak_das@mentor.com>
Cc: Shawn Guo <shawnguo@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Vladimir Zapolskiy <Vladimir_Zapolskiy@mentor.com>, Fabio Estevam <fabio.estevam@nxp.com>, Sascha Hauer <kernel@pengutronix.de>, Philipp Zabel <p.zabel@pengutronix.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Oct 25, 2016 at 6:57 AM, Deepak Das <deepak_das@mentor.com> wrote:

> generic gpio request/free should be added after gpiocip registration
> to validate mapping of gpiochip with pinctrl subsystem.
>
> gpiochip->pin_ranges list contains the information used by pinctrl
> subsystem to configure corresponding pins for gpio usage.
> This list will be empty if gpiochip fails to map with
> pinctrl subsystem for any reason.
> For Ex.:-
> generic gpio request/free should not be used if IOMUX pin controller
> device node is disabled in device tree.
>
> This commit checks above list and skips adding generic gpio request/free
> if list is found empty.
>
> Signed-off-by: Deepak Das <deepak_das@mentor.com>
> Signed-off-by: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>

Third time I find this in my inbox and it still doesn't apply.

Yours,
Linus Walleij
