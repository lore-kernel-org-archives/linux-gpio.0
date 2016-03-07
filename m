From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 00/63] Allow compile testing of most gpio drivers
Date: Mon, 7 Mar 2016 12:06:03 +0700
Message-ID: <CACRpkdYdsX-scQtKTsh_86j7GWPi=BYv2ftY9UKXHFEDATnZvA@mail.gmail.com>
References: <1456492692-21592-1-git-send-email-alexanders83@web.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f179.google.com ([209.85.214.179]:35636 "EHLO
	mail-ob0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750854AbcCGFGE (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Mar 2016 00:06:04 -0500
Received: by mail-ob0-f179.google.com with SMTP id xx9so95914616obc.2
        for <linux-gpio@vger.kernel.org>; Sun, 06 Mar 2016 21:06:03 -0800 (PST)
In-Reply-To: <1456492692-21592-1-git-send-email-alexanders83@web.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexander Stein <alexanders83@web.de>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Fri, Feb 26, 2016 at 8:17 PM, Alexander Stein <alexanders83@web.de> wrote:

> This patch set allows compile testing of most gpio drivers. I compiled all
> from this list for x86_64 and arm. The drivers missing are using arch specific
> includes or code only available on that platform, e.g. msr on x86, which is
> unavailable on others.
>
> I didn't include the OF people for the first one in purpose as I want some
> feedback first.

This is good. Is it possible that we take this for kernel v4.7 if you can
get some ACK from the OF people for patch 1, and provide me a
pull request from a git with all patches?

Yours,
Linus Walleij
