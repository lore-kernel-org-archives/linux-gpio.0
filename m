From: Vaibhav Hiremath <vaibhav.hiremath@linaro.org>
Subject: Re: Use of pinctrl-single for external device over I2C
Date: Thu, 25 Jun 2015 11:16:50 +0530
Message-ID: <558B95CA.9070105@linaro.org>
References: <55893B2C.1070800@linaro.org> <558A9CC7.6070409@linaro.org> <20150624133349.GI4156@atomide.com> <558AE478.2080802@linaro.org> <20150625043838.GK4156@atomide.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pd0-f175.google.com ([209.85.192.175]:35793 "EHLO
	mail-pd0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750966AbbFYFq5 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 25 Jun 2015 01:46:57 -0400
Received: by pdbci14 with SMTP id ci14so45909576pdb.2
        for <linux-gpio@vger.kernel.org>; Wed, 24 Jun 2015 22:46:57 -0700 (PDT)
In-Reply-To: <20150625043838.GK4156@atomide.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Tony Lindgren <tony@atomide.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, lee.jones@linaro.org, sameo@linux.intel.com, linux-gpio@vger.kernel.org, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-kernel@vger.kernel.org



On Thursday 25 June 2015 10:08 AM, Tony Lindgren wrote:
> * Vaibhav Hiremath <vaibhav.hiremath@linaro.org> [150624 10:12]:
>>
>> I do not like this, as this is not HW feature, so DT may not be right
>> approach.
>>
>> So I will dig more from either runtime or Compile time option to use
>> regmap_ Vs raw read/writes.
>
> Can't you just check if the pinctrl node has compatible = "syscon"
> property?
>
> A compile time option won't work for sure. I don't know what you
> would check at runtime as you do not know what the bus is behind
> syscon.
>

Although, I haven't gone through syscon, but not sure whether syscon
would be useful.

As you rightly stated, we need to know the bus behind regmap.

Thanks,
Vaibhav
