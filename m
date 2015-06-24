From: Tony Lindgren <tony@atomide.com>
Subject: Re: Use of pinctrl-single for external device over I2C
Date: Wed, 24 Jun 2015 06:33:50 -0700
Message-ID: <20150624133349.GI4156@atomide.com>
References: <55893B2C.1070800@linaro.org>
 <558A9CC7.6070409@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from muru.com ([72.249.23.125]:59513 "EHLO muru.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752006AbbFXNdy (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Wed, 24 Jun 2015 09:33:54 -0400
Content-Disposition: inline
In-Reply-To: <558A9CC7.6070409@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Vaibhav Hiremath <vaibhav.hiremath@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, lee.jones@linaro.org, sameo@linux.intel.com, linux-gpio@vger.kernel.org, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-kernel@vger.kernel.org

* Vaibhav Hiremath <vaibhav.hiremath@linaro.org> [150624 05:06]:
> On Tuesday 23 June 2015 04:25 PM, Vaibhav Hiremath wrote:
> >
> >/*
> >  * REVISIT: Reads and writes could eventually use regmap or something
> >  * generic. But at least on omaps, some mux registers are performance
> >  * critical as they may need to be remuxed every time before and after
> >  * idle. Adding tests for register access width for every read and
> >  * write like regmap is doing is not desired, and caching the registers
> >  * does not help in this case.
> >  */
> >
> >
> >Should be not have flag for this and use regmap_ variants? If we
> >implement flag based approach then same driver can be reused for pinmux
> >configuration of external device.

Nothing stopping you from adding regmap support to it. It just needs
to be made optional as the users so far don't need it.

Regards,

Tony
