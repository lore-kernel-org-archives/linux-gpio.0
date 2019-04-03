From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/6] gpio: Set proper argument value to set_config
Date: Wed, 3 Apr 2019 23:41:02 +0700
Message-ID: <CACRpkdaRofnaN5RMqRyyAakngyCWBKQX8+y32SESiwvVxbFyOA@mail.gmail.com>
References: <cover.66d6a9a379de8ebf176e4c25a8542152dc09f366.1552591798.git-series.maxime.ripard@bootlin.com>
 <b9ed544722175ea00b1f6ecb29ca5c3e1322239f.1552591798.git-series.maxime.ripard@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <b9ed544722175ea00b1f6ecb29ca5c3e1322239f.1552591798.git-series.maxime.ripard@bootlin.com>
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
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>, Chen-Yu Tsai <wens@csie.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Fri, Mar 15, 2019 at 2:33 AM Maxime Ripard <maxime.ripard@bootlin.com> wrote:

> The gpio_set_config function creates a pinconf configuration for a given
> pinc_config_param.
>
> However, it always uses an arg of 0, which might not be a valid argument
> for a given param. A good example of that would be the bias parameters,
> where 0 means that the pull up or down resistor is null, and the pin is
> directly connected to VCC/GND.
>
> The framework uses in some other places the value 1 as a default argument
> to enable the pull resistor, so let's use the same one here.
>
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>

Patch applied to the GPIO tree, I suppose I can merge it there
orthogonally to the other patches (the result will be fine).

Yours,
Linus Walleij
