From: Kai-Heng Feng <kai.heng.feng@canonical.com>
Subject: Re: [PATCH] pinctrl: intel: Clear interrupt status in unmask callback
Date: Tue, 23 Apr 2019 17:47:35 +0800
Message-ID: <3BE5F007-CD9C-486A-90EE-326AAB807D5B@canonical.com>
References: <20190422044539.16085-1-kai.heng.feng@canonical.com>
 <Ld5HCy5--3-1@tutanota.com>
 <EA207DE8-E89A-427B-B910-A36170A76031@canonical.com>
 <Ld8QGex--3-1@tutanota.com> <20190423090816.GN2654@lahna.fi.intel.com>
 <Ld8ZLG1--3-1@tutanota.com>
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.8\))
Content-Type: text/plain;
        charset=utf-8;
        delsp=yes;
        format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <Ld8ZLG1--3-1@tutanota.com>
Sender: linux-kernel-owner@vger.kernel.org
To: hotwater438@tutanota.com
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, Hdegoede <hdegoede@redhat.com>, Linux Gpio <linux-gpio@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

at 17:40, <hotwater438@tutanota.com> <hotwater438@tutanota.com> wrote:

> Hi. Thank's for a hint!
> So catting this file gives me next content:
> s2idle [deep]

Which kernel version do you use?

The default switches to s2idle based on FADT flag and _DSM on relative new  
kernels.

Most systems preload with Windows 8.1 should default to use s2idle.

>
> So I suppose I have s2idle with deep-mode available?
>
> I've tried to select deep by creating mem_sleep_default file, but I can't  
> (Permission error).
>
> Could you explain how do I switch suspend mode in Linux, if you know?

# echo s2idle > /sys/power/mem_sleep

> And to be honest, I don't think that's a correct fix of touchpad problem.

If the system defaults to use S2I, then it’s better to stick with it.

Lots of ODM/OEM don’t really test S3.

>
> Can we somehow cut off the power by hands or send a signal to a system to  
> shut off a touchpad? Or there are no approaches like that?

I don’t think it’s possible.

Kai-Heng

>
> Regards,
> Vladislav.
>
>
> Apr 23, 2019, 12:08 PM by mika.westerberg@linux.intel.com:
> On Tue, Apr 23, 2019 at 11:00:48AM +0200, hotwater438@tutanota.com wrote:
> Hi.
>
> Honestly, I can't find any information about my acpi suspend type.
> There are no options in my BIOS to change it, and I can't determine
> which exactly I have. But I suppose I have a S3 because I have suspend
> issue.
>
> Can I somehow determine it in Linux? I did a research but found nothing
> on the internet.
>
> You can read the default mode from /sys/power/mem_sleep. "s2idle" means,
> well suspend-to-idle and "deep" means S3.
