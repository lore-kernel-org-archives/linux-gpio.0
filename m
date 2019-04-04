From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 5/6] ARM: dts: sunxi: Remove pinctrl groups setting bias
Date: Thu, 4 Apr 2019 10:29:58 +0700
Message-ID: <CACRpkdZ-C6uQfKFUT+8j+wU0DS=DO5k7fgMoFJ-dHwFHz6D4HA@mail.gmail.com>
References: <cover.66d6a9a379de8ebf176e4c25a8542152dc09f366.1552591798.git-series.maxime.ripard@bootlin.com>
 <ca64e5b42aca638075f0b23ee887b79619884814.1552591798.git-series.maxime.ripard@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <ca64e5b42aca638075f0b23ee887b79619884814.1552591798.git-series.maxime.ripard@bootlin.com>
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

> So far we've enabled pull-up and pull-down resistors on GPIOs using a
> pinctrl node. Now that the GPIO binding allows for a flag to declare this,
> let's switch to it.
>
> This brings us closer to removing all the GPIO pinctrl nodes, which will in
> turn allow us to switch the pinctrl strict mode on.
>
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>

Way simpler like this right? :D

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Please funnel this through ARM SoC.

Yours,
Linus Walleij
