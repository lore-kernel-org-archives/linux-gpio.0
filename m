Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA62BC433DB
	for <linux-gpio@archiver.kernel.org>; Thu, 11 Feb 2021 07:25:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A495164E70
	for <linux-gpio@archiver.kernel.org>; Thu, 11 Feb 2021 07:25:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229559AbhBKHZJ (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Thu, 11 Feb 2021 02:25:09 -0500
Received: from smtprelay0232.hostedemail.com ([216.40.44.232]:58398 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S229533AbhBKHZI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 11 Feb 2021 02:25:08 -0500
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay04.hostedemail.com (Postfix) with ESMTP id B098A180A68C3;
        Thu, 11 Feb 2021 07:24:26 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: cart80_3f0d51b27616
X-Filterd-Recvd-Size: 2439
Received: from [192.168.1.159] (unknown [47.151.137.21])
        (Authenticated sender: joe@perches.com)
        by omf11.hostedemail.com (Postfix) with ESMTPA;
        Thu, 11 Feb 2021 07:24:24 +0000 (UTC)
Message-ID: <7b4105ca8671a2962910deb5418a934bf07d1458.camel@perches.com>
Subject: Re: [PATCH v4 2/2] pinctrl: pinmux: Add pinmux-select debugfs file
From:   Joe Perches <joe@perches.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Drew Fustini <drew@beagleboard.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tony Lindgren <tony@atomide.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@beagleboard.org>
Date:   Wed, 10 Feb 2021 23:24:23 -0800
In-Reply-To: <20210211071153.GJ20820@kadam>
References: <20210210222851.232374-1-drew@beagleboard.org>
         <20210210222851.232374-3-drew@beagleboard.org>
         <20210211071153.GJ20820@kadam>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, 2021-02-11 at 10:11 +0300, Dan Carpenter wrote:
> On Wed, Feb 10, 2021 at 02:28:54PM -0800, Drew Fustini wrote:
> > +	ret = strncpy_from_user(buf, user_buf, PINMUX_MAX_NAME * 2);
> > +	if (ret < 0) {
> > +		dev_err(pctldev->dev, "failed to copy buffer from userspace");
> > +		goto free_gname;
> > +	}
> > +	buf[len-1] = '\0';
> > +
> > +	ret = sscanf(buf, "%s %s", fname, gname);
> > +	if (ret != 2) {
> > +		dev_err(pctldev->dev, "expected format: <function-name> <group-name>");
> > +		goto free_gname;
> 
> We need a "ret = -EINVAL;" before the goto.  sscanf doesn't return error
> codes.  Normally we would write it like so:
> 
> 	if (sscanf(buf, "%s %s", fname, gname) != 2) {
> 		dev_err(pctldev->dev, "expected format: <function-name> <group-name>");
> 		ret = -EINVAL;
> 		goto free_gname;
> 	}
> 
> I'm going to write a Smatch check for this today.

It's a pretty frequently used style:

$ git grep -P '\w+\s*=\s+sscanf\b' | wc -l
327

A grep with -A5 seems to show most use some additional error assignment
when checking the return value.

$ git grep -P -A5 '\w+\s*=\s+sscanf\b' | grep -P '(?:return|=)\s*\-E' | wc -l
174


