Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CF6AC6FA8E
	for <linux-gpio@archiver.kernel.org>; Sat, 25 Feb 2023 12:12:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229520AbjBYMMk (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Sat, 25 Feb 2023 07:12:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229379AbjBYMMj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 25 Feb 2023 07:12:39 -0500
Received: from fgw20-7.mail.saunalahti.fi (fgw20-7.mail.saunalahti.fi [62.142.5.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCE967D9C
        for <linux-gpio@vger.kernel.org>; Sat, 25 Feb 2023 04:12:38 -0800 (PST)
Received: from localhost (88-113-24-128.elisa-laajakaista.fi [88.113.24.128])
        by fgw20.mail.saunalahti.fi (Halon) with ESMTP
        id b086f0fe-b505-11ed-bd9b-005056bd6ce9;
        Sat, 25 Feb 2023 14:12:36 +0200 (EET)
From:   andy.shevchenko@gmail.com
Date:   Sat, 25 Feb 2023 14:12:35 +0200
To:     Benjamin Li <benl@squareup.com>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [libgpiod,v2 1/2] tools: use getprogname() when available to
 remove dependency on glibc
Message-ID: <Y/n7M8M4R7jBv/Wq@surfacebook>
References: <20230225031235.3886280-1-benl@squareup.com>
 <20230225031235.3886280-2-benl@squareup.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230225031235.3886280-2-benl@squareup.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Fri, Feb 24, 2023 at 07:12:34PM -0800, Benjamin Li kirjoitti:
> Platforms like Bionic libc don't have program_invocation_[short_]name,
> which is a GNU extension. Use getprogname() from stdlib.h, another
> widely agreed extension, when it's available.
> 
> It seemed a little heavyweight to add gnulib to this project's autotools
> set-up just for making one function portable, so I've just added the
> portabilty shim to tools-common.c for the moment.

...

>  	printf("%s (libgpiod) v%s\n",
> -	       program_invocation_short_name, gpiod_api_version());
> +	       getprogname(), gpiod_api_version());

Now this can be a single line.

  	printf("%s (libgpiod) v%s\n", getprogname(), gpiod_api_version());

-- 
With Best Regards,
Andy Shevchenko


