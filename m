From: Tony Lindgren <tony@atomide.com>
Subject: Re: Use of pinctrl-single for external device over I2C
Date: Wed, 24 Jun 2015 21:38:39 -0700
Message-ID: <20150625043838.GK4156@atomide.com>
References: <55893B2C.1070800@linaro.org>
 <558A9CC7.6070409@linaro.org>
 <20150624133349.GI4156@atomide.com>
 <558AE478.2080802@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from muru.com ([72.249.23.125]:59601 "EHLO muru.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750953AbbFYEin (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Thu, 25 Jun 2015 00:38:43 -0400
Content-Disposition: inline
In-Reply-To: <558AE478.2080802@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Vaibhav Hiremath <vaibhav.hiremath@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, lee.jones@linaro.org, sameo@linux.intel.com, linux-gpio@vger.kernel.org, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-kernel@vger.kernel.org

* Vaibhav Hiremath <vaibhav.hiremath@linaro.org> [150624 10:12]:
> 
> I do not like this, as this is not HW feature, so DT may not be right
> approach.
> 
> So I will dig more from either runtime or Compile time option to use
> regmap_ Vs raw read/writes.

Can't you just check if the pinctrl node has compatible = "syscon"
property?

A compile time option won't work for sure. I don't know what you
would check at runtime as you do not know what the bus is behind
syscon.

Regards,

Tony
