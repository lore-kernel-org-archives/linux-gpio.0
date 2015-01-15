From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] sh-pfc: r8a7791: fix typo in MLB_CLK
Date: Thu, 15 Jan 2015 17:10:19 +0100
Message-ID: <CACRpkdYo0Jf5yXrwHsPL+L-6VH7OkpYMi6UtsmrHEG1qmzCCsA@mail.gmail.com>
References: <1479250.GJuNxlSkHs@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ie0-f179.google.com ([209.85.223.179]:35910 "EHLO
	mail-ie0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752269AbbAOQKV (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 15 Jan 2015 11:10:21 -0500
Received: by mail-ie0-f179.google.com with SMTP id rp18so15609615iec.10
        for <linux-gpio@vger.kernel.org>; Thu, 15 Jan 2015 08:10:20 -0800 (PST)
In-Reply-To: <1479250.GJuNxlSkHs@wasted.cogentembedded.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Sat, Jan 10, 2015 at 7:21 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:

> The R8A7791 manual sometimes calls the signal MLB_CLK and sometimes MLB_CK; the
> latter can only be encountered in the PFC section and  is probably  just a typo
> (this  signal is always called MLB_CLK in the R8A7790  manual). Fix occurences
> of MLB_CK throughout the R8A7791 PFC driver.
>
> Based on original patch by Andrey Gusakov <andrey.gusakov@cogentembedded.com>.
>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Patch applied with the ACKs.

Yours,
Linus Walleij
