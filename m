From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: meson: meson8b: fix the sdxc_a data 1..3 pins
Date: Mon, 11 Feb 2019 09:16:05 +0100
Message-ID: <CACRpkdY3ygTU3UvA=Gu36S+Gte_WpR3stX5H-8Od42fJyDdSug@mail.gmail.com>
References: <20190209010101.12210-1-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190209010101.12210-1-martin.blumenstingl@googlemail.com>
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
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
List-Id: linux-gpio@vger.kernel.org

On Sat, Feb 9, 2019 at 2:01 AM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:

> Fix the mismatch between the "sdxc_d13_1_a" pin group definition from
> meson8b_cbus_groups and the entry in sdxc_a_groups ("sdxc_d0_13_1_a").
> This makes it possible to use "sdxc_d13_1_a" in device-tree files to
> route the MMC data 1..3 pins to GPIOX_1..3.
>
> Fixes: 0fefcb6 ("pinctrl: Add support for Meson8b")
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Patch applied for fixes.

Yours,
Linus Walleij
