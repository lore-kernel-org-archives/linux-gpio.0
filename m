From: Vaibhav Hiremath <vaibhav.hiremath@linaro.org>
Subject: Re: Use of pinctrl-single for external device over I2C
Date: Wed, 24 Jun 2015 22:40:16 +0530
Message-ID: <558AE478.2080802@linaro.org>
References: <55893B2C.1070800@linaro.org> <558A9CC7.6070409@linaro.org> <20150624133349.GI4156@atomide.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pd0-f175.google.com ([209.85.192.175]:36527 "EHLO
	mail-pd0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752995AbbFXRKW (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 24 Jun 2015 13:10:22 -0400
Received: by pdcu2 with SMTP id u2so34524678pdc.3
        for <linux-gpio@vger.kernel.org>; Wed, 24 Jun 2015 10:10:22 -0700 (PDT)
In-Reply-To: <20150624133349.GI4156@atomide.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Tony Lindgren <tony@atomide.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, lee.jones@linaro.org, sameo@linux.intel.com, linux-gpio@vger.kernel.org, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-kernel@vger.kernel.org



On Wednesday 24 June 2015 07:03 PM, Tony Lindgren wrote:
> * Vaibhav Hiremath <vaibhav.hiremath@linaro.org> [150624 05:06]:
>> On Tuesday 23 June 2015 04:25 PM, Vaibhav Hiremath wrote:
>>>
>>> /*
>>>   * REVISIT: Reads and writes could eventually use regmap or something
>>>   * generic. But at least on omaps, some mux registers are performance
>>>   * critical as they may need to be remuxed every time before and after
>>>   * idle. Adding tests for register access width for every read and
>>>   * write like regmap is doing is not desired, and caching the registers
>>>   * does not help in this case.
>>>   */
>>>
>>>
>>> Should be not have flag for this and use regmap_ variants? If we
>>> implement flag based approach then same driver can be reused for pinmux
>>> configuration of external device.
>
> Nothing stopping you from adding regmap support to it. It just needs
> to be made optional as the users so far don't need it.
>

Yeah, absolutely.

Thinking more on this,


I do not like this, as this is not HW feature, so DT may not be right
approach.


So I will dig more from either runtime or Compile time option to use
regmap_ Vs raw read/writes.


Thanks,
Vaibhav

