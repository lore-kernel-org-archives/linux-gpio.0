From: Chris Chiu <chiu@endlessm.com>
Subject: Re: [PATCH] pinctrl: intel: save HOSTSW_OWN register over suspend/resume
Date: Thu, 16 Nov 2017 21:27:51 +0800
Message-ID: <CAB4CAwfHx8DgCYk0piVnrTa7YP2=6A8Le4ekoENFPyNVF9g1rw@mail.gmail.com>
References: <20171114104136.25595-1-chiu@endlessm.com> <20171115080446.GY17200@lahna.fi.intel.com>
 <018180A5-B0D2-418E-9DBC-EF5F310F7295@endlessm.com> <20171115101302.GA17200@lahna.fi.intel.com>
 <CAB4CAwc-SFtw4+74Qe-vX57JRGDjJMt9xM2+ev3OiipzwxBPBw@mail.gmail.com> <20171116124431.GS17200@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f42.google.com ([74.125.82.42]:39852 "EHLO
        mail-wm0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1757928AbdKPN1x (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Nov 2017 08:27:53 -0500
Received: by mail-wm0-f42.google.com with SMTP id l8so9711033wmg.4
        for <linux-gpio@vger.kernel.org>; Thu, 16 Nov 2017 05:27:53 -0800 (PST)
In-Reply-To: <20171116124431.GS17200@lahna.fi.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: heikki.krogerus@linux.intel.com, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Linux Upstreaming Team <linux@endlessm.com>

On Thu, Nov 16, 2017 at 8:44 PM, Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
> On Wed, Nov 15, 2017 at 06:19:56PM +0800, Chris Chiu wrote:
>> Hi Mika,
>>     I've confirmed with Asus and they said it's the latest BIOS for
>> shipment and verified OK on Windows. So their BIOS team will not do
>> anything for this.
>
> I'll ask around if our Windows people know anything about this. My gut
> feeling is that the Windows driver does not touch HOSTSW_OWN either.

Thanks. Please let me know if you need any information. I still keep
the machine.
