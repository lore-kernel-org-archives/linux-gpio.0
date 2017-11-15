From: Chris Chiu <chiu@endlessm.com>
Subject: Re: [PATCH] pinctrl: intel: save HOSTSW_OWN register over suspend/resume
Date: Wed, 15 Nov 2017 18:19:56 +0800
Message-ID: <CAB4CAwc-SFtw4+74Qe-vX57JRGDjJMt9xM2+ev3OiipzwxBPBw@mail.gmail.com>
References: <20171114104136.25595-1-chiu@endlessm.com> <20171115080446.GY17200@lahna.fi.intel.com>
 <018180A5-B0D2-418E-9DBC-EF5F310F7295@endlessm.com> <20171115101302.GA17200@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f48.google.com ([74.125.82.48]:45652 "EHLO
        mail-wm0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756448AbdKOKT6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Nov 2017 05:19:58 -0500
Received: by mail-wm0-f48.google.com with SMTP id 9so1869736wme.4
        for <linux-gpio@vger.kernel.org>; Wed, 15 Nov 2017 02:19:57 -0800 (PST)
In-Reply-To: <20171115101302.GA17200@lahna.fi.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: heikki.krogerus@linux.intel.com, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Linux Upstreaming Team <linux@endlessm.com>

Hi Mika,
    I've confirmed with Asus and they said it's the latest BIOS for
shipment and verified OK on Windows. So their BIOS team will not do
anything for this.

Chris

On Wed, Nov 15, 2017 at 6:13 PM, Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
> On Wed, Nov 15, 2017 at 04:08:32PM +0800, Chris Chiu wrote:
>>     Yes, that=E2=80=99s the most weird part.
>
> Sounds pretty much like a BIOS issue. Do you know if there is a newer
> BIOS and have you tried that already?
