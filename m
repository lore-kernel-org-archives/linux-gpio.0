From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] pinctrl: sunxi: Deal with per-bank regulators
Date: Fri, 14 Dec 2018 16:08:48 +0100
Message-ID: <CACRpkdZi2tqrwPh9_gi19X_MME1oXehv8AOvvfJmurSb5XDYKw@mail.gmail.com>
References: <cover.50931fbda5c95345087740e4c1ef5a57fdd53480.1544104801.git-series.maxime.ripard@bootlin.com>
 <3401ca7517927243f567899819e0d02eee12984f.1544104801.git-series.maxime.ripard@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <3401ca7517927243f567899819e0d02eee12984f.1544104801.git-series.maxime.ripard@bootlin.com>
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
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Chen-Yu Tsai <wens@csie.org>, =?UTF-8?Q?Myl=C3=A8ne_Josserand?= <mylene.josserand@bootlin.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-Id: linux-gpio@vger.kernel.org

On Thu, Dec 6, 2018 at 3:02 PM Maxime Ripard <maxime.ripard@bootlin.com> wrote:

> The Allwinner SoCs have on most of their GPIO banks a regulator input.
>
> This issue was mainly ignored so far because either the regulator was a
> static regulator that would be providing power anyway, or the bank was used
> for a feature unsupported so far (CSI). For the odd cases, enabling it in
> the bootloader was the preferred option.
>
> However, now that we are starting to support those features, and that we
> can't really rely on the bootloader for this, we need to model those
> regulators as such in the DT.
>
> This is slightly more complicated than what it looks like, since some
> regulators will be tied to the PMIC, and in order to have access to the
> PMIC bus, you need to mux its pins, which will need the pinctrl driver,
> that needs the regulator driver to be registered. And this is how you get a
> circular dependency.
>
> In practice however, the hardware cannot fall into this case since it would
> result in a completely unusable bus. In order to avoid that circular
> dependency, we can thus get and enable the regulators at pin_request time.
> We'll then need to account for the references of all the pins of a
> particular branch to know when to put the reference, but it works pretty
> nicely once implemented.
>
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>

Patch applied.

Yours,
Linus Walleij
