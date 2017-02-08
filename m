From: Martin Langhoff <martin.langhoff@gmail.com>
Subject: Re: Diagnosing ACPI trouble related to pinctr_cherryview on 4.8.x
Date: Wed, 8 Feb 2017 14:27:58 -0500
Message-ID: <CACPiFCJUDRX4nm4aR0SuL-YKY5SE4YMap2RNq7QUKKFo6FAYpg@mail.gmail.com>
References: <CACPiFC+zgmZkE3RDEHQfEFEq21zF9xz1_uoO9NQ7k=EU+rPJgg@mail.gmail.com>
 <20170207145201.GL19313@lahna.fi.intel.com> <CACPiFC+9bw0+Sw5yoQ6STdDE08Mg9fCH_iDTT4bYWkYTG=fAjQ@mail.gmail.com>
 <CACPiFC+rvpBj7NGd78uRbrGMpPA=YCGw4XaQ9=YqESeXqOXqLQ@mail.gmail.com>
 <20170207154800.GM19313@lahna.fi.intel.com> <CACPiFCKjAnttp8_kibxNjzhSsAiRsVjR0xutqmBn=1b9zNCEgw@mail.gmail.com>
 <20170207163046.GP19313@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-yb0-f196.google.com ([209.85.213.196]:35020 "EHLO
        mail-yb0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751093AbdBHT2T (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Feb 2017 14:28:19 -0500
Received: by mail-yb0-f196.google.com with SMTP id j82so6517629ybg.2
        for <linux-gpio@vger.kernel.org>; Wed, 08 Feb 2017 11:28:19 -0800 (PST)
In-Reply-To: <20170207163046.GP19313@lahna.fi.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org

Hi Mika,

this is... interesting. I've recompiled Fedora's v4.10-rc7 with
pinctrl-cherryview=m. Now all it needs to boot is 'noacpi'.
Blacklisting pinctrl-cherryview makes no difference.

Diffing the config made no sense, as you're using a minimal config and
I'm using distro config. The diff was awful.

I'll capture dmesg and compare.

Is there anything we can do to make pinctrl-cherryview better behaved
when built in? I mainly want this laptop to work well with the distro
kernel :-)

cheers,


martin

On Tue, Feb 7, 2017 at 11:30 AM, Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
> On Tue, Feb 07, 2017 at 11:11:55AM -0500, Martin Langhoff wrote:
>> On Tue, Feb 7, 2017 at 10:48 AM, Mika Westerberg
>> <mika.westerberg@linux.intel.com> wrote:
>> > So if you have disable pinctrl-cherryview and you have nothing special
>> > in the command line, everything works in v4.10-rc7?
>>
>> I can try that, it'll take a kernel rebuild. Fedora builds
>> pinctrl-cherryview=y and I haven't been able to convince them
>> otherwise :-/
>
> I just booted the machine with the attached config. No problems found.
> I've attached also dmesg of the boot (you can compare it to yours).



-- 
 martin.langhoff@gmail.com
 - ask interesting questions  ~  http://linkedin.com/in/martinlanghoff
 - don't be distracted        ~  http://github.com/martin-langhoff
   by shiny stuff
