From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: davinci: add support for pinmux gpio ranges
Date: Wed, 7 Feb 2018 14:00:43 +0100
Message-ID: <CACRpkdaTcCo93xqDNy7ixvF=aeF1VbML+OaJY8rtcEJZswXFbA@mail.gmail.com>
References: <1516576180-1467-1-git-send-email-david@lechnology.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1516576180-1467-1-git-send-email-david@lechnology.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: David Lechner <david@lechnology.com>
Cc: linux-gpio@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Keerthy <j-keerthy@ti.com>
List-Id: linux-gpio@vger.kernel.org

On Mon, Jan 22, 2018 at 12:09 AM, David Lechner <david@lechnology.com> wrote:

> This adds support for the pinmux gpio ranges feature to the DaVinci gpio
> driver. Only device tree is supported since the non-DT boards don't
> use a generic pinmux controller.
>
> Cc: Keerthy <j-keerthy@ti.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: David Lechner <david@lechnology.com>

Nice, patch applied!

> +       if (of_property_read_bool(dev->of_node, "gpio-ranges")) {
> +               chips->chip.request = gpiochip_generic_request;
> +               chips->chip.free = gpiochip_generic_free;
> +       }

If the backing pin controller can do things like debounce
or open drain pin control, consider using also the
gpiochip_generic_config() callback in the future.

Yours,
Linus Walleij
