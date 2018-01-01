From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH] pinctrl: baytrail: Enable glitch filter on some systems
Date: Mon, 1 Jan 2018 12:58:08 +0100
Message-ID: <6e505a7a-59ed-f14e-259e-776951f6aa64@redhat.com>
References: <20171228224128.29065-1-hdegoede@redhat.com>
 <20171229105454.GD27654@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f42.google.com ([74.125.82.42]:46774 "EHLO
        mail-wm0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751242AbeAAL6L (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 1 Jan 2018 06:58:11 -0500
Received: by mail-wm0-f42.google.com with SMTP id r78so57519398wme.5
        for <linux-gpio@vger.kernel.org>; Mon, 01 Jan 2018 03:58:10 -0800 (PST)
In-Reply-To: <20171229105454.GD27654@lahna.fi.intel.com>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-gpio@vger.kernel.org

Hi,

On 29-12-17 11:54, Mika Westerberg wrote:
> On Thu, Dec 28, 2017 at 11:41:28PM +0100, Hans de Goede wrote:
>> On some systems, some PCB traces attached to edge triggered GpioInts
>> are routed in such a way that they pick up enough interference to
>> constantly (many times per second) trigger.
>>
>> Enabling glitch-filtering fixes this. This commit introduces a DMI
>> list with systems which need this, but maybe we should enable this on
>> all Bay Trail GPIOs used as edge-triggered interrupts?
> 
> I think it makes sense to always enable it for GPIOs used as interrupts
> (regardless whether it is edge or level).

That sounds like a good idea to me. I will post a v2 implementing this.

Regards,

Hans
