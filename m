From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: Diagnosing ACPI trouble related to pinctr_cherryview on 4.8.x
Date: Thu, 9 Feb 2017 11:10:26 +0200
Message-ID: <20170209091026.GV19313@lahna.fi.intel.com>
References: <CACPiFC+zgmZkE3RDEHQfEFEq21zF9xz1_uoO9NQ7k=EU+rPJgg@mail.gmail.com>
 <20170207145201.GL19313@lahna.fi.intel.com>
 <CACPiFC+9bw0+Sw5yoQ6STdDE08Mg9fCH_iDTT4bYWkYTG=fAjQ@mail.gmail.com>
 <CACPiFC+rvpBj7NGd78uRbrGMpPA=YCGw4XaQ9=YqESeXqOXqLQ@mail.gmail.com>
 <20170207154800.GM19313@lahna.fi.intel.com>
 <CACPiFCKjAnttp8_kibxNjzhSsAiRsVjR0xutqmBn=1b9zNCEgw@mail.gmail.com>
 <20170207163046.GP19313@lahna.fi.intel.com>
 <CACPiFCJUDRX4nm4aR0SuL-YKY5SE4YMap2RNq7QUKKFo6FAYpg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:36847 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751945AbdBIJSE (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 9 Feb 2017 04:18:04 -0500
Content-Disposition: inline
In-Reply-To: <CACPiFCJUDRX4nm4aR0SuL-YKY5SE4YMap2RNq7QUKKFo6FAYpg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Martin Langhoff <martin.langhoff@gmail.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org

On Wed, Feb 08, 2017 at 02:27:58PM -0500, Martin Langhoff wrote:
> Hi Mika,
> 
> this is... interesting. I've recompiled Fedora's v4.10-rc7 with
> pinctrl-cherryview=m. Now all it needs to boot is 'noacpi'.
> Blacklisting pinctrl-cherryview makes no difference.
> 
> Diffing the config made no sense, as you're using a minimal config and
> I'm using distro config. The diff was awful.
> 
> I'll capture dmesg and compare.
> 
> Is there anything we can do to make pinctrl-cherryview better behaved
> when built in? I mainly want this laptop to work well with the distro
> kernel :-)

Hey, please don't blame pinctrl-cherryview until you actually know that
it causes the problem.

Also adding random parameters like "noacpi" to the command line is not
going to help at all in debugging this. So please do not alter the
command line. It only makes things worse.

Now, please send me your distro config (privately) and I'll try that
here if I can reproduce the problem.
