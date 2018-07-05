From: Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCHv2 0/5] pinctrl fixes for generic functions and groups
Date: Thu, 5 Jul 2018 01:57:29 -0700
Message-ID: <20180705085729.GZ112168@atomide.com>
References: <20180619093126.74060-1-tony@atomide.com>
 <CACRpkdaV84wai+ie1D-t=j+RiYNvKJUvjA8g-zvGhMZS2dBuEA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdaV84wai+ie1D-t=j+RiYNvKJUvjA8g-zvGhMZS2dBuEA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

* Linus Walleij <linus.walleij@linaro.org> [180628 13:57]:
> On Tue, Jun 19, 2018 at 11:31 AM Tony Lindgren <tony@atomide.com> wrote:
> 
> > Here are fixes to the race issues for generic group and functions
> > reported by H. Nikolaus Schaller <hns@goldelico.com>. I have not seen
> > the issue here myself, so please test to see if this is sufficient.
> 
> It looks sane to me, it'd be great to have some Tested-by: from
> H. Nikolaus, can we get that?
> 
> Else I guess I just queue them, but if I should queue them for
> fixes it'd be great if it actually can be verified to fix something :D

Looks like git did not add Reported-by to Cc or I messed up
something as Nikolaus did not see this set. I'll resend
these patches one more time so Nikolaus can test.

Regards,

Tony
