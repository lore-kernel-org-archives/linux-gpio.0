From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: [PATCH v3] gpio: add GPIO support for F71882FG and F71889F
Date: Thu, 29 Aug 2013 16:37:38 +0100
Message-ID: <20130829153738.GA16306@srcf.ucam.org>
References: <1374486633-9737-1-git-send-email-simon.guinot@sequanux.org>
 <CACRpkda2bH_TkFR6c0cXvjye4SmFWN5xuzQSO=NqBq8mNDgV0g@mail.gmail.com>
 <20130801134632.GY9916@kw.sim.vm.gnt>
 <CACRpkdZcEPM-u19pc+v_cRqUSfJBFZ49rJYiewQ1sWWSU5YxEg@mail.gmail.com>
 <20130829125754.GA8813@srcf.ucam.org>
 <521F4F95.5080103@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:52361 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752217Ab3H2Phq (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 29 Aug 2013 11:37:46 -0400
Content-Disposition: inline
In-Reply-To: <521F4F95.5080103@roeck-us.net>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Guenter Roeck <linux@roeck-us.net>
Cc: Linus Walleij <linus.walleij@linaro.org>, Simon Guinot <simon.guinot@sequanux.org>, "Rafael J. Wysocki" <rjw@sisk.pl>, Grant Likely <grant.likely@secretlab.ca>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "H. Peter Anvin" <hpa@linux.intel.com>

On Thu, Aug 29, 2013 at 06:41:41AM -0700, Guenter Roeck wrote:
> On 08/29/2013 05:57 AM, Matthew Garrett wrote:
> >If a vendor doesn't provide any way to autoprobe a device, there's no
> >way to autoprobe a device. That usually means that you're not expected
> >to use that device.
> >
> 
> Pretty radical. Following your advice, should we remove all watchdog
> and hwmon drivers for all SuperIO chips out there, plus any existing
> gpio drivers (drivers/char/pc8736x_gpio.c might be a candidate) ?

The majority of board vendors clearly don't expect the OS to drive the 
hwmon chips - they're there for the benefit of ACPI and SMM code. That 
doesn't mean that there's no benefit in having drivers for them, just 
that the board vendors don't care about that use case and so won't do 
anything to make it easier.

-- 
Matthew Garrett | mjg59@srcf.ucam.org
