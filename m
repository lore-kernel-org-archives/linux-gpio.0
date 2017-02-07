From: Martin Langhoff <martin.langhoff@gmail.com>
Subject: Re: Diagnosing ACPI trouble related to pinctr_cherryview on 4.8.x
Date: Tue, 7 Feb 2017 09:37:52 -0500
Message-ID: <CACPiFC+zgmZkE3RDEHQfEFEq21zF9xz1_uoO9NQ7k=EU+rPJgg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-yw0-f196.google.com ([209.85.161.196]:33730 "EHLO
        mail-yw0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753307AbdBGOiN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Feb 2017 09:38:13 -0500
Received: by mail-yw0-f196.google.com with SMTP id u68so9562359ywg.0
        for <linux-gpio@vger.kernel.org>; Tue, 07 Feb 2017 06:38:13 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org

About a year ago, I tried to get this laptop going with Fedora's 4.4
kernel, and we had this thread -
http://www.spinics.net/lists/linux-gpio/msg13139.html

Now I have that laptop back, and it only boots with the custom-built
4.4 I prepared back then.

The exact same behaviour is observed with 4.8.x (4.8.15 from latest
Fedora at the moment). Won't boot. Disabling ACPI won't do it.

Has there been any progress on pinctrl_cherryview, is there perhaps a
branch/tree with new configs I should test?

cheers,


martin



On Tue, Mar 22, 2016 at 11:09 AM, Martin Langhoff
<martin.langhoff@gmail.com> wrote:
>
> Hi pinctrl_cherryview maintainers.
>
> I unsuspectingly bought a laptop for a family member which hits trouble with pinctrl_cherryview; it only boots with the module blacklisted or acpi=off .
>
> System is (trying) to run Fedora 23 -- made more difficult by recent Fedora kernels having the module built-in.
>
> Are there any useful debugging steps I can follow to narrow this down? Already tried the acpi diagnostics steps (acpi=ht, etc) to no avail.
>
> thank you!
>
>
>
> m
> --
>  martin.langhoff@gmail.com
>  -  ask interesting questions
>  - don't get distracted with shiny stuff  - working code first
>  ~ http://docs.moodle.org/en/User:Martin_Langhoff




-- 
 martin.langhoff@gmail.com
 - ask interesting questions  ~  http://linkedin.com/in/martinlanghoff
 - don't be distracted        ~  http://github.com/martin-langhoff
   by shiny stuff
