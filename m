From: Javier Martinez Canillas <javier@dowhile0.org>
Subject: Re: [PATCH 5/6] ARM: dts: Add NextThing GR8 dtsi
Date: Wed, 7 Sep 2016 16:51:55 +0200
Message-ID: <CABxcv=kJCuP==QVRqyuoORSoWKAEqXmt5iRjdvDcCcr4MSm0gQ@mail.gmail.com>
References: <20160831081817.5191-1-maxime.ripard@free-electrons.com>
 <20160831081817.5191-6-maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20160831081817.5191-6-maxime.ripard@free-electrons.com>
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
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, linux-fbdev@vger.kernel.org, David Airlie <airlied@linux.ie>, Jingoo Han <jingoohan1@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Linux Kernel <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Linux GPIO List <linux-gpio@vger.kernel.org>, Chen-Yu Tsai <wens@csie.org>, Tomi Valkeinen <tomi.valkeinen@ti.com>, Thierry Reding <thierry.reding@gmail.com>, Daniel Vetter <daniel.vetter@intel.com>, Alexander Kaplan <alex@nextthing.co>, Mylene Josserand <mylene.josserand@free-electrons.com>, Lee Jones <lee.jones@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-gpio@vger.kernel.org

Hello Maxime,

On Wed, Aug 31, 2016 at 10:18 AM, Maxime Ripard
<maxime.ripard@free-electrons.com> wrote:

[snip]

> +
> +#include "skeleton.dtsi"
> +

The skeleton.dtsi has been deprecated and shouldn't be used in new DTS files:

http://www.spinics.net/lists/arm-kernel/msg528080.html

Best regards,
Javier
