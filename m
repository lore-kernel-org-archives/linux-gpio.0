From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 1/3] sh-pfc: fix sparse GPIOs for R-Car SoCs
Date: Mon, 13 Jul 2015 22:29:07 +0200
Message-ID: <CACRpkdbPAR4X7q2wJ14JF8nnd4GTy2pR2vJi3tNOcvRoEfEk-A@mail.gmail.com>
References: <1460630.GxHT4lRd7u@wasted.cogentembedded.com>
	<2925145.E3lLFJfWJW@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <2925145.E3lLFJfWJW@wasted.cogentembedded.com>
Sender: linux-sh-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Fri, Jun 26, 2015 at 12:40 AM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:

> The PFC driver causes the kernel to hang on the R-Car gen2 SoC based  boards
> when the CPU_ALL_PORT() macro is fixed to reflect the reality, i.e. when the
> GPIO space becomes actually sparse.  This happens because the _GP_GPIO() macro
> includes  an indexed initializer which causes the "holes" (array entries filled
> with all 0s) between the groups  of the existing GPIOs; and the driver can't
> cope with that.  There seems to  be no reason to use the indexed initializer,
> so we can remove the index specifier and so avoid the "holes".
>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Patch applied for fixes.

Yours,
Linus Walleij
