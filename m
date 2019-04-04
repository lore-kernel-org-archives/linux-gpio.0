From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/6] pinctrl: sunxi: Fix variable assignment syntax
Date: Thu, 4 Apr 2019 08:57:08 +0700
Message-ID: <CACRpkdZSfqwcmLMyFL+Y=pGxyaqr2PPz3aEwGwmAgM_6dbT1fA@mail.gmail.com>
References: <cover.66d6a9a379de8ebf176e4c25a8542152dc09f366.1552591798.git-series.maxime.ripard@bootlin.com>
 <d2307f2648901d1950a1516ad5ffd70f6d595898.1552591798.git-series.maxime.ripard@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <d2307f2648901d1950a1516ad5ffd70f6d595898.1552591798.git-series.maxime.ripard@bootlin.com>
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

> Lines are usually ended with a semi-column in C, yet this was copied from a
> structure declaration to the init variant while keeping the comma at the
> end. Make sure we have a normal syntax, instead of multiple assignments.
>
> Fixes: d83c82ce7ccd ("pinctrl: sunxi: support multiple pin controller")
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>

Patch applied.

Yours,
Linus Walleij
