From: Jim Quinlan <jim2101024@gmail.com>
Subject: Re: [PATCH 1/3] gpio: brcmstb: have driver register during subsys_initcall()
Date: Wed, 20 Jan 2016 10:30:24 -0500
Message-ID: <CANCKTBs-TSj5n1QE=Auo5XyXskJqc-Prrmyw6xm+HNMf9RBMUA@mail.gmail.com>
References: <1452106523-11556-1-git-send-email-f.fainelli@gmail.com>
	<1452106523-11556-2-git-send-email-f.fainelli@gmail.com>
	<CADtm3G7_pGdgM8EJgRzRf8j1JAJKivxzd85ie5haWP8ivZvwSg@mail.gmail.com>
	<568EAA99.1020603@gmail.com>
	<CANCKTBv-jfhf=UDz5XQ1tSso3v9A80ykEqOx=KTirU_ku=GUiQ@mail.gmail.com>
	<CADtm3G6kAVAiBoq63oK3pnFjvXOAwgh7cX8P2TEK2hGsXy8eJg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f193.google.com ([209.85.213.193]:33085 "EHLO
	mail-ig0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933889AbcATPaZ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 20 Jan 2016 10:30:25 -0500
Received: by mail-ig0-f193.google.com with SMTP id h5so1881684igh.0
        for <linux-gpio@vger.kernel.org>; Wed, 20 Jan 2016 07:30:25 -0800 (PST)
In-Reply-To: <CADtm3G6kAVAiBoq63oK3pnFjvXOAwgh7cX8P2TEK2hGsXy8eJg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Gregory Fong <gregory.0xf0@gmail.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>, linux-gpio@vger.kernel.org

Hi Gregory,
I don't want to use deferred probes as I think I can move the PCIe RC
driver to use module_platform_driver().  It originally used
arch_initcall(), but that was for legacy reasons; in it's previous
life it was a MIPs PCIe driver, and all of the MIPs PCIe drivers use
arch/postcore_initcall() because of the way the Linux MIPs PCIe
infrastructure works.  So, assuming I can do this, we do not need this
patch.
Thanks, Jim

On Wed, Jan 20, 2016 at 4:40 AM, Gregory Fong <gregory.0xf0@gmail.com> wrote:
> Hi Jim,
>
> On Tue, Jan 19, 2016 at 1:18 PM, Jim Quinlan <jim2101024@gmail.com> wrote:
>> Hi, sorry I am late to this thead.  Our brcmstb PCIe code is using
>> platform_driver_probe() which does not tolerate EPROBE_DEFER.
>
> Can't that be changed?  For instance, see this changeset which was
> merged, particularly patches 3 and 4:
> http://lists.infradead.org/pipermail/linux-arm-kernel/2013-August/191612.html
>
>> Also, I
>> do not see any "cost" associated with having gpio-brcmstb.c using
>> subsys_initcall(); in fact, I see 33 gpio-*.c files that use
>> subsys_initcall().
>
> I've been seeing some recent patches merged that remove uses of
> subsys_initcall() in favor of deferred probe.  But I acknowledge it
> may have some problems:
> - may slow boot time because it just hacks around the dependency
> problem, not really taking the required order into account
> - may waste memory for non-hotpluggable devices (like PCIe root
> complex) by requiring that the initialization functions be kept in
> memory for the case where probe must be deferred
>
> This isn't advising against using subsys_initcall() in the brcmstb
> downstream tree as a stopgap.  But I'd rather we don't contribute to
> the manual initcall mess without a very good reason, and since
> 1. it sounds like there's a way to write the pcie root complex driver
> to use deferred probe,
> 2. I'm not fully convinced that the cost of writing in a way to handle
> deferred probe is that high vs platform_driver_probe(), and
> 3. the one driver that would benefit from this isn't being submitted
> upstream at this time,
> I don't think this patch should be applied right now.
>
> Aside: It looks like there were some good ideas thrown around after
> the 2015 Kernel Summit last November for better handling of device
> dependencies: https://lwn.net/Articles/662820/ .  Not sure what's
> developed since then.
>
> Best regards,
> Gregory
>
>>
>> On Thu, Jan 7, 2016 at 1:12 PM, Florian Fainelli <f.fainelli@gmail.com> wrote:
>>> On 06/01/16 22:05, Gregory Fong wrote:
>>>> Hello Florian and Jim,
>>>>
>>>> On Wed, Jan 6, 2016 at 10:55 AM, Florian Fainelli <f.fainelli@gmail.com> wrote:
>>>>> From: Jim Quinlan <jim2101024@gmail.com>
>>>>>
>>>>> Because regulators are started with subsys_initcall(), and gpio references may
>>>>> be contained in the regulators, it makes sense to start the brcmstb-gpio's with
>>>>> a subsys_initcall(). The order within the drivers/Makefile ensures that the
>>>>> gpio initialization happens prior to the regulator's initialization.
>>>>>
>>>>> We need to unroll module_platform_driver() now to allow this and have custom
>>>>> exit and init module functions to control the initialization level.
>>>>
>>>> If gpio pins are needed for a regulator to come up, wouldn't it be
>>>> better to handle this using deferred probe instead of initcall-based
>>>> initialization?  Deferred probe has its problems, but I was under the
>>>> impression that it's the encouraged way to resolve these sort of
>>>> initialization order issues.
>>>
>>> To give you some more context associated with this change, we now have
>>> some boards which have GPIO-connected regulators to turn on/off PCIe
>>> endpoint devices. In the downstream kernel, and with lack of a better
>>> solution for now, we ended-up having the PCIE Root Complex driver to
>>> claim these regulator, and flip them on shortly before attempting a bus
>>> scan.
>>>
>>> If we used deferred probing, I am assuming the sequence of events could
>>> go like this:
>>>
>>> - PCIe driver gets initialized, looks for regulators, cannot get a
>>> handle on them, gets EPROBE_DEFER (arch_initcall right now)
>>> - regulator subsystem gets initialized, does not have a valid GPIO
>>> provider driver yet, returns EPROBE_DEFER (subsys_initcall)
>>> - GPIO provider (gpio-brcmstb) finally gets probed and registered,
>>> regulator get registered and available, PCIe RC driver can now use them
>>> and power on the PCIE end point (module_initcall)
>>>
>>> I suppose this might be working actually, let me go back to the white
>>> board and look at this with Jim.
>>> --
>>> Florian
