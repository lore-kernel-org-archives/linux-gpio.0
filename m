From: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH 0/6] pinctrl: sunxi: Allow to configure pull-up /
 pull-down from GPIO flags
Date: Fri, 15 Mar 2019 10:57:06 +0800
Message-ID: <CAGb2v641LTWh+9b2A56YxWJ3=KX26tcbgtf+Wqq1mz6qhBSv+w@mail.gmail.com>
References: <cover.66d6a9a379de8ebf176e4c25a8542152dc09f366.1552591798.git-series.maxime.ripard@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <cover.66d6a9a379de8ebf176e4c25a8542152dc09f366.1552591798.git-series.maxime.ripard@bootlin.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>, Linus Walleij <linus.walleij@linaro.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Fri, Mar 15, 2019 at 3:33 AM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
>
> Hi,
>
> Here is a series that addresses one of the issues we've had for some time
> with our pinctrl driver, which is that while we should have had the strict
> mode enabled, we didn't and now we have to deal with all the DT having GPIO
> and pinctrl nodes for the same pins.
>
> This was partially due to cargo cult (which has been addressed since), but
> also due to technical limitations of the GPIO DT bindings at the time which
> didn't allow to specify the pull-up and pull-down resistors, and the drive
> strength of the pins.
>
> Now that the former are supported, we can remove those users, and we will
> deal with the latter eventually.
>
> Let me know what you think,
> Maxime
>
> Maxime Ripard (6):
>   gpio: Set proper argument value to set_config
>   pinctrl: sunxi: implement pin_config_set
>   pinctrl: sunxi: Fix variable assignment syntax
>   pinctrl: sunxi: Declare set_config on the GPIO chip
>   ARM: dts: sunxi: Remove pinctrl groups setting bias
>   ARM: dts: sunxi: Remove useless pinctrl nodes

Acked-by: Chen-Yu Tsai <wens@csie.org>
