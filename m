From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: pxa: change initcall level second attempt
Date: Tue, 17 Nov 2015 14:56:16 +0100
Message-ID: <CACRpkdbaej0s0GNYUwbsmwR-fSRMuJR5H+GHrat1sevUBiCgmw@mail.gmail.com>
References: <1447446158-20213-1-git-send-email-robert.jarzmik@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1447446158-20213-1-git-send-email-robert.jarzmik@free.fr>
Sender: linux-kernel-owner@vger.kernel.org
To: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Fri, Nov 13, 2015 at 9:22 PM, Robert Jarzmik <robert.jarzmik@free.fr> wrote:

> This patch is a second attempt at what was previously in commit
> 6c7e660a27da ("gpio: pxa: set initcall level to module init").
>
> The goal is the same : enable gpio & pinctrl driver to work
> together. As pinctrl driver will be initialized at device level, the
> gpio should be as well, so that the deferring mechanism is honored.
>
> Yet this patch should also respect the legacy platforms, so the set of
> constraints is :
>  - in legacy platforms (ie. non dt), gpio_[gs]et_*() should be available
>    for machine code => core initcall
>  - in new platforms (ie. dt based), pinctrl will be available and no
>    machine code => device initcall
>
> In order to fullfill all these constraints, the initcall level is either
> postcore for non devicetree platforms, and device for devicetree platforms.
>
> Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>

Kludgy, but what can we do.
Patch applied.

Yours,
Linus Walleij
