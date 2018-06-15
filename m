From: Tony Lindgren <tony@atomide.com>
Subject: Re: BUG: drivers/pinctrl/core: races in pinctrl_groups and deferred
 probing
Date: Fri, 15 Jun 2018 04:13:18 -0700
Message-ID: <20180615111318.GJ112168@atomide.com>
References: <F20BD6B3-D4D7-4D5D-B464-64402650BDE5@goldelico.com>
 <20180614120157.GE112168@atomide.com>
 <FC373DE9-6D6B-40C5-ACED-C07B1B524469@goldelico.com>
 <20180615065810.GI112168@atomide.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180615065810.GI112168@atomide.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Discussions about the Letux Kernel <letux-kernel@openphoenux.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, kernel@pyra-handheld.com
List-Id: linux-gpio@vger.kernel.org

* Tony Lindgren <tony@atomide.com> [180615 07:00]:
> * H. Nikolaus Schaller <hns@goldelico.com> [180614 12:15]:
> > Hi Tony,
> > 
> > > Am 14.06.2018 um 14:01 schrieb Tony Lindgren <tony@atomide.com>:
> > > 
> > > * H. Nikolaus Schaller <hns@goldelico.com> [180613 12:41]:
> > >> 
> > >> Now if I look into pinctrl_generic_add_group() and pinctrl_generic_get_group_name(),
> > >> pctldev->num_groups++ is not protected if pinctrl_generic_add_group() may be called by
> > >> two threads in parallel for the same pctldev. Hence a second thread may try to insert
> > >> a different node into the radix tree at the same selector index. This fails but there
> > >> is no error check - and the second entry is completely missing (but probably assumed to
> > >> be there).
> > > 
> > > Sounds like pinctrl-single.c is missing mutex around calls to
> > > pinctrl_generic_add_group()?
> > 
> > Yes, that could be. I didn't research the call path, just the one of
> > devm_pinctrl_get(). That uses a mutex in
> 
> In addition to missing mutex lock around the generic pinctrl functions
> we also have racy helpers pinctrl_generic_remove_last_group() and
> pinmux_generic_remove_last_function() like you pointed out. I'll post
> a patch for you later on today to test.

OK I posted a series to fix these issues hopefully as thread
"[PATCH 0/5] pinctrl fixes for generic functions and groups".

Can you please test and see if that is enough to fix the issues
you're seeing?

Regards,

Tony
