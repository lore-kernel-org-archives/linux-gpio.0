From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: Diagnosing ACPI trouble related to pinctr_cherryview on 4.8.x
Date: Tue, 7 Feb 2017 17:48:00 +0200
Message-ID: <20170207154800.GM19313@lahna.fi.intel.com>
References: <CACPiFC+zgmZkE3RDEHQfEFEq21zF9xz1_uoO9NQ7k=EU+rPJgg@mail.gmail.com>
 <20170207145201.GL19313@lahna.fi.intel.com>
 <CACPiFC+9bw0+Sw5yoQ6STdDE08Mg9fCH_iDTT4bYWkYTG=fAjQ@mail.gmail.com>
 <CACPiFC+rvpBj7NGd78uRbrGMpPA=YCGw4XaQ9=YqESeXqOXqLQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga07.intel.com ([134.134.136.100]:5985 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754199AbdBGPsE (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 7 Feb 2017 10:48:04 -0500
Content-Disposition: inline
In-Reply-To: <CACPiFC+rvpBj7NGd78uRbrGMpPA=YCGw4XaQ9=YqESeXqOXqLQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Martin Langhoff <martin.langhoff@gmail.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org

On Tue, Feb 07, 2017 at 10:29:25AM -0500, Martin Langhoff wrote:
> On Tue, Feb 7, 2017 at 10:13 AM, Martin Langhoff
> <martin.langhoff@gmail.com> wrote:
> > Installing 4.10-rc7 from fedora rawhide repos.
> 
> 4.10-rc7 from rawhide gets past these issues with 'noapic', removing
> 'noapic' from the cmdline hits a panic in native_smp_prepare_cpus.
> 
> With 'noapic' I get to an emergency shell because systemd can't mount
> the root fs. Perhaps the mmcblk enumeration has changed between 4.4
> and 4.10?
> 
> What debug info should I get you?

So if you have disable pinctrl-cherryview and you have nothing special
in the command line, everything works in v4.10-rc7?
