From: Chris Chiu <chiu@endlessm.com>
Subject: Re: [PATCH] pinctrl: intel: save HOSTSW_OWN register over suspend/resume
Date: Tue, 21 Nov 2017 19:54:26 +0800
Message-ID: <CAB4CAwcjXi=YX+0PEC6wBdfAZ=am+BceB4HCFzTXzdts_FE2vQ@mail.gmail.com>
References: <20171114104136.25595-1-chiu@endlessm.com> <20171115080446.GY17200@lahna.fi.intel.com>
 <018180A5-B0D2-418E-9DBC-EF5F310F7295@endlessm.com> <20171115101302.GA17200@lahna.fi.intel.com>
 <CAB4CAwc-SFtw4+74Qe-vX57JRGDjJMt9xM2+ev3OiipzwxBPBw@mail.gmail.com>
 <20171116124431.GS17200@lahna.fi.intel.com> <CAB4CAwfHx8DgCYk0piVnrTa7YP2=6A8Le4ekoENFPyNVF9g1rw@mail.gmail.com>
 <20171117064904.GZ17200@lahna.fi.intel.com> <CAB4CAwdGQjXc6gsswyCgLTfFRN9CgcC=OJ6pz4rX-HCn8AT-TQ@mail.gmail.com>
 <20171121105205.GP22431@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f47.google.com ([74.125.82.47]:43462 "EHLO
        mail-wm0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751115AbdKULy2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 21 Nov 2017 06:54:28 -0500
Received: by mail-wm0-f47.google.com with SMTP id x63so2775770wmf.2
        for <linux-gpio@vger.kernel.org>; Tue, 21 Nov 2017 03:54:27 -0800 (PST)
In-Reply-To: <20171121105205.GP22431@lahna.fi.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Linux Kernel <linux-kernel@vger.kernel.org>, Linux Upstreaming Team <linux@endlessm.com>

On Tue, Nov 21, 2017 at 6:52 PM, Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
> On Fri, Nov 17, 2017 at 04:11:31PM +0800, Chris Chiu wrote:
>> On Fri, Nov 17, 2017 at 2:49 PM, Mika Westerberg
>> <mika.westerberg@linux.intel.com> wrote:
>> > On Thu, Nov 16, 2017 at 09:27:51PM +0800, Chris Chiu wrote:
>> >> On Thu, Nov 16, 2017 at 8:44 PM, Mika Westerberg
>> >> <mika.westerberg@linux.intel.com> wrote:
>> >> > On Wed, Nov 15, 2017 at 06:19:56PM +0800, Chris Chiu wrote:
>> >> >> Hi Mika,
>> >> >>     I've confirmed with Asus and they said it's the latest BIOS for
>> >> >> shipment and verified OK on Windows. So their BIOS team will not do
>> >> >> anything for this.
>> >> >
>> >> > I'll ask around if our Windows people know anything about this. My gut
>> >> > feeling is that the Windows driver does not touch HOSTSW_OWN either.
>> >>
>> >> Thanks. Please let me know if you need any information. I still keep
>> >> the machine.
>> >
>> > Got confirmation from Windows people. So Windows pretty much saves and
>> > restores the same registers than we do (padcfg + ie).
>> >
>> > Have you tried whether s2idle works instead of S3 suspend? You can try
>> > it like
>> >
>> >   # echo freeze > /sys/power/state
>> >
>> > If that works, I'm guessing that this system uses s2idle and that's also
>> > what Windows uses and could explain why it works in Windows.
>>
>> Unfortunately, I cant wake it up from neither power button nor any key
>> event after  "# echo freeze > /sys/power/state"....
>
> Yeah, it is S3 platform based on the acpidump you shared. Although
> freeze should still work.
>
> Have you dumped the pin config registers through debugfs before and
> after suspend? Are there any other differences except the HOSTSW_OWN
> thing?

Yup, I checked the value of the corresponded pin. It shows following before
suspend
pin 18 (GPIO_18) GPIO 0x40800102 0x00024075

Then after resume
pin 18 (GPIO_18) GPIO 0x40800102 0x00024075 [ACPI]

What else register do you suggest me to compare? The PADCFG2 is invalid
