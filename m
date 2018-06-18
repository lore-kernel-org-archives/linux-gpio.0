From: Tony Lindgren <tony@atomide.com>
Subject: Re: [Letux-kernel] BUG: drivers/pinctrl/core: races in
 pinctrl_groups and deferred probing
Date: Mon, 18 Jun 2018 04:51:22 -0700
Message-ID: <20180618115122.GT26255@atomide.com>
References: <FC373DE9-6D6B-40C5-ACED-C07B1B524469@goldelico.com>
 <20180615065810.GI112168@atomide.com>
 <20180615111318.GJ112168@atomide.com>
 <029F115C-480E-485A-B547-9D5873925CEF@goldelico.com>
 <4DE2E482-B0D3-4799-9E2D-74E2180B305B@goldelico.com>
 <CAHp75Vf7-xcsoSJ--9nJYbxpwSfDv201UwnxJHoFbwtD187SPw@mail.gmail.com>
 <20180618091433.GP112168@atomide.com>
 <BB5DB278-9827-4351-99DF-54C875B1879F@goldelico.com>
 <20180618095428.GQ112168@atomide.com>
 <CA+Ot1OxNj30KgHWJHXgWbnXYkNXTNvd_t-b6+uG3u=z8+pZf2Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CA+Ot1OxNj30KgHWJHXgWbnXYkNXTNvd_t-b6+uG3u=z8+pZf2Q@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Christ van Willegen <cvwillegen@gmail.com>
Cc: Discussions about the Letux Kernel <letux-kernel@openphoenux.org>, Linus Walleij <linus.walleij@linaro.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, kernel@pyra-handheld.com
List-Id: linux-gpio@vger.kernel.org

* Christ van Willegen <cvwillegen@gmail.com> [180618 10:01]:
> > --- a/drivers/pinctrl/core.c
> > +++ b/drivers/pinctrl/core.c
> > +               if (!strcmp(function, gname))
> 
> 
> This could never fail? gname guaranteed to never == NULL?

Thanks I'll add checks to make sure we always have a valid
name for new functions and groups added.

Regards,

Tony
