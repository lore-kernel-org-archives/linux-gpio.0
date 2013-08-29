From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: [PATCH v3] gpio: add GPIO support for F71882FG and F71889F
Date: Thu, 29 Aug 2013 13:57:54 +0100
Message-ID: <20130829125754.GA8813@srcf.ucam.org>
References: <1374486633-9737-1-git-send-email-simon.guinot@sequanux.org>
 <CACRpkda2bH_TkFR6c0cXvjye4SmFWN5xuzQSO=NqBq8mNDgV0g@mail.gmail.com>
 <20130801134632.GY9916@kw.sim.vm.gnt>
 <CACRpkdZcEPM-u19pc+v_cRqUSfJBFZ49rJYiewQ1sWWSU5YxEg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:50236 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752483Ab3H2M6I (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 29 Aug 2013 08:58:08 -0400
Content-Disposition: inline
In-Reply-To: <CACRpkdZcEPM-u19pc+v_cRqUSfJBFZ49rJYiewQ1sWWSU5YxEg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Simon Guinot <simon.guinot@sequanux.org>, "Rafael J. Wysocki" <rjw@sisk.pl>, Grant Likely <grant.likely@secretlab.ca>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Guenter Roeck <linux@roeck-us.net>, "H. Peter Anvin" <hpa@linux.intel.com>

On Thu, Aug 29, 2013 at 02:39:33PM +0200, Linus Walleij wrote:

> I think Rafael said something about it being possible for us
> to register our own kernel ACPI PNP IDs (as if: there is no
> road here, but if someone starts to walk here, a road will
> soon become, and we take the first step then).

It'd be straightforward to register the LNX PnP prefix and have someone 
take responsibility for assigning numbers, but really a generic vendor 
string should only be used when defining programming models rather than 
specific devices.

> But overall I am a bit confused: I am hearing from one end
> of the x86 community that ACPI is the way to go for
> configuring platform devices on x86, yet stuff like this is
> popping up from independent vendors, and get integrated
> on boards with no ACPI tables in sight.

ACPI is usually used to describe systems, and the normal ACPI way of 
handling GPIO devices is to expose the device at the other end of the 
GPIO lines and then provide AML for toggling the lines. Attaching an 
actual driver to the device would interfere with that, so nobody writes 
an actual driver.

> Over at ksummit-discuss we have had a thread about
> whether device tree should be used in such cases, but
> that is not clear either.

If a vendor doesn't provide any way to autoprobe a device, there's no 
way to autoprobe a device. That usually means that you're not expected 
to use that device.

> Basically I'm a bit confused because the x86 community
> is talking with so many voices and I'm not used to it,
> and I don't know if they actually have a common vision.

x86 is driven by the vendors, not us. If the vendors don't provide ACPI 
entries for a device then the choices are to either use port probing or 
refuse to support that device. We've traditionally gone for the former.

-- 
Matthew Garrett | mjg59@srcf.ucam.org
