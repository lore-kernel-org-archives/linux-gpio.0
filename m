From: Martin Langhoff <martin.langhoff@gmail.com>
Subject: Re: Diagnosing ACPI trouble related to pinctr_cherryview on 4.8.x
Date: Tue, 7 Feb 2017 10:13:50 -0500
Message-ID: <CACPiFC+9bw0+Sw5yoQ6STdDE08Mg9fCH_iDTT4bYWkYTG=fAjQ@mail.gmail.com>
References: <CACPiFC+zgmZkE3RDEHQfEFEq21zF9xz1_uoO9NQ7k=EU+rPJgg@mail.gmail.com>
 <20170207145201.GL19313@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-yw0-f175.google.com ([209.85.161.175]:34223 "EHLO
        mail-yw0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932077AbdBGPOL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Feb 2017 10:14:11 -0500
Received: by mail-yw0-f175.google.com with SMTP id w75so68408928ywg.1
        for <linux-gpio@vger.kernel.org>; Tue, 07 Feb 2017 07:14:11 -0800 (PST)
In-Reply-To: <20170207145201.GL19313@lahna.fi.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org

On Tue, Feb 7, 2017 at 9:52 AM, Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
> I remember this and I ordered the same Acer Aspire One 11 Cloudbook here
> but I did not see any issues with it. I still have the machine here so I
> can debug if any problems are found.

Oh wow that did happen! Thank you! Odd that found no issues at all.

Can you tell me about the relevant kernel module configs? (not built / m / y).

> Just to be sure, can you first boot the mainline kernel v4.10-rc7 (or
> close) and let me know how it fails (including dmesg if you can extract
> one)?

Installing 4.10-rc7 from fedora rawhide repos.

This may well be a problem with how Fedora is configuring the kernels.


m
-- 
 martin.langhoff@gmail.com
 - ask interesting questions  ~  http://linkedin.com/in/martinlanghoff
 - don't be distracted        ~  http://github.com/martin-langhoff
   by shiny stuff
