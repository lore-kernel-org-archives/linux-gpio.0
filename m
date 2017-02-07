From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: Diagnosing ACPI trouble related to pinctr_cherryview on 4.8.x
Date: Tue, 7 Feb 2017 16:52:01 +0200
Message-ID: <20170207145201.GL19313@lahna.fi.intel.com>
References: <CACPiFC+zgmZkE3RDEHQfEFEq21zF9xz1_uoO9NQ7k=EU+rPJgg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga06.intel.com ([134.134.136.31]:7395 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754625AbdBGOwQ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 7 Feb 2017 09:52:16 -0500
Content-Disposition: inline
In-Reply-To: <CACPiFC+zgmZkE3RDEHQfEFEq21zF9xz1_uoO9NQ7k=EU+rPJgg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Martin Langhoff <martin.langhoff@gmail.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org

On Tue, Feb 07, 2017 at 09:37:52AM -0500, Martin Langhoff wrote:
> About a year ago, I tried to get this laptop going with Fedora's 4.4
> kernel, and we had this thread -
> http://www.spinics.net/lists/linux-gpio/msg13139.html
> 
> Now I have that laptop back, and it only boots with the custom-built
> 4.4 I prepared back then.
> 
> The exact same behaviour is observed with 4.8.x (4.8.15 from latest
> Fedora at the moment). Won't boot. Disabling ACPI won't do it.
> 
> Has there been any progress on pinctrl_cherryview, is there perhaps a
> branch/tree with new configs I should test?

I remember this and I ordered the same Acer Aspire One 11 Cloudbook here
but I did not see any issues with it. I still have the machine here so I
can debug if any problems are found.

Just to be sure, can you first boot the mainline kernel v4.10-rc7 (or
close) and let me know how it fails (including dmesg if you can extract
one)?
