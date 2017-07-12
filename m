From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH] pinctrl: baytrail: Do not call WARN_ON for a firmware
 bug
Date: Wed, 12 Jul 2017 18:25:35 +0300
Message-ID: <1499873135.22624.366.camel@linux.intel.com>
References: <20170712123101.26996-1-hdegoede@redhat.com>
         <1499863132.22624.361.camel@linux.intel.com>
         <f38c9f73-c2ba-a119-0d4b-ba812ad40682@redhat.com>
         <1499865158.22624.363.camel@linux.intel.com>
         <87931ddb-5a5a-dc20-7e79-e1a507532e2b@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga14.intel.com ([192.55.52.115]:57019 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752617AbdGLP2j (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 12 Jul 2017 11:28:39 -0400
In-Reply-To: <87931ddb-5a5a-dc20-7e79-e1a507532e2b@redhat.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org

On Wed, 2017-07-12 at 16:18 +0200, Hans de Goede wrote:
> On 12-07-17 15:12, Andy Shevchenko wrote:
> > On Wed, 2017-07-12 at 14:44 +0200, Hans de Goede wrote:
> > > On 12-07-17 14:38, Andy Shevchenko wrote:
> > > > On Wed, 2017-07-12 at 14:31 +0200, Hans de Goede wrote:
> > > > > 


> > > that the ACPI tables / or a driver want to use a pin as gpio and
> > > it
> > > has
> > > been setup differently (as a special function) by the firmware.
> > 
> > Yes, and what I'm asking are the details of it, what product, what
> > device needs that pin, and why do we think that is the rightful
> > request
> > from the OS?
> 
> I will need to do some digging to get you these details, I will get
> back to you on that later.

Thanks!

> This discussion really is orthogonal to this patch,

Correct. I would like to know the details to have this knowledge in case
of something similar might happen with other device(s).

>  calling WARN_ON
> for something outside of the control of the kernel clearly is the
> wrong
> thing to do. So in the mean time can I have your ack for this patch ?

As I said, patch is okay to me.

Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
