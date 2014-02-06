From: Aaron Sierra <asierra@xes-inc.com>
Subject: Re: Intel ICH GPIOs compatibility IDs
Date: Thu, 6 Feb 2014 09:55:54 -0600 (CST)
Message-ID: <1703348638.20869.1391702154515.JavaMail.zimbra@xes-inc.com>
References: <20140206095744.GA21598@ks3318809.kimsufi.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from xes-mad.com ([216.165.139.218]:48137 "EHLO xes-mad.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751370AbaBFQeH (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Thu, 6 Feb 2014 11:34:07 -0500
In-Reply-To: <20140206095744.GA21598@ks3318809.kimsufi.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Vincent Donnefort <vdonnefort@gmail.com>
Cc: linux-gpio@vger.kernel.org

----- Original Message -----
> From: "Vincent Donnefort" <vdonnefort@gmail.com>
> Sent: Thursday, February 6, 2014 3:57:44 AM
> 
> Hi,
> 
> I'm working on adding Avoton support for ich_gpio. I noticed that
> GPIOs compatibility IDs defined into linux/drivers/mfd/lpc_ich.h
> aren't arbitrary but I can't find any trace of it into ICH10 and
> Avoton datasheet. How can I defined the right one?

Vincent,
As far as I can tell, I am responsible for introducing the values
assigned to the .gpio_version member of the lpc_ich_info structure.

I have to guess that my original intention was to encode the ICH
version, a version quirk identifier (see V10CONS and V10CORP, and
whether or not GPIO was supported into those values.

There is no reason for these values to be encoded the way that they
are based on the current form of the driver. They are effectively
arbitrary. It would almost certainly be better if these were
defined as an enum instead of individual #defines.

> 
> Thanks,
> --
> Vincent Donnefort
> 

-Aaron
