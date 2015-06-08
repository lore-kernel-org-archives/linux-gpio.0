From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH] gpio: improve error reporting on own descriptors
Date: Mon, 8 Jun 2015 11:19:10 +0900
Message-ID: <CAAVeFuJ9cOg-_RJpbDPvTmx8iT7e9n+QjArp6tj5ASeq27Naww@mail.gmail.com>
References: <1433496970-20392-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f42.google.com ([209.85.218.42]:34981 "EHLO
	mail-oi0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750769AbbFHCTb (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 7 Jun 2015 22:19:31 -0400
Received: by oihd6 with SMTP id d6so84511871oih.2
        for <linux-gpio@vger.kernel.org>; Sun, 07 Jun 2015 19:19:30 -0700 (PDT)
In-Reply-To: <1433496970-20392-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>

On Fri, Jun 5, 2015 at 6:36 PM, Linus Walleij <linus.walleij@linaro.org> wrote:
> When requesting own descriptors through hogs, it is useful to
> get some details about what's going on if we encounter problems.

Acked-by: Alexandre Courbot <acourbot@nvidia.com>

Linus, I apologize for my inactivity lately - hopefully I will have
some more time to spend on GPIO reviews. Thanks for your patience!
