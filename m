From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH] pinctrl: meson-axg: adjust spicc pin naming
Date: Fri, 08 Dec 2017 11:54:18 -0800
Message-ID: <7hvahhknbp.fsf@baylibre.com>
References: <20171208152909.15632-1-yixun.lan@amlogic.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20171208152909.15632-1-yixun.lan@amlogic.com> (Yixun Lan's
 message of "Fri, 8 Dec 2017 23:29:09 +0800")
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Yixun Lan <yixun.lan@amlogic.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Carlo Caione <carlo@caione.org>, linux-amlogic@lists.infradead.org, Xingyu Chen <xingyu.chen@amlogic.com>, Jerome Brunet <jbrunet@baylibre.com>
List-Id: linux-gpio@vger.kernel.org

Yixun Lan <yixun.lan@amlogic.com> writes:

> According to datasheet, we should use numbers for the pin naming
> instead of letters. The patch here try to fix this to keep
> the consistency.
>
> This patch should not bring any functional change.
>
> Fixes: 83c566806a68 ("pinctrl: meson-axg: Add new pinctrl driver for Meson AXG SoC")
> Suggested-by: Kevin Hilman <khilman@baylibre.com>
> Signed-off-by: Yixun Lan <yixun.lan@amlogic.com>

Acked-by: Kevin Hilman <khilman@baylibre.com>

> ---
> The issue was raised by Kevin while review the SPI DT part patches, see [1]
> [1] http://lists.infradead.org/pipermail/linux-amlogic/2017-December/005641.html
>
> Note: the 'Fixes' is coming from pinctrl's tree 'for-next' branch


Linus, please consider this change for your next branch.  I'd like to
get the names aligned with the datasheet before we have any users in DT.

Thanks,

Kevin
