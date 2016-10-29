From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: generic: Parse pinmux init nodes if node status
 is okay
Date: Sat, 29 Oct 2016 10:32:29 +0200
Message-ID: <CACRpkdaP2a+YPEAhn-GtSnfCHkJdzRmv7a1DM34LiXqs2iNWAQ@mail.gmail.com>
References: <1477653861-11921-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1477653861-11921-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Fri, Oct 28, 2016 at 1:24 PM, Laxman Dewangan <ldewangan@nvidia.com> wrote:

> During pinmux registration, pinmux table is parsed from DT
> for making the pinmux table configuration of pins.
>
> Parse the only those node whose status is not disabled.
> This will help on reusing the pin configuration table across
> platform and disabling the node by status property if that node
> is not needed on given platform.
>
> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>

Makes perfect sense. Patch applied.

Yours,
Linus Walleij
