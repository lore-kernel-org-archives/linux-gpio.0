From: Martin Langhoff <martin.langhoff@gmail.com>
Subject: Re: Diagnosing ACPI trouble related to pinctr_cherryview on 4.8.x
Date: Tue, 7 Feb 2017 11:11:55 -0500
Message-ID: <CACPiFCKjAnttp8_kibxNjzhSsAiRsVjR0xutqmBn=1b9zNCEgw@mail.gmail.com>
References: <CACPiFC+zgmZkE3RDEHQfEFEq21zF9xz1_uoO9NQ7k=EU+rPJgg@mail.gmail.com>
 <20170207145201.GL19313@lahna.fi.intel.com> <CACPiFC+9bw0+Sw5yoQ6STdDE08Mg9fCH_iDTT4bYWkYTG=fAjQ@mail.gmail.com>
 <CACPiFC+rvpBj7NGd78uRbrGMpPA=YCGw4XaQ9=YqESeXqOXqLQ@mail.gmail.com> <20170207154800.GM19313@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-yb0-f178.google.com ([209.85.213.178]:36063 "EHLO
        mail-yb0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755101AbdBGQMQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Feb 2017 11:12:16 -0500
Received: by mail-yb0-f178.google.com with SMTP id 123so36580857ybe.3
        for <linux-gpio@vger.kernel.org>; Tue, 07 Feb 2017 08:12:16 -0800 (PST)
In-Reply-To: <20170207154800.GM19313@lahna.fi.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org

On Tue, Feb 7, 2017 at 10:48 AM, Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
> So if you have disable pinctrl-cherryview and you have nothing special
> in the command line, everything works in v4.10-rc7?

I can try that, it'll take a kernel rebuild. Fedora builds
pinctrl-cherryview=y and I haven't been able to convince them
otherwise :-/

cheers,


m
-- 
 martin.langhoff@gmail.com
 - ask interesting questions  ~  http://linkedin.com/in/martinlanghoff
 - don't be distracted        ~  http://github.com/martin-langhoff
   by shiny stuff
