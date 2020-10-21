Return-Path: <SRS0=WRE+=D4=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CAD6C388F9
	for <linux-gpio@archiver.kernel.org>; Wed, 21 Oct 2020 14:39:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BF1B522275
	for <linux-gpio@archiver.kernel.org>; Wed, 21 Oct 2020 14:39:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2443023AbgJUOjh (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 21 Oct 2020 10:39:37 -0400
Received: from smtprelay0032.hostedemail.com ([216.40.44.32]:37426 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2442066AbgJUOjh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 21 Oct 2020 10:39:37 -0400
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay03.hostedemail.com (Postfix) with ESMTP id 0EF1887066B9;
        Wed, 21 Oct 2020 14:39:36 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: joke73_430d3d127249
X-Filterd-Recvd-Size: 2611
Received: from XPS-9350.home (unknown [47.151.133.149])
        (Authenticated sender: joe@perches.com)
        by omf07.hostedemail.com (Postfix) with ESMTPA;
        Wed, 21 Oct 2020 14:39:34 +0000 (UTC)
Message-ID: <42c1d07d46655f622c081f45b68ccaffba7361a1.camel@perches.com>
Subject: Re: [PATCH] gpio: bd70528: remove unneeded break
From:   Joe Perches <joe@perches.com>
To:     "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "trix@redhat.com" <trix@redhat.com>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>
Cc:     linux-power <linux-power@fi.rohmeurope.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "apw@canonical.com" <apw@canonical.com>
Date:   Wed, 21 Oct 2020 07:39:33 -0700
In-Reply-To: <db6856d5431aac3ff56cd3817312d204c41cf7d0.camel@fi.rohmeurope.com>
References: <20201019193353.13066-1-trix@redhat.com>
         <5b13773306265f89366b86afba71d2b4a4130e2b.camel@fi.rohmeurope.com>
         <0738b0cc482cfd07400cf8b0b0b2092e671cfb34.camel@fi.rohmeurope.com>
         <b435953eed76b9247a4b1dab88f268afe76ff470.camel@perches.com>
         <db6856d5431aac3ff56cd3817312d204c41cf7d0.camel@fi.rohmeurope.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 2020-10-21 at 07:25 +0000, Vaittinen, Matti wrote:
> Hello Joe & All,
> On Tue, 2020-10-20 at 11:36 -0700, Joe Perches wrote:
> > On Tue, 2020-10-20 at 11:48 +0000, Vaittinen, Matti wrote:
[]
> > > And for peeps who have not been following - following function
> > > triggers the checkpatch error above:
> > 
> > Huh?  what version of checkpatch are you using?
> > Send it to me please.
[]
> Please find my version of checkpatch and the patch to trigger the
> warning attached.

Thanks.  This test wasn't particularly useful
(and had some false positives) and was removed by

commit ef3c005c0eb07a60949191bc6ee407d5f43cc502
Author: Joe Perches <joe@perches.com>
Date:   Tue Aug 11 18:35:19 2020 -0700

    checkpatch: remove missing switch/case break test
    
    This test doesn't work well and newer compilers are much better
    at emitting this warning.
    
    Signed-off-by: Joe Perches <joe@perches.com>
    Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
    Cc: Cambda Zhu <cambda@linux.alibaba.com>
    Link: http://lkml.kernel.org/r/7e25090c79f6a69d502ab8219863300790192fe2.camel@perches.com
    Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>


