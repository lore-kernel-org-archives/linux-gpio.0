From: Chris Chiu <chiu@endlessm.com>
Subject: Re: intel-gpio interrupts stop firing with Focaltech I2C-HID touchpad
Date: Fri, 17 Nov 2017 18:01:27 +0800
Message-ID: <CAB4CAwfGsjtfZxHVvdyEAooqqK0whJS0MFZSsbm8+E0fi=hJyg@mail.gmail.com>
References: <CAD8Lp47LZs6qbd00CDeX4s-eQkqf1dGO9VaFXuCaReQ2yE73Og@mail.gmail.com>
 <20171116115244.GQ17200@lahna.fi.intel.com> <CAD8Lp46fz-80hsOY1b4BFSHrr15Pk8nhYbaFh7MA0hquVSSc4g@mail.gmail.com>
 <20171116130743.GT17200@lahna.fi.intel.com> <CAB4CAwcqxBJNnaS9q7S7dy_1GoR5m1VHY89y+8g-G7rXBBJ1hg@mail.gmail.com>
 <20171117091134.GB17200@lahna.fi.intel.com> <CAB4CAwdsAXqb-2KQr3s1Z6UBJoBXwrks41qY5S8va=zz3UQ1hA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:33912 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752486AbdKQKB3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Nov 2017 05:01:29 -0500
Received: by mail-wm0-f65.google.com with SMTP id y82so2771804wmg.1
        for <linux-gpio@vger.kernel.org>; Fri, 17 Nov 2017 02:01:28 -0800 (PST)
In-Reply-To: <CAB4CAwdsAXqb-2KQr3s1Z6UBJoBXwrks41qY5S8va=zz3UQ1hA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Daniel Drake <drake@endlessm.com>, heikki.krogerus@linux.intel.com, linux-gpio@vger.kernel.org, Linux Kernel <linux-kernel@vger.kernel.org>, Endless Linux Upstreaming Team <linux@endlessm.com>, Jarkko Nikula <jarkko.nikula@linux.intel.com>

On Fri, Nov 17, 2017 at 5:13 PM, Chris Chiu <chiu@endlessm.com> wrote:
> On Fri, Nov 17, 2017 at 5:11 PM, Mika Westerberg
> <mika.westerberg@linux.intel.com> wrote:
>> On Fri, Nov 17, 2017 at 04:27:39PM +0800, Chris Chiu wrote:
>>> On Thu, Nov 16, 2017 at 9:07 PM, Mika Westerberg
>>> <mika.westerberg@linux.intel.com> wrote:
>>> > On Thu, Nov 16, 2017 at 12:01:24PM +0000, Daniel Drake wrote:
>>> >> On Thu, Nov 16, 2017 at 11:52 AM, Mika Westerberg
>>> >> <mika.westerberg@linux.intel.com> wrote:
>>> >> > Please first check the signal with some analyzator if it works as
>>> >> > expected and let's then figure out what needs to be fixed and where ;-)
>>> >>
>>> >> It works fine under Windows, so I think it's already clear that there
>>> >> is a Linux bug to be solved here.
>>> >
>>> > Can you remove all the "debugging" patches and hacks and then add
>>> > "i2c_hid.debug=1" to the kernel command line.
>>> >
>>> > Then reproduce the issue and send me full dmesg and acpidump of the
>>> > system. Thanks.
>>>
>>> Hi Mika,
>>>     Here's the dmesg log which stops at 214th seconds and no more
>>> further output and archive of "acpidump -b" output files FYI.
>>
>> Thanks!
>>
>> The dmesg is not complete, I wonder if you can make the buffer a bit
>> bigger by increasing CONFIG_LOG_BUF_SHIFT (or get it from
>> /var/log/messages or so). I would like to see i2c-hid init and related
>> messages.
>>
>> From the acpidump related to the i2c-hid device, the system provides
>> custom I2C timings via FMCN ACPI method but it misses one value
>> (sda_hold). Not sure if if has anything to do with the problem, though.
>> Adding Jarkko in case he has any ideas.
>>
>> BTW, is this the same machine which has problems in S3 suspend/resume?
>
> Hi Mika,
>    Yes. This machine has the problem in S3 suspend/resume, too.
>
> Chris

Hi Mika,
    Here's the full dmesg log you need. The touchpad stop reporting at
the last of the log.
https://gist.github.com/mschiu77/a0b8d24a586a228c55eca30c87c71d41

Chris
