From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [PATCH] pinctrl: cherryview: Add a quirk to make Acer Chromebook
 keyboard work again
Date: Thu, 6 Apr 2017 16:15:57 +0100
Message-ID: <ebf75f34-4b57-b0d8-8818-6c56861f2923@arm.com>
References: <20170329095932.73368-1-mika.westerberg@linux.intel.com>
 <CACRpkdYm_wzJWskrkStgjXPM=F93S3K3HO-c5Tt=qSVJOxkGAw@mail.gmail.com>
 <da0935b8-245a-6920-4749-ade6eb278dba@arm.com>
 <20170330090047.GX2957@lahna.fi.intel.com>
 <20170406095948.GT2957@lahna.fi.intel.com>
 <6bcf8db2-626c-7934-a334-13b11fb7be68@arm.com>
 <20170406105059.GV2957@lahna.fi.intel.com>
 <f5508b70-3cbd-bbdd-da8d-ff0bff08f835@arm.com>
 <20170406131824.GW2957@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from foss.arm.com ([217.140.101.70]:44580 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752831AbdDFPQA (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 6 Apr 2017 11:16:00 -0400
In-Reply-To: <20170406131824.GW2957@lahna.fi.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Grant Likely <grant.likely@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Adam S Levy <theadamlevy@gmail.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On 06/04/17 14:18, Mika Westerberg wrote:
> On Thu, Apr 06, 2017 at 12:05:28PM +0100, Marc Zyngier wrote:
>>> There is a proper way to use GPIOs as interrupts in ACPI, namely GpioInt
>>> resource but it has not been used in that particular machine for some
>>> reason.
>>
>> OK, that explains it. One thing you could try would be to allocate the
>> domain as a legacy one, which allows you to specify the virtual
>> interrupt range you require. Not sure that's any better though.
> 
> Yeah, then I would have to add a whole bunch of code to handle custom
> irqdomain just to support this one machine (fingers crossed that it is
> limited to only this particular machine).
> 
> If no objections, I would rather stick to the approach used in this
> patch. I will just update the DMI strings to include BIOS version/date.

Fair enough. Though I have the ugly feeling that we're going to see this
cropping up again in a couple of releases, when some ordering changes
affect the interrupts allocated to this domain.

Another thing worth exploring would be to actually quirk the i8042
driver to override the ACPI interrupt. That would have a better chance
of working in the long term.

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...
