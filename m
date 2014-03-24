From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: Return int for .irq_request_resources callback
Date: Mon, 24 Mar 2014 09:56:12 +0100
Message-ID: <CACRpkdbEMZXs_CYuQoWLhVGan=WosKkzrWbqWNqQMtrkBLwh6g@mail.gmail.com>
References: <1395135620.18373.2.camel@phoenix>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f45.google.com ([209.85.219.45]:47155 "EHLO
	mail-oa0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750988AbaCXI4N (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 24 Mar 2014 04:56:13 -0400
Received: by mail-oa0-f45.google.com with SMTP id eb12so5110280oac.4
        for <linux-gpio@vger.kernel.org>; Mon, 24 Mar 2014 01:56:12 -0700 (PDT)
In-Reply-To: <1395135620.18373.2.camel@phoenix>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Axel Lin <axel.lin@ingics.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Jean-Jacques Hiblot <jjhiblot@traphandler.com>, Jamie Iles <jamie@jamieiles.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Tue, Mar 18, 2014 at 10:40 AM, Axel Lin <axel.lin@ingics.com> wrote:

> This fixes below build warnings:

I already wrote and pushed a similar patch myself, but thanks!

Yours,
Linus Walleij
