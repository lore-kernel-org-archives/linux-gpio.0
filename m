Return-Path: <SRS0=dRYU=DF=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F128C2D0A8
	for <linux-gpio@archiver.kernel.org>; Mon, 28 Sep 2020 16:06:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C82442080A
	for <linux-gpio@archiver.kernel.org>; Mon, 28 Sep 2020 16:06:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726615AbgI1QGk (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Mon, 28 Sep 2020 12:06:40 -0400
Received: from smtprelay0062.hostedemail.com ([216.40.44.62]:41254 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726551AbgI1QGk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 28 Sep 2020 12:06:40 -0400
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay03.hostedemail.com (Postfix) with ESMTP id EA4BF8383102;
        Mon, 28 Sep 2020 16:06:38 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: coast39_3a00add27182
X-Filterd-Recvd-Size: 2060
Received: from XPS-9350.home (unknown [47.151.133.149])
        (Authenticated sender: joe@perches.com)
        by omf12.hostedemail.com (Postfix) with ESMTPA;
        Mon, 28 Sep 2020 16:06:37 +0000 (UTC)
Message-ID: <12317bbc7712d96be8f52a3bf574e47628830191.camel@perches.com>
Subject: Re: [PATCH v2 1/9] lib: string_helpers: provide kfree_strarray()
From:   Joe Perches <joe@perches.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-doc <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 28 Sep 2020 09:06:34 -0700
In-Reply-To: <CAMRc=Mds0ccYBhRJnCQ0NEPkUpWRGtyX4FKj4+4rxN27_gfobA@mail.gmail.com>
References: <20200928104155.7385-1-brgl@bgdev.pl>
         <20200928104155.7385-2-brgl@bgdev.pl>
         <2fcfd81f62ec87d9b75cca32468d8b9583faec47.camel@perches.com>
         <CAMRc=Mds0ccYBhRJnCQ0NEPkUpWRGtyX4FKj4+4rxN27_gfobA@mail.gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 2020-09-28 at 18:02 +0200, Bartosz Golaszewski wrote:
> On Mon, Sep 28, 2020 at 5:59 PM Joe Perches <joe@perches.com> wrote:
> > On Mon, 2020-09-28 at 12:41 +0200, Bartosz Golaszewski wrote:
> > > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > > 
> > > There's a common pattern of dynamically allocating an array of char
> > > pointers and then also dynamically allocating each string in this
> > > array. Provide a helper for freeing such a string array with one call.
> > 
> > Isn't this also common for things like ring buffers?
> > Why limit this to char *[]?
> > 
> 
> I don't want to add APIs nobody is using. What do you suggest?

Change the argument to void** and call it

void kfree_array(void **array, int count);




