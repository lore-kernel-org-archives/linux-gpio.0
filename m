From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RESEND 1/6] mfd: lpc_ich: Convert ICH GPIOs IDs to enum
Date: Mon, 24 Feb 2014 14:37:23 +0100
Message-ID: <CACRpkdbBJzV312o8Bk3Bf05zW2RB6N3fxr3uE7SuC7DQnaP7oA@mail.gmail.com>
References: <1392386518-11025-1-git-send-email-vdonnefort@gmail.com>
	<1392386518-11025-2-git-send-email-vdonnefort@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f174.google.com ([209.85.214.174]:34553 "EHLO
	mail-ob0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752301AbaBXNhY (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 24 Feb 2014 08:37:24 -0500
Received: by mail-ob0-f174.google.com with SMTP id uy5so7265443obc.33
        for <linux-gpio@vger.kernel.org>; Mon, 24 Feb 2014 05:37:23 -0800 (PST)
In-Reply-To: <1392386518-11025-2-git-send-email-vdonnefort@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Vincent Donnefort <vdonnefort@gmail.com>, Lee Jones <lee.jones@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Samuel Ortiz <sameo@linux.intel.com>, Aaron Sierra <asierra@xes-inc.com>

On Fri, Feb 14, 2014 at 3:01 PM, Vincent Donnefort <vdonnefort@gmail.com> wrote:

> All those IDs are arbitrary and so can be encapsulated into an enumeration.
>
> Signed-off-by: Vincent Donnefort <vdonnefort@gmail.com>

OK Lee, how did we want to proceed with this? I think it's
easiest to put all patches into one tree, this is just too little
patches for cross-immutable branches & stuff.

You can either take the whole lot with my ACK (hereby
provided) or you can ACK patch 1+2 and I will put the whole
thing into the GPIO tree.

Yours,
Linus Walleij
