From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH gpio v2 1/3] gpio: gpio-davinci: remove duplicate check on resource
Date: Fri, 31 Oct 2014 09:03:26 +0100
Message-ID: <CACRpkdbqDzpZKGUcqVrWai2yyukPRB5_neYXVcLppsCkK1LSCw@mail.gmail.com>
References: <1414478227-24674-1-git-send-email-varkab@cdac.in>
	<1414478227-24674-2-git-send-email-varkab@cdac.in>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f177.google.com ([209.85.213.177]:52921 "EHLO
	mail-ig0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751880AbaJaID1 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 31 Oct 2014 04:03:27 -0400
Received: by mail-ig0-f177.google.com with SMTP id hl2so475288igb.16
        for <linux-gpio@vger.kernel.org>; Fri, 31 Oct 2014 01:03:26 -0700 (PDT)
In-Reply-To: <1414478227-24674-2-git-send-email-varkab@cdac.in>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Varka Bhadram <varkabhadram@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Varka Bhadram <varkab@cdac.in>

On Tue, Oct 28, 2014 at 7:37 AM, Varka Bhadram <varkabhadram@gmail.com> wrote:

> Sanity check on resource happening with devm_ioremap_resource().
>
> Signed-off-by: Varka Bhadram <varkab@cdac.in>
> Acked-by: Alexandre Courbot <acourbot@nvidia.com>

Patch applied.

Yours,
Linus Walleij
