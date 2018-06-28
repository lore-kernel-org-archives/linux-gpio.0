From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCHv2 0/5] pinctrl fixes for generic functions and groups
Date: Thu, 28 Jun 2018 15:54:06 +0200
Message-ID: <CACRpkdaV84wai+ie1D-t=j+RiYNvKJUvjA8g-zvGhMZS2dBuEA@mail.gmail.com>
References: <20180619093126.74060-1-tony@atomide.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180619093126.74060-1-tony@atomide.com>
Sender: linux-kernel-owner@vger.kernel.org
To: ext Tony Lindgren <tony@atomide.com>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Jun 19, 2018 at 11:31 AM Tony Lindgren <tony@atomide.com> wrote:

> Here are fixes to the race issues for generic group and functions
> reported by H. Nikolaus Schaller <hns@goldelico.com>. I have not seen
> the issue here myself, so please test to see if this is sufficient.

It looks sane to me, it'd be great to have some Tested-by: from
H. Nikolaus, can we get that?

Else I guess I just queue them, but if I should queue them for
fixes it'd be great if it actually can be verified to fix something :D

Yours,
Linus Walleij
