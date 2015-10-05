From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/3] gpio: generic: replace devm_request_mem_region /
 devm_ioremap with devm_ioremap_resource
Date: Mon, 5 Oct 2015 09:15:28 +0200
Message-ID: <CACRpkdbDrMitq97xtPW2aCWVSAdn3Z34vqw4-QUkNwCCKKMdSA@mail.gmail.com>
References: <560C594C.7090804@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f48.google.com ([209.85.218.48]:36232 "EHLO
	mail-oi0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752274AbbJEHP3 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Oct 2015 03:15:29 -0400
Received: by oibi136 with SMTP id i136so86328964oib.3
        for <linux-gpio@vger.kernel.org>; Mon, 05 Oct 2015 00:15:28 -0700 (PDT)
In-Reply-To: <560C594C.7090804@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Wed, Sep 30, 2015 at 11:51 PM, Heiner Kallweit <hkallweit1@gmail.com> wrote:

> Replace devm_request_mem_region / devm_ioremap with devm_ioremap_resource.
>
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Edited the too long subject and applied.

Yours,
Linus Walleij
