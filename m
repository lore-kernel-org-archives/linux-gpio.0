From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] ARM: dts: sun7i: bananapi: Add GPIO banks regulators
Date: Fri, 14 Dec 2018 16:10:16 +0100
Message-ID: <CACRpkdZy6wcAe1ypZaephqLVuvSDdZeGWyvpDBqg0ryZkm8hig@mail.gmail.com>
References: <cover.50931fbda5c95345087740e4c1ef5a57fdd53480.1544104801.git-series.maxime.ripard@bootlin.com>
 <fe8fc20bb7850e5f829c1b8d15beea7040dc6c9a.1544104801.git-series.maxime.ripard@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <fe8fc20bb7850e5f829c1b8d15beea7040dc6c9a.1544104801.git-series.maxime.ripard@bootlin.com>
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

> The bananapi has all its bank regulators tied to the 3v3 static regulator.
> Make sure it's properly represented.
>
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>

I suppose the DT bindings are already modified?

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
