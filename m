From: Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH 1/5] pinctrl: core: Return selector to the pinctrl driver
Date: Sun, 17 Jun 2018 23:48:58 -0700
Message-ID: <20180618064858.GM112168@atomide.com>
References: <20180615111141.37184-1-tony@atomide.com>
 <20180615111141.37184-2-tony@atomide.com>
 <CAHp75Vdi-9pEPYy3+hh9rw1-sMvmh7vahz_idug0XcMaCQh6=Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAHp75Vdi-9pEPYy3+hh9rw1-sMvmh7vahz_idug0XcMaCQh6=Q@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Haojian Zhuang <haojian.zhuang@linaro.org>, Jacopo Mondi <jacopo+renesas@jmondi.org>, Paul Cercueil <paul@crapouillou.net>, sean.wang@mediatek.com
List-Id: linux-gpio@vger.kernel.org

* Andy Shevchenko <andy.shevchenko@gmail.com> [180617 16:53]:
> On Fri, Jun 15, 2018 at 2:14 PM Tony Lindgren <tony@atomide.com> wrote:
> > @@ -641,12 +642,12 @@ int pinctrl_generic_add_group(struct pinctrl_dev *pctldev, const char *name,
> >         group->num_pins = num_pins;
> >         group->data = data;
> >
> > -       radix_tree_insert(&pctldev->pin_group_tree, pctldev->num_groups,
> > +       radix_tree_insert(&pctldev->pin_group_tree, selector,
> >                           group);
> 
> A nit: Can it be now one line?

Sure will update and post an updated series of patches. It probably
makes sense to wait a bit with these as there are still issues
remaining for deferred probe.

Regards,

Tony
