From: Daniel Drake <drake@endlessm.com>
Subject: Re: intel-gpio interrupts stop firing with Focaltech I2C-HID touchpad
Date: Thu, 16 Nov 2017 12:01:24 +0000
Message-ID: <CAD8Lp46fz-80hsOY1b4BFSHrr15Pk8nhYbaFh7MA0hquVSSc4g@mail.gmail.com>
References: <CAD8Lp47LZs6qbd00CDeX4s-eQkqf1dGO9VaFXuCaReQ2yE73Og@mail.gmail.com>
 <20171116115244.GQ17200@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f52.google.com ([209.85.218.52]:52354 "EHLO
        mail-oi0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1759439AbdKPMB0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Nov 2017 07:01:26 -0500
Received: by mail-oi0-f52.google.com with SMTP id r128so18225057oig.9
        for <linux-gpio@vger.kernel.org>; Thu, 16 Nov 2017 04:01:26 -0800 (PST)
In-Reply-To: <20171116115244.GQ17200@lahna.fi.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: heikki.krogerus@linux.intel.com, Chris Chiu <chiu@endlessm.com>, linux-gpio@vger.kernel.org, Linux Kernel <linux-kernel@vger.kernel.org>, Endless Linux Upstreaming Team <linux@endlessm.com>

On Thu, Nov 16, 2017 at 11:52 AM, Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
> Please first check the signal with some analyzator if it works as
> expected and let's then figure out what needs to be fixed and where ;-)

It works fine under Windows, so I think it's already clear that there
is a Linux bug to be solved here.

Thanks
Daniel
