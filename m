From: Chris Chiu <chiu@endlessm.com>
Subject: Re: [PATCH] pinctrl: intel: save HOSTSW_OWN register over suspend/resume
Date: Thu, 23 Nov 2017 20:24:05 +0800
Message-ID: <CAB4CAwcGU7BAWmvyFtxHdTVHmBAkUmpn1fdKt8DLvU_3ZSekfA@mail.gmail.com>
References: <20171115080446.GY17200@lahna.fi.intel.com> <018180A5-B0D2-418E-9DBC-EF5F310F7295@endlessm.com>
 <20171115101302.GA17200@lahna.fi.intel.com> <CAB4CAwc-SFtw4+74Qe-vX57JRGDjJMt9xM2+ev3OiipzwxBPBw@mail.gmail.com>
 <20171116124431.GS17200@lahna.fi.intel.com> <CAB4CAwfHx8DgCYk0piVnrTa7YP2=6A8Le4ekoENFPyNVF9g1rw@mail.gmail.com>
 <20171117064904.GZ17200@lahna.fi.intel.com> <CAB4CAwdGQjXc6gsswyCgLTfFRN9CgcC=OJ6pz4rX-HCn8AT-TQ@mail.gmail.com>
 <20171121105205.GP22431@lahna.fi.intel.com> <CAB4CAwcjXi=YX+0PEC6wBdfAZ=am+BceB4HCFzTXzdts_FE2vQ@mail.gmail.com>
 <20171121120422.GR22431@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171121120422.GR22431@lahna.fi.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Linux Kernel <linux-kernel@vger.kernel.org>, Linux Upstreaming Team <linux@endlessm.com>
List-Id: linux-gpio@vger.kernel.org

On Tue, Nov 21, 2017 at 8:04 PM, Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
> On Tue, Nov 21, 2017 at 07:54:26PM +0800, Chris Chiu wrote:
>> Yup, I checked the value of the corresponded pin. It shows following before
>> suspend
>> pin 18 (GPIO_18) GPIO 0x40800102 0x00024075
>>
>> Then after resume
>> pin 18 (GPIO_18) GPIO 0x40800102 0x00024075 [ACPI]
>
> OK, so ownership is changed to ACPI.
>
>> What else register do you suggest me to compare? The PADCFG2 is invalid
>
> It's fine APL does not have PADCFG2.
>
> Hmm, I don't understand how this can work in Windows either. The Windows
> people told me that they don't save and restore anything else than
> padcfg registers + ie. If the ownership is changed to ACPI it means you
> don't get interrupts anymore (only GPEs) and that applies to Windows as
> well.

Thanks for your confirmation. I've pushed this back to ASUS. They told me
there's a new official BIOS released, of course they don't know
whether if it helps
or not. I then upgraded it and the problem is gone. So it's truly a
BIOS but as you
said. Thanks for your help.

Chris
