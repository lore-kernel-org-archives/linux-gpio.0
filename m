From: Vincent Donnefort <vdonnefort@gmail.com>
Subject: Re: Intel ICH GPIOs compatibility IDs
Date: Thu, 6 Feb 2014 22:16:25 +0100
Message-ID: <20140206211625.GA28846@ks3318809.kimsufi.com>
References: <20140206095744.GA21598@ks3318809.kimsufi.com>
 <1703348638.20869.1391702154515.JavaMail.zimbra@xes-inc.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wg0-f52.google.com ([74.125.82.52]:57459 "EHLO
	mail-wg0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751297AbaBFVQ3 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 6 Feb 2014 16:16:29 -0500
Received: by mail-wg0-f52.google.com with SMTP id b13so1710778wgh.7
        for <linux-gpio@vger.kernel.org>; Thu, 06 Feb 2014 13:16:28 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1703348638.20869.1391702154515.JavaMail.zimbra@xes-inc.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Aaron Sierra <asierra@xes-inc.com>
Cc: linux-gpio@vger.kernel.org

Thank you Aaron,

So I will continue using this encoding way for next supported
chipsets.

-- 
Vincent.


On Thu, Feb 06, 2014 at 09:55:54AM -0600, Aaron Sierra wrote:
> ----- Original Message -----
> > From: "Vincent Donnefort" <vdonnefort@gmail.com>
> > Sent: Thursday, February 6, 2014 3:57:44 AM
> > 
> > Hi,
> > 
> > I'm working on adding Avoton support for ich_gpio. I noticed that
> > GPIOs compatibility IDs defined into linux/drivers/mfd/lpc_ich.h
> > aren't arbitrary but I can't find any trace of it into ICH10 and
> > Avoton datasheet. How can I defined the right one?
> 
> Vincent,
> As far as I can tell, I am responsible for introducing the values
> assigned to the .gpio_version member of the lpc_ich_info structure.
> 
> I have to guess that my original intention was to encode the ICH
> version, a version quirk identifier (see V10CONS and V10CORP, and
> whether or not GPIO was supported into those values.
> 
> There is no reason for these values to be encoded the way that they
> are based on the current form of the driver. They are effectively
> arbitrary. It would almost certainly be better if these were
> defined as an enum instead of individual #defines.
> 
> > 
> > Thanks,
> > --
> > Vincent Donnefort
> > 
> 
> -Aaron
