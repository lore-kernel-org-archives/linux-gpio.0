From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/3] pinctrl: sunxi: Add common sun5i pinctrl driver
Date: Mon, 9 Jan 2017 15:43:41 +0100
Message-ID: <CACRpkdaNdsvy+SbOyCvbppK4dEs_=8Zmf4CQhsedTt8aig8+BQ@mail.gmail.com>
References: <cover.53580d3fc31eec98682d3d81f17be89610d397ee.1483911013.git-series.maxime.ripard@free-electrons.com>
 <fd94b0b46841a455b1f1f68c2da801957d0748ac.1483911013.git-series.maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <fd94b0b46841a455b1f1f68c2da801957d0748ac.1483911013.git-series.maxime.ripard@free-electrons.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Chen-Yu Tsai <wens@csie.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Icenowy Zheng <icenowy@aosc.xyz>
List-Id: linux-gpio@vger.kernel.org

On Sun, Jan 8, 2017 at 10:31 PM, Maxime Ripard
<maxime.ripard@free-electrons.com> wrote:

> The sun5i SoCs (A10s, A13, GR8) are all based on the same die fit in
> different packages. Hence, the pins and functions available are just the
> based on the same set, each SoC having a different subset.
>
> Introduce a common pinctrl driver that supports multiple variants to allow
> to put as much as we can in common.
>
> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Patch applied.

Yours,
Linus Walleij
