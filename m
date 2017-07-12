From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH] pinctrl: baytrail: Do not call WARN_ON for a firmware bug
Date: Wed, 12 Jul 2017 16:18:42 +0200
Message-ID: <87931ddb-5a5a-dc20-7e79-e1a507532e2b@redhat.com>
References: <20170712123101.26996-1-hdegoede@redhat.com>
 <1499863132.22624.361.camel@linux.intel.com>
 <f38c9f73-c2ba-a119-0d4b-ba812ad40682@redhat.com>
 <1499865158.22624.363.camel@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:57458 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751997AbdGLOSp (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 12 Jul 2017 10:18:45 -0400
In-Reply-To: <1499865158.22624.363.camel@linux.intel.com>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org

Hi,

On 12-07-17 15:12, Andy Shevchenko wrote:
> On Wed, 2017-07-12 at 14:44 +0200, Hans de Goede wrote:
>> On 12-07-17 14:38, Andy Shevchenko wrote:
>>> On Wed, 2017-07-12 at 14:31 +0200, Hans de Goede wrote:
>>>> WARN_ON causes a backtrace to get logged which is only useful for
>>>> kernel bugs. For signalling a firmware bug dev_warn(dev, FW_BUG
>>>> "...")
>>>> should be used.
>>>>
>>>> This fixes users running userspace software to monitor kernel
>>>> oopses
>>>> getting a false positive bug-report every boot because of the
>>>> wrong
>>>> use of WARN_ON.
>>>
>>> I'm not against the patch, looks good to me, though can you shed a
>>> bit
>>> of light what is the FW bug you are experiencing?
>>
>> The bug is the code path which has the WARN_ON triggering, which means
>> that the ACPI tables / or a driver want to use a pin as gpio and it
>> has
>> been setup differently (as a special function) by the firmware.
> 
> Yes, and what I'm asking are the details of it, what product, what
> device needs that pin, and why do we think that is the rightful request
> from the OS?

I will need to do some digging to get you these details, I will get
back to you on that later.

This discussion really is orthogonal to this patch, calling WARN_ON
for something outside of the control of the kernel clearly is the wrong
thing to do. So in the mean time can I have your ack for this patch ?

Regards,

Hans
