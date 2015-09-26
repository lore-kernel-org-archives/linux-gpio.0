From: Olliver Schinagl <oliver+list@schinagl.nl>
Subject: Re: gpios search behaviour for gpio from _DSD
Date: Sat, 26 Sep 2015 21:30:59 +0200
Message-ID: <5606F273.6030100@schinagl.nl>
References: <5603A552.9020005@schinagl.nl> <20150924084324.GK1536@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from 7of9.schinagl.nl ([88.159.158.68]:39643 "EHLO 7of9.schinagl.nl"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753371AbbIZTbC (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Sat, 26 Sep 2015 15:31:02 -0400
In-Reply-To: <20150924084324.GK1536@lahna.fi.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Grant Likely <grant.likely@linaro.org>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

Hey Mika,

Thanks for your reply.

On 24-09-15 10:43, Mika Westerberg wrote:
> On Thu, Sep 24, 2015 at 09:25:06AM +0200, Olliver Schinagl wrote:
>> Hey list, Mika,
>>
>> With commit 0d9a693cc86 the following snippet of code was added:
>>
>> +       /* Try first from _DSD */
>> +       for (i = 0; i < ARRAY_SIZE(suffixes); i++) {
>> +               if (con_id && strcmp(con_id, "gpios")) {
>> +                       snprintf(propname, sizeof(propname), "%s-%s",
>> +                                con_id, suffixes[i]);
>>
>> and I was wondering why the gpios suffix is singled out. Are we not allowed
>> to check for all the strings in the suffixes array? Is gpios special or is
>> gpio simply not allowed. If that strcmp check would be removed, would bad
>> things happen?
> We default to "gpios". So if you pass "reset" we actually look for
> proprerty "reset-gpios". This is the recommend syntax AFAIK.
What i ment is, without strcmp, the loop would test for:

reset-gpio and then reset-gpios (and then gpio and gpios)

So why the strcmp at all, Why only reset-gpios? Will the _DSD or acpi 
break and if we probe for reset-gpio (first, instead of reset-gpios)? 
I'm asking because i'm trying some work on gpio lib and this section is 
getting reworked too. While doing that I want to remove the strcmp. 
Hence, the question if things break on the ACPI side (I'm mostly failiar 
with OF.
>
>> Also, just to educate myself, isn't relying on left to right parsing
>> complier specifc? E.g. if con_id is null, we end up passing NULL to strcmp
>> and atleast for libc can cause segfaults iirc.
> '&&' is so called short circuit operator so if we already know that
> con_id is NULL we never evaluate the remaining conditions.
I just looked it up and of course you are right and I learned something new:

(4). Unlike the bitwise binary & operator, the && operator guarantees 
left-to-right evaluation; there is a sequence point after the evaluation 
of the first operand. If the first operand compares equal to 0, the 
second operand is not evaluated.

So && is guaranteed left to right.

Olliver
