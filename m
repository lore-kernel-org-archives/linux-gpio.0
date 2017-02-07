From: Martin Langhoff <martin.langhoff@gmail.com>
Subject: Re: Diagnosing ACPI trouble related to pinctr_cherryview on 4.8.x
Date: Tue, 7 Feb 2017 10:29:25 -0500
Message-ID: <CACPiFC+rvpBj7NGd78uRbrGMpPA=YCGw4XaQ9=YqESeXqOXqLQ@mail.gmail.com>
References: <CACPiFC+zgmZkE3RDEHQfEFEq21zF9xz1_uoO9NQ7k=EU+rPJgg@mail.gmail.com>
 <20170207145201.GL19313@lahna.fi.intel.com> <CACPiFC+9bw0+Sw5yoQ6STdDE08Mg9fCH_iDTT4bYWkYTG=fAjQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-yw0-f196.google.com ([209.85.161.196]:34896 "EHLO
        mail-yw0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754525AbdBGP3q (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Feb 2017 10:29:46 -0500
Received: by mail-yw0-f196.google.com with SMTP id l16so9682633ywb.2
        for <linux-gpio@vger.kernel.org>; Tue, 07 Feb 2017 07:29:45 -0800 (PST)
In-Reply-To: <CACPiFC+9bw0+Sw5yoQ6STdDE08Mg9fCH_iDTT4bYWkYTG=fAjQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org

On Tue, Feb 7, 2017 at 10:13 AM, Martin Langhoff
<martin.langhoff@gmail.com> wrote:
> Installing 4.10-rc7 from fedora rawhide repos.

4.10-rc7 from rawhide gets past these issues with 'noapic', removing
'noapic' from the cmdline hits a panic in native_smp_prepare_cpus.

With 'noapic' I get to an emergency shell because systemd can't mount
the root fs. Perhaps the mmcblk enumeration has changed between 4.4
and 4.10?

What debug info should I get you?

cheers,


m
-- 
 martin.langhoff@gmail.com
 - ask interesting questions  ~  http://linkedin.com/in/martinlanghoff
 - don't be distracted        ~  http://github.com/martin-langhoff
   by shiny stuff
