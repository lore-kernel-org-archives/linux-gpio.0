From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: Possible regression in next-20150310 due to pinctrl: sh-pfc:
 r8a7790: Remove non existing GPIO pins
Date: Tue, 10 Mar 2015 15:00:05 +0100
Message-ID: <CACRpkdZ=+sMPhoKVhuHCS6drCWkRbtXnsN99nqD+0ouCjkmrOA@mail.gmail.com>
References: <20150310075538.GA20709@verge.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <20150310075538.GA20709@verge.net.au>
Sender: linux-sh-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: linux-gpio@vger.kernel.org

On Tue, Mar 10, 2015 at 8:55 AM, Simon Horman <horms@verge.net.au> wrote:

> I have observed what appears to be a regression in next-20150310.  Using
> the shmobile_defconfig the lager board does not produce console output
> whatsoever. If I revert bfb6698fad74e7ba2 ("pinctrl: sh-pfc: r8a7790:
> Remove non existing GPIO pins") then the problem seems to be resolved.

I have removed these two patches from the tree since last night.

Yours,
Linus Walleij
