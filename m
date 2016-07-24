From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: fix pincontrol definition for marvell
Date: Sun, 24 Jul 2016 16:25:16 +0200
Message-ID: <CACRpkdYcuYq_kGxoF=aXw_Ja1w7D65jGw_FPcAhbLnJSwhhNyA@mail.gmail.com>
References: <20160716150704.GA5883@andreas>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160716150704.GA5883@andreas>
Sender: linux-kernel-owner@vger.kernel.org
To: Andreas Klinger <ak@it-klinger.de>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Laxman Dewangan <ldewangan@nvidia.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: linux-gpio@vger.kernel.org

On Sat, Jul 16, 2016 at 5:07 PM, Andreas Klinger <ak@it-klinger.de> wrote:

> On Marvell mv88f6180 with pin control driver one can not use multi
> purpose pins 35 through 44.
> I'm using this controller on an embedded board and i found that the
> pin multiplexing is not the same as in the hardware spezification.
> This patch alters the pin description so that mpp pins 0 to 19 as well
> as 35 to 44 are usable.
>
> Pin settings i used can be found here:
> http://www.marvell.com/embedded-processors/kirkwood/assets/HW_88F6180_OpenSource.pdf
>
> Signed-off-by: Andreas Klinger <ak@it-klinger.de>

Patch applied with Sebastian's review tag.

Yours,
Linus Walleij
