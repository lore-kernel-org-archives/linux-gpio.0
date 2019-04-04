From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 4/6] pinctrl: sunxi: Declare set_config on the GPIO chip
Date: Thu, 4 Apr 2019 10:27:50 +0700
Message-ID: <CACRpkdbP91DoxbDj84ZteKqdjRUQqVXWN4nV52siYSkR4-1JCA@mail.gmail.com>
References: <cover.66d6a9a379de8ebf176e4c25a8542152dc09f366.1552591798.git-series.maxime.ripard@bootlin.com>
 <b83a81feebb87c8314581648f8d01fb5f04eb4d6.1552591798.git-series.maxime.ripard@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <b83a81feebb87c8314581648f8d01fb5f04eb4d6.1552591798.git-series.maxime.ripard@bootlin.com>
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

> Our pin controller can configure the pins no matter how they are muxed, so
> it makes sense to allow this for GPIOs as well.
>
> Add the generic set_config function so that we can rely on the existing
> pinctrl code we have.
>
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>

Patch applied.

This looks really nice, proper GPIO with pin config backend!

Yours,
Linus Walleij
