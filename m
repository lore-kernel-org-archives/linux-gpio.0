Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B515C433DB
	for <linux-gpio@archiver.kernel.org>; Wed, 10 Feb 2021 23:16:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E6D2964ED3
	for <linux-gpio@archiver.kernel.org>; Wed, 10 Feb 2021 23:16:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234132AbhBJXQU (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 10 Feb 2021 18:16:20 -0500
Received: from smtprelay0066.hostedemail.com ([216.40.44.66]:41828 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S233574AbhBJXNi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 10 Feb 2021 18:13:38 -0500
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay07.hostedemail.com (Postfix) with ESMTP id 2F19018029DA9;
        Wed, 10 Feb 2021 23:12:43 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: cork97_4c1518427613
X-Filterd-Recvd-Size: 2099
Received: from [192.168.1.159] (unknown [47.151.137.21])
        (Authenticated sender: joe@perches.com)
        by omf20.hostedemail.com (Postfix) with ESMTPA;
        Wed, 10 Feb 2021 23:12:41 +0000 (UTC)
Message-ID: <0bd0286b12832bdbe815325f581aec3a8ae3ca2d.camel@perches.com>
Subject: Re: [PATCH v2 1/2] pinctrl: use to octal permissions for debugfs
 files
From:   Joe Perches <joe@perches.com>
To:     Drew Fustini <drew@beagleboard.org>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@beagleboard.org>
Date:   Wed, 10 Feb 2021 15:12:39 -0800
In-Reply-To: <20210210212115.GA216435@x1>
References: <20210210074946.155417-1-drew@beagleboard.org>
         <20210210074946.155417-2-drew@beagleboard.org>
         <87437daafdd86fa5c765ff9b17b6c7b097f0c317.camel@perches.com>
         <CAHp75VeJT0dPATD-Ux+JCEYxNTigbOn_6D_F1VQkfL=vuiCBPQ@mail.gmail.com>
         <ef9bc69ea67b70557265f117ce2a09f8019bb17d.camel@perches.com>
         <20210210212115.GA216435@x1>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 2021-02-10 at 13:21 -0800, Drew Fustini wrote:
> I will change from the incorrect 0400 to 0444.

Thanks.

> As for S_IFREG, it does seem like leaving off S_IFREG is the most common
> case when using octal permissions with debugfs_create_*():
> 
> $ git grep debugfs_create drivers/ |grep 0444 |grep -v S_IFREG | wc -l
> 302
> $ git grep debugfs_create drivers/ |grep 0444 |grep S_IFREG | wc -l
> 9

It's ~2:1 when using S_IRUGO

$ git grep debugfs_create_file drivers/ | grep S_IRUGO | grep -v S_IFREG | wc -l
109
$ git grep debugfs_create_file drivers/ | grep S_IRUGO | grep S_IFREG | wc -l
48


