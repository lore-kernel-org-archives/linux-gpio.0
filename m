From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 1/2] pinctrl: meson: meson8b: fix the NAND DQS pins
Date: Fri, 7 Apr 2017 09:29:53 +0200
Message-ID: <CACRpkdbc9BqTAo-KbqVdeJ5ZS1K5ikepdvz_-ScjcX_sDvioPA@mail.gmail.com>
References: <20170325184350.7677-1-martin.blumenstingl@googlemail.com>
 <20170401135922.1288-1-martin.blumenstingl@googlemail.com>
 <20170401135922.1288-2-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170401135922.1288-2-martin.blumenstingl@googlemail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Carlo Caione <carlo@caione.org>, "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, Kevin Hilman <khilman@baylibre.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Sat, Apr 1, 2017 at 3:59 PM, Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:

> The nand_groups table uses different names for the NAND DQS pins than
> the GROUP() definition in meson8b_cbus_groups (nand_dqs_0 vs nand_dqs0).
> This prevents using the NAND DQS pins in the devicetree.
>
> Fix this by ensuring that the GROUP() definition and the
> meson8b_cbus_groups use the same name for these pins.
>
> Fixes: 0fefcb6876d0 ("pinctrl: Add support for Meson8b")
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Patch applied with Kevin's ACK.

Yours,
Linus Walleij
