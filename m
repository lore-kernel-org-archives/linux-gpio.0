Return-Path: <SRS0=dRYU=DF=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21C65C4741F
	for <linux-gpio@archiver.kernel.org>; Mon, 28 Sep 2020 15:59:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E551A214D8
	for <linux-gpio@archiver.kernel.org>; Mon, 28 Sep 2020 15:59:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726552AbgI1P7H (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Mon, 28 Sep 2020 11:59:07 -0400
Received: from smtprelay0219.hostedemail.com ([216.40.44.219]:51130 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726513AbgI1P7H (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 28 Sep 2020 11:59:07 -0400
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay02.hostedemail.com (Postfix) with ESMTP id 31E7945A3;
        Mon, 28 Sep 2020 15:59:06 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: base25_4208bb927182
X-Filterd-Recvd-Size: 1482
Received: from XPS-9350.home (unknown [47.151.133.149])
        (Authenticated sender: joe@perches.com)
        by omf13.hostedemail.com (Postfix) with ESMTPA;
        Mon, 28 Sep 2020 15:59:04 +0000 (UTC)
Message-ID: <2fcfd81f62ec87d9b75cca32468d8b9583faec47.camel@perches.com>
Subject: Re: [PATCH v2 1/9] lib: string_helpers: provide kfree_strarray()
From:   Joe Perches <joe@perches.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 28 Sep 2020 08:59:03 -0700
In-Reply-To: <20200928104155.7385-2-brgl@bgdev.pl>
References: <20200928104155.7385-1-brgl@bgdev.pl>
         <20200928104155.7385-2-brgl@bgdev.pl>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 2020-09-28 at 12:41 +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> There's a common pattern of dynamically allocating an array of char
> pointers and then also dynamically allocating each string in this
> array. Provide a helper for freeing such a string array with one call.

Isn't this also common for things like ring buffers?
Why limit this to char *[]?


