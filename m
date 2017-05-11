From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/4] pinctrl: meson: meson8b: add the PWM pins
Date: Thu, 11 May 2017 15:46:25 +0200
Message-ID: <CACRpkdY1xoC3_o66vJwFQF=djLbBDU8LMoU569h0y-rcokOdwA@mail.gmail.com>
References: <20170504184932.5372-1-martin.blumenstingl@googlemail.com>
 <20170504184932.5372-2-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170504184932.5372-2-martin.blumenstingl@googlemail.com>
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
Cc: Carlo Caione <carlo@caione.org>, Kevin Hilman <khilman@baylibre.com>, "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, May 4, 2017 at 8:49 PM, Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:

> This adds the missing pins for the PWM controllers found in Amlogic
> Meson8 SoCs. This includes the pins for PWM_A, PWM_B, PWM_C, PWM_D,
> PWM_E and PWM_F controllers.
> There is an additional PWM function with the name PWM_VS in the vendor
> kernel sources which seems to be used for external video input. Thus
> it's not part of this change as the IP block behind the pwm-meson driver
> is not responsible for these pins.
>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Patch applied.

Yours,
Linus Walleij
