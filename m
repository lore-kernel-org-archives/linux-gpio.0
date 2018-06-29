From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] pinctrl: armada-37xx: add suspend/resume support
Date: Fri, 29 Jun 2018 14:41:59 +0200
Message-ID: <CACRpkdYjp53wi+-KxL5fgpijq-1Eoix4g91jLLVVaznvJKQezQ@mail.gmail.com>
References: <20180626140613.13908-1-miquel.raynal@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180626140613.13908-1-miquel.raynal@bootlin.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: =?UTF-8?Q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, Antoine Tenart <antoine.tenart@bootlin.com>, Gregory Clement <gregory.clement@bootlin.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Nadav Haklai <nadavh@marvell.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: linux-gpio@vger.kernel.org

On Tue, Jun 26, 2018 at 4:06 PM Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Add suspend/resume hooks in pinctrl driver to handle S2RAM operations.
>
> Beyond the traditional register save/restore operations, these hooks
> also keep the GPIOs used for both-edge IRQ synchronized between their
> level (low/high) and expected IRQ polarity (falling/rising edge).
>
> Since pinctrl is an infrastructure module, its resume should be issued
> prior to other IO drivers. The pinctrl PM operations are requested at
> early/late stages for this reason.
>
> Suggested-by: Ken Ma <make@marvell.com>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Patch applied with Gregory's review tag.

Yours,
Linus Walleij
