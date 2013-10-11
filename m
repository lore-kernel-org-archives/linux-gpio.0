From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/3] gpio: rename gpio-langwell to gpio-intel-mid
Date: Fri, 11 Oct 2013 16:18:05 +0200
Message-ID: <CACRpkdZw29XE4z7iw2=JQbLMvWfpoWYm+-cgLB-oM8GzwK7xxg@mail.gmail.com>
References: <1380916902-23791-1-git-send-email-david.a.cohen@linux.intel.com>
	<1380916902-23791-3-git-send-email-david.a.cohen@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ie0-f174.google.com ([209.85.223.174]:33335 "EHLO
	mail-ie0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751762Ab3JKOSG (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Oct 2013 10:18:06 -0400
Received: by mail-ie0-f174.google.com with SMTP id qd12so3560708ieb.33
        for <linux-gpio@vger.kernel.org>; Fri, 11 Oct 2013 07:18:05 -0700 (PDT)
In-Reply-To: <1380916902-23791-3-git-send-email-david.a.cohen@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: David Cohen <david.a.cohen@linux.intel.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Fri, Oct 4, 2013 at 10:01 PM, David Cohen
<david.a.cohen@linux.intel.com> wrote:

> gpio-langwell is a deprecated name. Despite the driver was made
> initially for Langwell, it supports now other Intel Mid SoC's.
>
> This patch does no change beside the file renaming with Kconfig/Makefile
> update.
>
> Signed-off-by: David Cohen <david.a.cohen@linux.intel.com>

Are you aware of the git format-patch -M switch?

Anyway, good idea, so patch applied.

Yours,
Linus Walleij
