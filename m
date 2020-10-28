Return-Path: <SRS0=HCPu=ED=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1809C56201
	for <linux-gpio@archiver.kernel.org>; Wed, 28 Oct 2020 21:33:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5CAF424842
	for <linux-gpio@archiver.kernel.org>; Wed, 28 Oct 2020 21:33:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=axis.com header.i=@axis.com header.b="XueiRrt/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726203AbgJ1Vdl (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 28 Oct 2020 17:33:41 -0400
Received: from smtp2.axis.com ([195.60.68.18]:29487 "EHLO smtp2.axis.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726176AbgJ1Vdk (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 28 Oct 2020 17:33:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=1582; q=dns/txt; s=axis-central1;
  t=1603920821; x=1635456821;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wShs6Il8676fEisJ9OqkRk7Glv/K0kWtHAFo/leZB64=;
  b=XueiRrt/TAHzdubbGmnVUpFvbr7WJRhWdQUAfkDeXQv2mFheCSUAtmhB
   WPtKT9/R3VHqoyNLd7bYb6oGMVqRFk1AfQoAyK80LdGVIxNGkWpsP4Hv+
   pz35u3QkxKWCdIPgylYwKzXunm2DI702z76LGKlnkN2Rrh2iu6onywlUX
   eiEXSL00y8j2gSfMKScnxC0M77j9WbUXjyhPJwn4U456Ozx9zB8bXCBD1
   evTL/IkKz2gfm1F4Yh+u7kjiMcTs7Y7hZvGnFyGHusWWddnz2hTyHtNRC
   zzRUUg4lINfteKhB7EIfJdEqKhxafHvr9JAG1yEtnVR6RLQUs6FQbSg+n
   A==;
IronPort-SDR: U8zltDoScmoPmC4fPkt4No97bd/rwXnqaOG5X7a0JcHti08Il8LC8DtC222YcI/kIB6HgvWfwt
 J/+H8AGXxQE/W2fpGK68aV/w+DL+bhkqgv8ZEqqoOf4EuyFJp7vUDOaI7ntfwxhFqFf5opGXoz
 7AM11J2KHztE6qRm628hbygd7ayww1h2buIKls+eNCank0Tl1VE92QLqmH0a4JS/oC5LabwAlC
 slCRd1L83rroA2diWK8sYxBEz1gB2QvUU67wzHmoeKXcM9DyYQLhBPQy1LrCU5xy+74tC8qHFo
 pCs=
X-IronPort-AV: E=Sophos;i="5.77,425,1596492000"; 
   d="scan'208";a="13984860"
Date:   Wed, 28 Oct 2020 09:57:46 +0100
From:   Vincent Whitchurch <vincent.whitchurch@axis.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
CC:     Bamvor Jian Zhang <bamv2005@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        kernel <kernel@axis.com>,
        devicetree <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] gpio: mockup: Allow probing from device tree
Message-ID: <20201028085746.bmyb4y6ypburdy5s@axis.com>
References: <20201027135325.22235-1-vincent.whitchurch@axis.com>
 <CAMRc=Mdjm8tgxF_76T3f6r3TwghLKtrFtUv7ywtX3-nEQzVGtA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAMRc=Mdjm8tgxF_76T3f6r3TwghLKtrFtUv7ywtX3-nEQzVGtA@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Oct 27, 2020 at 07:12:13PM +0100, Bartosz Golaszewski wrote:
> On Tue, Oct 27, 2020 at 2:54 PM Vincent Whitchurch
> <vincent.whitchurch@axis.com> wrote:
> > diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
> > index 67ed4f238d43..c93892a6936a 100644
> > --- a/drivers/gpio/gpio-mockup.c
> > +++ b/drivers/gpio/gpio-mockup.c
> > @@ -13,6 +13,7 @@
> >  #include <linux/gpio/driver.h>
> >  #include <linux/interrupt.h>
> >  #include <linux/irq.h>
> > +#include <linux/of.h>
> 
> Please keep the includes ordered alphabetically.

Thanks, fixed in v3.

> >  #include <linux/irq_sim.h>
> >  #include <linux/irqdomain.h>
> >  #include <linux/module.h>
> > @@ -460,9 +461,18 @@ static int gpio_mockup_probe(struct platform_device *pdev)
> >         return 0;
> >  }
> >
> > +#ifdef CONFIG_OF
> > +static const struct of_device_id gpio_mockup_of_match[] = {
> > +       { .compatible = "gpio-mockup", },
> > +       {},
> > +};
> > +MODULE_DEVICE_TABLE(of, gpio_mockup_of_match);
> > +#endif
> 
> You don't need this ifdef - of_match_ptr() will evaluate to NULL if
> CONFIG_OF is disabled and the compiler will optimize this struct out.

The compiler can't optimise out the struct in the case of a module build
since there is a reference from the MODULE_DEVICE_TABLE:

 $ grep CONFIG_OF .config
 # CONFIG_OF is not set
 $ nm drivers/gpio/gpio-mockup.ko  | grep of_
 00000000 r gpio_mockup_of_match
 00000000 R __mod_of__gpio_mockup_of_match_device_table

But these few wasted bytes don't matter so I removed the CONFIG_OF
anyway as you suggested.
