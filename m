Return-Path: <SRS0=WxQe=DB=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A59E9C2D0E2
	for <linux-gpio@archiver.kernel.org>; Thu, 24 Sep 2020 16:10:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5AF11238E3
	for <linux-gpio@archiver.kernel.org>; Thu, 24 Sep 2020 16:10:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728592AbgIXQKu (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Thu, 24 Sep 2020 12:10:50 -0400
Received: from smtprelay0138.hostedemail.com ([216.40.44.138]:34742 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728448AbgIXQKu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 24 Sep 2020 12:10:50 -0400
X-Greylist: delayed 348 seconds by postgrey-1.27 at vger.kernel.org; Thu, 24 Sep 2020 12:10:50 EDT
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com [10.5.19.251])
        by smtpgrave02.hostedemail.com (Postfix) with ESMTP id 41F3F18003C3E;
        Thu, 24 Sep 2020 16:05:03 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay07.hostedemail.com (Postfix) with ESMTP id 6A350181D337B;
        Thu, 24 Sep 2020 16:05:01 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: face47_290156b27160
X-Filterd-Recvd-Size: 1629
Received: from XPS-9350.home (unknown [47.151.133.149])
        (Authenticated sender: joe@perches.com)
        by omf04.hostedemail.com (Postfix) with ESMTPA;
        Thu, 24 Sep 2020 16:04:59 +0000 (UTC)
Message-ID: <21cc553cc3a07e0952eb52a50149c323daff6041.camel@perches.com>
Subject: Re: [PATCH 5/9] gpio: mockup: use pr_fmt()
From:   Joe Perches <joe@perches.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Thu, 24 Sep 2020 09:04:58 -0700
In-Reply-To: <20200924113842.11670-6-brgl@bgdev.pl>
References: <20200924113842.11670-1-brgl@bgdev.pl>
         <20200924113842.11670-6-brgl@bgdev.pl>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, 2020-09-24 at 13:38 +0200, Bartosz Golaszewski wrote:
> We don't need a custom logging helper. Let's use the standard pr_fmt()
> macro which allows us to use all pr_*() routines with custom format.
[]
> diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
[]
> @@ -577,7 +577,7 @@ static int __init gpio_mockup_init(void)
>  
>  		pdev = platform_device_register_full(&pdevinfo);
>  		if (IS_ERR(pdev)) {
> -			gpio_mockup_err("error registering device");
> +			pr_err("error registering device");

You could add the missing newline at the same time.


