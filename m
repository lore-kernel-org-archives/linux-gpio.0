From: Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH] pinctrl: when claiming hog, skip maps not served by same
 device
Date: Fri, 12 May 2017 07:03:19 -0700
Message-ID: <20170512140319.GD3489@atomide.com>
References: <20170511200211.20985-1-nikita.yoush@cogentembedded.com>
 <20170511214444.GB3489@atomide.com>
 <df9e82c4-10ef-55c2-abc9-de315dee73da@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from muru.com ([72.249.23.125]:47334 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1756316AbdELODY (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 12 May 2017 10:03:24 -0400
Content-Disposition: inline
In-Reply-To: <df9e82c4-10ef-55c2-abc9-de315dee73da@cogentembedded.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Jon Hunter <jonathanh@nvidia.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Chris Healy <Chris.Healy@zii.aero>, Jeff.White@zii.aero

* Nikita Yushchenko <nikita.yoush@cogentembedded.com> [170512 01:22]:
> >> +		/*
> >> +		 * If pctldev is not null, we are claiming hog for it,
> >> +		 * that means, setting that is served by pctldev by itself.
> >> +		 *
> >> +		 * Thus we must skip map that is for this device but is served
> >> +		 * by other device.
> >> +		 */
> >> +		if (pctldev &&
> >> +		    strcmp(dev_name(pctldev->dev), map->ctrl_dev_name))
> >> +			continue;
> >>  
> >>  		ret = add_setting(p, pctldev, map);
> >>  		/*
> >> -- 
> > 
> > Maybe add a comment saying pctldev is NULL in the regular case
> > and only exists in the hog case?
> 
> Isn't comment above saying exactly that?

Yes it is, you're right :)

Tony
