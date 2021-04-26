Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86313C433ED
	for <linux-gpio@archiver.kernel.org>; Mon, 26 Apr 2021 09:57:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 46F80611C9
	for <linux-gpio@archiver.kernel.org>; Mon, 26 Apr 2021 09:57:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232483AbhDZJ6g (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Mon, 26 Apr 2021 05:58:36 -0400
Received: from elvis.franken.de ([193.175.24.41]:43385 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232140AbhDZJ6g (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 26 Apr 2021 05:58:36 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1lay01-000823-00; Mon, 26 Apr 2021 11:57:53 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 1C898C0BB9; Mon, 26 Apr 2021 11:33:13 +0200 (CEST)
Date:   Mon, 26 Apr 2021 11:33:13 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v3 1/2] gpio: Add support for IDT 79RC3243x GPIO
 controller
Message-ID: <20210426093313.GA7488@alpha.franken.de>
References: <20210422152055.85544-1-tsbogend@alpha.franken.de>
 <CAHp75VdToRrxxLSAnNPtN4sSoVfJ1yHQffUAuVL+SpsxkmYu5Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75VdToRrxxLSAnNPtN4sSoVfJ1yHQffUAuVL+SpsxkmYu5Q@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Apr 23, 2021 at 06:56:23PM +0300, Andy Shevchenko wrote:
> On Thu, Apr 22, 2021 at 6:21 PM Thomas Bogendoerfer
> <tsbogend@alpha.franken.de> wrote:
> >
> > IDT 79RC3243x SoCs integrated a gpio controller, which handles up
> > to 32 gpios. All gpios could be used as interrupt source.
> 
> One missed question: No I/O serialization in the entire driver? Is it
> taken care of by bgpio wrapper or ...?

for gpios bggpio takes care of it, for irqs I've added them in coming v4.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
