From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/3] pinctrl: cherryview: Serialize register access in
 suspend and resume hooks
Date: Fri, 4 Nov 2016 16:12:14 +0100
Message-ID: <CACRpkdYTjFBj4EAvFWtaAu7aaxbKkXy6HffXOzAnBCPKehWRtQ@mail.gmail.com>
References: <20161031145734.193016-1-mika.westerberg@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qt0-f173.google.com ([209.85.216.173]:33364 "EHLO
        mail-qt0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932271AbcKDPMP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 4 Nov 2016 11:12:15 -0400
Received: by mail-qt0-f173.google.com with SMTP id p16so49818130qta.0
        for <linux-gpio@vger.kernel.org>; Fri, 04 Nov 2016 08:12:15 -0700 (PDT)
In-Reply-To: <20161031145734.193016-1-mika.westerberg@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Christian Steiner <christian.steiner@outlook.de>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Mon, Oct 31, 2016 at 3:57 PM, Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:

> If async suspend is enabled, the driver may access registers concurrently
> with another instance which may fail because of the bug in Cherryview GPIO
> hardware. Prevent this by taking the shared lock while accessing the
> hardware in suspend and resume hooks.
>
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Patch applied.

Yours,
Linus Walleij
