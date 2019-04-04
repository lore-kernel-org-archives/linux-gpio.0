From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] pinctrl: sunxi: Allow to disable pinctrl drivers
Date: Thu, 4 Apr 2019 10:56:47 +0700
Message-ID: <CACRpkdYOL=EiZH0eRyxbNQkBuPkqxCqqRyuGMD1NBpKGgZfUrA@mail.gmail.com>
References: <20190319144203.23467-1-maxime.ripard@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190319144203.23467-1-maxime.ripard@bootlin.com>
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
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Chen-Yu Tsai <wens@csie.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Mar 19, 2019 at 9:42 PM Maxime Ripard <maxime.ripard@bootlin.com> wrote:

> Our pinctrl drivers are consisting of some common code, and big pin tables
> that are SoC-specific. This is fine in most cases, but when you want to
> reduce the size of the particular kernel image, those big tables are, well,
> quite big.
>
> We haven't had the option to disable them in the past since they were
> hidden Kconfig options based on the SoC support. However, that granularity
> isn't great since we don't have one Kconfig option per-SoC, but rather one
> by family.
>
> Make those options selectable by the user so that they can disable it if
> needed, while keeping the current default to not change the standard case.
>
> Acked-by: Chen-Yu Tsai <wens@csie.org>
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>

Patch applied!

Yours,
Linus Walleij
