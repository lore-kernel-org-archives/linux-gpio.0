From: Chris Chiu <chiu@endlessm.com>
Subject: Re: intel-gpio interrupts stop firing with Focaltech I2C-HID touchpad
Date: Fri, 17 Nov 2017 16:50:45 +0800
Message-ID: <CAB4CAwdYsQPmfm5HrrP7DMwwH7mQVfwgkG7xEXvMPzP+wB7n-A@mail.gmail.com>
References: <CAD8Lp47LZs6qbd00CDeX4s-eQkqf1dGO9VaFXuCaReQ2yE73Og@mail.gmail.com>
 <20171116115244.GQ17200@lahna.fi.intel.com> <CAD8Lp46fz-80hsOY1b4BFSHrr15Pk8nhYbaFh7MA0hquVSSc4g@mail.gmail.com>
 <20171116130743.GT17200@lahna.fi.intel.com> <CAB4CAwcqxBJNnaS9q7S7dy_1GoR5m1VHY89y+8g-G7rXBBJ1hg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f41.google.com ([74.125.82.41]:38812 "EHLO
        mail-wm0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S965665AbdKQIur (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Nov 2017 03:50:47 -0500
Received: by mail-wm0-f41.google.com with SMTP id z3so4879415wme.3
        for <linux-gpio@vger.kernel.org>; Fri, 17 Nov 2017 00:50:46 -0800 (PST)
In-Reply-To: <CAB4CAwcqxBJNnaS9q7S7dy_1GoR5m1VHY89y+8g-G7rXBBJ1hg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Daniel Drake <drake@endlessm.com>, heikki.krogerus@linux.intel.com, linux-gpio@vger.kernel.org, Linux Kernel <linux-kernel@vger.kernel.org>, Endless Linux Upstreaming Team <linux@endlessm.com>

The dmesg log is here
https://gist.github.com/mschiu77/5dfe91ef319de16fb343c5d907b2cbc5
And the acpidump is here
https://gist.github.com/mschiu77/d9b72d89a6a21efb616f153f164c0d18

On Fri, Nov 17, 2017 at 4:27 PM, Chris Chiu <chiu@endlessm.com> wrote:
> On Thu, Nov 16, 2017 at 9:07 PM, Mika Westerberg
> <mika.westerberg@linux.intel.com> wrote:
>> On Thu, Nov 16, 2017 at 12:01:24PM +0000, Daniel Drake wrote:
>>> On Thu, Nov 16, 2017 at 11:52 AM, Mika Westerberg
>>> <mika.westerberg@linux.intel.com> wrote:
>>> > Please first check the signal with some analyzator if it works as
>>> > expected and let's then figure out what needs to be fixed and where ;-)
>>>
>>> It works fine under Windows, so I think it's already clear that there
>>> is a Linux bug to be solved here.
>>
>> Can you remove all the "debugging" patches and hacks and then add
>> "i2c_hid.debug=1" to the kernel command line.
>>
>> Then reproduce the issue and send me full dmesg and acpidump of the
>> system. Thanks.
>
> Hi Mika,
>     Here's the dmesg log which stops at 214th seconds and no more
> further output and archive of "acpidump -b" output files FYI.
>
> Chris
