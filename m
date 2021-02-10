Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A582BC433DB
	for <linux-gpio@archiver.kernel.org>; Wed, 10 Feb 2021 12:38:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 75D3664E32
	for <linux-gpio@archiver.kernel.org>; Wed, 10 Feb 2021 12:38:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231310AbhBJMiw (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 10 Feb 2021 07:38:52 -0500
Received: from smtprelay0193.hostedemail.com ([216.40.44.193]:60942 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S229639AbhBJMgr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 10 Feb 2021 07:36:47 -0500
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay05.hostedemail.com (Postfix) with ESMTP id F3DC31801D2F8;
        Wed, 10 Feb 2021 12:36:03 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: cork75_4203f8127610
X-Filterd-Recvd-Size: 2735
Received: from [192.168.1.159] (unknown [47.151.137.21])
        (Authenticated sender: joe@perches.com)
        by omf01.hostedemail.com (Postfix) with ESMTPA;
        Wed, 10 Feb 2021 12:36:02 +0000 (UTC)
Message-ID: <ef9bc69ea67b70557265f117ce2a09f8019bb17d.camel@perches.com>
Subject: Re: [PATCH v2 1/2] pinctrl: use to octal permissions for debugfs
 files
From:   Joe Perches <joe@perches.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Drew Fustini <drew@beagleboard.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@beagleboard.org>
Date:   Wed, 10 Feb 2021 04:36:00 -0800
In-Reply-To: <CAHp75VeJT0dPATD-Ux+JCEYxNTigbOn_6D_F1VQkfL=vuiCBPQ@mail.gmail.com>
References: <20210210074946.155417-1-drew@beagleboard.org>
         <20210210074946.155417-2-drew@beagleboard.org>
         <87437daafdd86fa5c765ff9b17b6c7b097f0c317.camel@perches.com>
         <CAHp75VeJT0dPATD-Ux+JCEYxNTigbOn_6D_F1VQkfL=vuiCBPQ@mail.gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 2021-02-10 at 12:18 +0200, Andy Shevchenko wrote:
> On Wed, Feb 10, 2021 at 10:30 AM Joe Perches <joe@perches.com> wrote:
> > On Tue, 2021-02-09 at 23:49 -0800, Drew Fustini wrote:
> 
> > > -     debugfs_create_file("pinctrl-devices", S_IFREG | S_IRUGO,
> > > +     debugfs_create_file("pinctrl-devices", 0400,
> > >                           debugfs_root, NULL, &pinctrl_devices_fops);
> > 
> > NAK.  You've changed the permission levels.
> 
> NAK is usually given when the whole idea is broken. Here is not the
> case and you may have helped to amend the patch.

NAK IMO just means the patch should not be applied, not that the
concept is broken.

> ...
> 
> > And you have to keep the S_IFREG or'd along with the octal.
> 
> Perhaps time to read the code?
> https://elixir.bootlin.com/linux/latest/source/fs/debugfs/inode.c#L387

Then the commit message is also broken.

> > checkpatch does this conversion using this command line:
> > 
> > $ ./scripts/checkpatch.pl -f --show-types --terse drivers/pinctrl/*.[ch] --types=SYMBOLIC_PERMS --fix-inplace
> 
> NAK! See above.

The command line above is for octal conversion of the symbolic permissions.

Any other conversion would be for a different purpose and that purpose and
should be described in the commit message.


