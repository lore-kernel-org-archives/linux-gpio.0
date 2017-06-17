From: Mauro Carvalho Chehab <mchehab@s-opensource.com>
Subject: Re: [PATCH 01/29] pinctrl.txt: standardize document format
Date: Sat, 17 Jun 2017 12:03:01 -0300
Message-ID: <20170617120301.057229bc@vento.lan>
References: <cover.1495157082.git.mchehab@s-opensource.com>
        <d16c41b5f7022add66672d43b5d595af74a1db34.1495157082.git.mchehab@s-opensource.com>
        <CACRpkdaDZQQ7fprGkSvXiUHfqdM_zGkPe4_T3R-p55asCDeQCw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com ([52.27.115.49]:38375
        "EHLO osg.samsung.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1752066AbdFQPDK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 17 Jun 2017 11:03:10 -0400
In-Reply-To: <CACRpkdaDZQQ7fprGkSvXiUHfqdM_zGkPe4_T3R-p55asCDeQCw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Cyrille Pitchen <cyrille.pitchen@atmel.com>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Em Tue, 23 May 2017 11:12:43 +0200
Linus Walleij <linus.walleij@linaro.org> escreveu:

> On Fri, May 19, 2017 at 3:25 AM, Mauro Carvalho Chehab
> <mchehab@s-opensource.com> wrote:
> 
> > Each text file under Documentation follows a different
> > format. Some doesn't even have titles!
> >
> > Change its representation to follow the adopted standard,
> > using ReST markups for it to be parseable by Sphinx.
> >
> > This document is almost following the standard stile.
> >
> > There are only two things to adjust on it:
> >
> > - promote the level of the document title;
> > - mark literal blocks as such.
> >
> > Signed-off-by: Mauro Carvalho Chehab <mchehab@s-opensource.com>  
> 
> I applied the patch fixing some of the indentation mistakes pointed
> out by Geert.

Thanks!

(sorry for not answering earlier... got sidetracked by two trips)

> Should the file be renamed pinctrl.rst now?

If you just rename it, Sphinx will complain because it doesn't
belong to any index.rst file. As this is part of drivers/, I guess
the right thing is to add it to driver-api book.

The enclosed patch should be doing it (it is based on linux-next).

Thanks,
Mauro

[PATCH] pinctrl.txt: move it to the driver-api book

As pinctrl describes a feature from drivers/base, place it at
the right book.

Signed-off-by: Mauro Carvalho Chehab <mchehab@s-opensource.com>

diff --git a/Documentation/driver-api/index.rst b/Documentation/driver-api/index.rst
index 3cf1acebc4ee..7c94ab50afed 100644
--- a/Documentation/driver-api/index.rst
+++ b/Documentation/driver-api/index.rst
@@ -43,6 +43,7 @@ available subsections can be seen below.
    80211/index
    uio-howto
    firmware/index
+   pinctl
    misc_devices
 
 .. only::  subproject and html
diff --git a/Documentation/pinctrl.txt b/Documentation/driver-api/pinctl.rst
similarity index 100%
rename from Documentation/pinctrl.txt
rename to Documentation/driver-api/pinctl.rst



