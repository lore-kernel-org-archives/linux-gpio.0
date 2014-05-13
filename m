From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] GPIOD, OF: parse flags into gpiod
Date: Tue, 13 May 2014 10:42:44 +0200
Message-ID: <CACRpkdZu0BAfR5b=-AbURxQ1VtGJbBmBwrTmLkO3Te--EHYWyQ@mail.gmail.com>
References: <1398775115-6842-1-git-send-email-rabel@cit-ec.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f175.google.com ([209.85.214.175]:38056 "EHLO
	mail-ob0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752822AbaEMImo (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 13 May 2014 04:42:44 -0400
Received: by mail-ob0-f175.google.com with SMTP id wo20so22040obc.20
        for <linux-gpio@vger.kernel.org>; Tue, 13 May 2014 01:42:44 -0700 (PDT)
In-Reply-To: <1398775115-6842-1-git-send-email-rabel@cit-ec.uni-bielefeld.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Robert ABEL <rabel@cit-ec.uni-bielefeld.de>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Tue, Apr 29, 2014 at 2:38 PM, Robert ABEL
<rabel@cit-ec.uni-bielefeld.de> wrote:

> GPIO descriptions were assumed to be initialized with correct flags
> by GPIO chips. Hence, DT flags were being ignored.
> Translate flags from DTS flags to GPIOD flags when of_get_*gpiod_* is
> called.
>
> Signed-off-by: Robert ABEL <rabel@cit-ec.uni-bielefeld.de>

Since I've merged Alexandre's other patch making the function private
I'm dropping this assuming you have sorted things out...

Yours,
Linus Walleij
